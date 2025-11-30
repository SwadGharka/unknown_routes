function formatAmount(amount) {
    let x = amount.toString();
    let lastThree = x.substring(x.length - 3);
    let otherNumbers = x.substring(0, x.length - 3);

    if (otherNumbers !== '') {
        lastThree = ',' + lastThree;
    }

    // add commas after every 2 digits in the other part
    return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
}

async function getPackageDetails(){
    showLoader("Please wait...", true)
    let payload = {
        'packageId' : $("#packageId").val()
    }
    const response = await getDataByPayloadWithParentUrl("POST", true, true, BASE_URL + CONTEXT_PATH + "api/get-packages-by-id", payload);
    if(response.status == 1){
        showLoader("", false);
        // prefillPackageForm(response.packageData);
        let data = response.packageData;
        let cleanUrl = data.imageUrl.split("?")[0];

        $("#imageUrl").css({
            "background-image": "url('" + cleanUrl + "')",
            "background-size": "cover",
            "background-position": "center"
        });

        $("#title").text("Package Details | "+data.name);
        $("#packageName").text(data.name);
        $("#daysAndDestination").text(data.totalDays+ " Days  • "+data.destination);
        let majarAttractions = data.majorAttractionsList;
        let majarAttractionsHtml = '';
        majarAttractions.split(",").forEach(element => {
            majarAttractionsHtml += '<span class="tag">'+toTitleCase(element)+'</span>';
        });
        $("#majorAttractions").html(majarAttractionsHtml);
        $("#price").html("₹"+formatAmount(data.amount));
        data.inclusionsForCard
        let inclusionsForCard = data.inclusionsForCard;
        let inclusionsForCardHtml = '';
        inclusionsForCard.split(",").forEach(element => {
            
            inclusionsForCardHtml += '<li>'+element+'</li>';
        });
        $("#highlights").html(inclusionsForCardHtml);
        
        let inclusions = data.inclusion;
        let inclusionsHtml = '';
        inclusions.split(",").forEach(element => {
            
            inclusionsHtml += '<li>'+element+'</li>';
        });
        $("#inclusions").html(inclusionsHtml);
        
        let exclusions = data.exclusion;
        let exclusionsHtml = '';
        exclusions.split(",").forEach(element => {
            
            exclusionsHtml += '<li>'+element+'</li>';
        });
        $("#exclusions").html(exclusionsHtml);
        $("#packageName").val(data.name);
        $("#travelType").val(data.travelType);
        let activitiesResponse = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL + CONTEXT_PATH + "api/get-all-activities-by-packageId", payload)

        if (activitiesResponse != null && activitiesResponse.status == 1) {
            let activityList = activitiesResponse.activityArray;
            let activityHtml = '';
            activityList.forEach(item => {
                let header = toTitleCase(item.header);
                activityHtml += `
                    <div class="accordion-item">
                        <div class="accordion-header">
                            ${header}
                            <span>+</span>
                        </div>

                        <div class="accordion-body">
                            <p>${item.point}</p>
                        </div>
                    </div>
                `;
            });
            $("#itineraryContainer").html(activityHtml);
            $(".accordion-header").on("click", function () {
                const body = $(this).next(".accordion-body");
                const icon = $(this).find("span");

                if (body.height() > 0) {
                    // Close this one
                    body.animate({ height: "0px", padding: "0 16px" }, 300);
                    icon.text("+");
                } else {
                    // Open smoothly
                    const fullHeight = body.get(0).scrollHeight;
                    body.animate({ height: fullHeight + "px", padding: "16px" }, 300);
                    icon.text("-");
                }
            });
        }
    }else{
        showLoader("", false);
        showMessage("error", response.message);
    }
}

function bookNow(event){
    let name = $("#packageName").val();
    let travelType = $("#travelType").val();
    let packageId = $("#packageId").val();
    openBookingModal(event, name, packageId, travelType)
}

// Dynamic images (backend se aayengi)
let galleryImages = [
    "https://images.unsplash.com/photo-1506905925346-21bda4d32df4",
    "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2",
    "https://images.unsplash.com/photo-1544735716-392fe2489ffa",
    "https://images.unsplash.com/photo-1570168007204-dfb528c6958f",
    "https://images.unsplash.com/photo-1582972236019-ea4af5ffe587"
];

// --- Build Carousel Slides ---
function loadCarousels() {

    // Normal page carousel
    let html1 = "";
    galleryImages.forEach((img, i) => {
        html1 += `
            <div class="carousel-item ${i === 0 ? 'active' : ''}">
                <img src="${img}" class="d-block w-100 gallery-img" style="height:220px; object-fit:cover; border-radius:14px; cursor:pointer;"
                     onclick="openImageModal(${i})">
            </div>
        `;
    });
    $("#carouselImages").html(html1);

    // Modal carousel
    let html2 = "";
    galleryImages.forEach((img, i) => {
        html2 += `
            <div class="carousel-item ${i === 0 ? 'active' : ''}">
                <img src="${img}" class="d-block w-100" style="height:450px; object-fit:cover; border-radius:18px;">
            </div>
        `;
    });
    $("#modalCarouselImages").html(html2);
}

function buildGallery() {
  const $thumbStrip = $("#thumbStrip");
  const $modalInner = $("#modalCarouselImages");
  $thumbStrip.empty();
  $modalInner.empty();

  galleryImages.forEach((src, i) => {
    // thumbnails
    const t = $(`<img tabindex="0" class="thumb" src="${src}" alt="img-${i}">`);
    t.on("click keypress", e => {
      if (e.type === "click" || (e.type === "keypress" && (e.key === "Enter" || e.key === " "))) {
        openImageModal(i);
      }
    });
    $thumbStrip.append(t);

    // modal slides
    const slide = $(`
      <div class="carousel-item ${i === 0 ? 'active' : ''}">
        <img src="${src}" alt="modal-${i}">
      </div>
    `);
    $modalInner.append(slide);
  });
}

// open modal at index using Bootstrap 5 API
function openImageModal(index) {
  const modalEl = document.getElementById('imageModal');
  const modal = new bootstrap.Modal(modalEl, { backdrop: true });
  modal.show();

  // init carousel and jump to slide
  const modalCarouselEl = document.getElementById('modalCarousel');
  const carousel = new bootstrap.Carousel(modalCarouselEl, { interval: false, ride: false });
  carousel.to(index);
}

// thumb scroll controls
function thumbScroll(delta) {
  const el = document.getElementById('thumbStrip');
  el.scrollBy({ left: delta, behavior: 'smooth' });
}


function toTitleCase(str){
    return str.replace(/\w\S*/g,
         txt => txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()
    );
}

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
                activityHtml += `
                    <div class="accordion-item">
                        <div class="accordion-header">
                            Day ${item.day} – ${item.header}
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
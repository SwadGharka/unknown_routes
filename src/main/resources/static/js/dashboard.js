/* ============================================================
   GLOBAL DATA
============================================================ */
let allPackage = [];


/* ============================================================
   SECTION TOGGLING
============================================================ */
function toggleSection(sectionId, defaultOpen) {
    //  $(".section-content").addClass("d-none");
    const $target = $("#" + sectionId);
    if ($target.length === 0) return;

    $target.removeClass("d-none");

    if(defaultOpen){
        if (sectionId === "packages") {
            getAllPackages().then(() => getPackageCard(allPackage));
        }
    }else{
        // Trigger reflow
        $target[0].offsetHeight;

        // Smooth scroll
        setTimeout(() => {
            window.scrollTo({
                top: $target.offset().top - 50,
                behavior: "smooth"
            });
        }, 50);

        if (sectionId === "packages") {
            getAllPackages().then(() => getPackageCard(allPackage));
        }
    }
}


/* ============================================================
   ANIMATION COUNTER
============================================================ */
function animateCounter(element, target) {
    let current = 0;
    const step = Math.ceil(target / 60);

    const interval = setInterval(() => {
        current += step;
        if (current >= target) {
            current = target;
            clearInterval(interval);
        }
        element.textContent = current;
    }, 16);
}


/* ============================================================
   NAVBAR SCROLL EFFECT
============================================================ */
window.addEventListener("scroll", () => {
    const navbar = document.getElementById("navbar");

    if (window.scrollY > 100) {
        navbar.classList.add("navbar-scrolled");
        navbar.classList.remove("navbar-custom");
    } else {
        navbar.classList.remove("navbar-scrolled");
        navbar.classList.add("navbar-custom");
    }
});


/* ============================================================
   INTERSECTION OBSERVER
============================================================ */
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (!entry.isIntersecting) return;

        const el = entry.target;

        if (el.classList.contains("slide-in") || el.classList.contains("fade-in")) {
            el.classList.add("animated");
        }

        if (el.classList.contains("stats-counter")) {
            const target = parseInt(el.getAttribute("data-target"));
            animateCounter(el, target);
            observer.unobserve(el);
        }
    });
}, {
    threshold: 0.1,
    rootMargin: "0px 0px -50px 0px"
});


/* ============================================================
   DISCOVER CARD GENERATOR
============================================================ */
function discoverCard(icon, cardName, description, badge, backgroundColor, id) {
    return `
        <div class="col-md-6 col-lg-3">
            <div class="card nav-card text-white border-0 shadow-lg"
                 style="background:${backgroundColor}"
                 onclick="calegoryClicked('${id}')">

                <div class="card-body text-center p-4">
                    <div class="fs-1 mb-3">${icon}</div>

                    <h4 class="fw-bold mb-2">${cardName}</h4>

                    <p class="opacity-75 small">${description}</p>

                    ${badge ? `<span class="badge bg-light bg-opacity-25 px-3 py-2 rounded-pill fw-semibold">${badge}</span>` : ""}
                </div>
            </div>
        </div>`;
}


function getAllDiscoverCardCardByData(data) {
    const html = data
        .map(item => discoverCard(item.icon, item.cardName, item.description, item.badge, item.backgroundColor, item.id))
        .join("");

    $("#discoverCard").html(html);
}


/* ============================================================
   PACKAGE CARD GENERATOR
============================================================ */
function createPackageCard(pkg) {
    const pngIcon = BASE_URL + CONTEXT_PATH + "static/img/ribbon.png";

    const attractionBadges = pkg.attractions
        .map(a => `<span class="badge bg-primary bg-opacity-10 px-2 py-1" style="color:${pkg.packageColor}">${a}</span>`)
        .join("");

    const highlightItems = pkg.highlights
        .map(h => `
            <li class="d-flex align-items-center mb-2">
                <i class="bi bi-check-circle text-success me-2"></i>
                <span>${h}</span>
            </li>
        `)
        .join("");

    return `
        <div class="col-lg-4 col-md-6 package-card">
            <div class="card card-hover border-0 shadow-lg overflow-hidden">

                <div class="package-image rounded-top"
                     style="background:linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.1)),url('${pkg.imageUrl}');
                            background-size:cover;background-position:center;">

                    ${pkg.badgeText ? `
                        <img src="${pngIcon}"
                             style="position:absolute;top:10px;right:10px;width:65px;height:16px;
                                    transform:rotate(40deg) scale(4);transform-origin:center;" />

                        <span style="position: absolute; top: 22px; right: 22px; color: white; 
                        font-size: 7px; transform: rotate(40deg) scale(2.5);">${pkg.badgeText}</span>
                    ` : ""}

                    <div class="position-absolute bottom-0 start-0 m-3 text-white">
                        <h5 class="fw-bold">${pkg.location}</h5>
                    </div>
                </div>

                <div class="card-body p-4 text-center">
                    <h4 class="fw-bold" style="color:${pkg.packageColor}">${pkg.title}</h4>
                    <p class="fw-medium" style="color:${pkg.packageColor}">${pkg.subtitle}</p>

                    <h6 class="fw-semibold" style="color:${pkg.packageColor}; display: flex;">🗺️ Major Attractions:</h6>
                    <div class="d-flex flex-wrap gap-1 mb-3">${attractionBadges}</div>

                    <ul class="list-unstyled mb-4">${highlightItems}</ul>

                    <div class="price-highlight display-5 fw-bold">₹${pkg.price}</div>
                    <p class="text-muted small">${pkg.member}</p>

                    <div class="d-flex gap-2">
                        <button class="btn flex-fill" style="border-color:${pkg.packageColor}"
                                onclick="${pkg.onDetailsClick}"><spen style="color:${pkg.packageColor}">View Details</spen></button>

                        <button class="btn flex-fill" style="background-color:${pkg.packageColor}"
                                onclick="${pkg.onBookClick}"><span style="color:white">Book Now</span></button>
                    </div>
                </div>
            </div>
        </div>`;
}


/* ============================================================
   FETCH & RENDER PACKAGES
============================================================ */
async function getAllPackages() {
    if (allPackage.length > 0) return;

    const response = await getDataByPayloadWithParentUrl(
        "POST",
        true,
        true,
        BASE_URL + CONTEXT_PATH + "api/get-all-packages",
        ""
    );

    allPackage = response?.packages || [];
}


function getPackageCard(packages) {
    const cards = packages.map(pkg => {
        return createPackageCard({
            imageUrl: pkg.imageUrl,
            location: pkg.destination,
            title: pkg.name,
            subtitle: pkg.description,
            attractions: pkg.majorAttractionsList ? pkg.majorAttractionsList.split(",") : [],
            highlights: pkg.inclusionsForCard ? pkg.inclusionsForCard.split(",") : [],
            price: pkg.amount,
            badgeText: pkg.badge || "",
            member: pkg.members,
            packageColor: pkg.packageColor,
            onDetailsClick: `showPackageDetails('${pkg.name}')`,
            onBookClick: `bookPackage('${pkg.name}')`
        });
    }).join("");

    $("#packagesRow").html(cards);

    // Reveal animation
    $(".package-card").each(function (i) {
        $(this).css({
            opacity: 0,
            transform: "translateY(30px)"
        });

        setTimeout(() => {
            $(this).css({
                opacity: 1,
                transform: "translateY(0)",
                transition: "0.5s ease"
            });
        }, i * 80);
    });
}


/* ============================================================
   FILTER PACKAGES BY CATEGORY
============================================================ */
function getPackagesByCategory(allPackages, categoryId) {
    return allPackages.filter(pkg => pkg.categoryId.includes(parseInt(categoryId)));
}


/* ============================================================
   CATEGORY CLICK HANDLER
============================================================ */
function calegoryClicked(id) {
    const filtered = getPackagesByCategory(allPackage, id);

    getPackageCard(filtered);

    $(".section-content").addClass("d-none");
    const $sec = $("#packages");
    $sec.removeClass("d-none");

    setTimeout(() => {
        window.scrollTo({
            top: $sec.offset().top - 20,
            behavior: "smooth"
        });
    }, 50);
}

function bookPackage(packageName) {
    // Add click animation
    event.target.style.transform = 'scale(0.95)';
    setTimeout(() => {
        event.target.style.transform = '';
    }, 150);

    // Show contact section
    toggleSection('contact');

    // Pre-select the package in the form
    setTimeout(() => {
        const select = document.getElementById('packageSelect');
        const packageCode = packageName.split(' ')[0].toLowerCase();
        const option = select.querySelector(`option[value="${packageCode}"]`);
        if (option) {
            select.value = option.value;
            select.classList.add('border-primary');
            
            // Reset border color after 2 seconds
            setTimeout(() => {
                select.classList.remove('border-primary');
            }, 2000);
        }
    }, 1000);
}
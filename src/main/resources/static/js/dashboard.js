var allPackage = {}

async function toggleSection(sectionId) {
  // Hide all sections
  $('.section-content').addClass('d-none');

  const targetSection = document.getElementById(sectionId);
  if (!targetSection) return;

  // Show selected section
  targetSection.classList.remove('d-none');

  // Update Section Title
  const sectionNames = {
    packages: 'Travel Packages',
    stats: 'Why Choose Us',
    testimonials: 'Customer Reviews',
    contact: 'Get In Touch'
  };

  $('#activeSection').removeClass('d-none');
  $('#activeSectionName').text(sectionNames[sectionId] || '');

  setTimeout(() => {
    void targetSection.offsetWidth;

    const items = targetSection.querySelectorAll('.slide-in, .fade-in, .stats-counter');
    items.forEach(el => el.classList.add('animated'));
    if(sectionId == 'packages'){
    //   const cardHtml = createPackageCard({
    //       imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?auto=format&fit=crop&w=800&q=80',
    //       location: 'Manali, Himachal Pradesh',
    //       title: 'BRB Package',
    //       subtitle: 'Be Right Back - Mountain Escape',
    //       attractions: ['Rohtang Pass', 'Solang Valley', 'Hadimba Temple', 'Mall Road'],
    //       highlights: [
    //           { icon: '🏨', text: 'Mountain Resort Stay (2 nights)' },
    //           { icon: '🥾', text: 'Solang Valley Adventure' },
    //           { icon: '🧘', text: 'Himalayan Yoga Sessions' },
    //           { icon: '🍽️', text: 'Local Himachali Cuisine' }
    //       ],
    //       price: '45,999',
    //       badgeText: 'Popular',
    //       isPopular: true,
    //       onDetailsClick: "showPackageDetails('brb')",
    //       onBookClick: "bookPackage('BRB Package')"
    //   });
        getAllPackages();
      $('#packagesRow').html(cardHtml);
    }
    targetSection.scrollIntoView({
      behavior: 'smooth',
      block: 'start'
    });
  }, 80);

}


/* ✅ Helper Function: Animate numeric counters smoothly */
function animateCounter($element, target) {
  let current = 0;
  const step = Math.ceil(target / 60); // ~60 frames (1 second)
  const interval = setInterval(() => {
    current += step;
    if (current >= target) {
      current = target;
      clearInterval(interval);
    }
    $element.text(current);
  }, 16);
}

window.addEventListener('scroll', function() {
    const navbar = document.getElementById('navbar');
    if (window.scrollY > 100) {
        navbar.classList.add('navbar-scrolled');
        navbar.classList.remove('navbar-custom');
    } else {
        navbar.classList.remove('navbar-scrolled');
        navbar.classList.add('navbar-custom');
    }
});

const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            if (entry.target.classList.contains('slide-in') || entry.target.classList.contains('fade-in')) {
                entry.target.classList.add('animated');
            }
            
            if (entry.target.classList.contains('stats-counter')) {
                const target = parseInt(entry.target.getAttribute('data-target'));
                animateCounter(entry.target, target);
                observer.unobserve(entry.target);
            }
        }
    });
}, observerOptions);

function discoverCard(toggleSection, icon, cardName, description, badge, backgroundColor, height, width, id){
    let html = "";
    html = `
    <div class="col-md-6 col-lg-3">
        <div class="card nav-card text-white border-0 shadow-lg" style="height:100%; width:100%; max-width: 100%; background : ${backgroundColor}" onclick="calegoryClicked('${id}')">
            <div class="card-body text-center p-4">
                <div class="fs-1 mb-3">${icon}</div>
                <h4 class="card-title fw-bold mb-2">${cardName}</h4>
                <p class="card-text opacity-75 small">${description}</p>
                <div class="mt-3">
                    <span class="${badge != '' ? 'badge bg-light': ''} bg-opacity-25 px-3 py-2 rounded-pill fw-semibold">
                        ${badge}
                    </span>
                </div>
            </div>
        </div>
    </div>`
    return html;
}

// Hide all sections
function hideAllSections() {
    const allSections = document.querySelectorAll('.section-content');
    allSections.forEach(section => {
        section.classList.add('d-none');
    });
    
    const activeSection = document.getElementById('activeSection');
    activeSection.classList.add('d-none');
    
    // Scroll back to navigation menu
    const navSection = document.querySelector('.py-5.bg-white');
    if (navSection) {
        navSection.scrollIntoView({
            behavior: 'smooth',
            block: 'center'
        });
    }
}

function getAllDiscoverCardCardByData(discoverCardData){
    $("#discoverCard").html('');
    let html = '';
    discoverCardData.map(item => {
        console.log(item.icon, item.cardName);
        // html += discoverCard({toggleSection : item.toggleSection, icon : item.icon, cardName : item.cardName, description : item.description, badge : item.badge, className : item.className, height : item.height, width : item.width});
        html += discoverCard(item.toggleSection,  item.icon, item.cardName, item.description, item.badge, item.backgroundColor, item.height, item.width, item.id);
    });
    $("#discoverCard").html(html);
    // return html;
}

function createPackageCard({
    imageUrl,
    location,
    title,
    subtitle,
    attractions = [],
    highlights = [],
    price,
    badgeText = '',
    isPopular = false,
    onDetailsClick = '',
    onBookClick = '',
    member,
    pngIcon
}) {
    pngIcon = BASE_URL + CONTEXT_PATH+'static/img/ribbon.png'
    const attractionBadges = attractions
        .map(a => `<span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1">${a}</span>`)
        .join('');

    const highlightItems = highlights
        .map(h => `
            <li class="d-flex align-items-center mb-2">
                <span class="me-3 text-primary"><i class="bi bi-check-circle text-success me-2"></i></span>
                <span>${h}</span>
            </li>
        `)
        .join('');

    const popularBadge = true
        ? `<span class="badge bg-primary px-3 py-2 rounded-pill">${badgeText}</span>`
        : '';

    const cardHtml = `
        <div class="col-lg-4 col-md-6" style="opacity:0; transform: translateY(30px); transition: all 0.5s ease;">
            <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden">
                <div class="package-image rounded-top"
                    style="
                           background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), 
                           url('${imageUrl}');
                           background-size: cover;
                           background-position: center;">
                    <div class="position-absolute top-0 end-0 m-3" style="display:flex; flex-direction:column; align-items:end; gap:6px;">
                        ${badgeText ? `<img src="${pngIcon}" style="width: 63px;height: 15px;border-radius: 9px;transform: rotate(40deg) scale(4);transform-origin: center;""><span style="position: absolute;top: 13px;right: 7px; color: white; border-radius: 5px;font-size: 6px;transform: rotate(40deg) scale(3);transform-origin: center;"> ${badgeText}` : ''}
                    </div>

                    <div class="position-absolute bottom-0 start-0 m-3 text-white">
                        <h5 class="fw-bold mb-0">${location}${popularBadge}</h5>
                    </div>
                </div>

                <div class="card-body p-4">
                    <div class="text-center mb-4">
                        <h4 class="card-title fw-bold text-primary mb-1">${title}</h4>
                        <p class="text-primary fw-medium">${subtitle}</p>
                    </div>

                    <div class="mb-3">
                        <h6 class="fw-semibold text-primary mb-2">🗺️ Major Attractions:</h6>
                        <div class="d-flex flex-wrap gap-1 mb-3">
                            ${attractionBadges}
                        </div>
                    </div>

                    <ul class="list-unstyled mb-4">
                        ${highlightItems}
                    </ul>

                    <div class="text-center">
                        <div class="price-highlight display-5 fw-bold mb-2">₹${price}</div>
                        <p class="text-muted small mb-3">${member}</p>
                        <div class="d-flex gap-2">
                            <button class="btn btn-outline-primary flex-fill py-2 rounded-pill fw-semibold" onclick="${onDetailsClick}">
                                View Details 📋
                            </button>
                            <button class="btn btn-primary flex-fill py-2 rounded-pill fw-semibold" onclick="${onBookClick}">
                                Book Now 🏔️
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>`;

    // Append card and animate smoothly
    const $card = $(cardHtml);
    $('#packagesRow').append($card);

    // Smooth reveal animation
    // setTimeout(() => {
        $card.css({
            opacity: '1',
            transform: 'translateY(0)'
        });
    // }, 100);
}

async function getAllPackages() { 
  let apiResponse = await getDataByPayloadWithParentUrl(
    'POST',
    true,
    true,
    BASE_URL + CONTEXT_PATH + 'api/get-all-packages',
    ""
  );

  allPackage = apiResponse?.packages || [];
}
function getPackageCard(allPackage){
  var cardsHTML = "";
  let icon = BASE_URL + CONTEXT_PATH+'static/img/ribbon.png'
  allPackage.forEach(pkg => {
    cardsHTML += createPackageCard({
      imageUrl: pkg.imageUrl,
      location: pkg.destination,
      title: pkg.name,
      subtitle: pkg.description || "",
      attractions: pkg.majorAttractionsList ? pkg.majorAttractionsList.split(",") : [],
      highlights: pkg.inclusionsForCard ? pkg.inclusionsForCard.split(",") : [],
      price: pkg.amount,
      badgeText: pkg.badge ? pkg.badge : '',
      isPopular: pkg.totalDays > 3,
      onDetailsClick: `showPackageDetails('${pkg.name}')`,
      onBookClick: `bookPackage('${pkg.name}')`,
      member:pkg.members,
      icon
    });
  });
  return allPackage;
}

function getPackagesByCategory(allPackages, categoryId) {
    return allPackages.filter(pkg => pkg.categoryId.includes(parseInt(categoryId)));
}

function calegoryClicked(id){
    let packages = getPackagesByCategory(allPackage, id);
    getPackageCard(packages);
}
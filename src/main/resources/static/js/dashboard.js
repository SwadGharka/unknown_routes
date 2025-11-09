function toggleSection(sectionId) {
  // 🔹 Hide all sections first
  $('.section-content').addClass('d-none');

  // 🔹 Show the selected section
  const $target = $('#' + sectionId);
  if ($target.length) {
    $target.removeClass('d-none');

    // 🔹 Update section title (like "Travel Packages", "Why Choose Us")
    const sectionNames = {
      'packages': 'Travel Packages',
      'stats': 'Why Choose Us',
      'testimonials': 'Customer Reviews',
      'contact': 'Get In Touch'
    };

    $('#activeSection').removeClass('d-none');
    $('#activeSectionName').text(sectionNames[sectionId] || '');

    // 🔹 Smooth scroll to section
    $('html, body').animate({
      scrollTop: $target.offset().top - 50
    }, 600);

    // 🔹 Trigger basic animations (slide/fade/counters)
    $target.find('.slide-in, .fade-in, .stats-counter').each(function () {
      $(this).addClass('animated');
    });

    // 🔹 Animate counters if "stats" section is selected
    if (sectionId === 'stats') {
      $target.find('.stats-counter').each(function () {
        const $counter = $(this);
        const targetValue = parseInt($counter.data('target'));
        animateCounter($counter, targetValue);
      });
    }
    if(sectionId == 'packages'){
      const cardHtml = createPackageCard({
          imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?auto=format&fit=crop&w=800&q=80',
          location: 'Manali, Himachal Pradesh',
          title: 'BRB Package',
          subtitle: 'Be Right Back - Mountain Escape',
          attractions: ['Rohtang Pass', 'Solang Valley', 'Hadimba Temple', 'Mall Road'],
          highlights: [
              { icon: '🏨', text: 'Mountain Resort Stay (2 nights)' },
              { icon: '🥾', text: 'Solang Valley Adventure' },
              { icon: '🧘', text: 'Himalayan Yoga Sessions' },
              { icon: '🍽️', text: 'Local Himachali Cuisine' }
          ],
          price: '45,999',
          badgeText: 'Popular',
          isPopular: true,
          onDetailsClick: "showPackageDetails('brb')",
          onBookClick: "bookPackage('BRB Package')"
      });

      $('#packagesRow').html(cardHtml);
    }
  }
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
// Intersection Observer for animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            // Add animation classes
            if (entry.target.classList.contains('slide-in') || entry.target.classList.contains('fade-in')) {
                entry.target.classList.add('animated');
            }
            
            // Animate counters
            if (entry.target.classList.contains('stats-counter')) {
                const target = parseInt(entry.target.getAttribute('data-target'));
                animateCounter(entry.target, target);
                observer.unobserve(entry.target);
            }
        }
    });
}, observerOptions);

function discoverCard(toggleSection, icon, cardName, description, badge, className, height, width){
    let html = "";
    html = `
    <div class="col-md-6 col-lg-3">
        <div class="card nav-card ${className} text-white border-0 shadow-lg" style="height:100%; width:100%; max-width: 100%;" onclick="toggleSection('${toggleSection}')">
            <div class="card-body text-center p-4">
                <div class="fs-1 mb-3">${icon}</div>
                <h4 class="card-title fw-bold mb-2">${cardName}</h4>
                <p class="card-text opacity-75 small">${description}</p>
                <div class="mt-3">
                    <span class="badge bg-light bg-opacity-25 px-3 py-2 rounded-pill fw-semibold">
                        ${badge}
                    </span>
                </div>
            </div>
        </div>
    </div>`
    return html;
}

// function discoverCard({
//   toggleSection,
//   icon,
//   cardName,
//   description,
//   badge,
//   className = '',
//   height = 'auto',
//   width = '100%'
// }) {
//   return `
//     <div class="d-flex justify-content-center" style="width:${width}; max-width:100%;">
//       <div
//         class="card nav-card ${className} text-white border-0 shadow-lg"
//         style="height:${height}; width:100%; max-width:${width};"
//         onclick="toggleSection('${toggleSection}')"
//       >
//         <div class="card-body text-center p-4 d-flex flex-column justify-content-between">
//           <div>
//             <div class="fs-1 mb-3">${icon}</div>
//             <h4 class="card-title fw-bold mb-2">${cardName}</h4>
//             <p class="card-text opacity-75 small">${description}</p>
//           </div>
//           <div class="mt-3">
//             <span class="badge bg-light bg-opacity-25 px-3 py-2 rounded-pill fw-semibold">
//               ${badge}
//             </span>
//           </div>
//         </div>
//       </div>
//     </div>`;
// }



function getAllDiscoverCardCardByData(discoverCardData){
    $("#discoverCard").html('');
    let html = '';
    discoverCardData.map(item => {
        console.log(item.icon, item.cardName);
        // html += discoverCard({toggleSection : item.toggleSection, icon : item.icon, cardName : item.cardName, description : item.description, badge : item.badge, className : item.className, height : item.height, width : item.width});
        html += discoverCard(item.toggleSection,  item.icon, item.cardName, item.description, item.badge, item.className, item.height, item.width);
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
    onBookClick = ''
}) {
    const attractionBadges = attractions
        .map(a => `<span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1">${a}</span>`)
        .join('');

    const highlightItems = highlights
        .map(h => `
            <li class="d-flex align-items-center mb-2">
                <span class="me-3 text-primary">${h.icon}</span>
                <span>${h.text}</span>
            </li>
        `)
        .join('');

    const popularBadge = isPopular
        ? `<span class="badge bg-primary px-3 py-2 rounded-pill">${badgeText}</span>`
        : '';

    const cardHtml = `
        <div class="col-lg-4 col-md-6 card-wrapper" style="opacity:0; transform: translateY(30px); transition: all 0.5s ease;">
            <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden">
                <div class="package-image rounded-top"
                    style="height: 250px;
                           background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), 
                           url('${imageUrl}');
                           background-size: cover;
                           background-position: center;">
                    <div class="position-absolute top-0 end-0 m-3">
                        ${popularBadge}
                    </div>
                    <div class="position-absolute bottom-0 start-0 m-3 text-white">
                        <h5 class="fw-bold mb-0">${location}</h5>
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
                        <p class="text-muted small mb-3">per person</p>
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
    setTimeout(() => {
        $card.css({
            opacity: '1',
            transform: 'translateY(0)'
        });
    }, 100);
}



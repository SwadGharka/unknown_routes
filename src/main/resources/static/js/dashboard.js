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



function discoverCard(toggleSection, icon, cardName, description, badge, className, height, width){
    let html = "";
    html = `
    <div class="col-md-6 col-lg-3">
        <div class="card nav-card ${className} text-white border-0 shadow-lg" style="height:100%; width:100%; max-width: 100%;" onclick="toggleSection(${toggleSection})">
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


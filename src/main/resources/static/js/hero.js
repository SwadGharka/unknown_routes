$(document).ready(function () {
  // 🌄 Animate hero section elements on page load
  $('.slide-in').each(function (i) {
    const element = $(this);
    setTimeout(function () {
      element.css({
        opacity: 1,
        transform: 'translateY(0)',
        transition: 'all 0.8s ease'
      });
    }, i * 200);
  });

  // 🧮 Animate counters when hero stats become visible
  function animateCounters() {
    $('.stats-counter').each(function () {
      const $this = $(this);
      const target = parseInt($this.attr('data-target'));
      const duration = 1500; // 1.5 seconds
      let count = 0;
      const step = Math.ceil(target / (duration / 30));

      const interval = setInterval(() => {
        count += step;
        if (count >= target) {
          count = target;
          clearInterval(interval);
        }
        $this.text(count);
      }, 30);
    });
  }

  // 📡 Trigger counter animation when visible in viewport
  let triggered = false;
  $(window).on('scroll', function () {
    const heroStatsTop = $('.hero-stats').offset().top;
    const scrollBottom = $(window).scrollTop() + $(window).height();

    if (!triggered && scrollBottom > heroStatsTop + 100) {
      animateCounters();
      triggered = true;
    }
  });

  // 💫 Optional smooth scroll for buttons
  $('.btn-gradient-primary, .glass-effect').on('click', function (e) {
    const section = $(this).attr('onclick')?.match(/'(.*?)'/)?.[1];
    if (section && $('#' + section).length) {
      e.preventDefault();
      $('html, body').animate({ scrollTop: $('#' + section).offset().top - 50 }, 800);
    }
  });
});

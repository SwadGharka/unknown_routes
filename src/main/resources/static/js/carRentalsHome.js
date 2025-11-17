
// Smooth scrolling function
function scrollToSection(sectionId) {
    const section = document.getElementById(sectionId);
    if (section) {
        section.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
}

// Show booking modal
function showBookingModal(serviceType = '') {
    const modal = new bootstrap.Modal(document.getElementById('bookingModal'));
    modal.show();
    
    // Pre-select service type if provided
    if (serviceType) {
        setTimeout(() => {
            const serviceSelect = document.querySelector('#bookingModal select[required]');
            if (serviceSelect) {
                serviceSelect.value = serviceType;
            }
        }, 100);
    }
}

// Handle quick booking form
function handleQuickBooking(event) {
    event.preventDefault();
    showNotification('Getting your instant quote! Please wait...', 'info');
    
    setTimeout(() => {
        showNotification('Quote ready! Estimated fare: ₹450-650. Book now to confirm your ride.', 'success');
        showBookingModal();
    }, 2000);
}

// Handle main booking form
function handleBooking(event) {
    event.preventDefault();
    
    const modal = bootstrap.Modal.getInstance(document.getElementById('bookingModal'));
    modal.hide();
    
    showNotification('Booking confirmed! You will receive a confirmation SMS and email shortly.', 'success');
}

// Handle contact form
function handleContactForm(event) {
    event.preventDefault();
    showNotification('Thank you for your message! We will get back to you within 2 hours.', 'success');
    event.target.reset();
}

// Book specific vehicle
function bookVehicle(vehicleType) {
    showNotification(`Great choice! Booking ${vehicleType} for you...`, 'info');
    setTimeout(() => {
        showBookingModal();
    }, 1000);
}

// Show vehicle details
function showVehicleDetails(vehicleType) {
    const details = {
        'hatchback': 'Perfect for city rides with excellent fuel efficiency. Includes AC, music system, and GPS navigation.',
        'sedan': 'Comfortable premium travel with spacious interiors and professional chauffeur service.',
        'suv': 'Ideal for family trips with 7-seater capacity and extra luggage space.',
        'luxury': 'Ultimate premium experience with luxury vehicles like BMW, Mercedes, and Audi.',
        'tempo': 'Perfect for group travel with 12-17 seater capacity and comfortable push-back seats.',
        'bus': 'Large group transportation for corporate events and tours with 25-35 seater capacity.'
    };
    
    showNotification(details[vehicleType] || 'Vehicle details not available.', 'info');
}

// Show notification
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
    notification.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
    notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        if (notification.parentNode) {
            notification.remove();
        }
    }, 5000);
}

// Animate counters
function animateCounters() {
    const counters = document.querySelectorAll('.stats-counter');
    counters.forEach(counter => {
        const target = parseInt(counter.getAttribute('data-target'));
        const increment = target / 50;
        let current = 0;
        
        const timer = setInterval(() => {
            current += increment;
            if (current >= target) {
                counter.textContent = target;
                clearInterval(timer);
            } else {
                counter.textContent = Math.floor(current);
            }
        }, 40);
    });
}

// Initialize page
document.addEventListener('DOMContentLoaded', function() {
    // Animate hero stats on load
    setTimeout(() => {
        const heroCounters = document.querySelectorAll('.stats-counter');
        heroCounters.forEach(counter => {
            const target = parseInt(counter.getAttribute('data-target'));
            const increment = target / 30;
            let current = 0;
            
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    counter.textContent = target;
                    clearInterval(timer);
                } else {
                    counter.textContent = Math.floor(current);
                }
            }, 50);
        });
    }, 1000);

    // Navbar scroll effect
    window.addEventListener('scroll', function() {
        const navbar = document.getElementById('navbar');
        if (window.scrollY > 100) {
            navbar.classList.add('navbar-scrolled');
        } else {
            navbar.classList.remove('navbar-scrolled');
        }
    });

    // Add slide-in animation to elements
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animated');
            }
        });
    }, observerOptions);

    // Observe all slide-in elements
    document.querySelectorAll('.slide-in, .fade-in').forEach(el => {
        observer.observe(el);
    });

    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
});
 (function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'99f47c66a657919e',t:'MTc2MzI2OTg2OS4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();
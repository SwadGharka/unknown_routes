 // Section toggle functionality
        function toggleSection(sectionId) {
            // Hide all sections first
            const allSections = document.querySelectorAll('.section-content');
            allSections.forEach(section => {
                section.classList.add('d-none');
            });
           
            // Show the selected section
            const targetSection = document.getElementById(sectionId);
            if (targetSection) {
                targetSection.classList.remove('d-none');
               
                // Update active section indicator
                const activeSection = document.getElementById('activeSection');
                const activeSectionName = document.getElementById('activeSectionName');
               
                const sectionNames = {
                    'packages': 'Travel Packages',
                    'stats': 'Why Choose Us',
                    'testimonials': 'Customer Reviews',
                    'contact': 'Get In Touch'
                };
               
                activeSection.classList.remove('d-none');
                activeSectionName.textContent = sectionNames[sectionId];
               
                // Smooth scroll to section
                setTimeout(() => {
                    targetSection.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }, 100);
               
                // Trigger animations for the section
                const elementsToAnimate = targetSection.querySelectorAll('.slide-in, .fade-in, .stats-counter');
                elementsToAnimate.forEach(el => {
                    el.classList.add('animated');
                });
               
                // Animate counters if in stats section
                if (sectionId === 'stats') {
                    const counters = targetSection.querySelectorAll('.stats-counter');
                    counters.forEach(counter => {
                        const target = parseInt(counter.getAttribute('data-target'));
                        animateCounter(counter, target);
                    });
                }
            }
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

        // Book package function
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

        // Navbar scroll effect
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

        // Animated counter function
        function animateCounter(element, target, duration = 2000) {
            let start = 0;
            const increment = target / (duration / 16);
           
            function updateCounter() {
                start += increment;
                if (start < target) {
                    element.textContent = Math.floor(start);
                    requestAnimationFrame(updateCounter);
                } else {
                    element.textContent = target;
                }
            }
            updateCounter();
        }

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

        // Package details data
        const packageDetails = {
            brb: {
                name: 'BRB Package - Manali Mountain Escape',
                price: '₹45,999',
                duration: '3 Days / 2 Nights',
                location: 'Manali, Himachal Pradesh',
                color: 'primary',
                attractions: ['Rohtang Pass', 'Solang Valley', 'Hadimba Temple', 'Mall Road'],
                itinerary: [
                    {
                        day: 'Day 1',
                        title: 'Arrival & Local Sightseeing',
                        activities: ['Check-in at Mountain Resort', 'Visit Hadimba Temple', 'Explore Mall Road', 'Welcome dinner with local cuisine']
                    },
                    {
                        day: 'Day 2',
                        title: 'Adventure & Relaxation',
                        activities: ['Early morning yoga session', 'Solang Valley adventure activities', 'Paragliding (weather permitting)', 'Evening spa session']
                    },
                    {
                        day: 'Day 3',
                        title: 'Rohtang Pass & Departure',
                        activities: ['Visit Rohtang Pass (subject to permits)', 'Snow activities', 'Lunch at mountain cafe', 'Departure to airport/station']
                    }
                ],
                inclusions: ['2 nights accommodation', 'All meals', 'Adventure activities', 'Local transportation', 'Professional guide'],
                exclusions: ['Flight tickets', 'Personal expenses', 'Travel insurance', 'Tips and gratuities']
            },
            ttyl: {
                name: 'TTYL Package - Goa Beach Paradise',
                price: '₹52,999',
                duration: '3 Days / 2 Nights',
                location: 'Goa Beaches',
                color: 'success',
                attractions: ['Baga Beach', 'Calangute Beach', 'Fort Aguada', 'Old Goa Churches'],
                itinerary: [
                    {
                        day: 'Day 1',
                        title: 'Beach Arrival & Relaxation',
                        activities: ['Check-in at beachfront resort', 'Welcome drink & beach lunch', 'Afternoon at Baga Beach', 'Sunset at Calangute Beach']
                    },
                    {
                        day: 'Day 2',
                        title: 'Water Sports & Culture',
                        activities: ['Morning water sports session', 'Parasailing & jet skiing', 'Visit Fort Aguada', 'Old Goa churches tour', 'Beach party evening']
                    },
                    {
                        day: 'Day 3',
                        title: 'Spa & Departure',
                        activities: ['Ayurvedic spa session', 'Beach yoga', 'Shopping at local markets', 'Departure transfer']
                    }
                ],
                inclusions: ['2 nights beachfront stay', 'All meals & drinks', 'Water sports activities', 'Spa sessions', 'Airport transfers'],
                exclusions: ['Flight tickets', 'Alcohol (premium brands)', 'Personal shopping', 'Travel insurance']
            },
            afk: {
                name: 'AFK Package - Rishikesh River Retreat',
                price: '₹35,999',
                duration: '3 Days / 2 Nights',
                location: 'Rishikesh, Uttarakhand',
                color: '#6f42c1',
                attractions: ['Laxman Jhula', 'Ram Jhula', 'Beatles Ashram', 'Triveni Ghat'],
                itinerary: [
                    {
                        day: 'Day 1',
                        title: 'Spiritual Arrival',
                        activities: ['Riverside camping setup', 'Visit Laxman Jhula', 'Evening Ganga Aarti', 'Meditation session']
                    },
                    {
                        day: 'Day 2',
                        title: 'Adventure & Spirituality',
                        activities: ['Morning yoga by the river', 'White water rafting', 'Visit Beatles Ashram', 'Spiritual discourse at ashram']
                    },
                    {
                        day: 'Day 3',
                        title: 'Final Blessings',
                        activities: ['Sunrise meditation', 'Visit Ram Jhula', 'Holy dip at Triveni Ghat', 'Departure with blessed memories']
                    }
                ],
                inclusions: ['2 nights riverside camping', 'Vegetarian meals', 'Rafting equipment', 'Yoga & meditation sessions', 'Local transfers'],
                exclusions: ['Train/bus tickets', 'Personal gear', 'Donations at temples', 'Travel insurance']
            },
            gtg: {
                name: 'GTG Package - Jaipur Royal Heritage',
                price: '₹48,999',
                duration: '3 Days / 2 Nights',
                location: 'Jaipur, Rajasthan',
                color: 'warning',
                attractions: ['Amber Fort', 'City Palace', 'Hawa Mahal', 'Jantar Mantar'],
                itinerary: [
                    {
                        day: 'Day 1',
                        title: 'Royal Welcome',
                        activities: ['Check-in at heritage palace hotel', 'Welcome with traditional tilaka', 'City Palace tour', 'Royal dinner with folk dance']
                    },
                    {
                        day: 'Day 2',
                        title: 'Forts & Culture',
                        activities: ['Elephant safari to Amber Fort', 'Explore Amber Fort palace', 'Visit Hawa Mahal', 'Shopping at Johari Bazaar', 'Cultural performance evening']
                    },
                    {
                        day: 'Day 3',
                        title: 'Science & Departure',
                        activities: ['Visit Jantar Mantar observatory', 'Traditional Rajasthani lunch', 'Last-minute shopping', 'Royal send-off']
                    }
                ],
                inclusions: ['2 nights heritage hotel', 'All royal meals', 'Elephant safari', 'Cultural shows', 'AC transportation'],
                exclusions: ['Flight tickets', 'Shopping expenses', 'Camera fees at monuments', 'Travel insurance']
            },
            lol: {
                name: 'LOL Package - Mumbai Bollywood Fun',
                price: '₹42,999',
                duration: '3 Days / 2 Nights',
                location: 'Mumbai, Maharashtra',
                color: '#e83e8c',
                attractions: ['Gateway of India', 'Marine Drive', 'Juhu Beach', 'Film City'],
                itinerary: [
                    {
                        day: 'Day 1',
                        title: 'City of Dreams Arrival',
                        activities: ['Hotel check-in', 'Gateway of India visit', 'Boat ride to Elephanta Caves', 'Evening at Marine Drive', 'Street food tour']
                    },
                    {
                        day: 'Day 2',
                        title: 'Bollywood Extravaganza',
                        activities: ['Film City studio tour', 'Meet Bollywood stars (if available)', 'Comedy club show', 'Juhu Beach sunset', 'Bollywood dance workshop']
                    },
                    {
                        day: 'Day 3',
                        title: 'Local Experiences',
                        activities: ['Local train experience', 'Dhobi Ghat visit', 'Crawford Market shopping', 'Farewell at iconic cafe']
                    }
                ],
                inclusions: ['2 nights city hotel', 'All meals', 'Studio tours', 'Comedy show tickets', 'Local transportation'],
                exclusions: ['Flight tickets', 'Shopping', 'Celebrity meet charges', 'Travel insurance']
            },
            asap: {
                name: 'ASAP Package - Ladakh High Altitude Thrill',
                price: '₹65,999',
                duration: '4 Days / 3 Nights',
                location: 'Ladakh, J&K',
                color: 'danger',
                attractions: ['Pangong Lake', 'Nubra Valley', 'Khardung La', 'Leh Palace'],
                itinerary: [
                    {
                        day: 'Day 1',
                        title: 'Acclimatization Day',
                        activities: ['Arrival in Leh', 'Rest for altitude adjustment', 'Visit Leh Palace', 'Local market exploration', 'Light dinner']
                    },
                    {
                        day: 'Day 2',
                        title: 'Khardung La Adventure',
                        activities: ['Early morning bike expedition', 'Cross Khardung La Pass (18,380 ft)', 'Nubra Valley exploration', 'Camel safari in sand dunes', 'Overnight in Nubra']
                    },
                    {
                        day: 'Day 3',
                        title: 'Pangong Lake Magic',
                        activities: ['Journey to Pangong Lake', 'Photography at the blue lake', 'Camping under stars', 'Stargazing session', 'Bonfire night']
                    },
                    {
                        day: 'Day 4',
                        title: 'Return & Departure',
                        activities: ['Sunrise at Pangong', 'Return journey to Leh', 'Visit local monasteries', 'Departure preparations']
                    }
                ],
                inclusions: ['3 nights accommodation', 'All meals', 'Bike rental & fuel', 'Camping equipment', 'Permits & guides', 'Oxygen support'],
                exclusions: ['Flight tickets', 'Personal riding gear', 'Medical insurance', 'Emergency evacuation']
            }
        };

        // Show package details function
        function showPackageDetails(packageId) {
            const package = packageDetails[packageId];
            if (!package) return;

            const modal = new bootstrap.Modal(document.getElementById('packageModal'));
            const modalBody = document.getElementById('packageModalBody');
            const modalTitle = document.getElementById('packageModalLabel');
            const modalBookBtn = document.getElementById('modalBookBtn');

            modalTitle.textContent = package.name;
           
            modalBody.innerHTML = `
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="card border-0 bg-light h-100">
                            <div class="card-body">
                                <h6 class="fw-bold text-${package.color === '#6f42c1' || package.color === '#e83e8c' ? 'dark' : package.color} mb-3">
                                    📍 Package Overview
                                </h6>
                                <div class="mb-3">
                                    <strong>Duration:</strong> ${package.duration}<br>
                                    <strong>Location:</strong> ${package.location}<br>
                                    <strong>Price:</strong> <span class="text-${package.color === '#6f42c1' || package.color === '#e83e8c' ? 'dark' : package.color} fw-bold">${package.price}</span> per person
                                </div>
                                <h6 class="fw-bold mb-2">🗺️ Major Attractions:</h6>
                                <div class="d-flex flex-wrap gap-1">
                                    ${package.attractions.map(attraction =>
                                        `<span class="badge bg-${package.color === '#6f42c1' || package.color === '#e83e8c' ? 'secondary' : package.color} bg-opacity-10 text-${package.color === '#6f42c1' || package.color === '#e83e8c' ? 'dark' : package.color} px-2 py-1">${attraction}</span>`
                                    ).join('')}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card border-0 bg-light h-100">
                            <div class="card-body">
                                <h6 class="fw-bold text-success mb-3">✅ Inclusions</h6>
                                <ul class="list-unstyled small">
                                    ${package.inclusions.map(item => `<li class="mb-1">• ${item}</li>`).join('')}
                                </ul>
                                <h6 class="fw-bold text-danger mb-2 mt-3">❌ Exclusions</h6>
                                <ul class="list-unstyled small">
                                    ${package.exclusions.map(item => `<li class="mb-1">• ${item}</li>`).join('')}
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
               
                <div class="mt-4">
                    <h6 class="fw-bold mb-3">📅 Detailed Itinerary</h6>
                    ${package.itinerary.map(day => `
                        <div class="card border-0 bg-light mb-3">
                            <div class="card-body">
                                <h6 class="fw-bold text-${package.color === '#6f42c1' || package.color === '#e83e8c' ? 'dark' : package.color} mb-2">
                                    ${day.day}: ${day.title}
                                </h6>
                                <ul class="list-unstyled small mb-0">
                                    ${day.activities.map(activity => `<li class="mb-1">• ${activity}</li>`).join('')}
                                </ul>
                            </div>
                        </div>
                    `).join('')}
                </div>
            `;

            // Set up book button
            modalBookBtn.onclick = () => {
                modal.hide();
                bookPackage(package.name.split(' - ')[0]);
            };

            modal.show();
        }

        // Enhanced form submission
        function handleSubmit(event) {
            event.preventDefault();
           
            const button = event.target.querySelector('button[type="submit"]');
            const originalText = button.innerHTML;
           
            // Show loading state
            button.innerHTML = 'Sending... ⏳';
            button.disabled = true;
            button.classList.add('opacity-75');
           
            // Simulate API call
            setTimeout(() => {
                // Show success state
                button.innerHTML = 'Inquiry Sent! ✅';
                button.classList.remove('opacity-75');
                button.classList.remove('btn-gradient-secondary');
                button.classList.add('btn-success');
               
                // Show success message
                const successDiv = document.createElement('div');
                successDiv.className = 'alert alert-success mt-3';
                successDiv.innerHTML = '🎉 Thank you! We\'ll get back to you within 24 hours with a customized quote.';
                event.target.appendChild(successDiv);
               
                // Reset form after 4 seconds
                setTimeout(() => {
                    event.target.reset();
                    button.innerHTML = originalText;
                    button.disabled = false;
                    button.classList.remove('btn-success');
                    button.classList.add('btn-gradient-secondary');
                    if (successDiv.parentNode) {
                        successDiv.remove();
                    }
                }, 4000);
            }, 2000);
        }

        // Comprehensive state packages data with multiple city packages
        const statePackages = {
            'andhra-pradesh': {
                name: 'Andhra Pradesh',
                emoji: '🏛️',
                description: 'Land of temples, beaches, and rich cultural heritage',
                packages: [
                    {
                        name: 'Tirupati Spiritual Journey',
                        city: 'Tirupati',
                        duration: '3 Days / 2 Nights',
                        price: '₹24,999',
                        image: 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Tirumala Temple darshan', 'Chandragiri Fort', 'TTD gardens', 'Local prasadam'],
                        inclusions: ['Temple VIP darshan', 'AC accommodation', 'All meals', 'Local transport']
                    },
                    {
                        name: 'Vizag Beach Paradise',
                        city: 'Visakhapatnam',
                        duration: '4 Days / 3 Nights',
                        price: '₹32,999',
                        image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['RK Beach', 'Submarine museum', 'Araku Valley', 'Borra Caves'],
                        inclusions: ['Beach resort stay', 'Valley excursion', 'All meals', 'Sightseeing']
                    },
                    {
                        name: 'Araku Coffee Trail',
                        city: 'Araku Valley',
                        duration: '2 Days / 1 Night',
                        price: '₹18,999',
                        image: 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Coffee plantations', 'Tribal museum', 'Valley views', 'Local cuisine'],
                        inclusions: ['Hill station stay', 'Plantation tours', 'Tribal interactions', 'Transport']
                    }
                ],
                bestTime: 'October to March'
            },
            'arunachal-pradesh': {
                name: 'Arunachal Pradesh',
                emoji: '🏔️',
                description: 'Land of dawn-lit mountains and Buddhist monasteries',
                packages: [
                    {
                        name: 'Tawang Monastery Circuit',
                        city: 'Tawang',
                        duration: '4 Days / 3 Nights',
                        price: '₹42,999',
                        image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Tawang Monastery', 'Sela Pass', 'Madhuri Lake', 'War memorial'],
                        inclusions: ['Mountain lodge stay', 'Monastery visits', 'All meals', 'Permits & guide']
                    },
                    {
                        name: 'Itanagar Cultural Tour',
                        city: 'Itanagar',
                        duration: '3 Days / 2 Nights',
                        price: '₹28,999',
                        image: 'https://images.unsplash.com/photo-1544735716-392fe2489ffa?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Ita Fort', 'State museum', 'Ganga Lake', 'Local markets'],
                        inclusions: ['City hotel stay', 'Cultural tours', 'All meals', 'Local transport']
                    },
                    {
                        name: 'Bomdila Buddhist Trail',
                        city: 'Bomdila',
                        duration: '3 Days / 2 Nights',
                        price: '₹35,999',
                        image: 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Bomdila Monastery', 'Apple orchards', 'Craft center', 'Mountain views'],
                        inclusions: ['Monastery guest house', 'Meditation sessions', 'Organic meals', 'Nature walks']
                    }
                ],
                bestTime: 'March to October'
            },
            'assam': {
                name: 'Assam',
                emoji: '🦏',
                description: 'Land of one-horned rhinos, tea gardens, and river islands',
                packages: [
                    {
                        name: 'Kaziranga Wildlife Safari',
                        city: 'Kaziranga',
                        duration: '3 Days / 2 Nights',
                        price: '₹35,999',
                        image: 'https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Rhino safari', 'Elephant rides', 'Bird watching', 'Nature walks'],
                        inclusions: ['Eco lodge stay', 'Safari permits', 'All meals', 'Professional guide']
                    },
                    {
                        name: 'Guwahati Temple Trail',
                        city: 'Guwahati',
                        duration: '2 Days / 1 Night',
                        price: '₹22,999',
                        image: 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Kamakhya Temple', 'Brahmaputra cruise', 'Assam State Museum', 'Local markets'],
                        inclusions: ['City hotel stay', 'Temple visits', 'River cruise', 'Local transport']
                    },
                    {
                        name: 'Majuli Island Experience',
                        city: 'Majuli',
                        duration: '4 Days / 3 Nights',
                        price: '₹38,999',
                        image: 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['River island culture', 'Satras (monasteries)', 'Mask making', 'Traditional dance'],
                        inclusions: ['Heritage homestay', 'Cultural programs', 'All meals', 'Ferry transfers']
                    }
                ],
                bestTime: 'November to April'
            },
            'goa': {
                name: 'Goa',
                emoji: '🏖️',
                description: 'Sun, sand, and Portuguese heritage in India\'s beach paradise',
                packages: [
                    {
                        name: 'North Goa Beach Hopping',
                        city: 'North Goa',
                        duration: '3 Days / 2 Nights',
                        price: '₹35,999',
                        image: 'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Baga Beach parties', 'Calangute water sports', 'Anjuna flea market', 'Fort Aguada'],
                        inclusions: ['Beach resort stay', 'Water sports package', 'All meals', 'Airport transfers']
                    },
                    {
                        name: 'South Goa Serenity',
                        city: 'South Goa',
                        duration: '4 Days / 3 Nights',
                        price: '₹42,999',
                        image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Palolem Beach', 'Colva Beach', 'Spice plantations', 'Dudhsagar Falls'],
                        inclusions: ['Luxury beach resort', 'Spa treatments', 'Plantation tours', 'All meals']
                    },
                    {
                        name: 'Old Goa Heritage Walk',
                        city: 'Old Goa',
                        duration: '2 Days / 1 Night',
                        price: '₹28,999',
                        image: 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Basilica of Bom Jesus', 'Se Cathedral', 'Archaeological Museum', 'Portuguese architecture'],
                        inclusions: ['Heritage hotel stay', 'Guided tours', 'Cultural programs', 'Local transport']
                    }
                ],
                bestTime: 'November to February'
            },
            'kerala': {
                name: 'Kerala',
                emoji: '🌴',
                description: 'God\'s Own Country with backwaters, hill stations, and spice gardens',
                packages: [
                    {
                        name: 'Alleppey Houseboat Experience',
                        city: 'Alleppey',
                        duration: '3 Days / 2 Nights',
                        price: '₹45,999',
                        image: 'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Luxury houseboat stay', 'Backwater cruise', 'Village visits', 'Sunset views'],
                        inclusions: ['AC houseboat', 'All meals onboard', 'Fishing experience', 'Cultural shows']
                    },
                    {
                        name: 'Munnar Tea Gardens',
                        city: 'Munnar',
                        duration: '4 Days / 3 Nights',
                        price: '₹38,999',
                        image: 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Tea plantation tours', 'Eravikulam National Park', 'Mattupetty Dam', 'Spice gardens'],
                        inclusions: ['Hill station resort', 'Plantation visits', 'Nature walks', 'All meals']
                    },
                    {
                        name: 'Kochi Cultural Circuit',
                        city: 'Kochi',
                        duration: '3 Days / 2 Nights',
                        price: '₹32,999',
                        image: 'https://images.unsplash.com/photo-1544735716-392fe2489ffa?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Chinese fishing nets', 'Mattancherry Palace', 'Kathakali performances', 'Spice markets'],
                        inclusions: ['Heritage hotel', 'Cultural shows', 'City tours', 'Local cuisine']
                    }
                ],
                bestTime: 'September to March'
            },
            'rajasthan': {
                name: 'Rajasthan',
                emoji: '🏰',
                description: 'Land of kings with majestic palaces, desert safaris, and royal heritage',
                packages: [
                    {
                        name: 'Jaipur Pink City Royal Tour',
                        city: 'Jaipur',
                        duration: '3 Days / 2 Nights',
                        price: '₹42,999',
                        image: 'https://images.unsplash.com/photo-1599661046827-dacde6976549?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Amber Fort elephant ride', 'City Palace', 'Hawa Mahal', 'Jantar Mantar'],
                        inclusions: ['Palace hotel stay', 'Royal dining', 'Cultural shows', 'Shopping tours']
                    },
                    {
                        name: 'Udaipur Lake City Romance',
                        city: 'Udaipur',
                        duration: '4 Days / 3 Nights',
                        price: '₹55,999',
                        image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Lake Palace', 'City Palace complex', 'Boat rides on Pichola', 'Saheliyon ki Bari'],
                        inclusions: ['Lake view hotel', 'Sunset boat rides', 'Palace visits', 'Romantic dinners']
                    },
                    {
                        name: 'Jaisalmer Desert Safari',
                        city: 'Jaisalmer',
                        duration: '3 Days / 2 Nights',
                        price: '₹48,999',
                        image: 'https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Golden Fort', 'Camel safari', 'Desert camping', 'Folk performances'],
                        inclusions: ['Desert camp stay', 'Camel rides', 'Cultural programs', 'Stargazing']
                    }
                ],
                bestTime: 'October to March'
            },
            'himachal-pradesh': {
                name: 'Himachal Pradesh',
                emoji: '🏔️',
                description: 'Land of snow-capped mountains, adventure sports, and hill stations',
                packages: [
                    {
                        name: 'Manali Adventure Special',
                        city: 'Manali',
                        duration: '4 Days / 3 Nights',
                        price: '₹45,999',
                        image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Rohtang Pass', 'Solang Valley paragliding', 'Hadimba Temple', 'Mall Road shopping'],
                        inclusions: ['Mountain resort', 'Adventure activities', 'All meals', 'Local sightseeing']
                    },
                    {
                        name: 'Shimla Colonial Charm',
                        city: 'Shimla',
                        duration: '3 Days / 2 Nights',
                        price: '₹38,999',
                        image: 'https://images.unsplash.com/photo-1544735716-392fe2489ffa?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Mall Road', 'Christ Church', 'Jakhu Temple', 'Toy train ride'],
                        inclusions: ['Heritage hotel', 'Toy train tickets', 'City tours', 'All meals']
                    },
                    {
                        name: 'Dharamshala Spiritual Retreat',
                        city: 'Dharamshala',
                        duration: '4 Days / 3 Nights',
                        price: '₹41,999',
                        image: 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Dalai Lama Temple', 'McLeod Ganj', 'Triund trek', 'Tibetan culture'],
                        inclusions: ['Mountain lodge', 'Meditation sessions', 'Trekking guide', 'Tibetan meals']
                    }
                ],
                bestTime: 'March to June, September to November'
            },
            'bihar': {
                name: 'Bihar',
                emoji: '🏛️',
                description: 'Land of Buddha and ancient learning centers',
                packages: [
                    {
                        name: 'Bodh Gaya Spiritual Journey',
                        city: 'Bodh Gaya',
                        duration: '3 Days / 2 Nights',
                        price: '₹25,999',
                        image: 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Mahabodhi Temple', 'Bodhi Tree', 'Buddhist monasteries', 'Meditation sessions'],
                        inclusions: ['Buddhist lodge stay', 'Temple visits', 'Meditation classes', 'Vegetarian meals']
                    },
                    {
                        name: 'Nalanda Heritage Tour',
                        city: 'Nalanda',
                        duration: '2 Days / 1 Night',
                        price: '₹22,999',
                        image: 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        highlights: ['Ancient university ruins', 'Archaeological museum', 'Hiuen Tsang Memorial', 'Local villages'],
                        inclusions: ['Heritage hotel', 'Guided tours', 'Museum visits', 'Cultural programs']
                    }
                ],
                bestTime: 'October to March'
            },
            'chhattisgarh': {
                name: 'Tribal Culture & Waterfalls',
                duration: '4 Days / 3 Nights',
                price: '₹32,999',
                destinations: ['Chitrakoot Falls', 'Raipur', 'Bastar'],
                highlights: ['Niagara of India', 'Tribal art workshops', 'Dense forest treks', 'Local handicrafts'],
                bestTime: 'October to February'
            },
            'goa': {
                name: 'Beach Paradise Getaway',
                duration: '3 Days / 2 Nights',
                price: '₹52,999',
                destinations: ['North Goa', 'South Goa', 'Old Goa'],
                highlights: ['Beach parties & water sports', 'Portuguese heritage sites', 'Spice plantation tours', 'Sunset cruises'],
                bestTime: 'November to February'
            },
            'gujarat': {
                name: 'Lions & Salt Desert Safari',
                duration: '5 Days / 4 Nights',
                price: '₹42,999',
                destinations: ['Gir Forest', 'Rann of Kutch', 'Ahmedabad'],
                highlights: ['Asiatic lion safari', 'White desert camping', 'Handicraft villages', 'Sabarmati Ashram'],
                bestTime: 'November to February'
            },
            'haryana': {
                name: 'Heritage & Spiritual Tour',
                duration: '3 Days / 2 Nights',
                price: '₹22,999',
                destinations: ['Kurukshetra', 'Panipat', 'Faridabad'],
                highlights: ['Battlefield of Mahabharata', 'Historical monuments', 'Spiritual discourse', 'Local cuisine'],
                bestTime: 'October to March'
            },
            'himachal-pradesh': {
                name: 'Mountain Adventure Escape',
                duration: '5 Days / 4 Nights',
                price: '₹45,999',
                destinations: ['Manali', 'Shimla', 'Dharamshala'],
                highlights: ['Snow activities', 'Paragliding adventures', 'Dalai Lama residence', 'Apple orchards'],
                bestTime: 'March to June, September to November'
            },
            'jharkhand': {
                name: 'Waterfalls & Tribal Culture',
                duration: '4 Days / 3 Nights',
                price: '₹29,999',
                destinations: ['Ranchi', 'Jamshedpur', 'Deoghar'],
                highlights: ['Hundru Falls', 'Tribal museums', 'Baidyanath Temple', 'Industrial heritage'],
                bestTime: 'October to March'
            },
            'karnataka': {
                name: 'Royal Karnataka Circuit',
                duration: '6 Days / 5 Nights',
                price: '₹48,999',
                destinations: ['Mysore', 'Hampi', 'Coorg', 'Bangalore'],
                highlights: ['Mysore Palace', 'Vijayanagara ruins', 'Coffee plantations', 'IT city tour'],
                bestTime: 'October to March'
            },
            'kerala': {
                name: 'Gods Own Country Experience',
                duration: '6 Days / 5 Nights',
                price: '₹55,999',
                destinations: ['Munnar', 'Alleppey', 'Kochi', 'Thekkady'],
                highlights: ['Tea gardens', 'Houseboat cruise', 'Chinese fishing nets', 'Spice plantations'],
                bestTime: 'September to March'
            },
            'madhya-pradesh': {
                name: 'Heart of India Safari',
                duration: '5 Days / 4 Nights',
                price: '₹39,999',
                destinations: ['Khajuraho', 'Bandhavgarh', 'Bhopal'],
                highlights: ['Erotic temple sculptures', 'Tiger safari', 'Bhimbetka caves', 'Lake city charm'],
                bestTime: 'October to March'
            },
            'maharashtra': {
                name: 'Bollywood & Heritage Tour',
                duration: '5 Days / 4 Nights',
                price: '₹42,999',
                destinations: ['Mumbai', 'Pune', 'Aurangabad'],
                highlights: ['Film city tours', 'Ajanta Ellora caves', 'Street food trails', 'Hill stations'],
                bestTime: 'November to February'
            },
            'manipur': {
                name: 'Jewel of Northeast',
                duration: '5 Days / 4 Nights',
                price: '₹41,999',
                destinations: ['Imphal', 'Loktak Lake', 'Kangla Fort'],
                highlights: ['Floating islands', 'Manipuri dance', 'War cemeteries', 'Handloom weaving'],
                bestTime: 'October to March'
            },
            'meghalaya': {
                name: 'Abode of Clouds Adventure',
                duration: '5 Days / 4 Nights',
                price: '₹43,999',
                destinations: ['Shillong', 'Cherrapunji', 'Mawlynnong'],
                highlights: ['Living root bridges', 'Wettest place on earth', 'Cleanest village in Asia', 'Cave explorations'],
                bestTime: 'October to May'
            },
            'mizoram': {
                name: 'Blue Mountain Paradise',
                duration: '4 Days / 3 Nights',
                price: '₹37,999',
                destinations: ['Aizawl', 'Champhai', 'Serchhip'],
                highlights: ['Blue mountain views', 'Mizo culture', 'Bamboo crafts', 'Traditional festivals'],
                bestTime: 'November to March'
            },
            'nagaland': {
                name: 'Hornbill Festival Special',
                duration: '5 Days / 4 Nights',
                price: '₹44,999',
                destinations: ['Kohima', 'Dimapur', 'Mon'],
                highlights: ['Hornbill festival', 'Naga heritage village', 'War cemetery', 'Tribal traditions'],
                bestTime: 'October to March'
            },
            'odisha': {
                name: 'Temple & Beach Circuit',
                duration: '5 Days / 4 Nights',
                price: '₹34,999',
                destinations: ['Puri', 'Konark', 'Bhubaneswar'],
                highlights: ['Jagannath Temple', 'Sun Temple', 'Lingaraj Temple', 'Golden beach'],
                bestTime: 'October to March'
            },
            'punjab': {
                name: 'Golden Temple & Heritage',
                duration: '4 Days / 3 Nights',
                price: '₹31,999',
                destinations: ['Amritsar', 'Chandigarh', 'Patiala'],
                highlights: ['Golden Temple', 'Wagah border ceremony', 'Jallianwala Bagh', 'Punjabi cuisine'],
                bestTime: 'October to March'
            },
            'rajasthan': {
                name: 'Royal Rajasthan Circuit',
                duration: '7 Days / 6 Nights',
                price: '₹58,999',
                destinations: ['Jaipur', 'Udaipur', 'Jodhpur', 'Jaisalmer'],
                highlights: ['Palace hotels', 'Desert safari', 'Lake city romance', 'Camel rides'],
                bestTime: 'October to March'
            },
            'sikkim': {
                name: 'Himalayan Kingdom Tour',
                duration: '5 Days / 4 Nights',
                price: '₹46,999',
                destinations: ['Gangtok', 'Pelling', 'Lachung'],
                highlights: ['Kanchenjunga views', 'Monastery visits', 'Yumthang valley', 'Cable car rides'],
                bestTime: 'March to May, September to November'
            },
            'tamil-nadu': {
                name: 'Temple Trail & Hill Stations',
                duration: '6 Days / 5 Nights',
                price: '₹41,999',
                destinations: ['Chennai', 'Madurai', 'Ooty', 'Kanyakumari'],
                highlights: ['Meenakshi Temple', 'Nilgiri toy train', 'Southernmost tip', 'Marina beach'],
                bestTime: 'November to February'
            },
            'telangana': {
                name: 'Cyberabad & Heritage',
                duration: '4 Days / 3 Nights',
                price: '₹33,999',
                destinations: ['Hyderabad', 'Warangal', 'Nagarjunasagar'],
                highlights: ['Charminar & Golconda', 'IT hub tours', 'Thousand pillar temple', 'Biryani trails'],
                bestTime: 'October to March'
            },
            'tripura': {
                name: 'Royal Tripura Heritage',
                duration: '4 Days / 3 Nights',
                price: '₹35,999',
                destinations: ['Agartala', 'Udaipur', 'Kailashahar'],
                highlights: ['Ujjayanta Palace', 'Neermahal water palace', 'Tribal museums', 'Handloom centers'],
                bestTime: 'October to March'
            },
            'uttar-pradesh': {
                name: 'Golden Triangle Plus',
                duration: '6 Days / 5 Nights',
                price: '₹47,999',
                destinations: ['Agra', 'Varanasi', 'Lucknow', 'Mathura'],
                highlights: ['Taj Mahal sunrise', 'Ganga aarti', 'Nawabi cuisine', 'Krishna birthplace'],
                bestTime: 'October to March'
            },
            'uttarakhand': {
                name: 'Spiritual & Adventure Combo',
                duration: '6 Days / 5 Nights',
                price: '₹49,999',
                destinations: ['Rishikesh', 'Haridwar', 'Nainital', 'Jim Corbett'],
                highlights: ['River rafting', 'Ganga aarti', 'Lake district', 'Tiger safari'],
                bestTime: 'March to June, September to November'
            },
            'west-bengal': {
                name: 'Cultural Bengal Experience',
                duration: '5 Days / 4 Nights',
                price: '₹38,999',
                destinations: ['Kolkata', 'Darjeeling', 'Sundarbans'],
                highlights: ['Victoria Memorial', 'Toy train ride', 'Royal Bengal tigers', 'Bengali cuisine'],
                bestTime: 'October to March'
            },
            // Union Territories
            'andaman-nicobar': {
                name: 'Tropical Island Paradise',
                duration: '6 Days / 5 Nights',
                price: '₹65,999',
                destinations: ['Port Blair', 'Havelock', 'Neil Island'],
                highlights: ['Cellular Jail', 'Radhanagar Beach', 'Scuba diving', 'Coral reefs'],
                bestTime: 'October to May'
            },
            'chandigarh': {
                name: 'City Beautiful Tour',
                duration: '2 Days / 1 Night',
                price: '₹18,999',
                destinations: ['Chandigarh', 'Rock Garden', 'Sukhna Lake'],
                highlights: ['Planned city architecture', 'Rock Garden art', 'Lake activities', 'Rose Garden'],
                bestTime: 'October to March'
            },
            'dadra-nagar-haveli': {
                name: 'Tribal Culture Experience',
                duration: '3 Days / 2 Nights',
                price: '₹24,999',
                destinations: ['Silvassa', 'Vanganga Lake', 'Tribal Museum'],
                highlights: ['Warli art workshops', 'Nature walks', 'Tribal dance', 'Handicraft centers'],
                bestTime: 'October to March'
            },
            'daman-diu': {
                name: 'Portuguese Heritage Coast',
                duration: '3 Days / 2 Nights',
                price: '₹27,999',
                destinations: ['Daman', 'Diu', 'Nagoa Beach'],
                highlights: ['Portuguese forts', 'Beach resorts', 'Church visits', 'Water sports'],
                bestTime: 'November to February'
            },
            'delhi': {
                name: 'Capital City Heritage Walk',
                duration: '3 Days / 2 Nights',
                price: '₹29,999',
                destinations: ['Old Delhi', 'New Delhi', 'Gurgaon'],
                highlights: ['Red Fort', 'India Gate', 'Lotus Temple', 'Street food tours'],
                bestTime: 'October to March'
            },
            'jammu-kashmir': {
                name: 'Paradise on Earth',
                duration: '7 Days / 6 Nights',
                price: '₹68,999',
                destinations: ['Srinagar', 'Gulmarg', 'Pahalgam', 'Leh'],
                highlights: ['Dal Lake houseboats', 'Skiing in Gulmarg', 'Valley of shepherds', 'Ladakh monasteries'],
                bestTime: 'April to October'
            },
            'lakshadweep': {
                name: 'Coral Island Escape',
                duration: '5 Days / 4 Nights',
                price: '₹75,999',
                destinations: ['Kavaratti', 'Bangaram', 'Agatti'],
                highlights: ['Coral reef diving', 'Lagoon cruises', 'Water sports', 'Island hopping'],
                bestTime: 'October to May'
            },
            'puducherry': {
                name: 'French Riviera of India',
                duration: '3 Days / 2 Nights',
                price: '₹32,999',
                destinations: ['French Quarter', 'Auroville', 'Mahabalipuram'],
                highlights: ['Colonial architecture', 'Spiritual community', 'Beach promenades', 'French cuisine'],
                bestTime: 'November to March'
            }
        };

        // Explore state function
        function exploreState(stateId) {
            // Add click animation
            event.target.closest('.state-card').style.transform = 'scale(0.95)';
            setTimeout(() => {
                event.target.closest('.state-card').style.transform = '';
            }, 150);

            // Navigate to state packages page
            showStatePackagesPage(stateId);
        }

        // Show state packages page
        function showStatePackagesPage(stateId) {
            const stateData = statePackages[stateId];
            if (!stateData) {
                alert('Package details coming soon! Contact us for custom packages.');
                return;
            }

            // Hide all current sections
            const allSections = document.querySelectorAll('.section-content');
            allSections.forEach(section => section.classList.add('d-none'));
           
            const heroSection = document.querySelector('.hero-bg');
            const navSection = document.querySelector('.py-5.bg-white');
            const footer = document.querySelector('footer');
           
            // Hide main sections
            heroSection.style.display = 'none';
            navSection.style.display = 'none';
           
            // Create state packages page
            const statePageHTML = `
                <section class="py-5 bg-light min-vh-100" id="statePackagesPage">
                    <div class="container">
                        <!-- Back Navigation -->
                        <div class="mb-4">
                            <button class="btn btn-outline-primary rounded-pill px-4" onclick="goBackToHome()">
                                <i class="bi bi-arrow-left me-2"></i>Back to All States
                            </button>
                        </div>

                        <!-- State Header -->
                        <div class="text-center mb-5">
                            <div class="display-1 mb-3">${stateData.emoji}</div>
                            <h1 class="display-4 fw-bold text-dark mb-3">Explore ${stateData.name}</h1>
                            <p class="lead text-muted mb-4">${stateData.description}</p>
                            <div class="mx-auto rounded-pill" style="width: 120px; height: 4px; background: linear-gradient(45deg, #ffc107, #fd7e14);"></div>
                            <div class="mt-4">
                                <span class="badge bg-info bg-opacity-10 text-info px-4 py-2 rounded-pill fs-6">
                                    <i class="bi bi-calendar-event me-2"></i>Best Time: ${stateData.bestTime}
                                </span>
                            </div>
                        </div>

                        <!-- Packages Grid -->
                        <div class="row g-4">
                            ${stateData.packages.map((pkg, index) => `
                                <div class="col-lg-4 col-md-6">
                                    <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden" style="animation-delay: ${index * 0.1}s;">
                                        <div class="position-relative">
                                            <img src="${pkg.image}" class="card-img-top" style="height: 250px; object-fit: cover;" alt="${pkg.name}" onerror="this.src=''; this.style.display='none'; this.nextElementSibling.style.display='block';">
                                            <div class="package-image rounded-top" style="height: 250px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: none;">
                                                <div class="d-flex align-items-center justify-content-center h-100">
                                                    <div class="text-white text-center">
                                                        <div class="display-4 mb-2">${stateData.emoji}</div>
                                                        <h5>${pkg.city}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="position-absolute top-0 end-0 m-3">
                                                <span class="badge bg-primary px-3 py-2 rounded-pill">${pkg.city}</span>
                                            </div>
                                            <div class="position-absolute bottom-0 start-0 end-0 p-3" style="background: linear-gradient(transparent, rgba(0,0,0,0.7));">
                                                <h5 class="text-white fw-bold mb-0">${pkg.name}</h5>
                                            </div>
                                        </div>
                                        <div class="card-body p-4">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="text-muted"><i class="bi bi-clock me-1"></i>${pkg.duration}</span>
                                                <span class="fw-bold text-primary fs-5">${pkg.price}</span>
                                            </div>
                                           
                                            <div class="mb-3">
                                                <h6 class="fw-semibold text-success mb-2">✨ Highlights</h6>
                                                <div class="d-flex flex-wrap gap-1">
                                                    ${pkg.highlights.slice(0, 3).map(highlight =>
                                                        `<span class="badge bg-success bg-opacity-10 text-success px-2 py-1 small">${highlight}</span>`
                                                    ).join('')}
                                                    ${pkg.highlights.length > 3 ? `<span class="badge bg-light text-muted px-2 py-1 small">+${pkg.highlights.length - 3} more</span>` : ''}
                                                </div>
                                            </div>

                                            <div class="mb-4">
                                                <h6 class="fw-semibold text-info mb-2">📋 Inclusions</h6>
                                                <ul class="list-unstyled small text-muted">
                                                    ${pkg.inclusions.slice(0, 2).map(inclusion =>
                                                        `<li class="mb-1"><i class="bi bi-check-circle text-success me-2"></i>${inclusion}</li>`
                                                    ).join('')}
                                                    ${pkg.inclusions.length > 2 ? `<li class="text-primary small">+ ${pkg.inclusions.length - 2} more inclusions</li>` : ''}
                                                </ul>
                                            </div>

                                            <div class="d-flex gap-2">
                                                <button class="btn btn-outline-primary flex-fill py-2 rounded-pill fw-semibold" onclick="showCityPackageDetails('${stateId}', ${index})">
                                                    View Details
                                                </button>
                                                <button class="btn btn-primary flex-fill py-2 rounded-pill fw-semibold" onclick="bookCityPackage('${pkg.name}')">
                                                    Book Now
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            `).join('')}
                        </div>

                        <!-- State Info Section -->
                        <div class="mt-5">
                            <div class="row g-4">
                                <div class="col-md-6">
                                    <div class="card border-0 shadow-lg h-100">
                                        <div class="card-body p-4">
                                            <h5 class="fw-bold text-primary mb-3">
                                                <i class="bi bi-info-circle me-2"></i>About ${stateData.name}
                                            </h5>
                                            <p class="text-muted mb-4">${stateData.description}</p>
                                            <div class="row g-3">
                                                <div class="col-6">
                                                    <div class="text-center p-3 bg-primary bg-opacity-10 rounded">
                                                        <div class="fw-bold text-primary">${stateData.packages.length}</div>
                                                        <small class="text-muted">Packages</small>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="text-center p-3 bg-success bg-opacity-10 rounded">
                                                        <div class="fw-bold text-success">${stateData.packages.length} Cities</div>
                                                        <small class="text-muted">Covered</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card border-0 shadow-lg h-100">
                                        <div class="card-body p-4">
                                            <h5 class="fw-bold text-success mb-3">
                                                <i class="bi bi-gift me-2"></i>Special Offers
                                            </h5>
                                            <ul class="list-unstyled">
                                                <li class="mb-2 d-flex align-items-center">
                                                    <i class="bi bi-check-circle text-success me-2"></i>
                                                    <span>15% off for groups of 4+ people</span>
                                                </li>
                                                <li class="mb-2 d-flex align-items-center">
                                                    <i class="bi bi-check-circle text-success me-2"></i>
                                                    <span>Free cancellation up to 48 hours</span>
                                                </li>
                                                <li class="mb-2 d-flex align-items-center">
                                                    <i class="bi bi-check-circle text-success me-2"></i>
                                                    <span>Complimentary travel insurance</span>
                                                </li>
                                                <li class="mb-2 d-flex align-items-center">
                                                    <i class="bi bi-check-circle text-success me-2"></i>
                                                    <span>24/7 customer support</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Call to Action -->
                        <div class="text-center mt-5">
                            <div class="card border-0 shadow-lg" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                <div class="card-body p-5 text-white">
                                    <h4 class="fw-bold mb-3">Ready to Explore ${stateData.name}?</h4>
                                    <p class="lead mb-4">Contact our travel experts for customized packages and group bookings</p>
                                    <div class="d-flex flex-column flex-sm-row gap-3 justify-content-center">
                                        <button class="btn btn-light btn-lg px-5 py-3 rounded-pill fw-semibold" onclick="goBackToHome(); setTimeout(() => toggleSection('contact'), 500);">
                                            Get Custom Quote
                                        </button>
                                        <button class="btn btn-outline-light btn-lg px-5 py-3 rounded-pill fw-semibold" onclick="window.open('tel:+91-800-OOO-TRIP', '_blank')">
                                            Call Now
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            `;

            // Insert state page after footer
            footer.insertAdjacentHTML('beforebegin', statePageHTML);

            // Scroll to top
            window.scrollTo({ top: 0, behavior: 'smooth' });

            // Add animations
            setTimeout(() => {
                const cards = document.querySelectorAll('#statePackagesPage .card-hover');
                cards.forEach((card, index) => {
                    setTimeout(() => {
                        card.style.opacity = '0';
                        card.style.transform = 'translateY(30px)';
                        card.style.transition = 'all 0.6s ease';
                       
                        setTimeout(() => {
                            card.style.opacity = '1';
                            card.style.transform = 'translateY(0)';
                        }, 50);
                    }, index * 100);
                });
            }, 100);
        }

        // Go back to home function
        function goBackToHome() {
            // Remove state packages page
            const statePage = document.getElementById('statePackagesPage');
            if (statePage) {
                statePage.remove();
            }

            // Show main sections
            const heroSection = document.querySelector('.hero-bg');
            const navSection = document.querySelector('.py-5.bg-white');
           
            heroSection.style.display = 'flex';
            navSection.style.display = 'block';

            // Hide all section content
            const allSections = document.querySelectorAll('.section-content');
            allSections.forEach(section => section.classList.add('d-none'));

            // Hide active section indicator
            const activeSection = document.getElementById('activeSection');
            activeSection.classList.add('d-none');

            // Scroll to navigation menu
            setTimeout(() => {
                navSection.scrollIntoView({
                    behavior: 'smooth',
                    block: 'center'
                });
            }, 100);
        }

        // Show city package details
        function showCityPackageDetails(stateId, packageIndex) {
            const stateData = statePackages[stateId];
            const pkg = stateData.packages[packageIndex];
           
            const modal = new bootstrap.Modal(document.getElementById('packageModal') || createPackageModal());
            const modalBody = document.getElementById('packageModalBody');
            const modalTitle = document.getElementById('packageModalLabel');
            const modalBookBtn = document.getElementById('modalBookBtn');

            modalTitle.textContent = pkg.name;
           
            modalBody.innerHTML = `
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="card border-0 bg-light h-100">
                            <div class="card-body">
                                <h6 class="fw-bold text-primary mb-3">📍 Package Overview</h6>
                                <div class="mb-3">
                                    <strong>City:</strong> ${pkg.city}<br>
                                    <strong>Duration:</strong> ${pkg.duration}<br>
                                    <strong>Price:</strong> <span class="text-primary fw-bold">${pkg.price}</span> per person
                                </div>
                                <h6 class="fw-bold mb-2">✨ Highlights</h6>
                                <div class="d-flex flex-wrap gap-1">
                                    ${pkg.highlights.map(highlight =>
                                        `<span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1">${highlight}</span>`
                                    ).join('')}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card border-0 bg-light h-100">
                            <div class="card-body">
                                <h6 class="fw-bold text-success mb-3">✅ Package Inclusions</h6>
                                <ul class="list-unstyled">
                                    ${pkg.inclusions.map(inclusion => `<li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>${inclusion}</li>`).join('')}
                                </ul>
                               
                                <div class="mt-4 p-3 bg-warning bg-opacity-10 rounded">
                                    <h6 class="fw-bold text-warning mb-2">🎉 Special Offer</h6>
                                    <p class="small mb-0">Book now and get 15% off for groups of 4+ people!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;

            modalBookBtn.onclick = () => {
                modal.hide();
                bookCityPackage(pkg.name);
            };

            modal.show();
        }

        // Book city package
        function bookCityPackage(packageName) {
            goBackToHome();
            setTimeout(() => {
                toggleSection('contact');
               
                setTimeout(() => {
                    const textarea = document.querySelector('#contact textarea');
                    if (textarea) {
                        textarea.value = `I'm interested in the "${packageName}" package. Please send me detailed itinerary and pricing information.`;
                        textarea.focus();
                        textarea.classList.add('border-primary');
                       
                        setTimeout(() => {
                            textarea.classList.remove('border-primary');
                        }, 3000);
                    }
                }, 1000);
            }, 500);
        }

        // Create package modal if it doesn't exist
        function createPackageModal() {
            const modalHTML = `
                <div class="modal fade" id="packageModal" tabindex="-1" aria-labelledby="packageModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content border-0 shadow-lg">
                            <div class="modal-header border-0 pb-0">
                                <h5 class="modal-title fw-bold" id="packageModalLabel">Package Details</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body p-4" id="packageModalBody">
                                <!-- Package details will be loaded here -->
                            </div>
                            <div class="modal-footer border-0 pt-0">
                                <button type="button" class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary rounded-pill px-4" id="modalBookBtn">Book This Package</button>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            document.body.insertAdjacentHTML('beforeend', modalHTML);
            return document.getElementById('packageModal');
        }

        // Show state package modal
        function showStatePackageModal(package, stateId) {
            // Create modal HTML
            const modalHTML = `
                <div class="modal fade" id="statePackageModal" tabindex="-1" aria-labelledby="statePackageModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content border-0 shadow-lg">
                            <div class="modal-header border-0 pb-0" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                <div class="text-white">
                                    <h5 class="modal-title fw-bold mb-1" id="statePackageModalLabel">${package.name}</h5>
                                    <p class="mb-0 opacity-75">${package.duration} • ${package.price} per person</p>
                                </div>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body p-4">
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <div class="card border-0 bg-light h-100">
                                            <div class="card-body">
                                                <h6 class="fw-bold text-primary mb-3">🗺️ Destinations Covered</h6>
                                                <div class="d-flex flex-wrap gap-2 mb-4">
                                                    ${package.destinations.map(dest =>
                                                        `<span class="badge bg-primary bg-opacity-10 text-primary px-3 py-2 rounded-pill">${dest}</span>`
                                                    ).join('')}
                                                </div>
                                               
                                                <h6 class="fw-bold text-success mb-3">⭐ Package Highlights</h6>
                                                <ul class="list-unstyled">
                                                    ${package.highlights.map(highlight =>
                                                        `<li class="mb-2 d-flex align-items-start">
                                                            <span class="text-success me-2">•</span>
                                                            <span>${highlight}</span>
                                                        </li>`
                                                    ).join('')}
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <div class="col-md-6">
                                        <div class="card border-0 bg-light h-100">
                                            <div class="card-body">
                                                <h6 class="fw-bold text-info mb-3">📅 Best Time to Visit</h6>
                                                <p class="mb-4">${package.bestTime}</p>
                                               
                                                <h6 class="fw-bold text-warning mb-3">💰 Package Inclusions</h6>
                                                <ul class="list-unstyled small">
                                                    <li class="mb-1">• Accommodation (3*/4* hotels)</li>
                                                    <li class="mb-1">• Daily breakfast & dinner</li>
                                                    <li class="mb-1">• AC transportation</li>
                                                    <li class="mb-1">• Professional guide</li>
                                                    <li class="mb-1">• Entry tickets to monuments</li>
                                                    <li class="mb-1">• Airport/station transfers</li>
                                                </ul>
                                               
                                                <div class="mt-4 p-3 bg-warning bg-opacity-10 rounded">
                                                    <h6 class="fw-bold text-warning mb-2">🎉 Special Offer</h6>
                                                    <p class="small mb-0">Book now and get 15% off for groups of 4+ people!</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="mt-4 text-center">
                                    <div class="row g-3">
                                        <div class="col-md-4">
                                            <div class="p-3 bg-primary bg-opacity-10 rounded">
                                                <div class="fw-bold text-primary">${package.duration}</div>
                                                <small class="text-muted">Duration</small>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="p-3 bg-success bg-opacity-10 rounded">
                                                <div class="fw-bold text-success">${package.price}</div>
                                                <small class="text-muted">Starting Price</small>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="p-3 bg-info bg-opacity-10 rounded">
                                                <div class="fw-bold text-info">${package.destinations.length} Cities</div>
                                                <small class="text-muted">Destinations</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer border-0 pt-0">
                                <button type="button" class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary rounded-pill px-4" onclick="bookStatePackage('${package.name}')">
                                    Book This Package 🎯
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            `;

            // Remove existing modal if any
            const existingModal = document.getElementById('statePackageModal');
            if (existingModal) {
                existingModal.remove();
            }

            // Add modal to body
            document.body.insertAdjacentHTML('beforeend', modalHTML);

            // Show modal
            const modal = new bootstrap.Modal(document.getElementById('statePackageModal'));
            modal.show();

            // Clean up modal after it's hidden
            document.getElementById('statePackageModal').addEventListener('hidden.bs.modal', function() {
                this.remove();
            });
        }

        // Book state package function
        function bookStatePackage(packageName) {
            // Close the state package modal
            const modal = bootstrap.Modal.getInstance(document.getElementById('statePackageModal'));
            if (modal) {
                modal.hide();
            }

            // Show contact section
            setTimeout(() => {
                toggleSection('contact');
               
                // Pre-fill the package in contact form
                setTimeout(() => {
                    const textarea = document.querySelector('#contact textarea');
                    if (textarea) {
                        textarea.value = `I'm interested in the "${packageName}" package. Please send me detailed itinerary and pricing information.`;
                        textarea.focus();
                        textarea.classList.add('border-primary');
                       
                        // Reset border after 3 seconds
                        setTimeout(() => {
                            textarea.classList.remove('border-primary');
                        }, 3000);
                    }
                }, 1000);
            }, 500);
        }

        // Initialize on page load
        document.addEventListener('DOMContentLoaded', function() {
            // Observe elements for animation
            document.querySelectorAll('.slide-in, .fade-in, .stats-counter').forEach(el => {
                observer.observe(el);
            });

            // Add stagger delay to package cards
            document.querySelectorAll('.card-hover').forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
                card.classList.add('slide-in');
                observer.observe(card);
            });

            // Add stagger delay to state cards
            document.querySelectorAll('.state-card').forEach((card, index) => {
                card.style.animationDelay = `${index * 0.02}s`;
                card.classList.add('slide-in');
                observer.observe(card);
            });
        });
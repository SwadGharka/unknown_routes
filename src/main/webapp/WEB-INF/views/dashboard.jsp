<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OOO TRIPS - Out Of Office Weekend Getaways</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">

    <!-- ✅ Common CSS -->
    <!-- <link rel="stylesheet" href="${PATH_FOLDER_CSS}/common.css"> -->
    <link rel="stylesheet" href="${PATH_FOLDER_CSS}/dashboard.css">
    <link rel="stylesheet" href="${PATH_FOLDER_CSS}/hero.css">

    <!-- ✅ jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- ✅ Common JS -->
    <script src="${PATH_FOLDER_JS}/common.js"></script>
    <script src="${PATH_FOLDER_JS}/dashboard.js"></script>
    <script src="${PATH_FOLDER_JS}/hero.js"></script>
</head>
<body>
    <%@ include file="header.jsp"%>
     <section class="hero-bg text-white d-flex align-items-center position-relative overflow-hidden">
        <div class="position-absolute top-0 start-0 w-100 h-100" style="background: linear-gradient(45deg, rgba(13, 110, 253, 0.2), rgba(111, 66, 193, 0.2));"></div>
        <div class="container text-center position-relative" style="z-index: 10;">
            <div class="floating mb-4">
                <div class="display-1 mb-3">🏖️</div>
                <div class="d-flex justify-content-center gap-3 fs-1">
                    <span class="bounce-slow">✈️</span>
                    <span class="bounce-slow" style="animation-delay: 0.2s">🏔️</span>
                    <span class="bounce-slow" style="animation-delay: 0.4s">🏕️</span>
                </div>
            </div>
           
            <h2 class="display-3 fw-bold mb-4 text-shadow slide-in">
                Time to Set Your Status to
                <span class="text-warning">Away</span>
            </h2>
           
            <p class="lead mb-5 mx-auto opacity-75 slide-in text-shadow" style="max-width: 600px; animation-delay: 0.2s">
                Corporate life got you down? Our weekend getaway packages are designed specifically for busy professionals who need to disconnect and recharge in beautiful Indian destinations.
            </p>
           
            <div class="d-flex flex-column flex-sm-row gap-3 justify-content-center mb-5 slide-in" style="animation-delay: 0.4s">
                <button class="btn btn-gradient-primary btn-lg px-5 py-3 rounded-pill" onclick="toggleSection('packages')">
                    Browse Packages 📨
                </button>
                <button class="btn glass-effect btn-lg px-5 py-3 rounded-pill text-white border-white" onclick="toggleSection('contact')">
                    Plan Custom Trip ✨
                </button>
            </div>
           
            <div class="row justify-content-center slide-in hero-stats" style="animation-delay: 0.6s">
                <div class="col-4 col-md-2">
                    <div class="stats-counter" data-target="500">0</div>
                    <small class="opacity-75">Happy Travelers</small>
                </div>
                <div class="col-4 col-md-2">
                    <div class="stats-counter" data-target="50">0</div>
                    <small class="opacity-75">Destinations</small>
                </div>
                <div class="col-4 col-md-2">
                    <div class="stats-counter" data-target="98">0</div>
                    <small class="opacity-75">% Satisfaction</small>
                </div>
            </div>
        </div>
       
        <div class="position-absolute bottom-0 start-50 translate-middle-x bounce-slow mb-3">
            <i class="bi bi-chevron-down fs-3 opacity-75"></i>
        </div>
    </section>

    <section class="py-5 bg-white">
        <div class="container">
            <div class="text-center mb-5">
                <h3 class="display-4 fw-bold text-dark mb-3">Explore OOO TRIPS</h3>
                <p class="lead text-muted">Click on any section below to discover more</p>
                <div class="mx-auto mt-3 rounded-pill" style="width: 80px; height: 4px; background: linear-gradient(45deg, #ffc107, #fd7e14);"></div>
            </div>
           
            <div class="row g-4" id="discoverCard">
            
            </div>
            <!-- Active Section Indicator -->
            <div id="activeSection" class="text-center mt-4 d-none">
                <div class="d-inline-flex align-items-center bg-light rounded-pill px-4 py-2">
                    <span class="text-muted me-2">Currently viewing:</span>
                    <span id="activeSectionName" class="fw-bold text-dark"></span>
                    <button class="btn btn-sm ms-3 p-0" onclick="hideAllSections()">
                        <i class="bi bi-x-lg text-muted"></i>
                    </button>
                </div>
            </div>
        </div>
    </section>
        <!-- Packages Section -->
    <section id="packages" class="py-5 bg-light section-content d-none">
        <div class="container">
            <div class="text-center mb-5 slide-in">
                <h3 class="display-4 fw-bold text-dark mb-3">Explore All Indian States</h3>
                <p class="lead text-muted">Discover incredible destinations across all 28 states and 8 union territories of India</p>
                <div class="mx-auto mt-3 rounded-pill" style="width: 100px; height: 4px; background: linear-gradient(45deg, #ffc107, #fd7e14);"></div>
            </div>

            <!-- Featured Packages Section -->
            <div class="mb-5">
                <h4 class="fw-bold text-center mb-4 text-primary">🌟 Featured Weekend Packages</h4>

            <div class="row g-4">
                <!-- BRB Package - Manali -->
                <div id="packagesRow">

                </div>
            </div>
        </div>
    </section>
</body>
<script>
    $(document).ready(async function(){
        let discoverCardData = [
        {
            toggleSection : 'packages',
            icon : '📦',
            cardName : 'Travel Packages',
            description : 'Discover our weekend getaway packages designed for busy professionals',
            badge : '6 Amazing Packages',
            className : 'bg-gradient-blue',
            height : '100%',
            width : '100%'
        },
        {
            toggleSection : 'stats',
            icon : '⭐',
            cardName : 'Why Choose Us',
            description : 'See our impressive stats and what makes us the best choice',
            badge : '2500+ Happy Travelers',
            className : 'bg-gradient-purple',
            height : '100%',
            width : '100%'
        },
        {
            toggleSection : 'testimonials',
            icon : '💬',
            cardName : 'Customer Reviews',
            description : 'Read what our satisfied customers have to say about their trips',
            badge : '5-Star Rated',
            className : 'bg-gradient-green',
            height : '100%',
            width : '100%'
        },
        {
            toggleSection : 'contact',
            icon : '📞',
            cardName : 'Get In Touch',
            description : 'Ready to book? Contact us for personalized assistance',
            badge : '24/7 Support',
            className : 'bg-gradient-orange',
            height : '100%',
            width : '100%'
        },
    ]

        //let discoverCardData = [];


        var cardDataapi = await getDataByPayloadWithParentUrl('POST', true, true, '${BASE_URL}${CONTEXT_PATH}api/get-all-categories', "");
        const converted = cardDataapi.categories.map(item => {
            const meta = JSON.parse(item.metaValue);

            return {
                toggleSection: meta.toggleSection,
                icon: '📞',
                cardName: item.name,
                description: item.description,
                badge: meta.badge,
                className: meta.className,
                height: meta.height,
                width: meta.width
            };
        });
        console.log(discoverCardData);
        getAllDiscoverCardCardByData(converted);
    })
</script>
</html>

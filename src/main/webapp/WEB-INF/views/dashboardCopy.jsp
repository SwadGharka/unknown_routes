<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OOO TRIPS - Out Of Office Weekend Getaways</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${PATH_FOLDER_CSS}dashboardCopy.css" rel="stylesheet">
    <script type="text/javascript" src="${PATH_FOLDER_JS}dashboardCopy.js"></script>
</head>
<body>


    <!-- Header -->
     <nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-custom" id="navbar">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center fade-in" href="#">
                <div class="bg-gradient rounded-circle d-flex align-items-center justify-content-center pulse-slow me-3" style="width: 48px; height: 48px; background: linear-gradient(45deg, #ffc107, #fd7e14);">
                    <span class="text-white fw-bold fs-4">🏖️</span>
                </div>
                <div>
                    <h1 class="h4 mb-0 text-shadow">OOO TRIPS</h1>
                    <small class="opacity-75">Out Of Office Trips</small>
                </div>
            </a>
           
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
           
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="#" onclick="toggleSection('packages')">Packages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="#" onclick="toggleSection('stats')">Why Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="#" onclick="toggleSection('testimonials')">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="#" onclick="toggleSection('contact')">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Hero Section -->
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
                This Dashboard copy
                <span class="text-warning">Deployment By CI/CD</span>
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

    <!-- Navigation Menu Section -->
    <section class="py-5 bg-white">
        <div class="container">
            <div class="text-center mb-5">
                <h3 class="display-4 fw-bold text-dark mb-3">Explore OOO TRIPS</h3>
                <p class="lead text-muted">Click on any section below to discover more</p>
                <div class="mx-auto mt-3 rounded-pill" style="width: 80px; height: 4px; background: linear-gradient(45deg, #ffc107, #fd7e14);"></div>
            </div>
           
            <div class="row g-4">
                <!-- Packages Card -->
                <div class="col-md-6 col-lg-3">
                    <div class="card nav-card bg-gradient-blue text-white h-100 border-0 shadow-lg" onclick="toggleSection('packages')">
                        <div class="card-body text-center p-4">
                            <div class="fs-1 mb-3">📦</div>
                            <h4 class="card-title fw-bold mb-2">Travel Packages</h4>
                            <p class="card-text opacity-75 small">Discover our weekend getaway packages designed for busy professionals</p>
                            <div class="mt-3">
                                <span class="badge bg-light bg-opacity-25 px-3 py-2 rounded-pill fw-semibold">
                                    6 Amazing Packages
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Why Us Card -->
                <div class="col-md-6 col-lg-3">
                    <div class="card nav-card bg-gradient-purple text-white h-100 border-0 shadow-lg" onclick="toggleSection('stats')">
                        <div class="card-body text-center p-4">
                            <div class="fs-1 mb-3">⭐</div>
                            <h4 class="card-title fw-bold mb-2">Why Choose Us</h4>
                            <p class="card-text opacity-75 small">See our impressive stats and what makes us the best choice</p>
                            <div class="mt-3">
                                <span class="badge bg-light bg-opacity-25 px-3 py-2 rounded-pill fw-semibold">
                                    2500+ Happy Travelers
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Reviews Card -->
                <div class="col-md-6 col-lg-3">
                    <div class="card nav-card bg-gradient-green text-white h-100 border-0 shadow-lg" onclick="toggleSection('testimonials')">
                        <div class="card-body text-center p-4">
                            <div class="fs-1 mb-3">💬</div>
                            <h4 class="card-title fw-bold mb-2">Customer Reviews</h4>
                            <p class="card-text opacity-75 small">Read what our satisfied customers have to say about their trips</p>
                            <div class="mt-3">
                                <span class="badge bg-light bg-opacity-25 px-3 py-2 rounded-pill fw-semibold">
                                    5-Star Rated
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact Card -->
                <div class="col-md-6 col-lg-3">
                    <div class="card nav-card bg-gradient-orange text-white h-100 border-0 shadow-lg" onclick="toggleSection('contact')">
                        <div class="card-body text-center p-4">
                            <div class="fs-1 mb-3">📞</div>
                            <h4 class="card-title fw-bold mb-2">Get In Touch</h4>
                            <p class="card-text opacity-75 small">Ready to book? Contact us for personalized assistance</p>
                            <div class="mt-3">
                                <span class="badge bg-light bg-opacity-25 px-3 py-2 rounded-pill fw-semibold">
                                    24/7 Support
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
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

            <!-- All Indian States Section -->
            <div class="mt-5">
                <h4 class="fw-bold text-center mb-4 text-success">🗺️ All Indian States & Union Territories</h4>
                <p class="text-center text-muted mb-4">Click on any state to explore travel packages and destinations</p>
               
                <!-- States Grid -->
                <div class="row g-3">
                    <!-- Andhra Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('andhra-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Andhra Pradesh</h6>
                                <small class="text-muted">Tirupati, Visakhapatnam</small>
                            </div>
                        </div>
                    </div>

                    <!-- Arunachal Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('arunachal-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1">Arunachal Pradesh</h6>
                                <small class="text-muted">Tawang, Itanagar</small>
                            </div>
                        </div>
                    </div>

                    <!-- Assam -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('assam')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🦏</div>
                                <h6 class="fw-bold mb-1">Assam</h6>
                                <small class="text-muted">Kaziranga, Guwahati</small>
                            </div>
                        </div>
                    </div>

                    <!-- Bihar -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('bihar')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Bihar</h6>
                                <small class="text-muted">Bodh Gaya, Nalanda</small>
                            </div>
                        </div>
                    </div>

                    <!-- Chhattisgarh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('chhattisgarh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌲</div>
                                <h6 class="fw-bold mb-1">Chhattisgarh</h6>
                                <small class="text-muted">Chitrakoot Falls, Raipur</small>
                            </div>
                        </div>
                    </div>

                    <!-- Goa -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-success bg-opacity-10" onclick="exploreState('goa')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏖️</div>
                                <h6 class="fw-bold mb-1 text-success">Goa</h6>
                                <small class="text-success">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Gujarat -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('gujarat')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🦁</div>
                                <h6 class="fw-bold mb-1">Gujarat</h6>
                                <small class="text-muted">Gir Forest, Rann of Kutch</small>
                            </div>
                        </div>
                    </div>

                    <!-- Haryana -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('haryana')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌾</div>
                                <h6 class="fw-bold mb-1">Haryana</h6>
                                <small class="text-muted">Kurukshetra, Panipat</small>
                            </div>
                        </div>
                    </div>

                    <!-- Himachal Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-primary bg-opacity-10" onclick="exploreState('himachal-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1 text-primary">Himachal Pradesh</h6>
                                <small class="text-primary">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Jharkhand -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('jharkhand')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">⛰️</div>
                                <h6 class="fw-bold mb-1">Jharkhand</h6>
                                <small class="text-muted">Ranchi, Jamshedpur</small>
                            </div>
                        </div>
                    </div>

                    <!-- Karnataka -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('karnataka')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1">Karnataka</h6>
                                <small class="text-muted">Mysore, Hampi, Coorg</small>
                            </div>
                        </div>
                    </div>

                    <!-- Kerala -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('kerala')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌴</div>
                                <h6 class="fw-bold mb-1">Kerala</h6>
                                <small class="text-muted">Backwaters, Munnar</small>
                            </div>
                        </div>
                    </div>

                    <!-- Madhya Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('madhya-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🐅</div>
                                <h6 class="fw-bold mb-1">Madhya Pradesh</h6>
                                <small class="text-muted">Khajuraho, Bhopal</small>
                            </div>
                        </div>
                    </div>

                    <!-- Maharashtra -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" style="background-color: rgba(232, 62, 140, 0.1);" onclick="exploreState('maharashtra')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎬</div>
                                <h6 class="fw-bold mb-1" style="color: #e83e8c;">Maharashtra</h6>
                                <small style="color: #e83e8c;">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Manipur -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('manipur')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">💃</div>
                                <h6 class="fw-bold mb-1">Manipur</h6>
                                <small class="text-muted">Imphal, Loktak Lake</small>
                            </div>
                        </div>
                    </div>

                    <!-- Meghalaya -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('meghalaya')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">☔</div>
                                <h6 class="fw-bold mb-1">Meghalaya</h6>
                                <small class="text-muted">Shillong, Cherrapunji</small>
                            </div>
                        </div>
                    </div>

                    <!-- Mizoram -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('mizoram')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌸</div>
                                <h6 class="fw-bold mb-1">Mizoram</h6>
                                <small class="text-muted">Aizawl, Blue Mountain</small>
                            </div>
                        </div>
                    </div>

                    <!-- Nagaland -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('nagaland')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎭</div>
                                <h6 class="fw-bold mb-1">Nagaland</h6>
                                <small class="text-muted">Kohima, Hornbill Festival</small>
                            </div>
                        </div>
                    </div>

                    <!-- Odisha -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('odisha')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Odisha</h6>
                                <small class="text-muted">Puri, Konark Temple</small>
                            </div>
                        </div>
                    </div>

                    <!-- Punjab -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('punjab')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🕌</div>
                                <h6 class="fw-bold mb-1">Punjab</h6>
                                <small class="text-muted">Amritsar, Golden Temple</small>
                            </div>
                        </div>
                    </div>

                    <!-- Rajasthan -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-warning bg-opacity-10" onclick="exploreState('rajasthan')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1 text-warning">Rajasthan</h6>
                                <small class="text-warning">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Sikkim -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('sikkim')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1">Sikkim</h6>
                                <small class="text-muted">Gangtok, Kanchenjunga</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tamil Nadu -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('tamil-nadu')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Tamil Nadu</h6>
                                <small class="text-muted">Chennai, Ooty, Madurai</small>
                            </div>
                        </div>
                    </div>

                    <!-- Telangana -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('telangana')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">💻</div>
                                <h6 class="fw-bold mb-1">Telangana</h6>
                                <small class="text-muted">Hyderabad, Warangal</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tripura -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('tripura')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1">Tripura</h6>
                                <small class="text-muted">Agartala, Ujjayanta Palace</small>
                            </div>
                        </div>
                    </div>

                    <!-- Uttar Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('uttar-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🕌</div>
                                <h6 class="fw-bold mb-1">Uttar Pradesh</h6>
                                <small class="text-muted">Agra, Varanasi, Lucknow</small>
                            </div>
                        </div>
                    </div>

                    <!-- Uttarakhand -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" style="background-color: rgba(111, 66, 193, 0.1);" onclick="exploreState('uttarakhand')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏕️</div>
                                <h6 class="fw-bold mb-1" style="color: #6f42c1;">Uttarakhand</h6>
                                <small style="color: #6f42c1;">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- West Bengal -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('west-bengal')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎨</div>
                                <h6 class="fw-bold mb-1">West Bengal</h6>
                                <small class="text-muted">Kolkata, Darjeeling</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Union Territories Section -->
                <div class="mt-5">
                    <h5 class="fw-bold text-center mb-4 text-info">🏛️ Union Territories</h5>
                    <div class="row g-3 justify-content-center">
                        <!-- Andaman and Nicobar Islands -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('andaman-nicobar')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏝️</div>
                                    <h6 class="fw-bold mb-1">Andaman & Nicobar</h6>
                                    <small class="text-muted">Port Blair, Havelock</small>
                                </div>
                            </div>
                        </div>

                        <!-- Chandigarh -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('chandigarh')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏙️</div>
                                    <h6 class="fw-bold mb-1">Chandigarh</h6>
                                    <small class="text-muted">Rock Garden, Sukhna Lake</small>
                                </div>
                            </div>
                        </div>

                        <!-- Dadra and Nagar Haveli -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('dadra-nagar-haveli')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🌳</div>
                                    <h6 class="fw-bold mb-1">Dadra & Nagar Haveli</h6>
                                    <small class="text-muted">Silvassa, Tribal Culture</small>
                                </div>
                            </div>
                        </div>

                        <!-- Daman and Diu -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('daman-diu')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏖️</div>
                                    <h6 class="fw-bold mb-1">Daman & Diu</h6>
                                    <small class="text-muted">Beaches, Portuguese Heritage</small>
                                </div>
                            </div>
                        </div>

                        <!-- Delhi -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('delhi')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏛️</div>
                                    <h6 class="fw-bold mb-1">Delhi</h6>
                                    <small class="text-muted">Red Fort, India Gate</small>
                                </div>
                            </div>
                        </div>

                        <!-- Jammu and Kashmir -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm bg-danger bg-opacity-10" onclick="exploreState('jammu-kashmir')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏔️</div>
                                    <h6 class="fw-bold mb-1 text-danger">Jammu & Kashmir</h6>
                                    <small class="text-danger">Featured Package Available</small>
                                </div>
                            </div>
                        </div>

                        <!-- Lakshadweep -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('lakshadweep')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏝️</div>
                                    <h6 class="fw-bold mb-1">Lakshadweep</h6>
                                    <small class="text-muted">Coral Islands, Lagoons</small>
                                </div>
                            </div>
                        </div>

                        <!-- Puducherry -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('puducherry')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🇫🇷</div>
                                    <h6 class="fw-bold mb-1">Puducherry</h6>
                                    <small class="text-muted">French Quarter, Auroville</small>
                                </div>
                            </div>
                        </div>
                    </div>
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
                <div class="col-lg-4 col-md-6">
                    <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden">
                        <div class="package-image rounded-top" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), url('https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80');">
                            <div class="position-absolute top-0 end-0 m-3">
                                <span class="badge bg-primary px-3 py-2 rounded-pill">Popular</span>
                            </div>
                            <div class="position-absolute bottom-0 start-0 m-3 text-white">
                                <h5 class="fw-bold mb-0">Manali, Himachal Pradesh</h5>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <h4 class="card-title fw-bold text-primary mb-1">BRB Package</h4>
                                <p class="text-primary fw-medium">Be Right Back - Mountain Escape</p>
                            </div>
                            <div class="mb-3">
                                <h6 class="fw-semibold text-primary mb-2">🗺️ Major Attractions:</h6>
                                <div class="d-flex flex-wrap gap-1 mb-3">
                                    <span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1">Rohtang Pass</span>
                                    <span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1">Solang Valley</span>
                                    <span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1">Hadimba Temple</span>
                                    <span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1">Mall Road</span>
                                </div>
                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-primary">🏨</span>
                                    <span>Mountain Resort Stay (2 nights)</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-primary">🥾</span>
                                    <span>Solang Valley Adventure</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-primary">🧘</span>
                                    <span>Himalayan Yoga Sessions</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-primary">🍽️</span>
                                    <span>Local Himachali Cuisine</span>
                                </li>
                            </ul>
                            <div class="text-center">
                                <div class="price-highlight display-5 fw-bold mb-2">₹45,999</div>
                                <p class="text-muted small mb-3">per person</p>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-outline-primary flex-fill py-2 rounded-pill fw-semibold" onclick="showPackageDetails('brb')">
                                        View Details 📋
                                    </button>
                                    <button class="btn btn-primary flex-fill py-2 rounded-pill fw-semibold" onclick="bookPackage('BRB Package')">
                                        Book Now 🏔️
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- TTYL Package - Goa -->
                <div class="col-lg-4 col-md-6">
                    <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden">
                        <div class="package-image rounded-top" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), url('https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80');">
                            <div class="position-absolute top-0 end-0 m-3">
                                <span class="badge bg-success px-3 py-2 rounded-pill">Beach Vibes</span>
                            </div>
                            <div class="position-absolute bottom-0 start-0 m-3 text-white">
                                <h5 class="fw-bold mb-0">Goa Beaches</h5>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <h4 class="card-title fw-bold text-success mb-1">TTYL Package</h4>
                                <p class="text-success fw-medium">Talk To You Later - Beach Paradise</p>
                            </div>
                            <div class="mb-3">
                                <h6 class="fw-semibold text-success mb-2">🗺️ Major Attractions:</h6>
                                <div class="d-flex flex-wrap gap-1 mb-3">
                                    <span class="badge bg-success bg-opacity-10 text-success px-2 py-1">Baga Beach</span>
                                    <span class="badge bg-success bg-opacity-10 text-success px-2 py-1">Calangute Beach</span>
                                    <span class="badge bg-success bg-opacity-10 text-success px-2 py-1">Fort Aguada</span>
                                    <span class="badge bg-success bg-opacity-10 text-success px-2 py-1">Old Goa Churches</span>
                                </div>
                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-success">🏖️</span>
                                    <span>Beachfront Resort (2 nights)</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-success">🏄</span>
                                    <span>Water Sports & Parasailing</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-success">💆</span>
                                    <span>Ayurvedic Spa Sessions</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-success">🍹</span>
                                    <span>Sunset Beach Party</span>
                                </li>
                            </ul>
                            <div class="text-center">
                                <div class="price-highlight display-5 fw-bold mb-2">₹52,999</div>
                                <p class="text-muted small mb-3">per person</p>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-outline-success flex-fill py-2 rounded-pill fw-semibold" onclick="showPackageDetails('ttyl')">
                                        View Details 📋
                                    </button>
                                    <button class="btn btn-success flex-fill py-2 rounded-pill fw-semibold" onclick="bookPackage('TTYL Package')">
                                        Book Now 🏖️
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- AFK Package - Rishikesh -->
                <div class="col-lg-4 col-md-6">
                    <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden">
                        <div class="package-image rounded-top" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), url('https://images.unsplash.com/photo-1544735716-392fe2489ffa?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80');">
                            <div class="position-absolute top-0 end-0 m-3">
                                <span class="badge" style="background-color: #6f42c1;" px-3 py-2 rounded-pill">Spiritual</span>
                            </div>
                            <div class="position-absolute bottom-0 start-0 m-3 text-white">
                                <h5 class="fw-bold mb-0">Rishikesh, Uttarakhand</h5>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <h4 class="card-title fw-bold mb-1" style="color: #6f42c1;">AFK Package</h4>
                                <p class="fw-medium" style="color: #6f42c1;"> From Keyboard - River Retreat</p>
                            </div>
                            <div class="mb-3">
                                <h6 class="fw-semibold mb-2" style="color: #6f42c1;">🗺️ Major Attractions:</h6>
                                <div class="d-flex flex-wrap gap-1 mb-3">
                                    <span class="badge px-2 py-1" style="background-color: rgba(111, 66, 193, 0.1); color: #6f42c1;">Laxman Jhula</span>
                                    <span class="badge px-2 py-1" style="background-color: rgba(111, 66, 193, 0.1); color: #6f42c1;">Ram Jhula</span>
                                    <span class="badge px-2 py-1" style="background-color: rgba(111, 66, 193, 0.1); color: #6f42c1;">Beatles Ashram</span>
                                    <span class="badge px-2 py-1" style="background-color: rgba(111, 66, 193, 0.1); color: #6f42c1;">Triveni Ghat</span>
                                </div>
                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3" style="color: #6f42c1;">⛺</span>
                                    <span>Riverside Camping (2 nights)</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3" style="color: #6f42c1;">🚣</span>
                                    <span>White Water Rafting</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3" style="color: #6f42c1;">🧘</span>
                                    <span>Meditation & Yoga Ashram</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3" style="color: #6f42c1;">🔥</span>
                                    <span>Ganga Aarti Experience</span>
                                </li>
                            </ul>
                            <div class="text-center">
                                <div class="price-highlight display-5 fw-bold mb-2">₹35,999</div>
                                <p class="text-muted small mb-3">per person</p>
                                <div class="d-flex gap-2">
                                    <button class="btn flex-fill py-2 rounded-pill fw-semibold" style="background-color: rgba(111, 66, 193, 0.1); color: #6f42c1; border: 1px solid #6f42c1;" onclick="showPackageDetails('afk')">
                                        View Details 📋
                                    </button>
                                    <button class="btn flex-fill py-2 rounded-pill fw-semibold text-white" style="background-color: #6f42c1;" onclick="bookPackage('AFK Package')">
                                        Book Now 🏕️
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- GTG Package - Jaipur -->
                <div class="col-lg-4 col-md-6">
                    <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden">
                        <div class="package-image rounded-top" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), url('https://images.unsplash.com/photo-1599661046827-dacde6976549?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80');">
                            <div class="position-absolute top-0 end-0 m-3">
                                <span class="badge bg-warning px-3 py-2 rounded-pill text-dark">Royal</span>
                            </div>
                            <div class="position-absolute bottom-0 start-0 m-3 text-white">
                                <h5 class="fw-bold mb-0">Jaipur, Rajasthan</h5>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <h4 class="card-title fw-bold text-warning mb-1">GTG Package</h4>
                                <p class="text-warning fw-medium">Good To Go - Royal Heritage</p>
                            </div>
                            <div class="mb-3">
                                <h6 class="fw-semibold text-warning mb-2">🗺️ Major Attractions:</h6>
                                <div class="d-flex flex-wrap gap-1 mb-3">
                                    <span class="badge bg-warning bg-opacity-10 text-warning px-2 py-1">Amber Fort</span>
                                    <span class="badge bg-warning bg-opacity-10 text-warning px-2 py-1">City Palace</span>
                                    <span class="badge bg-warning bg-opacity-10 text-warning px-2 py-1">Hawa Mahal</span>
                                    <span class="badge bg-warning bg-opacity-10 text-warning px-2 py-1">Jantar Mantar</span>
                                </div>
                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-warning">🏰</span>
                                    <span>Heritage Palace Hotel (2 nights)</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-warning">🐘</span>
                                    <span>Elephant Safari & Amber Fort</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-warning">🎭</span>
                                    <span>Cultural Dance Performances</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-warning">🛍️</span>
                                    <span>Johari Bazaar Shopping</span>
                                </li>
                            </ul>
                            <div class="text-center">
                                <div class="price-highlight display-5 fw-bold mb-2">₹48,999</div>
                                <p class="text-muted small mb-3">per person</p>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-outline-warning flex-fill py-2 rounded-pill fw-semibold text-dark" onclick="showPackageDetails('gtg')">
                                        View Details 📋
                                    </button>
                                    <button class="btn btn-warning flex-fill py-2 rounded-pill fw-semibold text-dark" onclick="bookPackage('GTG Package')">
                                        Book Now 🏰
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- LOL Package - Mumbai -->
                <div class="col-lg-4 col-md-6">
                    <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden">
                        <div class="package-image rounded-top" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), url('https://images.unsplash.com/photo-1570168007204-dfb528c6958f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80');">
                            <div class="position-absolute top-0 end-0 m-3">
                                <span class="badge" style="background-color: #e83e8c;" px-3 py-2 rounded-pill">City Life</span>
                            </div>
                            <div class="position-absolute bottom-0 start-0 m-3 text-white">
                                <h5 class="fw-bold mb-0">Mumbai, Maharashtra</h5>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <h4 class="card-title fw-bold mb-1" style="color: #e83e8c;">LOL Package</h4>
                                <p class="fw-medium" style="color: #e83e8c;">Laugh Out Loud - Bollywood Fun</p>
                            </div>
                            <div class="mb-3">
                                <h6 class="fw-semibold mb-2" style="color: #e83e8c;">🗺️ Major Attractions:</h6>
                                <div class="d-flex flex-wrap gap-1 mb-3">
                                    <span class="badge px-2 py-1" style="background-color: rgba(232, 62, 140, 0.1); color: #e83e8c;">Gateway of India</span>
                                    <span class="badge px-2 py-1" style="background-color: rgba(232, 62, 140, 0.1); color: #e83e8c;">Marine Drive</span>
                                    <span class="badge px-2 py-1" style="background-color: rgba(232, 62, 140, 0.1); color: #e83e8c;">Juhu Beach</span>
                                    <span class="badge px-2 py-1" style="background-color: rgba(232, 62, 140, 0.1); color: #e83e8c;">Film City</span>
                                </div>
                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3" style="color: #e83e8c;">🎬</span>
                                    <span>Bollywood Studio Tours (2 nights)</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3" style="color: #e83e8c;">🎭</span>
                                    <span>Comedy Club & Stand-up Shows</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3" style="color: #e83e8c;">🍛</span>
                                    <span>Street Food Tours</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3" style="color: #e83e8c;">🌊</span>
                                    <span>Marine Drive Evening Walks</span>
                                </li>
                            </ul>
                            <div class="text-center">
                                <div class="price-highlight display-5 fw-bold mb-2">₹42,999</div>
                                <p class="text-muted small mb-3">per person</p>
                                <div class="d-flex gap-2">
                                    <button class="btn flex-fill py-2 rounded-pill fw-semibold" style="background-color: rgba(232, 62, 140, 0.1); color: #e83e8c; border: 1px solid #e83e8c;" onclick="showPackageDetails('lol')">
                                        View Details 📋
                                    </button>
                                    <button class="btn flex-fill py-2 rounded-pill fw-semibold text-white" style="background-color: #e83e8c;" onclick="bookPackage('LOL Package')">
                                        Book Now 🎬
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ASAP Package - Ladakh -->
                <div class="col-lg-4 col-md-6">
                    <div class="card card-hover h-100 border-0 shadow-lg overflow-hidden">
                        <div class="package-image rounded-top" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), url('https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80');">
                            <div class="position-absolute top-0 end-0 m-3">
                                <span class="badge bg-danger px-3 py-2 rounded-pill">Adventure</span>
                            </div>
                            <div class="position-absolute bottom-0 start-0 m-3 text-white">
                                <h5 class="fw-bold mb-0">Ladakh, J&K</h5>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <h4 class="card-title fw-bold text-danger mb-1">ASAP Package</h4>
                                <p class="text-danger fw-medium">As Soon As Possible - High Altitude Thrill</p>
                            </div>
                            <div class="mb-3">
                                <h6 class="fw-semibold text-danger mb-2">🗺️ Major Attractions:</h6>
                                <div class="d-flex flex-wrap gap-1 mb-3">
                                    <span class="badge bg-danger bg-opacity-10 text-danger px-2 py-1">Pangong Lake</span>
                                    <span class="badge bg-danger bg-opacity-10 text-danger px-2 py-1">Nubra Valley</span>
                                    <span class="badge bg-danger bg-opacity-10 text-danger px-2 py-1">Khardung La</span>
                                    <span class="badge bg-danger bg-opacity-10 text-danger px-2 py-1">Leh Palace</span>
                                </div>
                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-danger">🏔️</span>
                                    <span>Mountain Lodge (2 nights)</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-danger">🏍️</span>
                                    <span>Bike Expedition to Pangong</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-danger">🧗</span>
                                    <span>Rock Climbing & Trekking</span>
                                </li>
                                <li class="d-flex align-items-center mb-2">
                                    <span class="me-3 text-danger">⭐</span>
                                    <span>Stargazing at 14,000 ft</span>
                                </li>
                            </ul>
                            <div class="text-center">
                                <div class="price-highlight display-5 fw-bold mb-2">₹65,999</div>
                                <p class="text-muted small mb-3">per person</p>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-outline-danger flex-fill py-2 rounded-pill fw-semibold" onclick="showPackageDetails('asap')">
                                        View Details 📋
                                    </button>
                                    <button class="btn btn-danger flex-fill py-2 rounded-pill fw-semibold" onclick="bookPackage('ASAP Package')">
                                        Book Now ⚡
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- All Indian States Section -->
            <div class="mt-5">
                <h4 class="fw-bold text-center mb-4 text-success">🗺️ All Indian States & Union Territories</h4>
                <p class="text-center text-muted mb-4">Click on any state to explore travel packages and destinations</p>
               
                <!-- States Grid -->
                <div class="row g-3">
                    <!-- Andhra Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('andhra-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Andhra Pradesh</h6>
                                <small class="text-muted">Tirupati, Visakhapatnam</small>
                            </div>
                        </div>
                    </div>

                    <!-- Arunachal Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('arunachal-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1">Arunachal Pradesh</h6>
                                <small class="text-muted">Tawang, Itanagar</small>
                            </div>
                        </div>
                    </div>

                    <!-- Assam -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('assam')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🦏</div>
                                <h6 class="fw-bold mb-1">Assam</h6>
                                <small class="text-muted">Kaziranga, Guwahati</small>
                            </div>
                        </div>
                    </div>

                    <!-- Bihar -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('bihar')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Bihar</h6>
                                <small class="text-muted">Bodh Gaya, Nalanda</small>
                            </div>
                        </div>
                    </div>

                    <!-- Chhattisgarh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('chhattisgarh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌲</div>
                                <h6 class="fw-bold mb-1">Chhattisgarh</h6>
                                <small class="text-muted">Chitrakoot Falls, Raipur</small>
                            </div>
                        </div>
                    </div>

                    <!-- Goa -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-success bg-opacity-10" onclick="exploreState('goa')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏖️</div>
                                <h6 class="fw-bold mb-1 text-success">Goa</h6>
                                <small class="text-success">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Gujarat -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('gujarat')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🦁</div>
                                <h6 class="fw-bold mb-1">Gujarat</h6>
                                <small class="text-muted">Gir Forest, Rann of Kutch</small>
                            </div>
                        </div>
                    </div>

                    <!-- Haryana -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('haryana')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌾</div>
                                <h6 class="fw-bold mb-1">Haryana</h6>
                                <small class="text-muted">Kurukshetra, Panipat</small>
                            </div>
                        </div>
                    </div>

                    <!-- Himachal Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-primary bg-opacity-10" onclick="exploreState('himachal-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1 text-primary">Himachal Pradesh</h6>
                                <small class="text-primary">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Jharkhand -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('jharkhand')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">⛰️</div>
                                <h6 class="fw-bold mb-1">Jharkhand</h6>
                                <small class="text-muted">Ranchi, Jamshedpur</small>
                            </div>
                        </div>
                    </div>

                    <!-- Karnataka -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('karnataka')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1">Karnataka</h6>
                                <small class="text-muted">Mysore, Hampi, Coorg</small>
                            </div>
                        </div>
                    </div>

                    <!-- Kerala -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('kerala')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌴</div>
                                <h6 class="fw-bold mb-1">Kerala</h6>
                                <small class="text-muted">Backwaters, Munnar</small>
                            </div>
                        </div>
                    </div>

                    <!-- Madhya Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('madhya-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🐅</div>
                                <h6 class="fw-bold mb-1">Madhya Pradesh</h6>
                                <small class="text-muted">Khajuraho, Bhopal</small>
                            </div>
                        </div>
                    </div>

                    <!-- Maharashtra -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" style="background-color: rgba(232, 62, 140, 0.1);" onclick="exploreState('maharashtra')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎬</div>
                                <h6 class="fw-bold mb-1" style="color: #e83e8c;">Maharashtra</h6>
                                <small style="color: #e83e8c;">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Manipur -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('manipur')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">💃</div>
                                <h6 class="fw-bold mb-1">Manipur</h6>
                                <small class="text-muted">Imphal, Loktak Lake</small>
                            </div>
                        </div>
                    </div>

                    <!-- Meghalaya -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('meghalaya')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">☔</div>
                                <h6 class="fw-bold mb-1">Meghalaya</h6>
                                <small class="text-muted">Shillong, Cherrapunji</small>
                            </div>
                        </div>
                    </div>

                    <!-- Mizoram -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('mizoram')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌸</div>
                                <h6 class="fw-bold mb-1">Mizoram</h6>
                                <small class="text-muted">Aizawl, Blue Mountain</small>
                            </div>
                        </div>
                    </div>

                    <!-- Nagaland -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('nagaland')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎭</div>
                                <h6 class="fw-bold mb-1">Nagaland</h6>
                                <small class="text-muted">Kohima, Hornbill Festival</small>
                            </div>
                        </div>
                    </div>

                    <!-- Odisha -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('odisha')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Odisha</h6>
                                <small class="text-muted">Puri, Konark Temple</small>
                            </div>
                        </div>
                    </div>

                    <!-- Punjab -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('punjab')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🕌</div>
                                <h6 class="fw-bold mb-1">Punjab</h6>
                                <small class="text-muted">Amritsar, Golden Temple</small>
                            </div>
                        </div>
                    </div>

                    <!-- Rajasthan -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-warning bg-opacity-10" onclick="exploreState('rajasthan')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1 text-warning">Rajasthan</h6>
                                <small class="text-warning">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Sikkim -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('sikkim')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1">Sikkim</h6>
                                <small class="text-muted">Gangtok, Kanchenjunga</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tamil Nadu -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('tamil-nadu')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Tamil Nadu</h6>
                                <small class="text-muted">Chennai, Ooty, Madurai</small>
                            </div>
                        </div>
                    </div>

                    <!-- Telangana -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('telangana')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">💻</div>
                                <h6 class="fw-bold mb-1">Telangana</h6>
                                <small class="text-muted">Hyderabad, Warangal</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tripura -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('tripura')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1">Tripura</h6>
                                <small class="text-muted">Agartala, Ujjayanta Palace</small>
                            </div>
                        </div>
                    </div>

                    <!-- Uttar Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('uttar-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🕌</div>
                                <h6 class="fw-bold mb-1">Uttar Pradesh</h6>
                                <small class="text-muted">Agra, Varanasi, Lucknow</small>
                            </div>
                        </div>
                    </div>

                    <!-- Uttarakhand -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" style="background-color: rgba(111, 66, 193, 0.1);" onclick="exploreState('uttarakhand')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏕️</div>
                                <h6 class="fw-bold mb-1" style="color: #6f42c1;">Uttarakhand</h6>
                                <small style="color: #6f42c1;">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- West Bengal -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('west-bengal')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎨</div>
                                <h6 class="fw-bold mb-1">West Bengal</h6>
                                <small class="text-muted">Kolkata, Darjeeling</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Union Territories Section -->
                <div class="mt-5">
                    <h5 class="fw-bold text-center mb-4 text-info">🏛️ Union Territories</h5>
                    <div class="row g-3 justify-content-center">
                        <!-- Andaman and Nicobar Islands -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('andaman-nicobar')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏝️</div>
                                    <h6 class="fw-bold mb-1">Andaman & Nicobar</h6>
                                    <small class="text-muted">Port Blair, Havelock</small>
                                </div>
                            </div>
                        </div>

                        <!-- Chandigarh -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('chandigarh')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏙️</div>
                                    <h6 class="fw-bold mb-1">Chandigarh</h6>
                                    <small class="text-muted">Rock Garden, Sukhna Lake</small>
                                </div>
                            </div>
                        </div>

                        <!-- Dadra and Nagar Haveli -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('dadra-nagar-haveli')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🌳</div>
                                    <h6 class="fw-bold mb-1">Dadra & Nagar Haveli</h6>
                                    <small class="text-muted">Silvassa, Tribal Culture</small>
                                </div>
                            </div>
                        </div>

                        <!-- Daman and Diu -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('daman-diu')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏖️</div>
                                    <h6 class="fw-bold mb-1">Daman & Diu</h6>
                                    <small class="text-muted">Beaches, Portuguese Heritage</small>
                                </div>
                            </div>
                        </div>

                        <!-- Delhi -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('delhi')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏛️</div>
                                    <h6 class="fw-bold mb-1">Delhi</h6>
                                    <small class="text-muted">Red Fort, India Gate</small>
                                </div>
                            </div>
                        </div>

                        <!-- Jammu and Kashmir -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm bg-danger bg-opacity-10" onclick="exploreState('jammu-kashmir')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏔️</div>
                                    <h6 class="fw-bold mb-1 text-danger">Jammu & Kashmir</h6>
                                    <small class="text-danger">Featured Package Available</small>
                                </div>
                            </div>
                        </div>

                        <!-- Lakshadweep -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('lakshadweep')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏝️</div>
                                    <h6 class="fw-bold mb-1">Lakshadweep</h6>
                                    <small class="text-muted">Coral Islands, Lagoons</small>
                                </div>
                            </div>
                        </div>

                        <!-- Puducherry -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('puducherry')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🇫🇷</div>
                                    <h6 class="fw-bold mb-1">Puducherry</h6>
                                    <small class="text-muted">French Quarter, Auroville</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section id="stats" class="py-5 gradient-bg text-white position-relative overflow-hidden section-content d-none">
        <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark opacity-25"></div>
        <div class="container position-relative">
            <div class="text-center mb-5">
                <h3 class="display-4 fw-bold mb-3">Why Choose OOO TRIPS?</h3>
                <p class="lead opacity-75">Trusted by thousands of corporate professionals across India</p>
            </div>
           
            <div class="row text-center mb-5">
                <div class="col-md-3 col-6 mb-4">
                    <div class="stats-counter display-4 fw-bold mb-2 text-white" data-target="2500">0</div>
                    <p class="lead opacity-75">Happy Travelers</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stats-counter display-4 fw-bold mb-2 text-white" data-target="150">0</div>
                    <p class="lead opacity-75">Destinations</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stats-counter display-4 fw-bold mb-2 text-white" data-target="98">0</div>
                    <p class="lead opacity-75">% Satisfaction</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stats-counter display-4 fw-bold mb-2 text-white" data-target="24">0</div>
                    <p class="lead opacity-75">Hour Support</p>
                </div>
            </div>
           
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="glass-effect p-4 rounded-4 text-center h-100">
                        <div class="display-4 mb-3">⚡</div>
                        <h4 class="h3 fw-semibold mb-3">Quick Escapes</h4>
                        <p class="opacity-75">Perfect weekend getaways designed for busy professionals who need instant stress relief</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="glass-effect p-4 rounded-4 text-center h-100">
                        <div class="display-4 mb-3">📱</div>
                        <h4 class="h3 fw-semibold mb-3">Digital Detox</h4>
                        <p class="opacity-75">Disconnect from work emails and reconnect with nature and yourself</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="glass-effect p-4 rounded-4 text-center h-100">
                        <div class="display-4 mb-3">🤝</div>
                        <h4 class="h3 fw-semibold mb-3">Team Building</h4>
                        <p class="opacity-75">Perfect for corporate groups and team bonding experiences</p>
                    </div>
                </div>
            </div>

            <!-- All Indian States Section -->
            <div class="mt-5">
                <h4 class="fw-bold text-center mb-4 text-success">🗺️ All Indian States & Union Territories</h4>
                <p class="text-center text-muted mb-4">Click on any state to explore travel packages and destinations</p>
               
                <!-- States Grid -->
                <div class="row g-3">
                    <!-- Andhra Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('andhra-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Andhra Pradesh</h6>
                                <small class="text-muted">Tirupati, Visakhapatnam</small>
                            </div>
                        </div>
                    </div>

                    <!-- Arunachal Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('arunachal-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1">Arunachal Pradesh</h6>
                                <small class="text-muted">Tawang, Itanagar</small>
                            </div>
                        </div>
                    </div>

                    <!-- Assam -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('assam')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🦏</div>
                                <h6 class="fw-bold mb-1">Assam</h6>
                                <small class="text-muted">Kaziranga, Guwahati</small>
                            </div>
                        </div>
                    </div>

                    <!-- Bihar -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('bihar')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Bihar</h6>
                                <small class="text-muted">Bodh Gaya, Nalanda</small>
                            </div>
                        </div>
                    </div>

                    <!-- Chhattisgarh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('chhattisgarh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌲</div>
                                <h6 class="fw-bold mb-1">Chhattisgarh</h6>
                                <small class="text-muted">Chitrakoot Falls, Raipur</small>
                            </div>
                        </div>
                    </div>

                    <!-- Goa -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-success bg-opacity-10" onclick="exploreState('goa')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏖️</div>
                                <h6 class="fw-bold mb-1 text-success">Goa</h6>
                                <small class="text-success">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Gujarat -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('gujarat')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🦁</div>
                                <h6 class="fw-bold mb-1">Gujarat</h6>
                                <small class="text-muted">Gir Forest, Rann of Kutch</small>
                            </div>
                        </div>
                    </div>

                    <!-- Haryana -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('haryana')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌾</div>
                                <h6 class="fw-bold mb-1">Haryana</h6>
                                <small class="text-muted">Kurukshetra, Panipat</small>
                            </div>
                        </div>
                    </div>

                    <!-- Himachal Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-primary bg-opacity-10" onclick="exploreState('himachal-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1 text-primary">Himachal Pradesh</h6>
                                <small class="text-primary">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Jharkhand -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('jharkhand')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">⛰️</div>
                                <h6 class="fw-bold mb-1">Jharkhand</h6>
                                <small class="text-muted">Ranchi, Jamshedpur</small>
                            </div>
                        </div>
                    </div>

                    <!-- Karnataka -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('karnataka')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1">Karnataka</h6>
                                <small class="text-muted">Mysore, Hampi, Coorg</small>
                            </div>
                        </div>
                    </div>

                    <!-- Kerala -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('kerala')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌴</div>
                                <h6 class="fw-bold mb-1">Kerala</h6>
                                <small class="text-muted">Backwaters, Munnar</small>
                            </div>
                        </div>
                    </div>

                    <!-- Madhya Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('madhya-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🐅</div>
                                <h6 class="fw-bold mb-1">Madhya Pradesh</h6>
                                <small class="text-muted">Khajuraho, Bhopal</small>
                            </div>
                        </div>
                    </div>

                    <!-- Maharashtra -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" style="background-color: rgba(232, 62, 140, 0.1);" onclick="exploreState('maharashtra')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎬</div>
                                <h6 class="fw-bold mb-1" style="color: #e83e8c;">Maharashtra</h6>
                                <small style="color: #e83e8c;">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Manipur -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('manipur')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">💃</div>
                                <h6 class="fw-bold mb-1">Manipur</h6>
                                <small class="text-muted">Imphal, Loktak Lake</small>
                            </div>
                        </div>
                    </div>

                    <!-- Meghalaya -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('meghalaya')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">☔</div>
                                <h6 class="fw-bold mb-1">Meghalaya</h6>
                                <small class="text-muted">Shillong, Cherrapunji</small>
                            </div>
                        </div>
                    </div>

                    <!-- Mizoram -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('mizoram')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌸</div>
                                <h6 class="fw-bold mb-1">Mizoram</h6>
                                <small class="text-muted">Aizawl, Blue Mountain</small>
                            </div>
                        </div>
                    </div>

                    <!-- Nagaland -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('nagaland')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎭</div>
                                <h6 class="fw-bold mb-1">Nagaland</h6>
                                <small class="text-muted">Kohima, Hornbill Festival</small>
                            </div>
                        </div>
                    </div>

                    <!-- Odisha -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('odisha')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Odisha</h6>
                                <small class="text-muted">Puri, Konark Temple</small>
                            </div>
                        </div>
                    </div>

                    <!-- Punjab -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('punjab')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🕌</div>
                                <h6 class="fw-bold mb-1">Punjab</h6>
                                <small class="text-muted">Amritsar, Golden Temple</small>
                            </div>
                        </div>
                    </div>

                    <!-- Rajasthan -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-warning bg-opacity-10" onclick="exploreState('rajasthan')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1 text-warning">Rajasthan</h6>
                                <small class="text-warning">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Sikkim -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('sikkim')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1">Sikkim</h6>
                                <small class="text-muted">Gangtok, Kanchenjunga</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tamil Nadu -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('tamil-nadu')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Tamil Nadu</h6>
                                <small class="text-muted">Chennai, Ooty, Madurai</small>
                            </div>
                        </div>
                    </div>

                    <!-- Telangana -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('telangana')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">💻</div>
                                <h6 class="fw-bold mb-1">Telangana</h6>
                                <small class="text-muted">Hyderabad, Warangal</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tripura -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('tripura')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1">Tripura</h6>
                                <small class="text-muted">Agartala, Ujjayanta Palace</small>
                            </div>
                        </div>
                    </div>

                    <!-- Uttar Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('uttar-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🕌</div>
                                <h6 class="fw-bold mb-1">Uttar Pradesh</h6>
                                <small class="text-muted">Agra, Varanasi, Lucknow</small>
                            </div>
                        </div>
                    </div>

                    <!-- Uttarakhand -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" style="background-color: rgba(111, 66, 193, 0.1);" onclick="exploreState('uttarakhand')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏕️</div>
                                <h6 class="fw-bold mb-1" style="color: #6f42c1;">Uttarakhand</h6>
                                <small style="color: #6f42c1;">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- West Bengal -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('west-bengal')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎨</div>
                                <h6 class="fw-bold mb-1">West Bengal</h6>
                                <small class="text-muted">Kolkata, Darjeeling</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Union Territories Section -->
                <div class="mt-5">
                    <h5 class="fw-bold text-center mb-4 text-info">🏛️ Union Territories</h5>
                    <div class="row g-3 justify-content-center">
                        <!-- Andaman and Nicobar Islands -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('andaman-nicobar')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏝️</div>
                                    <h6 class="fw-bold mb-1">Andaman & Nicobar</h6>
                                    <small class="text-muted">Port Blair, Havelock</small>
                                </div>
                            </div>
                        </div>

                        <!-- Chandigarh -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('chandigarh')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏙️</div>
                                    <h6 class="fw-bold mb-1">Chandigarh</h6>
                                    <small class="text-muted">Rock Garden, Sukhna Lake</small>
                                </div>
                            </div>
                        </div>

                        <!-- Dadra and Nagar Haveli -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('dadra-nagar-haveli')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🌳</div>
                                    <h6 class="fw-bold mb-1">Dadra & Nagar Haveli</h6>
                                    <small class="text-muted">Silvassa, Tribal Culture</small>
                                </div>
                            </div>
                        </div>

                        <!-- Daman and Diu -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('daman-diu')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏖️</div>
                                    <h6 class="fw-bold mb-1">Daman & Diu</h6>
                                    <small class="text-muted">Beaches, Portuguese Heritage</small>
                                </div>
                            </div>
                        </div>

                        <!-- Delhi -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('delhi')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏛️</div>
                                    <h6 class="fw-bold mb-1">Delhi</h6>
                                    <small class="text-muted">Red Fort, India Gate</small>
                                </div>
                            </div>
                        </div>

                        <!-- Jammu and Kashmir -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm bg-danger bg-opacity-10" onclick="exploreState('jammu-kashmir')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏔️</div>
                                    <h6 class="fw-bold mb-1 text-danger">Jammu & Kashmir</h6>
                                    <small class="text-danger">Featured Package Available</small>
                                </div>
                            </div>
                        </div>

                        <!-- Lakshadweep -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('lakshadweep')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏝️</div>
                                    <h6 class="fw-bold mb-1">Lakshadweep</h6>
                                    <small class="text-muted">Coral Islands, Lagoons</small>
                                </div>
                            </div>
                        </div>

                        <!-- Puducherry -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('puducherry')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🇫🇷</div>
                                    <h6 class="fw-bold mb-1">Puducherry</h6>
                                    <small class="text-muted">French Quarter, Auroville</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section id="testimonials" class="py-5 bg-light section-content d-none">
        <div class="container">
            <div class="text-center mb-5">
                <h3 class="display-4 fw-bold text-dark mb-3">What Our Travelers Say</h3>
                <p class="lead text-muted">Real experiences from real corporate professionals</p>
                <div class="mx-auto mt-3 rounded-pill" style="width: 100px; height: 4px; background: linear-gradient(45deg, #ffc107, #fd7e14);"></div>
            </div>
           
            <div class="row g-4">
                <div class="col-lg-4">
                    <div class="card testimonial-card border-0 shadow-lg h-100">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-4">
                                <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold fs-4 me-3"
                                     style="width: 64px; height: 64px; background: linear-gradient(45deg, #0d6efd, #6f42c1);">
                                    P
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-0">Priya Sharma</h5>
                                    <p class="text-muted mb-0">Software Engineer, TCS</p>
                                </div>
                            </div>
                            <div class="text-warning mb-3">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                            </div>
                            <p class="fst-italic text-muted">"The BRB package to Manali was exactly what I needed after months of coding. The mountain air and yoga sessions completely recharged me!"</p>
                        </div>
                    </div>
                </div>
               
                <div class="col-lg-4">
                    <div class="card testimonial-card border-0 shadow-lg h-100">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-4">
                                <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold fs-4 me-3"
                                     style="width: 64px; height: 64px; background: linear-gradient(45deg, #198754, #20c997);">
                                    R
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-0">Rahul Gupta</h5>
                                    <p class="text-muted mb-0">Marketing Manager, Wipro</p>
                                </div>
                            </div>
                            <div class="text-warning mb-3">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                            </div>
                            <p class="fst-italic text-muted">"Goa TTYL package was perfect for our team outing. The beach activities and spa sessions helped us bond better than any office party!"</p>
                        </div>
                    </div>
                </div>
               
                <div class="col-lg-4">
                    <div class="card testimonial-card border-0 shadow-lg h-100">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-4">
                                <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold fs-4 me-3"
                                     style="width: 64px; height: 64px; background: linear-gradient(45deg, #fd7e14, #dc3545);">
                                    A
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-0">Anita Patel</h5>
                                    <p class="text-muted mb-0">HR Director, Infosys</p>
                                </div>
                            </div>
                            <div class="text-warning mb-3">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                            </div>
                            <p class="fst-italic text-muted">"The GTG package to Jaipur was incredible! The royal treatment and cultural experiences made me forget all about work stress."</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- All Indian States Section -->
            <div class="mt-5">
                <h4 class="fw-bold text-center mb-4 text-success">🗺️ All Indian States & Union Territories</h4>
                <p class="text-center text-muted mb-4">Click on any state to explore travel packages and destinations</p>
               
                <!-- States Grid -->
                <div class="row g-3">
                    <!-- Andhra Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('andhra-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Andhra Pradesh</h6>
                                <small class="text-muted">Tirupati, Visakhapatnam</small>
                            </div>
                        </div>
                    </div>

                    <!-- Arunachal Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('arunachal-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1">Arunachal Pradesh</h6>
                                <small class="text-muted">Tawang, Itanagar</small>
                            </div>
                        </div>
                    </div>

                    <!-- Assam -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('assam')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🦏</div>
                                <h6 class="fw-bold mb-1">Assam</h6>
                                <small class="text-muted">Kaziranga, Guwahati</small>
                            </div>
                        </div>
                    </div>

                    <!-- Bihar -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('bihar')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Bihar</h6>
                                <small class="text-muted">Bodh Gaya, Nalanda</small>
                            </div>
                        </div>
                    </div>

                    <!-- Chhattisgarh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('chhattisgarh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌲</div>
                                <h6 class="fw-bold mb-1">Chhattisgarh</h6>
                                <small class="text-muted">Chitrakoot Falls, Raipur</small>
                            </div>
                        </div>
                    </div>

                    <!-- Goa -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-success bg-opacity-10" onclick="exploreState('goa')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏖️</div>
                                <h6 class="fw-bold mb-1 text-success">Goa</h6>
                                <small class="text-success">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Gujarat -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('gujarat')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🦁</div>
                                <h6 class="fw-bold mb-1">Gujarat</h6>
                                <small class="text-muted">Gir Forest, Rann of Kutch</small>
                            </div>
                        </div>
                    </div>

                    <!-- Haryana -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('haryana')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌾</div>
                                <h6 class="fw-bold mb-1">Haryana</h6>
                                <small class="text-muted">Kurukshetra, Panipat</small>
                            </div>
                        </div>
                    </div>

                    <!-- Himachal Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-primary bg-opacity-10" onclick="exploreState('himachal-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1 text-primary">Himachal Pradesh</h6>
                                <small class="text-primary">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Jharkhand -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('jharkhand')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">⛰️</div>
                                <h6 class="fw-bold mb-1">Jharkhand</h6>
                                <small class="text-muted">Ranchi, Jamshedpur</small>
                            </div>
                        </div>
                    </div>

                    <!-- Karnataka -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('karnataka')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1">Karnataka</h6>
                                <small class="text-muted">Mysore, Hampi, Coorg</small>
                            </div>
                        </div>
                    </div>

                    <!-- Kerala -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('kerala')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌴</div>
                                <h6 class="fw-bold mb-1">Kerala</h6>
                                <small class="text-muted">Backwaters, Munnar</small>
                            </div>
                        </div>
                    </div>

                    <!-- Madhya Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('madhya-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🐅</div>
                                <h6 class="fw-bold mb-1">Madhya Pradesh</h6>
                                <small class="text-muted">Khajuraho, Bhopal</small>
                            </div>
                        </div>
                    </div>

                    <!-- Maharashtra -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" style="background-color: rgba(232, 62, 140, 0.1);" onclick="exploreState('maharashtra')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎬</div>
                                <h6 class="fw-bold mb-1" style="color: #e83e8c;">Maharashtra</h6>
                                <small style="color: #e83e8c;">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Manipur -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('manipur')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">💃</div>
                                <h6 class="fw-bold mb-1">Manipur</h6>
                                <small class="text-muted">Imphal, Loktak Lake</small>
                            </div>
                        </div>
                    </div>

                    <!-- Meghalaya -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('meghalaya')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">☔</div>
                                <h6 class="fw-bold mb-1">Meghalaya</h6>
                                <small class="text-muted">Shillong, Cherrapunji</small>
                            </div>
                        </div>
                    </div>

                    <!-- Mizoram -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('mizoram')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🌸</div>
                                <h6 class="fw-bold mb-1">Mizoram</h6>
                                <small class="text-muted">Aizawl, Blue Mountain</small>
                            </div>
                        </div>
                    </div>

                    <!-- Nagaland -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('nagaland')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎭</div>
                                <h6 class="fw-bold mb-1">Nagaland</h6>
                                <small class="text-muted">Kohima, Hornbill Festival</small>
                            </div>
                        </div>
                    </div>

                    <!-- Odisha -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('odisha')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Odisha</h6>
                                <small class="text-muted">Puri, Konark Temple</small>
                            </div>
                        </div>
                    </div>

                    <!-- Punjab -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('punjab')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🕌</div>
                                <h6 class="fw-bold mb-1">Punjab</h6>
                                <small class="text-muted">Amritsar, Golden Temple</small>
                            </div>
                        </div>
                    </div>

                    <!-- Rajasthan -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm bg-warning bg-opacity-10" onclick="exploreState('rajasthan')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1 text-warning">Rajasthan</h6>
                                <small class="text-warning">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- Sikkim -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('sikkim')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏔️</div>
                                <h6 class="fw-bold mb-1">Sikkim</h6>
                                <small class="text-muted">Gangtok, Kanchenjunga</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tamil Nadu -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('tamil-nadu')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏛️</div>
                                <h6 class="fw-bold mb-1">Tamil Nadu</h6>
                                <small class="text-muted">Chennai, Ooty, Madurai</small>
                            </div>
                        </div>
                    </div>

                    <!-- Telangana -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('telangana')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">💻</div>
                                <h6 class="fw-bold mb-1">Telangana</h6>
                                <small class="text-muted">Hyderabad, Warangal</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tripura -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('tripura')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏰</div>
                                <h6 class="fw-bold mb-1">Tripura</h6>
                                <small class="text-muted">Agartala, Ujjayanta Palace</small>
                            </div>
                        </div>
                    </div>

                    <!-- Uttar Pradesh -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('uttar-pradesh')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🕌</div>
                                <h6 class="fw-bold mb-1">Uttar Pradesh</h6>
                                <small class="text-muted">Agra, Varanasi, Lucknow</small>
                            </div>
                        </div>
                    </div>

                    <!-- Uttarakhand -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" style="background-color: rgba(111, 66, 193, 0.1);" onclick="exploreState('uttarakhand')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🏕️</div>
                                <h6 class="fw-bold mb-1" style="color: #6f42c1;">Uttarakhand</h6>
                                <small style="color: #6f42c1;">Featured Package Available</small>
                            </div>
                        </div>
                    </div>

                    <!-- West Bengal -->
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('west-bengal')">
                            <div class="card-body text-center p-3">
                                <div class="fs-4 mb-2">🎨</div>
                                <h6 class="fw-bold mb-1">West Bengal</h6>
                                <small class="text-muted">Kolkata, Darjeeling</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Union Territories Section -->
                <div class="mt-5">
                    <h5 class="fw-bold text-center mb-4 text-info">🏛️ Union Territories</h5>
                    <div class="row g-3 justify-content-center">
                        <!-- Andaman and Nicobar Islands -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('andaman-nicobar')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏝️</div>
                                    <h6 class="fw-bold mb-1">Andaman & Nicobar</h6>
                                    <small class="text-muted">Port Blair, Havelock</small>
                                </div>
                            </div>
                        </div>

                        <!-- Chandigarh -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('chandigarh')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏙️</div>
                                    <h6 class="fw-bold mb-1">Chandigarh</h6>
                                    <small class="text-muted">Rock Garden, Sukhna Lake</small>
                                </div>
                            </div>
                        </div>

                        <!-- Dadra and Nagar Haveli -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('dadra-nagar-haveli')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🌳</div>
                                    <h6 class="fw-bold mb-1">Dadra & Nagar Haveli</h6>
                                    <small class="text-muted">Silvassa, Tribal Culture</small>
                                </div>
                            </div>
                        </div>

                        <!-- Daman and Diu -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('daman-diu')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏖️</div>
                                    <h6 class="fw-bold mb-1">Daman & Diu</h6>
                                    <small class="text-muted">Beaches, Portuguese Heritage</small>
                                </div>
                            </div>
                        </div>

                        <!-- Delhi -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('delhi')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏛️</div>
                                    <h6 class="fw-bold mb-1">Delhi</h6>
                                    <small class="text-muted">Red Fort, India Gate</small>
                                </div>
                            </div>
                        </div>

                        <!-- Jammu and Kashmir -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm bg-danger bg-opacity-10" onclick="exploreState('jammu-kashmir')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏔️</div>
                                    <h6 class="fw-bold mb-1 text-danger">Jammu & Kashmir</h6>
                                    <small class="text-danger">Featured Package Available</small>
                                </div>
                            </div>
                        </div>

                        <!-- Lakshadweep -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('lakshadweep')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🏝️</div>
                                    <h6 class="fw-bold mb-1">Lakshadweep</h6>
                                    <small class="text-muted">Coral Islands, Lagoons</small>
                                </div>
                            </div>
                        </div>

                        <!-- Puducherry -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card state-card h-100 border-0 shadow-sm" onclick="exploreState('puducherry')">
                                <div class="card-body text-center p-3">
                                    <div class="fs-4 mb-2">🇫🇷</div>
                                    <h6 class="fw-bold mb-1">Puducherry</h6>
                                    <small class="text-muted">French Quarter, Auroville</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="py-5 bg-white position-relative overflow-hidden section-content d-none">
        <div class="position-absolute top-0 start-0 w-100 h-100 opacity-50" style="background: linear-gradient(135deg, rgba(13, 110, 253, 0.1), rgba(111, 66, 193, 0.1));"></div>
        <div class="container position-relative">
            <div class="text-center mb-5">
                <h3 class="display-4 fw-bold text-dark mb-3">Ready to Go OOO?</h3>
                <p class="lead text-muted mb-3">Contact us to book your perfect weekend getaway or customize a package for your team.</p>
                <div class="mx-auto rounded-pill" style="width: 100px; height: 4px; background: linear-gradient(45deg, #ffc107, #fd7e14);"></div>
            </div>
           
            <div class="row g-5 align-items-start">
                <div class="col-lg-6">
                    <div class="card glass-effect border-0 shadow-lg">
                        <div class="card-body p-4">
                            <form onsubmit="handleSubmit(event)">
                                <div class="row g-3 mb-3">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control form-control-lg" placeholder="Your Name" required>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="email" class="form-control form-control-lg" placeholder="Email Address" required>
                                    </div>
                                </div>
                                <div class="row g-3 mb-3">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control form-control-lg" placeholder="Company Name">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="tel" class="form-control form-control-lg" placeholder="Phone Number" required>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <select id="packageSelect" class="form-select form-select-lg">
                                        <option value="">Select a Package</option>
                                        <option value="brb">BRB Package - Manali Mountain Adventure (₹45,999)</option>
                                        <option value="ttyl">TTYL Package - Goa Beach Paradise (₹52,999)</option>
                                        <option value="afk">AFK Package - Rishikesh River Retreat (₹35,999)</option>
                                        <option value="gtg">GTG Package - Jaipur Royal Heritage (₹48,999)</option>
                                        <option value="lol">LOL Package - Mumbai Bollywood Fun (₹42,999)</option>
                                        <option value="asap">ASAP Package - Ladakh High Altitude Thrill (₹65,999)</option>
                                    </select>
                                </div>
                                <div class="mb-4">
                                    <textarea class="form-control form-control-lg" rows="4" placeholder="Tell us about your group size, travel dates, and any special requirements..."></textarea>
                                </div>
                                <button type="submit" class="btn btn-gradient-secondary btn-lg w-100 py-3 rounded-pill">
                                    Send Inquiry 📧
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
               
                <div class="col-lg-6">
                    <div class="mb-4">
                        <div class="card border-0 shadow-lg">
                            <div class="card-body p-4">
                                <h4 class="h3 fw-bold text-dark mb-4">Get In Touch</h4>
                                <div class="d-flex align-items-center mb-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 48px; height: 48px; background: linear-gradient(45deg, #0d6efd, #6f42c1);">
                                        <i class="bi bi-telephone text-white"></i>
                                    </div>
                                    <div>
                                        <p class="fw-semibold mb-0">Call Us</p>
                                        <p class="text-muted mb-0">+91-800-OOO-TRIP</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 48px; height: 48px; background: linear-gradient(45deg, #198754, #20c997);">
                                        <i class="bi bi-envelope text-white"></i>
                                    </div>
                                    <div>
                                        <p class="fw-semibold mb-0">Email Us</p>
                                        <p class="text-muted mb-0">hello@oootrips.com</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 48px; height: 48px; background: linear-gradient(45deg, #fd7e14, #dc3545);">
                                        <i class="bi bi-whatsapp text-white"></i>
                                    </div>
                                    <div>
                                        <p class="fw-semibold mb-0">WhatsApp</p>
                                        <p class="text-muted mb-0">+91-98765-43210</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <div class="card text-white border-0" style="background: linear-gradient(45deg, #ffc107, #fd7e14);">
                        <div class="card-body p-4">
                            <h4 class="h3 fw-bold mb-3">🎉 Special Offer!</h4>
                            <p class="lead mb-3">Book any package this month and get:</p>
                            <ul class="list-unstyled">
                                <li class="mb-2">✅ 15% discount for groups of 6+</li>
                                <li class="mb-2">✅ Free airport transfers</li>
                                <li class="mb-2">✅ Complimentary travel insurance</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Package Details Modal -->
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

    <!-- Footer -->
    <footer class="gradient-bg text-white py-5 position-relative overflow-hidden">
        <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark opacity-25"></div>
        <div class="container position-relative">
            <div class="row g-4 mb-4">
                <div class="col-lg-6">
                    <div class="d-flex align-items-center mb-4">
                        <div class="rounded-circle d-flex align-items-center justify-content-center pulse-slow me-3"
                             style="width: 48px; height: 48px; background: linear-gradient(45deg, #ffc107, #fd7e14);">
                            <span class="text-white fw-bold fs-4">🏖️</span>
                        </div>
                        <div>
                            <h4 class="h3 fw-bold mb-0">OOO TRIPS</h4>
                            <small class="opacity-75">Out Of Office Trips</small>
                        </div>
                    </div>
                    <p class="opacity-75 mb-4" style="max-width: 400px;">
                        Your perfect weekend getaway is just one click away from your out-of-office message.
                        Disconnect to reconnect with what matters most.
                    </p>
                    <div class="d-flex gap-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center"
                             style="width: 40px; height: 40px; background: rgba(255,255,255,0.2); cursor: pointer;">
                            <i class="bi bi-facebook"></i>
                        </div>
                        <div class="rounded-circle d-flex align-items-center justify-content-center"
                             style="width: 40px; height: 40px; background: rgba(255,255,255,0.2); cursor: pointer;">
                            <i class="bi bi-instagram"></i>
                        </div>
                        <div class="rounded-circle d-flex align-items-center justify-content-center"
                             style="width: 40px; height: 40px; background: rgba(255,255,255,0.2); cursor: pointer;">
                            <i class="bi bi-twitter"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="fw-semibold mb-3">Quick Links</h5>
                    <ul class="list-unstyled opacity-75">
                        <li class="mb-2"><a href="#" class="text-white text-decoration-none" onclick="toggleSection('packages')">Packages</a></li>
                        <li class="mb-2"><a href="#" class="text-white text-decoration-none" onclick="toggleSection('stats')">Why Choose Us</a></li>
                        <li class="mb-2"><a href="#" class="text-white text-decoration-none" onclick="toggleSection('testimonials')">Reviews</a></li>
                        <li class="mb-2"><a href="#" class="text-white text-decoration-none" onclick="toggleSection('contact')">Contact</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="fw-semibold mb-3">Destinations</h5>
                    <ul class="list-unstyled opacity-75">
                        <li class="mb-2">Manali, Himachal Pradesh</li>
                        <li class="mb-2">Goa Beaches</li>
                        <li class="mb-2">Rishikesh, Uttarakhand</li>
                        <li class="mb-2">Jaipur, Rajasthan</li>
                        <li class="mb-2">Mumbai, Maharashtra</li>
                        <li class="mb-2">Ladakh, J&K</li>
                    </ul>
                </div>
            </div>
            <hr class="opacity-25">
            <div class="text-center pt-3">
                <p class="opacity-75 mb-1">© 2024 OOO TRIPS. All rights reserved. | Disconnect to Reconnect ™</p>
                <p class="small opacity-50">Made with ❤️ for corporate professionals who deserve a break</p>
            </div>
        </div>
    </footer>

    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'989b95f6625a8ae2',t:'MTc1OTY1MzMyOC4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script> -->
</body>
</html>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- ✅ Common CSS -->
    <!-- <link rel="stylesheet" href="${PATH_FOLDER_CSS}/common.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/hero.css">

    <%@ include file="common/commonScript.jsp" %>
    <!-- ✅ Common JS -->
    <script src="${pageContext.request.contextPath}/static/js/dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/hero.js"></script>
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
                <h3 class="display-4 fw-bold text-dark mb-3">Top Packages for Your Selection</h3>
                <p class="lead text-muted">Carefully curated options to make your trip memorable.</p>
                <div class="mx-auto mt-3 rounded-pill" style="width: 100px; height: 4px; background: linear-gradient(45deg, #ffc107, #fd7e14);"></div>
            </div>

            <!-- Featured Packages Section -->
            <div class="mb-5">
                <!-- <h4 class="fw-bold text-center mb-4 text-primary">🌟 Featured Weekend Packages</h4> -->

            <div class="row g-4" id="packagesRow">
            </div>
        </div>
    </section>
    <section id="contact" class="py-5 bg-white position-relative overflow-hidden section-content">
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
                                <button type="submit" class="btn btn-gradient-primary btn-lg w-100 py-3 rounded-pill">
                                    Send Inquiry
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
                                        <p class="text-muted mb-0">+91 8630327282</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 48px; height: 48px; background: linear-gradient(45deg, #198754, #20c997);">
                                        <i class="bi bi-envelope text-white"></i>
                                    </div>
                                    <div>
                                        <p class="fw-semibold mb-0">Email Us</p>
                                        <p class="text-muted mb-0">ooo.trips@gmail.com</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 48px; height: 48px; background: linear-gradient(45deg, #fd7e14, #dc3545);">
                                        <i class="bi bi-whatsapp text-white"></i>
                                    </div>
                                    <div>
                                        <p class="fw-semibold mb-0">WhatsApp</p>
                                        <a class="text-muted mb-0" href="https://wa.me/8630327282?text='Hi baby'">+91 8030327282</a>
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
    <jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
<script>
    $(document).ready(async function(){
        var cardDataapi = await getDataByPayloadWithParentUrl('POST', true, true, '${pageContext.request.contextPath}/api/get-all-categories', "");
        const converted = cardDataapi.categories.map(item => {
            // getAllDiscoverCardCardByData('',item.icon, item.name, item.description, '',item.backgroundColor == '' ? 'linear-gradient(135deg, #4a6cf7, #0106a7)' : item.backgroundColor, '','');
            return {
                toggleSection: item.toggleSection == '' ? '': '',
                icon: item.icon,
                cardName: item.name,
                description: item.description,
                badge: item.packageCount > 0 ?  item.packageCount + ' Amazing Packages' : '',
                backgroundColor: item.backgroundColor == '' ? 'linear-gradient(135deg, #4a6cf7, #0106a7)' : item.backgroundColor,
                height: '',
                width: '',
                id: item.id
            };
        });
        // console.log(discoverCardData);
        getAllDiscoverCardCardByData(converted);
        getAllPackages();
        toggleSection('packages', true);
    })
</script>
</html>

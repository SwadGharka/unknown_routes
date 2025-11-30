<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title id="title"></title>

        <!-- Lightbox (Gallery) -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/packageDetails.css">
        <script src="${pageContext.request.contextPath}/static/js/packageDetails.js"></script>
    </head>
    <body>
        <%@ include file="common/commonScript.jsp" %>
        <div class="package-hero" id="imageUrl">
            <div class="hero-content">
                <h1 class="package-title" id="packageName"></h1>
                <p class="package-location" id="daysAndDestination"></p>
            </div>
        </div>

        <div class="container my-5">
            <div class="row g-4">
                <!-- LEFT CONTENT -->
                <div class="col-lg-8">
                    <!-- Gallery -->
                    <!-- Gallery (replace existing) -->
                    <div class="glass-box">
                    <h3>Photo Gallery</h3>

                    <!-- Thumb strip -->
                    <button class="thumb-side-btn left" id="thumbPrev"><span class="carousel-control-prev-icon" aria-hidden="true"></span></button>
                    <div class="thumb-strip" id="thumbStrip"></div>
                    <button class="thumb-side-btn right" id="thumbNext"><span class="carousel-control-next-icon" aria-hidden="true"></span></button>
                    </div>

                    <!-- Modal with Carousel (keep near page bottom) -->
                    <div class="modal fade" id="imageModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content" style="background:transparent;border:none;">
                        <div id="modalCarousel" class="carousel slide" data-bs-ride="false">
                            <div class="carousel-inner" id="modalCarouselImages"></div>

                            <button class="carousel-control-prev" type="button" data-bs-target="#modalCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#modalCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            </button>
                        </div>
                        </div>
                    </div>
                    </div>

                    <input type="hidden" value="${packageId}" id="packageId">
                    <input type="hidden" value="" id="travelType">
                    <!-- Major Attractions -->
                    <div class="glass-box">
                        <h3>Major Attractions</h3>
                        <div id="majorAttractions">
                        </div>
                    </div>
                    <!-- ITINERARY -->
                    <div class="glass-box">
                        <h3>Itinerary</h3>
                        <div id="itineraryContainer"></div>
                    </div>


                    <!-- INCLUSION + EXCLUSION -->
                    <div class="dual-box">

                        <div class="glass-box">
                            <h3>Inclusions</h3>
                            <ul>
                                <div id="inclusions">

                                </div>
                            </ul>
                        </div>

                        <div class="glass-box">
                            <h3>Exclusions</h3>
                            <ul>
                                <div id="exclusions">
                                </div>
                            </ul>
                        </div>

                    </div>

                </div>


                <!-- RIGHT SIDEBAR -->
                <div class="col-lg-4">
                    <div class="sidebar">
                        <div class="side-card">
                            <h4>Starting Price</h4>
                            <div class="side-price" id="price"></div>

                            <hr>

                            <h5>Highlights</h5>
                            <ul>
                                <div id="highlights">
                                </div>
                            </ul>

                            <button class="btn-book mt-2"
                                onclick="bookNow()">Book Now</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="float-book-btn" onclick="bookNow()">Book Now</div>
        <!-- Image Preview Modal -->
        <div class="modal fade" id="imageModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content" style="background: transparent; border: none;">

                <div id="modalCarousel" class="carousel slide">
                    <div class="carousel-inner" id="modalCarouselImages"></div>

                    <button class="carousel-control-prev" type="button" data-bs-target="#modalCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#modalCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                    </button>
                </div>

                </div>
            </div>
        </div>
    <%@ include file="/WEB-INF/views/bookingModal.jsp" %>
    <jsp:include page="/WEB-INF/views/footer.jsp" />
    </body>
    <script>
        $(document).ready(async function () {
            await getPackageDetails();
            // loadCarousels();
             buildGallery();

                $('#thumbPrev').on('click', () => thumbScroll(-260));
                $('#thumbNext').on('click', () => thumbScroll(260));
        });
    </script>
</html>
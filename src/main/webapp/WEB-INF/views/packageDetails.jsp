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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/packageDetails.css">
        <script src="${pageContext.request.contextPath}/static/js/packageDetails.js"></script>
    </head>
    <body>
        <%@ include file="common/commonScript.jsp" %>
        <div class="package-hero"
            style="background-image:url('https://images.unsplash.com/photo-1506905925346-21bda4d32df4');">
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
                    <div class="glass-box">
                        <h3>Photo Gallery</h3>
                        <div class="gallery-grid">
                            <a href="https://picsum.photos/900/600?random=1" data-lightbox="g">
                                <img src="https://picsum.photos/300/200?1" class="gallery-img">
                            </a>
                            <a href="https://picsum.photos/900/600?random=2" data-lightbox="g">
                                <img src="https://picsum.photos/300/200?2" class="gallery-img">
                            </a>
                            <a href="https://picsum.photos/900/600?random=3" data-lightbox="g">
                                <img src="https://picsum.photos/300/200?3" class="gallery-img">
                            </a>
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
                            <div class="side-price" id="price">₹54,999</div>

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
        <div class="float-book-btn" onclick="bookNow()">Book Now
        </div>
    </body>
    <script>
        $(document).ready(async function () {
            await getPackageDetails();
        });
    </script>
    <%@ include file="/WEB-INF/views/bookingModal.jsp" %>
    <jsp:include page="/WEB-INF/views/footer.jsp" />
</html>
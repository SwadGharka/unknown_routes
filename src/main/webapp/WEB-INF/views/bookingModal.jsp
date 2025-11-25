<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ================= BOOK NOW MODAL ================= -->
<div id="bookingModal" class="ooo-modal">
    <div class="ooo-modal-overlay" onclick="closeBookingModal()"></div>

    <div class="ooo-modal-box" id="bookingModalBox">
        
        <!-- Close Button -->
        <button class="ooo-close-btn" onclick="closeBookingModal()">×</button>

        <!-- FORM CONTENT -->
        <div id="bookingFormSection">
            <h3 class="modal-title">Send Inquiry</h3>
            <p class="modal-sub">Fill the details and we will contact you soon.</p>

            <form onsubmit="submitInquiry(event)">

                <div class="modal-field-row">
                    <input type="text" class="modal-input" id="inqName" placeholder="Your Name" required>
                    <input type="email" class="modal-input" id="inqEmail" placeholder="Email Address" required>
                </div>

                <div class="modal-field-row">
                    <input type="text" class="modal-input" id="inqCompany" placeholder="Company Name">
                    <input type="tel" class="modal-input" id="inqPhone" placeholder="Phone Number" required>
                </div>

                <textarea class="modal-input modal-textarea" id="inqMessage"
                          placeholder="Tell us about your trip requirement…" rows="4"></textarea>

                <button class="modal-btn" type="submit">Send Inquiry</button>
            </form>
        </div>

        <!-- THANK YOU SECTION -->
        <div id="bookingThankYou" class="d-none">
            <h3 class="modal-title">Thank You 🎉</h3>
            <p class="modal-sub">We’ve received your request. Our team will reach out shortly.</p>

            <button class="modal-btn" onclick="closeBookingModal()">Close</button>
        </div>

    </div>
</div>

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bookingModal.css">
<script src="${pageContext.request.contextPath}/static/js/bookingModal.js"></script>

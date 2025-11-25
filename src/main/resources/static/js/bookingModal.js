function openBookingModal() {
    document.getElementById("bookingModal").classList.add("show");
}

function closeBookingModal() {
    document.getElementById("bookingModal").classList.remove("show");

    setTimeout(() => {
        resetBookingModal();
    }, 300);
}

function resetBookingModal() {
    document.getElementById("bookingFormSection").classList.remove("d-none");
    document.getElementById("bookingThankYou").classList.add("d-none");
}

function submitInquiry(e) {
    e.preventDefault();

    // simulate API delay
    setTimeout(() => {
        document.getElementById("bookingFormSection").classList.add("d-none");
        document.getElementById("bookingThankYou").classList.remove("d-none");
    }, 700);
}

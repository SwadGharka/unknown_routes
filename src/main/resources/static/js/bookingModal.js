function openBookingModal(event, packageName, packageId, travelType) {
    $("#bookingFormSection #travelType").val(travelType);
    $("#bookingFormSection #packageId").val(packageId);
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

function validateInquiryForm(formId) {
    let isValid = true;

    $("#"+formId +" .modal-input").removeClass("shake");

    const name = $("#"+formId +" #inqName").val().trim();
    const email = $("#"+formId +" #inqEmail").val().trim();
    const persionCount = $("#"+formId +" #inqPersionCount").val().trim();
    const number = $("#"+formId +" #inqPhone").val().trim();
    const message = $("#"+formId +" #inqMessage").val().trim();

    if (name.length < 2) {
        $("#"+formId +" #inqName").addClass("shake");
        setTimeout(() => $("#"+formId +" #inqName").removeClass("shake"), 1000);
        isValid = false;
    }

    // const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    // if (!emailRegex.test(email)) {
    //     $("#inqEmail").addClass("shake");
    //     setTimeout(() => $("#inqEmail").removeClass("shake"), 1000);
    //     isValid = false;
    // }

    const phoneRegex = /^[0-9]{10}$/;
    if (!phoneRegex.test(number)) {
        $("#"+formId +" #inqPhone").addClass("shake");
        setTimeout(() => $("#"+formId +" #inqPhone").removeClass("shake"), 1000);
        isValid = false;
    }
    if (!isValid) return null;
    let packageId = $("#"+formId +" #packageId").val();
    let travelType = $("#"+formId +" #travelType").val();
    return {
        name,
        email,
        persionCount,
        number,
        message,
        travelType,
        packageId
    };
}

async function submitInquiry(event, formId) {
    event.preventDefault();

    const payload = validateInquiryForm(formId);

    if (!payload) {
        showMessage("error", "Please fill all required fields correctly");
        return;
    }

    showLoader("Sending Inquiry...", true);

    let response = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL + CONTEXT_PATH + "api/save-package-inquiry", payload)
    if (response != null && response.status == 1) {
        showLoader("", false);
        setTimeout(() => {
            document.getElementById("bookingFormSection").classList.add("d-none");
            document.getElementById("bookingThankYou").classList.remove("d-none");
        }, 700);
        $("#inqName, #inqEmail, #inqCompany, #inqPhone, #inqMessage").val("");
    }else{
        showLoader("", false);
        showMessage("error", "Something went wrong, try again!");
    }
}

$(document).ready(function () {
    $(".readBtn").click(function () {
        let blogId = $(this).data("id");

        alert("Blog details will open for ID: " + blogId + "\n(After backend API integration)");
    });
});

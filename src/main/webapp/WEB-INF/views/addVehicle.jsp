<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Category | OOO Trips</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	integrity="sha512-..." crossorigin="anonymous"
	referrerpolicy="no-referrer" />
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/addVehicle.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/common.js"></script>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="page-wrapper">

		<!-- LEFT FORM -->
		<div class="container mt-4">
			<div class="row">
				<div class="col-lg-6">

					<div class="form-container">
						<h2 class="mb-3">🚗 Add New Vehicle</h2>

						<form id="vehicleForm">
							<div class="row g-3">

								<!-- Left Column -->
								<div class="col-md-6">
									<label class="form-label">Vehicle Name:</label> <input
										type="text" id="name" class="form-control"
										placeholder="Hatchback"> <label
										class="form-label mt-3">Tagline:</label> <input type="text"
										id="tagline" class="form-control"
										placeholder="Perfect for city rides"> <label
										class="form-label mt-3">Image URL:</label> <input type="text"
										id="image" class="form-control" placeholder="https://...">

									<label class="form-label mt-3">Badge Label:</label> <input
										type="text" id="badgeLabel" class="form-control"
										placeholder="Most Popular"> <label
										class="form-label mt-3">Badge Color Class:</label> <select
										id="badgeClass" class="form-select">
										<option value="bg-success">Green</option>
										<option value="bg-primary">Blue</option>
										<option value="bg-warning text-dark">Yellow</option>
										<option value="bg-danger">Red</option>
									</select>
								</div>

								<!-- Right Column -->
								<div class="col-md-6">
									<label class="form-label">Price:</label> <input type="text"
										id="price" class="form-control" placeholder="₹12/km">
									<label class="form-label mt-3">Seats</label> <input
										type="number" id="specSeats" class="form-control"
										placeholder="Enter number of seats" min="1"> <label
										class="form-label mt-3">Bags</label> <input type="number"
										id="specBags" class="form-control"
										placeholder="Enter number of bags" min="0"> <label
										class="form-label mt-3">Transmission</label> <select
										id="specTransmission" class="form-select">
										<option value="Manual">Manual</option>
										<option value="Automatic">Automatic</option>
										<option value="Manual/Auto">Manual/Auto</option>
									</select> <label class="form-label mt-3">Fuel Type</label> <select
										id="specFuel" class="form-select">
										<option value="Petrol">Petrol</option>
										<option value="Diesel">Diesel</option>
										<option value="CNG">CNG</option>
										<option value="EV">EV</option>
										<option value="Petrol/Diesel">Petrol/Diesel</option>
									</select>
								</div>

								<!-- Full Width Row -->
								<div class="col-12">
									<label class="form-label mt-3">Features (comma
										separated):</label>
									<textarea id="features" class="form-control"
										placeholder="GPS Navigation, AC & Music"></textarea>
								</div>

								<div class="col-12 text-center mt-4">
									<button type="button" class="btn btn-success px-4 py-2"
										onclick="saveVehicle()">💾 Save Vehicle</button>
								</div>

							</div>
						</form>
					</div>
				</div>

				<div class="col-lg-6">
					<!-- RIGHT PREVIEW -->
					<div class="preview-container">
						<h3>Vehicle Preview</h3>

						<div class="preview-wrapper">
							<div class="vehicle-preview-card">
								<div class="vehicle-image" id="previewImage"
									style="background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.1)), url('https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&amp;fit=crop&amp;w=800&amp;q=80');">

									<div class="vehicle-badge">
										<span id="previewBadge"
											class="badge bg-success px-3 py-2 rounded-pill"> Most
											Popular </span>
									</div>

								</div>

								<div class="p-4">
									<h4 class="text-primary fw-bold" id="previewName">Hatchback</h4>
									<p class="text-muted" id="previewTagline">Perfect for city
										rides</p>

									<div id="previewSpecs" class="row g-2 text-center"></div>

									<ul id="previewFeatures" class="list-unstyled mt-3"></ul>

									<div class="text-center mt-3">
										<div class="display-6 fw-bold" id="previewPrice">₹12/km</div>
										<p class="text-muted small">Starting from</p>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>




	<script>

    // Live update events same as category file
    $("#name").on("input", () => $("#previewName").text($("#name").val() || "Hatchback"));
    $("#tagline").on("input", () => $("#previewTagline").text($("#tagline").val() || "Perfect for city rides"));

    $("#image").on("input", function () {
        let url = $(this).val().trim() || "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&w=800&q=80";
        $("#previewImage").css("background", 
            "linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.1)), url('" + url + "')");
    });

    $("#badgeLabel").on("input", () => $("#previewBadge").text($("#badgeLabel").val() || "Most Popular"));
    $("#badgeClass").on("change", () => $("#previewBadge").attr("class", "badge px-3 py-2 rounded-pill " + $("#badgeClass").val()));

    $("#price").on("input", () => $("#previewPrice").text($("#price").val() || "₹12/km"));

    $("#specSeats, #specBags, #specTransmission, #specFuel")
    .on("input change", function () {
        updateSpecsPreview();
    });
    function updateSpecsPreview() {
        let seats = $("#specSeats").val().trim() || "4";
        let bags = $("#specBags").val().trim() || "2";
        let transmission = $("#specTransmission").val();
        let fuel = $("#specFuel").val();

        let html = "";

        html += 
            '<li class="d-flex align-items-center mb-1">' +
                '<i class="bi bi-people me-2 text-primary"></i>' +
                '<p class="mb-0">' + seats + ' Seats</p>' +
            '</li>';

        html += 
            '<li class="d-flex align-items-center mb-1">' +
                '<i class="bi bi-bag me-2 text-primary"></i>' +
                '<p class="mb-0">' + bags + ' Bags</p>' +
            '</li>';

        html += 
            '<li class="d-flex align-items-center mb-1">' +
                '<i class="bi bi-gear me-2 text-primary"></i>' +
                '<p class="mb-0">' + trans + '</p>' +
            '</li>';

        html += 
            '<li class="d-flex align-items-center mb-1">' +
                '<i class="bi bi-fuel-pump me-2 text-primary"></i>' +
                '<p class="mb-0">' + fuel + '</p>' +
            '</li>';

        $("#previewSpecs").html(html);
    }

    // trigger update on any change
    $("#specSeats, #specBags, #specTransmission, #specFuel")
        .on("input change", updateSpecsPreview);

    // initial load
    updateSpecsPreview();


    $("#features").on("input", function () {
        let html = "";
        let list = $(this).val().split(",");

        list.forEach(f => {
            let feature = f.trim();
            if (feature !== "") {
            	html += 
            	    '<li class="d-flex align-items-center mb-1">' +
            	        '<i class="bi bi-check-circle text-success me-2"></i>' +
            	        '<p class="mb-0">' + feature + '</p>' +
            	    '</li>';
            }
        });

        $("#previewFeatures").html(html);
    });

    // Build JSON object same as your category file
    function getVehicle() {
        return {
            name: $("#name").val().trim(),
            tagline: $("#tagline").val().trim(),
            image: $("#image").val().trim(),
            badgeLabel: $("#badgeLabel").val().trim(),
            badgeClass: $("#badgeClass").val().trim(),
            price: $("#price").val().trim(),
            specs: $("#specs").val().trim(),
            features: $("#features").val().trim()
        };
    }

    function saveVehicle() {
        let data = getVehicle();
        console.log("JSON Payload:", data);

        alert("Vehicle saved!\n\n" + JSON.stringify(data, null, 4));
    }

</script>

</body>
</html>
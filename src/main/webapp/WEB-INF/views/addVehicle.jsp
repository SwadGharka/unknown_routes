<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Add Vechicle | OOO Trips</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- FontAwesome -->
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/addVehicle.css">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
</head>
<body>

<%@ include file="header.jsp" %>
	<div class="container py-5 mt-5">
		<div class="row g-4">


			<div class="col-lg-6">
				<div class="form-container p-4">
					

					<div class="d-flex justify-content-between">
					<div>
					<h2 class="mb-4 text-white">🚗 Add New Vehicle</h2>
					</div>
					
						<div class="form-check form-switch">
						  <input class="form-check-input" type="checkbox" role="switch" id="activestatus">
						  <label class="form-check-label" for="flexSwitchCheckDefault">Status</label>
						</div>
					</div>

					<form id="vehicleForm">
						<div class="row g-3">

							<div class="col-md-6">
								<label class="form-label">Vehicle Name:</label> <input
									type="text" id="name" class="form-control"
									placeholder="" required> <label
									class="form-label mt-3">Tagline:</label> <input type="text"
									id="tagline" class="form-control"
									placeholder="" required> <label
									class="form-label mt-3">Vehicle Image:</label> <input
									type="file" id="imageFile" class="form-control"
									accept="image/*" required> <label
									class="form-label mt-3">Badge Label:</label> <input type="text"
									id="badgeLabel" class="form-control" placeholder=""
									required> <label class="form-label mt-3">Badge
									Color:</label> <select id="badgeClass" class="form-select" required>
									<option value="bg-success">Green</option>
									<option value="bg-primary">Blue</option>
									<option value="bg-warning text-dark">Yellow</option>
									<option value="bg-danger">Red</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label">Price:</label> <input type="text"
									id="price" class="form-control" placeholder="price per km" required>

								<label class="form-label mt-3">Seats:</label> <input
									type="number" id="specSeats" class="form-control"
									placeholder="0" min="1" required> <label
									class="form-label mt-3">Bags:</label> <input type="number"
									id="specBags" class="form-control" placeholder="0" min="0"
									required> <label class="form-label mt-3">Transmission:</label>
								<select id="specTransmission" class="form-select" required>
									<option value="Manual">Manual</option>
									<option value="Automatic">Automatic</option>
									<option value="Manual/Auto">Manual/Auto</option>
								</select> <label class="form-label mt-3">Fuel Type:</label> <select
									id="specFuel" class="form-select" required>
									<option value="Petrol">Petrol</option>
									<option value="Diesel">Diesel</option>
									<option value="CNG">CNG</option>
									<option value="EV">EV</option>
									<option value="Petrol/Diesel">Petrol/Diesel</option>
								</select>
							</div>

							<div class="col-12">
								<label class="form-label mt-3">Features (#
									separated):</label>
								<textarea id="features" class="form-control"
									placeholder="" rows="3" required></textarea>
							</div>

							<div class="col-12 text-center mt-4">
								<button type="button" class="btn btn-success btn-lg px-5"
									onclick="saveVehicle()">💾 Save Vehicle</button>
							</div>

						</div>
					</form>
				</div>
			</div>


			<div class="col-lg-6">
    <div class="text-center">
        <h3 class="mb-4 text-white">Vehicle Preview</h3>

        <div class="vehicle-preview-card">

            <!-- IMAGE BACKGROUND + POSITION RELATIVE -->
            <div class="vehicle-image position-relative" id="previewImage"
                 style="background:url('https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&w=800&q=80') center/cover;
                        height:280px; border-radius:0.5rem;">

                <!-- BADGE RIGHT TOP -->
                <span id="previewBadge"
                      class="badge bg-success px-3 py-2 rounded-pill position-absolute top-0 end-0 m-2">
                    Badge
                </span>

            </div>

            <div class="p-4">
                <h4 class="text-primary fw-bold" id="previewName">Vehicle Name</h4>
                <p class="text-muted" id="previewTagline">Short tagline for vehicle</p>

                <div id="previewSpecs" class="mt-3"></div>
                <ul id="previewFeatures" class="list-unstyled mt-3"></ul>

                <div class="text-center mt-4">
                    <div class="display-6 fw-bold text-primary">
                    <span>₹</span><span id="previewPrice">00</span><span>/km</span>
                    
                    </div>
                    
                    <p class="text-muted small">Starting from</p>
                </div>
            </div>

        </div>
    </div>
</div>


		</div>
	</div>

	<script>
 
        $("#imageFile").on("change", function () {
            let file = this.files[0];
            if (file) {
                let url = URL.createObjectURL(file);
                $("#previewImage").css("background", `url('${url}') center/cover`);
            }
        });
 
 
        $("#name").on("input", () => $("#previewName").text($("#name").val()));
        $("#tagline").on("input", () => $("#previewTagline").text($("#tagline").val()));
        $("#price").on("input", () => $("#previewPrice").text($("#price").val()));
        $("#badgeLabel").on("input", () => $("#previewBadge").text($("#badgeLabel").val() || "Most Popular"));
        $("#badgeClass").on("change", function () {
            $("#previewBadge").attr("class",
                `badge px-3 py-2 rounded-pill position-absolute top-0 end-0 m-2 \${$(this).val()}`
            );
        }); 
 
        function updateSpecsPreview() {
            $("#previewSpecs").html(`
			<div class="row g-2 text-center">
			<div class="col-6"><i class="bi bi-people me-2 text-primary"></i>\${$("#specSeats").val()} Seats</div>
			<div class="col-6"><i class="bi bi-bag me-2 text-primary"></i>\${$("#specBags").val()} Bags</div>
			<div class="col-6"><i class="bi bi-gear me-2 text-primary"></i>\${$("#specTransmission").val()}</div>
			<div class="col-6"><i class="bi bi-fuel-pump me-2 text-primary"></i>\${$("#specFuel").val()}</div>
			</div>
            `);
        }
        $("#specSeats, #specBags, #specTransmission, #specFuel").on("input change", updateSpecsPreview);
        updateSpecsPreview();
 
        $("#features").on("input", function () {
            let raw = $(this).val().trim();

            if (raw === "") {
                $("#previewFeatures").html(`
                    <li class="d-flex align-items-center mb-1">
                        <i class="bi bi-check-circle text-success me-2"></i>
                        <span></span>
                    </li>
                `);
                return;
            }

            let list = raw.split(/[\n#]+/);
            let html = "";

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
 
 
        function getVehicleDetails() {
            if (!document.getElementById("vehicleForm").checkValidity()) {
                alert("Please fill all required fields!");
                return;
            }
 
            let file = $("#imageFile")[0].files[0];
            let imageName = file ? file.name : "";
 
            return {
                name: $("#name").val(),
                tagline: $("#tagline").val(),
                /* imageFileName: imageName, */
                badgeLabel: $("#badgeLabel").val(),
                badgeClass: $("#badgeClass").val(),
                price: $("#price").val(),
                specs: {
                    seats: $("#specSeats").val(),
                    bags: $("#specBags").val(),
                    transmission: $("#specTransmission").val(),
                    fuel: $("#specFuel").val()
                },
                features: $("#features").val(),
                status: $("#activestatus").prop("checked")
            };
        }

        async function saveVehicle() {
            let payload = getVehicleDetails();
            let response = await getDataByPayloadWithParentUrl("post", false, true, "${BASE_URL}${CONTEXT_PATH}api/save-vehicle", payload);
            if (response.status == '1') {
                showMessage("success", response.message, true);
                setTimeout(() => window.location.reload(), 3000);
            } else {
                showMessage("error", response.message);
            }
        }
</script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>${title}</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/carRentalsHome.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/carRentalsHome.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
	<script src="/_sdk/data_sdk.js" type="text/javascript"></script>
	<script src="/_sdk/element_sdk.js" type="text/javascript"></script>
	<script src="https://cdn.tailwindcss.com" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	 <%@ include file="common/commonScript.jsp" %>
	 
	 
	 
</head>
<body>
	<%@ include file="header.jsp"%>

	<!-- Hero Section -->
	<section
		class="hero-bg text-white d-flex align-items-center position-relative overflow-hidden">
		<div class="position-absolute top-0 start-0 w-100 h-100"
			style="background: linear-gradient(45deg, rgba(13, 110, 253, 0.2), rgba(111, 66, 193, 0.2));"></div>
		<div class="container position-relative" style="z-index: 10;">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="floating mb-4">
						<div class="display-1 mb-3">🚗</div>
					</div>
					<h2 class="display-3 fw-bold mb-4 text-shadow slide-in">Premium
						Car Rentals for Every Journey</h2>
					<p class="lead mb-5 opacity-75 slide-in text-shadow"
						style="animation-delay: 0.2s">From airport transfers to
						weekend getaways, we provide reliable, comfortable, and affordable
						car rental services across India. Your perfect ride is just a
						click away.</p>
					<div class="d-flex flex-column flex-sm-row gap-3 mb-5 slide-in"
						style="animation-delay: 0.4s">
						<button
							class="btn btn-gradient-primary btn-lg px-5 py-3 rounded-pill"
							onclick="showBookingModal()">Book Your Ride 🚗</button>
						<button
							class="btn glass-effect btn-lg px-5 py-3 rounded-pill text-white border-white"
							onclick="scrollToSection('vehicles')">View Our Fleet 🚙
						</button>
					</div>
					<div class="row slide-in" style="animation-delay: 0.6s">
						<div class="col-4">
							<div class="stats-counter text-white" data-target="500">0</div>
							<small class="opacity-75">Happy Customers</small>
						</div>
						<div class="col-4">
							<div class="stats-counter text-white" data-target="50">0</div>
							<small class="opacity-75">Cities Covered</small>
						</div>
						<div class="col-4">
							<div class="stats-counter text-white" data-target="24">0</div>
							<small class="opacity-75">Hour Service</small>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="booking-form p-4 slide-in"
						style="animation-delay: 0.8s">
						<h4 class="fw-bold text-dark mb-4 text-center">Quick Booking</h4>
						<form onsubmit="handleQuickBooking(event)">
							<div class="row g-3 mb-3">
								<div class="col-md-6">
									<label class="form-label fw-semibold text-dark">Pickup
										Location</label> <input type="text"
										class="form-control form-control-lg"
										placeholder="Enter pickup location" required>
								</div>
								<div class="col-md-6">
									<label class="form-label fw-semibold text-dark">Drop
										Location</label> <input type="text"
										class="form-control form-control-lg"
										placeholder="Enter drop location">
								</div>
							</div>
							<div class="row g-3 mb-3">
								<div class="col-md-6">
									<label class="form-label fw-semibold text-dark">Pickup
										Date</label> <input type="date" class="form-control form-control-lg"
										required>
								</div>
								<div class="col-md-6">
									<label class="form-label fw-semibold text-dark">Pickup
										Time</label> <input type="time" class="form-control form-control-lg"
										required>
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label fw-semibold text-dark">Service
									Type</label> <select class="form-select form-select-lg" required>
									<option value="">Select Service</option>
									<option value="airport">Airport Transfer</option>
									<option value="local">Local Sightseeing</option>
									<option value="outstation">Outstation Travel</option>
									<option value="selfdrive">Self Drive</option>
								</select>
							</div>
							<button type="submit"
								class="btn btn-gradient-secondary btn-lg w-100 rounded-pill">
								Get Instant Quote 💰</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Our Fleet Section -->
	<section id="vehicles" class="py-5 bg-light">
		<div class="container">
			<div class="text-center mb-5 slide-in">
				<h3 class="display-4 fw-bold text-dark mb-3">Our Premium Fleet</h3>
				<p class="lead text-muted">Choose from our wide range of
					well-maintained vehicles</p>
				<div class="section-divider"></div>
			</div>
			<div class="row g-4 mb-5" id="vehicleContainer"></div>
	</section>
	<!-- Services Section -->
	<section id="services" class="py-5 bg-white">
		<div class="container">
			<div class="text-center mb-5 slide-in">
				<h3 class="display-4 fw-bold text-dark mb-3">Our Services</h3>
				<p class="lead text-muted">Comprehensive car rental solutions
					for every need</p>
				<div class="section-divider"></div>
			</div>
			<div class="row g-4 mb-5">
				<!-- Airport Transfer -->
				<div class="col-lg-3 col-md-6">
					<div class="service-feature bg-light">
						<div class="feature-icon bg-primary bg-opacity-10 text-primary">
							<i class="bi bi-airplane"></i>
						</div>
						<h5 class="fw-bold mb-3">Airport Transfer</h5>
						<p class="text-muted mb-3">Reliable pickup and drop services
							to all major airports with flight tracking.</p>
						<ul class="list-unstyled text-start">
							<li class="mb-1">✓ 24/7 availability</li>
							<li class="mb-1">✓ Flight tracking</li>
							<li class="mb-1">✓ Meet &amp; greet service</li>
							<li class="mb-1">✓ Fixed pricing</li>
						</ul>
					</div>
				</div>
				<!-- Local Sightseeing -->
				<div class="col-lg-3 col-md-6">
					<div class="service-feature bg-light">
						<div class="feature-icon bg-success bg-opacity-10 text-success">
							<i class="bi bi-camera"></i>
						</div>
						<h5 class="fw-bold mb-3">Local Sightseeing</h5>
						<p class="text-muted mb-3">Explore city attractions with our
							guided tours and customized itineraries.</p>
						<ul class="list-unstyled text-start">
							<li class="mb-1">✓ Local guide included</li>
							<li class="mb-1">✓ Custom itineraries</li>
							<li class="mb-1">✓ Photo stops</li>
							<li class="mb-1">✓ Entry ticket assistance</li>
						</ul>
					</div>
				</div>
				<!-- Outstation Travel -->
				<div class="col-lg-3 col-md-6">
					<div class="service-feature bg-light">
						<div class="feature-icon bg-warning bg-opacity-10 text-warning">
							<i class="bi bi-map"></i>
						</div>
						<h5 class="fw-bold mb-3">Outstation Travel</h5>
						<p class="text-muted mb-3">Long distance travel with
							experienced drivers and well-maintained vehicles.</p>
						<ul class="list-unstyled text-start">
							<li class="mb-1">✓ Inter-city travel</li>
							<li class="mb-1">✓ Driver accommodation</li>
							<li class="mb-1">✓ Fuel &amp; toll included</li>
							<li class="mb-1">✓ Multiple day packages</li>
						</ul>
					</div>
				</div>
				<!-- Self Drive -->
				<div class="col-lg-3 col-md-6">
					<div class="service-feature bg-light">
						<div class="feature-icon bg-info bg-opacity-10 text-info">
							<i class="bi bi-key"></i>
						</div>
						<h5 class="fw-bold mb-3">Self Drive</h5>
						<p class="text-muted mb-3">Drive at your own pace with our
							self-drive car rental options.</p>
						<ul class="list-unstyled text-start">
							<li class="mb-1">✓ Flexible timing</li>
							<li class="mb-1">✓ Full insurance</li>
							<li class="mb-1">✓ 24/7 roadside assistance</li>
							<li class="mb-1">✓ Fuel efficient cars</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- How It Works -->
			<div class="row">
				<div class="col-12">
					<div class="text-center mb-5">
						<h4 class="fw-bold text-dark mb-3">How It Works</h4>
						<p class="text-muted">Simple steps to book your perfect ride</p>
					</div>
					<div class="row g-4">
						<div class="col-lg-3 col-md-6">
							<div class="booking-step">
								<div class="step-number">1</div>
								<h6 class="fw-bold mb-2">Choose Vehicle</h6>
								<p class="text-muted small">Select from our wide range of
									vehicles based on your needs</p>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="booking-step">
								<div class="step-number">2</div>
								<h6 class="fw-bold mb-2">Book Online</h6>
								<p class="text-muted small">Fill in your details and confirm
									your booking instantly</p>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="booking-step">
								<div class="step-number">3</div>
								<h6 class="fw-bold mb-2">Make Payment</h6>
								<p class="text-muted small">Secure payment options with
									instant confirmation</p>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="booking-step">
								<div class="step-number">4</div>
								<h6 class="fw-bold mb-2">Enjoy Ride</h6>
								<p class="text-muted small">Sit back and enjoy your
									comfortable journey</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Pricing Section -->
	<section id="pricing" class="py-5 bg-light">
		<div class="container">
			<div class="text-center mb-5 slide-in">
				<h3 class="display-4 fw-bold text-dark mb-3">Transparent
					Pricing</h3>
				<p class="lead text-muted">No hidden charges, pay only for what
					you use</p>
				<div class="section-divider"></div>
			</div>
			<div class="row g-4">
				<!-- Local Pricing -->
				<div class="col-lg-4">
					<div class="card pricing-card h-100 shadow-lg">
						<div class="card-header bg-primary text-white text-center py-4">
							<h5 class="fw-bold mb-0">Local Rides</h5>
							<p class="mb-0 opacity-75">Within city limits</p>
						</div>
						<div class="card-body p-4">
							<div class="text-center mb-4">
								<div class="display-4 fw-bold text-primary">₹12</div>
								<p class="text-muted">per kilometer</p>
							</div>
							<ul class="list-unstyled">
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Minimum
										25km or 2 hours</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Driver
										allowance included</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Fuel
										charges included</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Toll
										&amp; parking extra</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>24/7
										customer support</span></li>
							</ul>
							<button class="btn btn-primary w-100 rounded-pill py-3"
								onclick="showBookingModal('local')">Book Local Ride</button>
						</div>
					</div>
				</div>
				<!-- Outstation Pricing -->
				<div class="col-lg-4">
					<div class="card pricing-card featured h-100 shadow-lg">
						<div class="card-header text-white text-center py-4"
							style="background: linear-gradient(45deg, #ffc107, #fd7e14);">
							<h5 class="fw-bold mb-0">Outstation</h5>
							<p class="mb-0 opacity-75">Inter-city travel</p>
							<span
								class="badge bg-white text-dark position-absolute top-0 start-50 translate-middle px-3 py-2">Most
								Popular</span>
						</div>
						<div class="card-body p-4">
							<div class="text-center mb-4">
								<div class="display-4 fw-bold text-warning">₹15</div>
								<p class="text-muted">per kilometer</p>
							</div>
							<ul class="list-unstyled">
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Minimum
										250km per day</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Driver
										allowance ₹500/day</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Fuel
										&amp; toll included</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Driver
										accommodation</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Comprehensive
										insurance</span></li>
							</ul>
							<button
								class="btn btn-warning w-100 rounded-pill py-3 text-dark fw-bold"
								onclick="showBookingModal('outstation')">Book
								Outstation</button>
						</div>
					</div>
				</div>
				<!-- Airport Pricing -->
				<div class="col-lg-4">
					<div class="card pricing-card h-100 shadow-lg">
						<div class="card-header bg-success text-white text-center py-4">
							<h5 class="fw-bold mb-0">Airport Transfer</h5>
							<p class="mb-0 opacity-75">Fixed rate transfers</p>
						</div>
						<div class="card-body p-4">
							<div class="text-center mb-4">
								<div class="display-4 fw-bold text-success">₹899</div>
								<p class="text-muted">starting from</p>
							</div>
							<ul class="list-unstyled">
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Fixed
										pricing (no surge)</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Flight
										tracking included</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Meet
										&amp; greet service</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>Free
										waiting (45 minutes)</span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="bi bi-check-circle text-success me-3"></i> <span>24/7
										availability</span></li>
							</ul>
							<button class="btn btn-success w-100 rounded-pill py-3"
								onclick="showBookingModal('airport')">Book Airport
								Transfer</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section -->
	<section id="about" class="py-5 bg-white">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="slide-in">
						<h3 class="display-4 fw-bold text-dark mb-4">Why Choose OOO
							Car Rentals?</h3>
						<p class="lead text-muted mb-4">With over 5 years of
							experience in the car rental industry, we've built our reputation
							on reliability, comfort, and exceptional customer service.</p>
						<div class="row g-4 mb-4">
							<div class="col-md-6">
								<div class="d-flex align-items-start">
									<div
										class="feature-icon bg-primary bg-opacity-10 text-primary me-3"
										style="width: 50px; height: 50px; font-size: 1.5rem;">
										<i class="bi bi-shield-check"></i>
									</div>
									<div>
										<h6 class="fw-bold mb-2">Verified Drivers</h6>
										<p class="text-muted small mb-0">All our drivers are
											background verified and trained professionals</p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="d-flex align-items-start">
									<div
										class="feature-icon bg-success bg-opacity-10 text-success me-3"
										style="width: 50px; height: 50px; font-size: 1.5rem;">
										<i class="bi bi-tools"></i>
									</div>
									<div>
										<h6 class="fw-bold mb-2">Well Maintained</h6>
										<p class="text-muted small mb-0">Regular maintenance and
											sanitization of all vehicles</p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="d-flex align-items-start">
									<div
										class="feature-icon bg-warning bg-opacity-10 text-warning me-3"
										style="width: 50px; height: 50px; font-size: 1.5rem;">
										<i class="bi bi-clock"></i>
									</div>
									<div>
										<h6 class="fw-bold mb-2">24/7 Support</h6>
										<p class="text-muted small mb-0">Round the clock customer
											support and roadside assistance</p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="d-flex align-items-start">
									<div class="feature-icon bg-info bg-opacity-10 text-info me-3"
										style="width: 50px; height: 50px; font-size: 1.5rem;">
										<i class="bi bi-credit-card"></i>
									</div>
									<div>
										<h6 class="fw-bold mb-2">Flexible Payment</h6>
										<p class="text-muted small mb-0">Multiple payment options
											with transparent pricing</p>
									</div>
								</div>
							</div>
						</div>
						<div class="d-flex gap-3">
							<button class="btn btn-gradient-primary rounded-pill px-4"
								onclick="showBookingModal()">Book Now</button>
							<button class="btn btn-outline-primary rounded-pill px-4"
								onclick="scrollToSection('contact')">Contact Us</button>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="slide-in" style="animation-delay: 0.3s">
						<div class="row g-4">
							<div class="col-6">
								<div class="card border-0 shadow-lg text-center p-4">
									<div class="stats-counter" data-target="500">0</div>
									<p class="text-muted mb-0">Happy Customers</p>
								</div>
							</div>
							<div class="col-6">
								<div class="card border-0 shadow-lg text-center p-4">
									<div class="stats-counter" data-target="50">0</div>
									<p class="text-muted mb-0">Cities Covered</p>
								</div>
							</div>
							<div class="col-6">
								<div class="card border-0 shadow-lg text-center p-4">
									<div class="stats-counter" data-target="100">0</div>
									<p class="text-muted mb-0">Vehicles</p>
								</div>
							</div>
							<div class="col-6">
								<div class="card border-0 shadow-lg text-center p-4">
									<div class="stats-counter" data-target="98">0</div>
									<p class="text-muted mb-0">% Satisfaction</p>
								</div>
							</div>
						</div>
						<!-- Testimonials -->
						<div class="mt-5">
							<div class="card testimonial-card shadow-lg">
								<div class="card-body p-4">
									<div class="d-flex align-items-center mb-3">
										<div
											class="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center me-3"
											style="width: 50px; height: 50px;">
											<span class="fw-bold">RS</span>
										</div>
										<div>
											<h6 class="fw-bold mb-0">Rajesh Sharma</h6>
											<small class="text-muted">Business Traveler</small>
										</div>
									</div>
									<div class="text-warning mb-2">
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
									</div>
									<p class="text-muted mb-0 fst-italic">"Excellent service!
										The driver was punctual, the car was clean, and the pricing
										was transparent. Highly recommended for business travel."</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section -->
	<section id="contact" class="py-5 bg-light">
		<div class="container">
			<div class="text-center mb-5 slide-in">
				<h3 class="display-4 fw-bold text-dark mb-3">Get In Touch</h3>
				<p class="lead text-muted">Ready to book your ride? Contact us
					for instant quotes and bookings</p>
				<div class="section-divider"></div>
			</div>
			<div class="row g-5">
				<div class="col-lg-8">
					<div class="card border-0 shadow-lg">
						<div class="card-body p-5">
							<h5 class="fw-bold mb-4">Send us a Message</h5>
							<form onsubmit="handleContactForm(event)">
								<div class="row g-3 mb-3">
									<div class="col-md-6">
										<label class="form-label fw-semibold">Full Name</label> <input
											type="text" class="form-control form-control-lg" required>
									</div>
									<div class="col-md-6">
										<label class="form-label fw-semibold">Phone Number</label> <input
											type="tel" class="form-control form-control-lg" required>
									</div>
								</div>
								<div class="row g-3 mb-3">
									<div class="col-md-6">
										<label class="form-label fw-semibold">Email Address</label> <input
											type="email" class="form-control form-control-lg" required>
									</div>
									<div class="col-md-6">
										<label class="form-label fw-semibold">Service Required</label>
										<select class="form-select form-select-lg">
											<option>Airport Transfer</option>
											<option>Local Sightseeing</option>
											<option>Outstation Travel</option>
											<option>Self Drive</option>
											<option>Corporate Booking</option>
										</select>
									</div>
								</div>
								<div class="mb-4">
									<label class="form-label fw-semibold">Message</label>
									<textarea class="form-control form-control-lg" rows="4"
										placeholder="Tell us about your requirements..."></textarea>
								</div>
								<button type="submit"
									class="btn btn-gradient-primary btn-lg rounded-pill px-5">
									Send Message 📧</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card border-0 shadow-lg h-100">
						<div class="card-body p-4">
							<h5 class="fw-bold mb-4">Contact Information</h5>
							<div class="d-flex align-items-center mb-4">
								<div
									class="feature-icon bg-primary bg-opacity-10 text-primary me-3"
									style="width: 50px; height: 50px; font-size: 1.5rem;">
									<i class="bi bi-telephone"></i>
								</div>
								<div>
									<h6 class="fw-semibold mb-1">Call Us</h6>
									<p class="text-muted mb-0">+91-800-CAR-RENT</p>
									<small class="text-muted">24/7 Booking Hotline</small>
								</div>
							</div>
							<div class="d-flex align-items-center mb-4">
								<div
									class="feature-icon bg-success bg-opacity-10 text-success me-3"
									style="width: 50px; height: 50px; font-size: 1.5rem;">
									<i class="bi bi-whatsapp"></i>
								</div>
								<div>
									<h6 class="fw-semibold mb-1">WhatsApp</h6>
									<p class="text-muted mb-0">+91-98765-43210</p>
									<small class="text-muted">Instant Quotes</small>
								</div>
							</div>
							<div class="d-flex align-items-center mb-4">
								<div
									class="feature-icon bg-warning bg-opacity-10 text-warning me-3"
									style="width: 50px; height: 50px; font-size: 1.5rem;">
									<i class="bi bi-envelope"></i>
								</div>
								<div>
									<h6 class="fw-semibold mb-1">Email Us</h6>
									<p class="text-muted mb-0">bookings@ooocarrentals.com</p>
									<small class="text-muted">Quick Response</small>
								</div>
							</div>
							<div class="d-flex align-items-center mb-4">
								<div class="feature-icon bg-info bg-opacity-10 text-info me-3"
									style="width: 50px; height: 50px; font-size: 1.5rem;">
									<i class="bi bi-geo-alt"></i>
								</div>
								<div>
									<h6 class="fw-semibold mb-1">Office Address</h6>
									<p class="text-muted mb-0">123 Business District, Mumbai,
										Maharashtra 400001</p>
								</div>
							</div>
							<hr class="my-4">
							<h6 class="fw-semibold mb-3">Operating Hours</h6>
							<div class="d-flex justify-content-between mb-2">
								<span class="text-muted">Monday - Friday</span> <span
									class="fw-semibold">24/7</span>
							</div>
							<div class="d-flex justify-content-between mb-2">
								<span class="text-muted">Saturday - Sunday</span> <span
									class="fw-semibold">24/7</span>
							</div>
							<small class="text-success">✓ Always Available for
								Bookings</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<footer class="gradient-bg text-white py-5">
		<div class="container">
			<div class="row g-4">
				<div class="col-lg-4">
					<div class="d-flex align-items-center mb-4">
						<div
							class="rounded-circle d-flex align-items-center justify-content-center pulse-slow me-3"
							style="width: 48px; height: 48px; background: linear-gradient(45deg, #ffc107, #fd7e14);">
							<span class="text-white fw-bold fs-4">🚗</span>
						</div>
						<div>
							<h4 class="h3 fw-bold mb-0">OOO Car Rentals</h4>
							<small class="opacity-75">Premium Vehicle Services</small>
						</div>
					</div>
					<p class="opacity-75 mb-4">Your trusted partner for all car
						rental needs. From airport transfers to weekend getaways, we
						provide reliable, comfortable, and affordable transportation
						solutions.</p>
					<div class="d-flex gap-3">
						<div
							class="rounded-circle d-flex align-items-center justify-content-center"
							style="width: 40px; height: 40px; background: rgba(255, 255, 255, 0.2); cursor: pointer;">
							<i class="bi bi-facebook"></i>
						</div>
						<div
							class="rounded-circle d-flex align-items-center justify-content-center"
							style="width: 40px; height: 40px; background: rgba(255, 255, 255, 0.2); cursor: pointer;">
							<i class="bi bi-instagram"></i>
						</div>
						<div
							class="rounded-circle d-flex align-items-center justify-content-center"
							style="width: 40px; height: 40px; background: rgba(255, 255, 255, 0.2); cursor: pointer;">
							<i class="bi bi-twitter"></i>
						</div>
						<div
							class="rounded-circle d-flex align-items-center justify-content-center"
							style="width: 40px; height: 40px; background: rgba(255, 255, 255, 0.2); cursor: pointer;">
							<i class="bi bi-whatsapp"></i>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-6">
					<h5 class="fw-semibold mb-3">Services</h5>
					<ul class="list-unstyled opacity-75">
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Airport Transfer</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Local Sightseeing</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Outstation Travel</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Self Drive</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Corporate Booking</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6">
					<h5 class="fw-semibold mb-3">Vehicle Types</h5>
					<ul class="list-unstyled opacity-75">
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Hatchback</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Sedan</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">SUV</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Luxury Cars</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Tempo Traveller</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6">
					<h5 class="fw-semibold mb-3">Quick Links</h5>
					<ul class="list-unstyled opacity-75">
						<li class="mb-2"><a href="#about"
							class="text-white text-decoration-none">About Us</a></li>
						<li class="mb-2"><a href="#pricing"
							class="text-white text-decoration-none">Pricing</a></li>
						<li class="mb-2"><a href="#contact"
							class="text-white text-decoration-none">Contact</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Terms &amp;
								Conditions</a></li>
						<li class="mb-2"><a href="#"
							class="text-white text-decoration-none">Privacy Policy</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6">
					<h5 class="fw-semibold mb-3">Support</h5>
					<ul class="list-unstyled opacity-75">
						<li class="mb-2">📞 +91-800-CAR-RENT</li>
						<li class="mb-2">📱 +91-98765-43210</li>
						<li class="mb-2">✉️ support@ooocarrentals.com</li>
						<li class="mb-2">🕒 24/7 Available</li>
					</ul>
				</div>
			</div>
			<hr class="opacity-25 my-4">
			<div class="row align-items-center">
				<div class="col-md-6">
					<p class="opacity-75 mb-0">© 2024 OOO Car Rentals. All rights
						reserved.</p>
				</div>
				<div class="col-md-6 text-md-end">
					<p class="opacity-75 mb-0">Made with ❤️ for comfortable
						journeys</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Quick Booking Button -->
	<div class="quick-booking">
		<button class="btn btn-gradient-primary pulse-slow"
			onclick="showBookingModal()" title="Quick Booking">
			<i class="bi bi-plus-lg"></i>
		</button>
	</div>
	<!-- Booking Modal -->
	<div class="modal fade" id="bookingModal" tabindex="-1"
		aria-labelledby="bookingModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content border-0 shadow-lg">
				<div class="modal-header border-0 pb-0"
					style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
					<h5 class="modal-title fw-bold text-white" id="bookingModalLabel">
						<i class="bi bi-car-front me-2"></i>Book Your Ride
					</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-5">
					<form onsubmit="handleBooking(event)">
						<div class="row g-3 mb-3">
							<div class="col-md-6">
								<label class="form-label fw-semibold">Pickup Location</label> <input
									type="text" class="form-control form-control-lg"
									placeholder="Enter pickup location" required>
							</div>
							<div class="col-md-6">
								<label class="form-label fw-semibold">Drop Location</label> <input
									type="text" class="form-control form-control-lg"
									placeholder="Enter drop location">
							</div>
						</div>
						<div class="row g-3 mb-3">
							<div class="col-md-6">
								<label class="form-label fw-semibold">Pickup Date</label> <input
									type="date" class="form-control form-control-lg" required>
							</div>
							<div class="col-md-6">
								<label class="form-label fw-semibold">Pickup Time</label> <input
									type="time" class="form-control form-control-lg" required>
							</div>
						</div>
						<div class="row g-3 mb-3">
							<div class="col-md-6">
								<label class="form-label fw-semibold">Service Type</label> <select
									class="form-select form-select-lg" required>
									<option value="">Select Service</option>
									<option value="airport">Airport Transfer</option>
									<option value="local">Local Sightseeing</option>
									<option value="outstation">Outstation Travel</option>
									<option value="selfdrive">Self Drive</option>
								</select>
							</div>
							<div class="col-md-6">
								<label class="form-label fw-semibold">Vehicle Type</label> <select
									class="form-select form-select-lg" required>
									<option value="">Select Vehicle</option>
									<option value="hatchback">Hatchback (₹12/km)</option>
									<option value="sedan">Sedan (₹15/km)</option>
									<option value="suv">SUV (₹18/km)</option>
									<option value="luxury">Luxury (₹35/km)</option>
								</select>
							</div>
						</div>
						<div class="row g-3 mb-4">
							<div class="col-md-6">
								<label class="form-label fw-semibold">Full Name</label> <input
									type="text" class="form-control form-control-lg" required>
							</div>
							<div class="col-md-6">
								<label class="form-label fw-semibold">Phone Number</label> <input
									type="tel" class="form-control form-control-lg" required>
							</div>
						</div>
						<div class="mb-4">
							<label class="form-label fw-semibold">Email Address</label> <input
								type="email" class="form-control form-control-lg" required>
						</div>
						<div class="text-center">
							<button type="submit"
								class="btn btn-gradient-primary btn-lg px-5 rounded-pill">
								Confirm Booking 🚗</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>

function renderVehicles(vehicles) {

    const container = document.getElementById("vehicleContainer");

    container.innerHTML = vehicles.map(v => `

        <div class="col-lg-4 col-md-6">
            <div class="card vehicle-card card-hover h-100 shadow-lg">

                <div class="vehicle-image"
                    style="background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.1)), url('\${v.image}');">
                    <div class="vehicle-badge">
                        <span class="badge \${v.badge.cssClass} px-3 py-2 rounded-pill">\${v.badge.label}</span>
                    </div>
                </div>

                <div class="card-body p-4">

                    <div class="text-center mb-4">
                        <h4 class="card-title fw-bold text-primary mb-1">\${v.name}</h4>
                        <p class="text-muted">\${v.tagline}</p>
                    </div>

                    <div class="vehicle-specs mb-4">
                        <div class="row g-2 text-center">

                            \${v.specs.map(s => `
                                <div class="col-6">
                                    <div class="d-flex align-items-center justify-content-center">
                                        <i class="bi \${s.icon} me-2 text-primary"></i>
                                        <span class="fw-semibold">\${s.text}</span>
                                    </div>
                                </div>
                            `).join('')}

                        </div>
                    </div>

                    <ul class="list-unstyled mb-4">

                        \${v.features.map(f => `
                            <li class="d-flex align-items-center mb-2">
                                <i class="bi bi-check-circle text-success me-2"></i>
                                <span>\${f}</span>
                            </li>
                        `).join('')}

                    </ul>

                    <div class="text-center">
                        <div class="price-highlight display-6 fw-bold mb-2">\${v.price}</div>
                        <p class="text-muted small mb-3">Starting from</p>

                        <div class="d-flex gap-2">
                            <button class="btn btn-outline-primary flex-fill py-2 rounded-pill fw-semibold"
                                onclick="showVehicleDetails('\${v.key}')">View Details</button>

                            <button class="btn btn-primary flex-fill py-2 rounded-pill fw-semibold"
                                onclick="bookVehicle('\${v.name}')">Enquire Now</button>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    `).join("");

}

$(document).ready(async function(){
    var cardDataapi = await getDataByPayloadWithParentUrl('POST', true, true, '${pageContext.request.contextPath}/api/get-all-vehicle', "");
    const vehicles = convertDbToCardList(cardDataapi);
	renderVehicles(vehicles);
})

function convertDbToCardList(dbList) {
    return dbList.vehicles.map(item => {
        return {
            name: item.name,
            tagline: item.tagline,
            image: item.image || "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&w=800&q=80",
            badge: {
                label: item.badge_label,
                cssClass: item.badge_class
            },
            price: `₹\${item.price_per_km}/km`,
            specs: [
                { icon: "bi-people", text: `\${item.max_pax} Seats` },
                { icon: "bi-bag", text: `\${item.max_no_of_bags} Bags` },
                { icon: "bi-gear", text: item.gear_type },
                { icon: "bi-fuel-pump", text: item.fuel_type }
            ],
            features: item.features.split("#").map(f => f.trim())
        };
    });
}


</script>
</html>
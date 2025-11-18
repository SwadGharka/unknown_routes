<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<footer class="ooo-footer">
  <div class="ooo-footer__overlay"></div>

  <div class="ooo-footer__container">
    <div class="ooo-footer__top row">
      <div class="col-lg-6">
        <div class="brand d-flex align-items-center mb-3">
          <div class="brand__icon">🏖️</div>
          <div>
            <h4 class="brand__title">OOO TRIPS</h4>
            <small class="brand__sub">Out Of Office Trips</small>
          </div>
        </div>

        <p class="brand__desc">
          Your perfect weekend getaway is one click away. Disconnect to reconnect with what matters most.
        </p>

        <div class="social d-flex gap-2">
          <a class="social__btn" href="#"><i class="bi bi-facebook"></i></a>
          <a class="social__btn" href="#"><i class="bi bi-instagram"></i></a>
          <a class="social__btn" href="#"><i class="bi bi-twitter"></i></a>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mt-4 mt-lg-0">
        <h5 class="ooo-footer__heading">Quick Links</h5>
        <ul class="ooo-footer__list">
          <li><a href="#" onclick="toggleSection('packages')">Packages</a></li>
          <li><a href="#" onclick="toggleSection('stats')">Why Choose Us</a></li>
          <li><a href="#" onclick="toggleSection('testimonials')">Reviews</a></li>
          <li><a href="#" onclick="toggleSection('contact')">Contact</a></li>
        </ul>
      </div>

      <div class="col-lg-3 col-md-6 mt-4 mt-lg-0">
        <h5 class="ooo-footer__heading">Popular Destinations</h5>
        <ul class="ooo-footer__list">
          <li>Manali, Himachal Pradesh</li>
          <li>Goa Beaches</li>
          <li>Rishikesh, Uttarakhand</li>
          <li>Jaipur, Rajasthan</li>
          <li>Mumbai, Maharashtra</li>
          <li>Ladakh, J&K</li>
        </ul>
      </div>
    </div>

    <hr class="ooo-footer__divider">

    <div class="ooo-footer__bottom text-center">
      <p class="mb-1">© 2024 OOO TRIPS. All rights reserved. | Disconnect to Reconnect ™</p>
      <p class="small mb-0">Made with ❤️ for corporate professionals who deserve a break</p>
    </div>
  </div>
</footer>

<style>
/* THEME UPDATED FOOTER */
.ooo-footer {
  position: relative;
  color: #fff;
  padding: 48px 0;
  overflow: hidden;
  font-family: "Poppins", system-ui;
  background: linear-gradient(45deg, rgb(79 20 112), rgb(74 6 98)); /* UPDATED THEME */
  border-top: 1px solid rgba(255,255,255,0.06);
}

.ooo-footer__overlay {
  position: absolute;
  inset: 0;
  background: rgba(0,0,0,0.25);
}

.ooo-footer__container {
  position: relative;
  z-index: 2;
  max-width: 1180px;
  margin: 0 auto;
  padding: 0 20px;
}

/* brand */
.brand__icon {
  width: 56px;
  height: 56px;
  border-radius: 50%;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  margin-right: 12px;
  background: linear-gradient(45deg, #ffb300, #ff6f00);
  font-size: 22px;
  box-shadow: 0 6px 18px rgba(0,0,0,0.25);
}

.brand__title {
  margin: 0;
  font-size: 20px;
  font-weight: 700;
}

.brand__sub {
  color: rgba(255,255,255,0.85);
}

/* description */
.brand__desc {
  color: rgba(255,255,255,0.90);
  max-width: 420px;
  margin-top: 14px;
  margin-bottom: 18px;
  line-height: 1.5;
}

/* social buttons */
.social__btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: rgba(255,255,255,0.12);
  color: #fff;
  font-size: 18px;
  transition: 0.18s;
}
.social__btn:hover {
  transform: translateY(-3px);
  background: rgba(255,255,255,0.22);
}

/* headings & lists */
.ooo-footer__heading {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 12px;
}

.ooo-footer__list {
  list-style: none;
  padding: 0;
}
.ooo-footer__list li {
  margin-bottom: 10px;
  font-size: 14px;
  color: rgba(255,255,255,0.85);
}
.ooo-footer__list a {
  color: rgba(255,255,255,0.95);
  text-decoration: none;
}
.ooo-footer__list a:hover {
  text-decoration: underline;
}

/* divider */
.ooo-footer__divider {
  border-top: 1px solid rgba(255,255,255,0.15);
  margin: 30px 0;
}

/* bottom */
.ooo-footer__bottom {
  color: rgba(255,255,255,0.85);
}

/* responsive */
@media (max-width: 575px) {
  .ooo-footer { padding: 32px 0; }
  .brand__icon { width: 44px; height: 44px; }
}
</style>

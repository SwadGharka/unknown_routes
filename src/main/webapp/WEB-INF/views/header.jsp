<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-custom" id="navbar"
  style="
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    transition: all 0.3s ease-in-out;
    width: 100%;
    z-index: 1000;
    height: 9%;
  ">

  <div class="container-fluid" style="padding: 10px 20px;">

    <!-- Brand -->
    <a class="navbar-brand d-flex align-items-center" href="#" style="color: #fff; text-decoration: none;">
      <div style="
        background: linear-gradient(45deg, #ffc107, #fd7e14);
        width: 48px;
        height: 48px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 12px;
        animation: pulse 3s infinite;">
        <span style="color: #fff; font-weight: bold; font-size: 24px;">🏖️</span>
      </div>
      <div>
        <h1 style="margin: 0; font-size: 20px; font-weight: 700; color: #fff; text-shadow: 2px 2px 6px rgba(0,0,0,0.4);">
          OOO TRIPS
        </h1>
        <small style="color: #ddd; font-size: 13px;">Out Of Office Trips</small>
      </div>
    </a>

    <!-- Toggle Button -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"
      style="border: none; outline: none;">
      <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
    </button>

    <!-- Menu -->
    <div class="navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav ms-auto align-items-lg-center" style="list-style: none; margin: 0; padding: 0;">
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold text-white" href="home">Home</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold text-white" href="car-rental">Rent Cars</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold text-white" href="#">Why Us</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold text-white" href="#">Reviews</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold text-white" href="#">Contact</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold text-white" href="add-category">Add Category</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold text-white" href="add-package">Add Package</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<style>
  @keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.05); }
  }

  .navbar-custom {
    padding-top: 12px;
    padding-bottom: 12px;
  }

  /* ✅ Mobile menu fix */
  @media (max-width: 991px) {
    #navbarNav {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 10px;
      padding: 15px 0;
      text-align: center;
      margin-top: 10px;
    }

    #navbarNav .nav-item {
      margin: 10px 0;
    }

    #navbarNav .nav-link {
      color: white !important;
      font-size: 16px;
    }
  }
</style>

<!-- Bootstrap JS dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="navbar"
  style="
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    transition: all 0.3s ease-in-out;
    width: 100%;
    height: 10%;
    z-index: 1000;
  ">
  
  <div class="container" style="display: flex; align-items: center; justify-content: space-between; padding: 10px 20px;">

    <a class="navbar-brand d-flex align-items-center" href="#"
      style="display: flex; align-items: center; text-decoration: none; color: #fff;">
      
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
        <h1 style="
          margin: 0;
          font-size: 20px;
          font-weight: 700;
          color: #fff;
          text-shadow: 2px 2px 6px rgba(0,0,0,0.4);
        ">OOO TRIPS</h1>
        <small style="color: #ddd; font-size: 13px;">Out Of Office Trips</small>
      </div>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      style="border: none; outline: none;">
      <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto" style="display: flex; list-style: none; margin: 0; padding: 0;">
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold" href="dashboard" style="color: white; text-decoration: none; font-weight: 600;">Packages</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold" href="#" onclick="toggleSection('stats')" style="color: white; text-decoration: none; font-weight: 600;">Why Us</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold" href="#" onclick="toggleSection('testimonials')" style="color: white; text-decoration: none; font-weight: 600;">Reviews</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold" href="#" onclick="toggleSection('contact')" style="color: white; text-decoration: none; font-weight: 600;">Contact</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold" href="add-category" style="color: white; text-decoration: none; font-weight: 600;">Add Category</a>
        </li>
        <li class="nav-item" style="margin-left: 20px;">
          <a class="nav-link fw-semibold" href="add-package" style="color: white; text-decoration: none; font-weight: 600;">Add Package</a>
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
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    }
    .navbar-scrolled {
        background: rgba(0, 0, 0, 0.8) !important;
    }
    .navbar-custom {
        padding-top: 12px;
        padding-bottom: 12px;
    }
</style>

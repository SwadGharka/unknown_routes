<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-custom" id="navbar">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center fade-in" href="#">
                <div class="bg-gradient rounded-circle d-flex align-items-center justify-content-center pulse-slow me-3" style="width: 48px; height: 48px; background: linear-gradient(45deg, #ffc107, #fd7e14);">
                    <span class="text-white fw-bold fs-4">🏖️</span>
                </div>
                <div>
                    <h1 class="h4 mb-0 text-shadow">OOO TRIPS</h1>
                    <small class="opacity-75">Out Of Office Trips</small>
                </div>
            </a>
           
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
           
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="#" onclick="toggleSection('packages')">Packages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="#" onclick="toggleSection('stats')">Why Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="#" onclick="toggleSection('testimonials')">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="#" onclick="toggleSection('contact')">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
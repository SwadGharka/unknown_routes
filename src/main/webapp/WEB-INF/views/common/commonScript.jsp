<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- ✅ jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
</head>
<style>
/* Fullscreen overlay – blocks everything */
.ooo-loader-overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.55);
    backdrop-filter: blur(10px);
    display: none;
    align-items: center;
    justify-content: center;
    z-index: 99999;
    animation: fadeIn .3s ease forwards;
    pointer-events: all; /* block clicks */
}

/* Loader Card */
.ooo-loader-box {
    background: rgba(255,255,255,0.18);
    border-radius: 22px;
    padding: 35px 45px;
    border: 1px solid rgba(255,255,255,0.25);
    text-align: center;
    animation: popIn .35s ease;
    backdrop-filter: blur(15px);
    box-shadow: 0px 10px 35px rgba(0,0,0,0.25);
}

/* Circle Loader */
.ooo-loader-circle {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    border: 6px solid rgba(255,255,255,0.25);
    border-top-color: rgba(13,110,253,0.9);
    border-right-color: rgba(111,66,193,0.9);
    animation: spin 1s linear infinite;
    margin: auto;
}

/* Text */
.ooo-loader-text {
    margin-top: 15px;
    font-size: 18px;
    color: white;
    font-weight: 600;
    letter-spacing: 0.7px;
}

/* Disable scroll when loader is open */
body.no-scroll {
    overflow: hidden;
}

/* Animations */
@keyframes spin {
    to { transform: rotate(360deg); }
}

@keyframes popIn {
    from { transform: scale(0.6); opacity: 0; }
    to   { transform: scale(1); opacity: 1; }
}

@keyframes fadeIn {
    from { opacity: 0; }
    to   { opacity: 1; }
}


</style>
<head>
    <div id="loader">
    </div>
</head>
<script>
    const BASE_URL = window.location.origin;
    const CONTEXT_PATH = "${pageContext.request.contextPath}/";
</script>
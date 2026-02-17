<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>404 - Page Not Found | OOO Trips</title>
    <!-- <link rel="stylesheet" href="css/404.css"> -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(45deg, rgba(13,110,253,0.2), rgba(111,66,193,0.2));
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        /* Floating background shapes */
        .background-shapes::before,
        .background-shapes::after {
            content: "";
            position: absolute;
            width: 400px;
            height: 400px;
            background: rgba(255,255,255,0.15);
            border-radius: 50%;
            filter: blur(120px);
            animation: float 8s infinite ease-in-out;
        }

        .background-shapes::after {
            top: 60%;
            left: 70%;
            animation-delay: 3s;
        }

        @keyframes float {
            0%,100% { transform: translateY(0); }
            50% { transform: translateY(-30px); }
        }

        .error-container {
            text-align: center;
            padding: 20px;
        }

        .glass-card {
            background: rgba(255,255,255,0.25);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 50px 40px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .error-code {
            font-size: 100px;
            font-weight: bold;
            color: #0d6efd;
        }

        .glass-card h2 {
            margin-bottom: 15px;
        }

        .glass-card p {
            margin-bottom: 30px;
            color: #444;
            font-size: 15px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .btn-primary,
        .btn-outline {
            padding: 10px 20px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn-primary {
            background: #0d6efd;
            color: white;
        }

        .btn-primary:hover {
            background: #084298;
        }

        .btn-outline {
            border: 2px solid #0d6efd;
            color: #0d6efd;
        }

        .btn-outline:hover {
            background: #0d6efd;
            color: white;
        }

    </style>
</head>
<body>

<div class="background-shapes"></div>

<div class="error-container">
    <div class="glass-card">
        <h1 class="error-code">404</h1>
        <h2>Oops! Page Not Found</h2>
        <p>
            Lagta hai aap galat raste par aa gaye ho.  
            Ye page exist nahi karta ya shift ho chuka hai.
        </p>

        <div class="button-group">
            <a href="/dashboard/home" class="btn-primary">🏠 Go to Home</a>
            <a href="/dashboard/home" class="btn-outline">🌍 Explore Trips</a>
        </div>
    </div>
</div>

</body>
</html>

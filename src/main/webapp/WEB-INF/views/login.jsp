<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${title}</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/login.js"></script>
</head>
<body class="login-bg">

  <div class="glass-card">
    <h2 class="card-title">Welcome Back</h2>
    <p class="card-sub">Log in to your account</p>

    <div class="input-group">
      <input type="text" id="userName" required />
      <label>User Name</label>
    </div>

    <div class="input-group password-group">
        <input type="password" id="password" required />
        <label>Password</label>

        <!-- Stylish Eye Button -->
        <span class="eye-btn" onclick="togglePassword()">
            🐵
        </span>
    </div>

    <button class="btn-login" onclick="doLogin()">Login</button>
  </div>

</body>
<script>
  const BASE_URL = window.location.origin;
  const CONTEXT_PATH = "${pageContext.request.contextPath}/";
  $(document).keydown(function (e) {
      if (e.key === "Enter") {
          $(".btn-login").click();
      }
  });
</script>
</html>

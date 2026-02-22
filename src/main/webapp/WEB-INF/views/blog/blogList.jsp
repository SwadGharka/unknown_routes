<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${title eq "" || title eq null ? "OOO Trips Blogs" : title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <%@ include file="../common/commonScript.jsp" %> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blogList.css">
    <script src="${pageContext.request.contextPath}/static/js/blogList.js"></script>
</head>
<body>

<%@ include file="../header.jsp"%>
    <div class="admin-blog-wrapper">
        <h2>📝 Blog List</h2>
        <div class="admin-blog-table">
            <div class="table-header">
                <div>Title</div>
                <div>Slug</div>
                <div>Status</div>
                <div style="text-align: center;">Actions</div>
            </div>
            <div id="blogList">
            </div>
        </div>
    </div>

</body>
</html>

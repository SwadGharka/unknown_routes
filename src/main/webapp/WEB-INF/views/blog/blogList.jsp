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
<%-- <div class="container blog-container">
    <h2 class="section-title">Travel Blogs</h2>

    <div class="row" id="blogList">
        <!-- Static demo card 1 -->
        <div class="col-md-4 mb-4">
            <div class="blog-card">
                <img src="https://images.unsplash.com/photo-1526772662000-3f88f10405ff" class="blog-img">
                <h4>Discover the Beauty of Kashmir</h4>
                <p>Kashmir is called heaven on earth with its snow mountains, lakes and peaceful valleys...</p>
                <button class="readBtn" data-id="1">Read More</button>
            </div>
        </div>

        <!-- Static demo card 2 -->
        <div class="col-md-4 mb-4">
            <div class="blog-card">
                <img src="https://images.unsplash.com/photo-1505764706515-aa95265c5abc" class="blog-img">
                <h4>Goa Beaches and Nightlife</h4>
                <p>If you love beaches, seafood and nightlife, Goa is your perfect holiday destination...</p>
                <button class="readBtn" data-id="2">Read More</button>
            </div>
        </div>

        <!-- Static demo card 3 -->
        <div class="col-md-4 mb-4">
            <div class="blog-card">
                <img src="https://images.unsplash.com/photo-1502920514313-52581002a659" class="blog-img">
                <h4>Explore the Culture of Rajasthan</h4>
                <p>Known for forts, palaces, and royal hospitality, Rajasthan offers a unique travel experience...</p>
                <button class="readBtn" data-id="3">Read More</button>
            </div>
        </div>
    </div>
</div> --%>

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

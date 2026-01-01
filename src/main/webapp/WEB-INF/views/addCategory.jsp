<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- FontAwesome -->
        <!-- <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script> -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/addCategory.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
            <div class="container-flex">
                <div class="page-wrapper">
                    <div class="form-container">
                        <h2>🗂️ Add New Category</h2>
                        <form id="categoryForm" method="post">
                            <label>Name:</label>
                            <input type="text" id="name" name="name" placeholder="Enter category name" required>
                            <label>Description:</label>
                            <textarea id="description" name="description"
                                placeholder="Write a short description"></textarea>
                            <label>Status:</label>
                            <select id="status" name="status">
                                <option value="true">Active</option>
                                <option value="false">Inactive</option>
                            </select>
                            <label>Select Icon</label>
                            <select id="categoryIcon">
                                <option value="🍽️">🍽️ Food</option>
                                <option value="🚌">🚌 Travel</option>
                                <option value="🏨">🏨 Hotel</option>
                                <option value="⛰️">⛰️ Adventure</option>
                                <option value="👤">👤 User</option>
                            </select>
                            <label>Category Gradient</label>
                            <select id="backgroundColor">
                                <option style="color: #0d6efd;" value="linear-gradient(135deg, #0d6efd, #6f42c1)">Blue</option>
                                <option style="color: #6f42c1;" value="linear-gradient(135deg, #6f42c1, #e83e8c)">Pink</option>
                                <option style="color: #198754;" value="linear-gradient(135deg, #198754, #20c997)">Green</option>
                                <option style="color: #fd7e14;" value="linear-gradient(135deg, #fd7e14, #dc3545)">Orange</option>
                            </select>

                            <button type="button" class="save-category" onclick="saveCategory();">💾 Save
                                Category</button>
                        </form>
                    </div>

                    <div class="preview-container">
                        <h3>Category Preview</h3>

                        <div class="preview-wrapper">
                            <div class="category-preview-card">
                                <div class="icon">📦</div>
                                <h4 class="title">Category Name</h4>
                                <p class="desc">Short description here</p>

                                <span class="badge">Default Badge</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <script>
        $("#name").on("input", function () {
            $(".category-preview-card .title").text($(this).val() || "Category Name");
        });

        $("#description").on("input", function () {
            $(".category-preview-card .desc").text($(this).val() || "Short description here");
        });

        $("#categoryIcon").on("change", function () {
            $(".category-preview-card .icon").text($(this).val());
        });

        $("#backgroundColor").on("change", function () {
            $(".category-preview-card").css("background", $(this).val());
        });

        async function saveCategory() {
            let payload = getCategory();
            let response = await getDataByPayloadWithParentUrl("post", false, true, "${BASE_URL}${CONTEXT_PATH}api/save-category", payload);

            if (response.status == '1') {
                showMessage("success", response.message, true);
                setTimeout(() => window.location.reload(), 3000);
            } else {
                showMessage("error", response.message);
            }
        }

        function getCategory() {
            return {
                name: $("#name").val().trim(),
                description: $("#description").val().trim(),
                icon: $("#categoryIcon").val().trim(),
                backgroundColor: $("#backgroundColor").val().trim(),
                status: $("#status").val() === "true"
            };
        }

    </script>

    </body>

</html>
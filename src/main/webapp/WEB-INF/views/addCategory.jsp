<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Add Category | OOO Trips</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
            <link rel="stylesheet" href="${PATH_FOLDER_CSS}/addCategory.css">
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <script src="${PATH_FOLDER_JS}/common.js"></script>
        </head>

        <body>
            <%@ include file="header.jsp"%> 
            <div class="form-container">
                <h2>🗂️ Add New Category</h2>

                <form id="categoryForm" method="post">
                    <label>Name:</label>
                    <input type="text" id="name" name="name" placeholder="Enter category name" required>

                    <label>Description:</label>
                    <textarea id="description" name="description" placeholder="Write a short description"></textarea>

                    <label>Icon URL:</label>
                    <input type="text" id="iconUrl" name="iconUrl" placeholder="https://example.com/icon.png">

                    <label>Meta Value:</label>
                    <input type="text" id="metaValue" name="metaValue" placeholder="Optional metadata value">

                    <label>Status:</label>
                    <select id="status" name="status">
                        <option value="true">Active</option>
                        <option value="false">Inactive</option>
                    </select>

                    <button type="button" class="save-category" onclick="saveCategory();">💾 Save Category</button>
                </form>
            </div>            
        </body>
        <script>
            async function saveCategory() {
                let payload = getCategory();
                let response = await getDataByPayloadWithParentUrl("post", false, true, "${BASE_URL}${CONTEXT_PATH}api/save-category", payload);
                if(response.status == '1'){
                    showMessage("success", response.message, true);
                    setTimeout(() => window.location.reload(), 3000);
                }else{
                    showMessage("error", response.message);
                }
            }
            function getCategory() {
                const categoryData = {
                name: $("#name").val().trim(),
                description: $("#description").val().trim(),
                iconUrl: $("#iconUrl").val().trim(),
                metaValue: $("#metaValue").val().trim(),
                status: $("#status").val() === "true"
                };
                return categoryData;
            }

        </script>

        </html>
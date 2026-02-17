<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
  <!-- <title>Editor - Blog</title> -->
  <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blog.css">
  <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script> -->
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	
    <!-- ✅ Jodit Editor -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jodit@3/build/jodit.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jodit@3/build/jodit.min.js"></script>


    <!-- ✅ Common CSS -->
    <%@ include file="../common/commonScript.jsp" %> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/hero.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blogEditor.css">
    <script src="${pageContext.request.contextPath}/static/js/blog/blogEditor.js"></script>
</head>
<body>
<%@ include file="../header.jsp"%>
<div class="blog-editor-container">
    <h2>✍️ Add New Blog</h2>

    <form>
        <input type="hidden" id="editBlogId" value="${blogId}">
        <div class="blog-editor-grid">

            <div>
                <label>Title</label>
                <input type="text" name="title" id="title">
            </div>

            <div>
                <label>Slug</label>
                <div class="slug-group">
                    <input type="text" name="slug" id="slug">
                    <button type="button" onclick="checkSlug()">Check</button>
                </div>
                <small id="slugFeedback"></small>
            </div>

            <div class="full-width">
                <label>Excerpt</label>
                <textarea rows="3" id="excerpt"></textarea>
            </div>

            <div class="full-width">
                <label for="blogContent">Content</label>

                <textarea id="blogContent"
                        name="content"
                        class="blog-content-editor">
                </textarea>
            </div>

            <div class="full-width">
                <label>Cover Image</label>
                <div class="image-upload-box">
                    <input type="file" id="imageUpload">
                    <input type="hidden" id="coverImageUrl">
                    <div id="uploadPreview">
					</div>
                </div>
            </div>

            <div>
                <label>Status</label>
                <select id="status">
                    <option>DRAFT</option>
                    <option>PUBLISHED</option>
                </select>
            </div>

        </div>

        <div class="editor-actions">
            <button type="button" class="btn-save" onclick="saveBlog()">Save Blog</button>
        </div>

    </form>
</div>
<script>
    let editor;
    $(document).ready(function () {
        editor = new Jodit('#blogContent', {
            height: 400,
            placeholder: 'Write your blog content here...',
            toolbarSticky: false,
            uploader: {
                insertImageAsBase64URI: false
            }
        });
        if ($("#editBlogId").val() != null && $("#editBlogId").val() != undefined && $("#editBlogId").val() != '') {
            getBlogData();
        }
    });
    $(function(){
        $("#title").on('keyup', function(){
            let title = $(this).val();
            let slug = title.toLowerCase().trim().replace(/[^a-z0-9\- ]/g,'').replace(/\s+/g,'-');
            $("#slug").val(slug);
            $("#slugFeedback").text('');
        });

        $("#imageUpload").on("change", function () {
            let file = this.files[0];
            if (!file) return;
            let formData = new FormData();
            formData.append("file", file);
            $.ajax({
                url: BASE_URL + CONTEXT_PATH + "api/update-blog-image",
                type: "POST",
                data: formData,
                contentType: false,   // VERY IMPORTANT
                processData: false,   // VERY IMPORTANT
                success: function (res) {
                    res = JSON.parse(res);
                    if (res.status === 1) {
                        $("#coverImage").val(res.url);
                        showMessage("success", "Image uploaded");
                        $("#coverImageUrl").val(res.url);
                        $("#uploadPreview").html('<img src="'+res.url+'" style="max-height:150px" class="img-fluid rounded">');
                        //   $("#uploadPreview").html('<img src="'+res.url+'" style="max-height:150px" class="img-fluid rounded">');
                    } else {
                        showMessage("error", res.message);
                    }
                },
                error: function () {
                    showMessage("error", "Image upload failed");
                }
            });

        });
    });
</script>
</body>
</html>

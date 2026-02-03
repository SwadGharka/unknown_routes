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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- ✅ Common CSS -->
    <!-- <link rel="stylesheet" href="${PATH_FOLDER_CSS}/common.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/hero.css">

    <%@ include file="../common/commonScript.jsp" %>
    <!-- ✅ Common JS -->
    <script src="${pageContext.request.contextPath}/static/js/dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/hero.js"></script>
</head>
<body>
<div class="container">
  <h2>Blog Editor</h2>
  <form action="${pageContext.request.contextPath}/admin/blog" method="post" id="blogForm">
    <input type="hidden" name="id" value="${blogPost.id}"/>

    <label>Title</label>
    <input type="text" name="title" class="form-control" value="${blogPost.title}" required>

    <label>Slug</label>
    <div class="input-group">
      <input type="text" name="slug" class="form-control" value="${blogPost.slug}" placeholder="auto generate">
      <div class="input-group-append">
        <button type="button" id="checkSlugBtn" class="btn btn-outline-secondary">Check</button>
      </div>
    </div>
    <small id="slugFeedback" class="text-muted"></small>

    <label>Excerpt</label>
    <textarea name="excerpt" class="form-control">${blogPost.excerpt}</textarea>

    <label>Content</label>
    <textarea name="content" id="contentEditor" class="form-control" rows="12">${blogPost.content}</textarea>

    <label>Cover image</label>
    <div>
      <input type="text" name="coverImage" class="form-control" id="coverImageUrl" value="${blogPost.coverImage}">
      <input type="file" id="coverImageFile" accept="image/*">
      <button type="button" id="uploadCoverBtn" class="btn btn-sm btn-secondary mt-2">Upload Image</button>
      <div id="uploadPreview" class="mt-2">
        <img src="${blogPost.coverImage}" class="img-fluid" style="max-height:150px">
      </div>
    </div>

    <label>Status</label>
    <select name="status" class="form-control">
      <option value="DRAFT" ${blogPost.status == 'DRAFT' ? 'selected' : ''}>Draft</option>
      <option value="PUBLISHED" ${blogPost.status == 'PUBLISHED' ? 'selected' : ''}>Published</option>
    </select>

    <button type="submit" class="btn btn-primary mt-3">Save</button>
  </form>
</div>

<script>
$(function(){
  // auto slug from title
  $("input[name='title']").on('keyup', function(){
    let title = $(this).val();
    let slug = title.toLowerCase().trim().replace(/[^a-z0-9\- ]/g,'').replace(/\s+/g,'-');
    $("input[name='slug']").val(slug);
    $("#slugFeedback").text('');
  });

  $("#checkSlugBtn").on('click', function(){
    let slug = $("input[name='slug']").val();
    if (!slug) { $("#slugFeedback").text('Enter slug'); return; }
    $.get("/admin/blog/check-slug", { slug: slug }, function(data){
      if (data.exists) {
        $("#slugFeedback").text('Slug already taken, it will be made unique on save.');
      } else {
        $("#slugFeedback").text('Slug available.');
      }
    });
  });

  // image upload
  $("#uploadCoverBtn").on('click', function(){
    let f = $("#coverImageFile")[0].files[0];
    if (!f) { alert('Choose file'); return; }
    let fd = new FormData();
    fd.append('file', f);
    $.ajax({
      url: '/admin/blog/upload-image',
      type: 'POST',
      data: fd,
      contentType: false,
      processData: false,
      success: function(res) {
        if (res.success) {
          $("#coverImageUrl").val(res.url);
          $("#uploadPreview").html('<img src="'+res.thumb+'" style="max-height:150px" class="img-fluid rounded">');
        } else {
          alert(res.message || 'Upload failed');
        }
      },
      error: function() { alert('Upload error'); }
    });
  });

});
</script>
</body>
</html>

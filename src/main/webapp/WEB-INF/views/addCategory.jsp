<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Category</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        form { width: 400px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
        input, textarea { width: 100%; margin: 10px 0; padding: 8px; }
        button { padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background-color: #0056b3; }
        .msg { color: green; text-align: center; }
    </style>
</head>
<body>

<h2 style="text-align:center;">Add New Category</h2>

<form action="save-category" method="post">
    <label>Name:</label>
    <input type="text" name="name" required />

    <label>Description:</label>
    <textarea name="desc" rows="3"></textarea>

    <label>Icon URL:</label>
    <input type="text" name="iconUrl" />

    <label>Meta Value:</label>
    <input type="text" name="metaValue" />

    <label>Status:</label>
    <select name="status">
        <option value="true">Active</option>
        <option value="false">Inactive</option>
    </select>

    <button type="submit">Save Category</button>
</form>

<c:if test="${not empty message}">
    <p class="msg">${message}</p>
</c:if>

</body>
</html>

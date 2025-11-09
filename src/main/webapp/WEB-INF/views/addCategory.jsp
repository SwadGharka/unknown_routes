<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add Category</title>
</head>
<body>
<h2>Add Category</h2>

<form:form action="save-category" method="post" modelAttribute="category">

    <label>Name:</label>
    <form:input path="name" /><br/>

    <label>Description:</label>
    <form:textarea path="description" /><br/>

    <label>Icon URL:</label>
    <form:input path="iconUrl" /><br/>

    <label>Meta Value:</label>
    <form:input path="metaValue" /><br/>

    <label>Status:</label>
    <form:select path="status">
        <form:option value="true" label="Active"/>
        <form:option value="false" label="Inactive"/>
    </form:select><br/>

    <button type="submit">Save</button>
</form:form>

<p>${message}</p>

</body>
</html>

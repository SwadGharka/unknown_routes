<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Package</title>
</head>
<body>
<h2>Add New Travel Package</h2>

<form action="/api/packages/add" method="post">
    Name: <input type="text" name="name" required><br><br>
    Description: <textarea name="desc"></textarea><br><br>
    Major Attractions: <input type="text" name="majorAttractionsList"><br><br>
    Image URL: <input type="text" name="imageUrl"><br><br>
    City: <input type="text" name="city"><br><br>
    State: <input type="text" name="state"><br><br>
    Country: <input type="text" name="country"><br><br>
    Amount: <input type="number" step="0.01" name="amount"><br><br>
    Category ID: <input type="number" name="categoryId"><br><br>
    Day and Night: <input type="text" name="dayAndNight"><br><br>
    Activities List: <input type="text" name="activitiesList"><br><br>
    Number of Adult: <input type="number" name="numberOfAdult"><br><br>
    Number of Child: <input type="number" name="numberOfChild"><br><br>
    Status: 
    <select name="status">
        <option value="true">Active</option>
        <option value="false">Inactive</option>
    </select><br><br>

    <button type="submit">Submit</button>
</form>

</body>
</html>

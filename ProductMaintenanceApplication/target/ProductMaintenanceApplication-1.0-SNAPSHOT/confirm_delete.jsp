<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="music.business.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Confirm Delete</title>
</head>
<body>
    <h1>Confirm Delete</h1> 
    <p>Are you sure you want to delete the product?</p> <!-- Prompt the user for confirmation -->

    <!-- Form to handle the delete action -->
    <form action="product" method="post">
        <!-- Hidden field to specify the action as "delete" -->
        <input type="hidden" name="action" value="delete"/>
        <!-- Hidden field to pass the product code -->
        <input type="hidden" name="code" value="<%= request.getAttribute("code") %>"/>
        
        <!-- Submit buttons for user confirmation -->
        <p>
            <input type="submit" value="Yes"/> <!-- Submit button for "Yes" -->
            <input type="submit" value="No"/>  <!-- Submit button for "No" -->
        </p>
    </form>
</body>
</html>

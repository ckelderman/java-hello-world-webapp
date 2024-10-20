<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="music.business.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Page</title>
</head>
<body>
    <h1>Product</h1>
    <form action="product" method="post">
        <input type="hidden" name="action" value="<%= request.getAttribute("action") %>"/>
        <input type="hidden" name="productId" value="<%= request.getAttribute("productId") %>"/>
        <p>Code: <input type="text" name="code" value="<%= request.getAttribute("code") %>"/></p>
        <p>Description: <input type="text" name="description" value="<%= request.getAttribute("description") %>"/></p>
        <p>Price: <input type="text" name="price" value="<%= request.getAttribute("price") %>"/></p>
        <p><input type="submit" value="Update Product"/></p>
    </form>
</body>
</html>

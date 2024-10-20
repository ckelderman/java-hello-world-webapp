<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="music.business.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the HTML page -->
    <title>Products Page</title>                                       <!-- Title of the HTML page -->
</head>
<body>
    <h1>Products</h1>
    <a href="product?action=add">Add Product</a>                        <!-- Link to add a new product -->

    <!-- Retrieve the list of products from the request attribute and display them in a table -->
    <% 
        List<Product> products = (List<Product>) request.getAttribute("products");  //Get the list of products from the request attribute
        
        if (products != null && !products.isEmpty()) {  //Check if the products list is not null and not empty
    %>
        <table border="1">
            <tr>
                <th>Code</th>                                           <!-- Table header for product code -->
                <th>Description</th>                                    <!-- Table header for product description -->
                <th>Price</th>                                          <!-- Table header for product price -->
                <th>Actions</th>                                        <!-- Table header for actions -->
            </tr>
            <% 
                for (Product product : products) { //Loop through each product in the list
                    out.println("</td><td>" + product.getCode() + "</td><td>" + product.getDescription() + "</td><td>" + product.getPriceCurrencyFormat() + "</td>"
                            + "<td><a href='product?action=edit&code=" + product.getCode() + "'>Edit</a> | "
                            + "<a href='product?action=delete&code=" + product.getCode() + "'>Delete</a></td></tr>");  //Print each product’s details in a table row with edit and delete links
                } 
            %>
        </table>
    <% 
        } else { 
            out.println("<p>No products available.</p>"); //Message displayed if there are no products
        } 
    %>
</body>
</html>

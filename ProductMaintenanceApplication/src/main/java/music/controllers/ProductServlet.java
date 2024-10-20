package music.controllers;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import music.business.Product;
import music.data.ProductIO;

@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        // Initialize the ProductIO with the file path to the products.txt file
        /*FIX ME: For some reason, my IDE has difficulty finding the relative file path so I have to use the absolute for it to work. I've kept the relative path here but
        if this doesn't work, add the absolute path.
        */
        String filePath = getServletContext().getRealPath("/WEB-INF/products.txt");
        System.out.println("Initializing ProductIO with file path: " + filePath); // Debug statement
        ProductIO.init(filePath); // Call the init method of ProductIO to set the file path
        System.out.println("ProductIO initialized"); // Debug statement to confirm initialization
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the action parameter from the request
        String action = request.getParameter("action");
        System.out.println("Action received: " + action); // Debug statement

        // If action is null, set it to default action "displayProducts"
        if (action == null) {
            action = "displayProducts";  // default action
        }

        String url;
        // Handle the displayProducts action
        if (action.equals("displayProducts")) {
            List<Product> products = ProductIO.selectProducts(); // Retrieve the list of products
            System.out.println("Number of products: " + (products != null ? products.size() : "null")); // Debug statement
            request.setAttribute("products", products); // Set the products attribute in the request
            url = "/products.jsp"; // Forward to products.jsp
        } else {
            // Default URL if action is not recognized
            url = "/index.jsp";
        }

        // Forward the request and response to the appropriate URL
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delegate POST requests to the doGet method
        doGet(request, response);
    }
}

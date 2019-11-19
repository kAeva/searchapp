package controller;

import model.Product;
import DAO.ProductDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/deleteproduct"})
public class DeleteProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int prodID = Integer.valueOf(request.getParameter("prodId"));
            Product prodFordeletion = new ProductDao().getProduct(prodID);
            new ProductDao().delete(prodFordeletion);
            List<Product> searchResults = new ProductDao().getAll();
            request.setAttribute("prodsList", searchResults);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/Dashboard.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

package controller;

import model.Product;
import model.ProductDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditProductServlet", urlPatterns = {"/editproduct"})
public class EditProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("edit servlet started");
            int prodID = Integer.valueOf(request.getParameter("prodId"));
            System.out.println("got an id " + prodID);

            Product prodForEdit = new ProductDao().getProduct(prodID);
//            new ProductDao().delete(prodFordeletion);
//            List<Product> searchResults = new ProductDao().getAll();
            request.setAttribute("editproduct", prodForEdit);
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/editproduct.jsp");
        dispatcher.forward(request, response);
    }
}

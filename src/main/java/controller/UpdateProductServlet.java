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

@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/updateproduct"})
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("update servlet started");
            String [] params = new String[6];
            params[0] = request.getParameter("prodname");
            params[1] = request.getParameter("prodquant");
            params[2] = request.getParameter("prodprice");
            params[3] = request.getParameter("prodcategory");
            params[4] = request.getParameter("proddescr");
            params[5] = request.getParameter("prodsec");

            for(String param : params) {
                System.out.println(param);
            }
            System.out.println(request.getParameter("prodId") + " got a product id to change");
            int prodID = Integer.parseInt(request.getParameter("prodId"));

            Product product = new ProductDao().getProduct(prodID);
            new ProductDao().update(product, params);

            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/success.jsp");
        dispatcher.forward(request, response);
    }
}

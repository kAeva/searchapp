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

@WebServlet(name = "AddNewProductServlet", urlPatterns = {"/addproduct"})
public class AddNewProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            System.out.println("add servlet started");
            Product product = new Product();

            product.setProductName(request.getParameter("prodname"));
            product.setQuant(Integer.parseInt(request.getParameter("prodquant")));
            product.setPrice(Float.parseFloat(request.getParameter("prodprice")));
            product.setCategory(request.getParameter("prodcategory"));
            product.setDescription(request.getParameter("proddescr"));
            product.setSectionNum(request.getParameter("prodsec"));
            System.out.println(product);

            new ProductDao().save(product);
            request.setAttribute("prodName", request.getParameter("prodname"));

            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/addproduct.jsp");
        dispatcher.forward(request, response);
    }
}

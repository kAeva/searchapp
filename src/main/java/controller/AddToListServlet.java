package controller;

import model.Product;
import model.ProductDao;
import model.SearchList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "listadder", urlPatterns = {"/listadder"})
public class AddToListServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("addtoholder servlet started");

        String id = request.getParameter("productId");
        int productId = Integer.parseInt(id);
        SearchList searchList = SearchList.getInstance();
        List<Product> productsList = searchList.list();

        try {
            Product searchResult = ProductDao.getProduct(productId);
            productsList.add(searchResult);
            searchList.add(searchResult);
            request.setAttribute("productsList", productsList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/SearchHolder.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

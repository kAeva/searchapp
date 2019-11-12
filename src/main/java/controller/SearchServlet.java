package controller;

import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "searchservlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchkey = request.getParameter("searchkey");
        System.out.println("servler started with input parameter " + searchkey);

        try {
            List<Product> searchResults = ProductDao.searchProduct(searchkey);
            request.setAttribute("prodsList", searchResults);
            request.setAttribute("searchkey", searchkey);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

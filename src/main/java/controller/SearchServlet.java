package controller;

import model.Dao;
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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "searchservlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchkey = request.getParameter("searchkey");
        System.out.println("servler started with input parameter " + searchkey);
        Statement st;
//
//        SearchList model = SearchList.getInstance();
//        List<Product> prodList = model.list();
//        request.setAttribute("prodList", prodList);

        try (Connection conn = ConnectionFactory.getConnection();) {
//            Dao productDao = new ProductDao();
//            ProductDao product = ProductDao.getProduct(searchkey);
//            Product prod1 = ProductDao.getProduct(searchkey);
//            productDao.getProduct(searchkey);
//            ArrayList<String> al = null;
//            List<Product> prodsList = new ArrayList<>();


            ArrayList<String> al = null;
            ArrayList<ArrayList<String>> prodsList = new ArrayList<ArrayList<String>>();
            String query = "select * from products where item like '%" + searchkey + "%'";

            System.out.println("query " + query);
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                al = new ArrayList<>();

                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                al.add(rs.getString(6));
                al.add(rs.getString(7));

                System.out.println("al :: " + al);
                prodsList.add(al);
            }

            request.setAttribute("prodsList", prodsList);
            request.setAttribute("searchkey", searchkey);


            RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }


}

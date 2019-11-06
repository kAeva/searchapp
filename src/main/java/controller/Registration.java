package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "Registration", urlPatterns = {"/Registration"})
public class Registration extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String searchRequest = request.getParameter("searchRequest");
//        request.setAttribute("request", searchRequest);
//
//        doGet(request, response);

        try {
            String name = request.getParameter("user");
            String password = request.getParameter("password");
            String sql = "insert into users(name, password) values(?, ?)";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/searchapp", "root", "6666");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.executeUpdate();
            PrintWriter out = response.getWriter();
            out.println("You've been registered");


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/add.jsp");
        //requestDispatcher.forward(request, response);





    }
}

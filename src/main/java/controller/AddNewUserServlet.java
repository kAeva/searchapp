package controller;

import DAO.ProductDao;
import DAO.UserDao;
import model.Product;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddNewUserServlet", urlPatterns = {"/addnewuser"})
public class AddNewUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            System.out.println("adduser new servlet started");
            User user = new User();

            user.setName(request.getParameter("username"));
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));

            System.out.println(user);

            new UserDao().save(user);
            request.setAttribute("username", request.getParameter("username"));

            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/adduserpage.jsp");
        dispatcher.forward(request, response);
    }
}

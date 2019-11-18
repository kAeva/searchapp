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

@WebServlet(name = "EditUserServlet", urlPatterns = {"/edituser"})
public class EditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {

                int userId = Integer.parseInt(request.getParameter("userId"));

                User userForEdit = new UserDao().getUser(userId);
                request.setAttribute("edituser", userForEdit);
                doGet(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/edituser.jsp");
            dispatcher.forward(request, response);
    }
}

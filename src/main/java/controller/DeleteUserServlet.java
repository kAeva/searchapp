package controller;

import DAO.UserDao;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteUserServlet", urlPatterns = {"/deleteuser"})
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int userId = Integer.valueOf(request.getParameter("userId"));
            User userFordeletion = new UserDao().getUser(userId);
            new UserDao().delete(userFordeletion);
            List<User> searchResults = new UserDao().getAll();
            request.setAttribute("usersList", searchResults);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/userdashboard.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

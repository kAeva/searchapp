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

@WebServlet(name = "UpdateUserServlet", urlPatterns = {"/updateuser"})
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("updateuser servlet started");
            String [] params = new String[3];
            params[0] = request.getParameter("username");
            params[1] = request.getParameter("useremail");
            params[2] = request.getParameter("userpass");
            request.setAttribute("userName", request.getParameter("username"));

            for(String param : params) {
                System.out.println(param);
            }
            System.out.println(request.getParameter("userId") + " got a product id to change");
            int userId = Integer.parseInt(request.getParameter("userId"));

            User user = new UserDao().getUser(userId);
            System.out.println("here is the user that will be updated" + user);
            new UserDao().update(user, params);
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/success.jsp");
        dispatcher.forward(request, response);
    }
}

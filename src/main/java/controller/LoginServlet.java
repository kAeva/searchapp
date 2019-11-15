package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String login = request.getParameter("login");
        String pass = request.getParameter("password");
        request.setAttribute("login", login);
        System.out.println("in post method with next log and pass: " + login + " " + pass);
//        boolean result;

        if(ManagerVerification.checkUser(login, pass))
        {
            System.out.println("we're going to be redirected");
//            result = true;
            request.setAttribute("result", true);
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/login.jsp");
            dispatcher.forward(request, response);


        }
        else{
//            System.out.println("we're going to fail and back again");
//            request.setAttribute("result", "Username or Password incorrect");
//            result = false;
            request.setAttribute("result", false);
//            out.println("Username or Password incorrect");
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/login.jsp");
            dispatcher.include(request, response);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/login.jsp");
//            dispatcher.forward(request, response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            System.out.println("parameter is null we're in doget standart");
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/login.jsp");
            dispatcher.forward(request, response);
    }
}

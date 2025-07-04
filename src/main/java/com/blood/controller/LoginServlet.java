package com.blood.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String emailOrUsername = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        RequestDispatcher dispatcher = null;

        switch (role) {
            case "admin":
                request.setAttribute("username", emailOrUsername);
                request.setAttribute("password", password);
                dispatcher = request.getRequestDispatcher("AdminLoginServlet");
                dispatcher.forward(request, response);

                break;
            case "donor":
                request.setAttribute("email", emailOrUsername);
                request.setAttribute("password", password);
                dispatcher = request.getRequestDispatcher("DonorLoginServlet");
                dispatcher.forward(request, response);
                break;
            case "hospital":
                request.setAttribute("email", emailOrUsername);
                request.setAttribute("password", password);
                dispatcher = request.getRequestDispatcher("OfficerLoginServlet");
                dispatcher.forward(request, response);
                break;
        }
    }
}

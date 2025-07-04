package com.blood.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blood.dao.OfficerDAO;
import com.blood.model.Officer;

@WebServlet("/OfficerLoginServlet")
public class OfficerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = (String) request.getAttribute("email");
        String password = (String) request.getAttribute("password");

        Officer officer = OfficerDAO.validateOfficer(email, password);

        if (officer != null) {
            HttpSession session = request.getSession();

            session.setAttribute("officerId", officer.getId());
            session.setAttribute("officerName", officer.getName());
            response.sendRedirect("officer_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}

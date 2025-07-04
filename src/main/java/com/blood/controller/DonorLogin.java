package com.blood.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blood.dao.DonorDAO;
import com.blood.model.Donor;

@WebServlet("/DonorLoginServlet")
public class DonorLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        DonorDAO donorDAO = new DonorDAO();
        Donor donor = donorDAO.validateDonor(email, password);

        if (donor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("donorId", donor.getId());
            session.setAttribute("donorName", donor.getName());
            response.sendRedirect("donor_dashboard.jsp");
        } else {
            response.sendRedirect("./jsp/failure.jsp?msg=Invalid email or password");
        }
    }
}

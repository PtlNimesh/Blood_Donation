package com.blood.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.DonorDAO;

@WebServlet("/becomedonor")
public class BecomeDonor extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String bloodGroup = request.getParameter("bloodGroup");

        boolean success = DonorDAO.registerDonor(name, email, password, phone, address, bloodGroup);

        if (success) {
            response.sendRedirect("jsp/success.jsp?msg=Donor Registered Successfully");
        } else {
            response.sendRedirect("jsp/failure.jsp?msg=Registration Failed. Try Again.");
        }
    }
}

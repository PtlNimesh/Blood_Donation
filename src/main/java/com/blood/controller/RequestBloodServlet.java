package com.blood.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.BloodRequestDAO;

@WebServlet("/requestblood")
public class RequestBloodServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String bloodGroup = request.getParameter("bloodGroup");
        String location = request.getParameter("location");

        boolean success = BloodRequestDAO.requestBlood(name, email, phone, bloodGroup, location);

        if (success) {
            response.sendRedirect("jsp/success.jsp?msg=Blood Request Submitted Successfully");
        } else {
            response.sendRedirect("jsp/failure.jsp?msg=Blood Request Failed. Try Again.");
        }
    }
}

package com.blood.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.OfficerDAO;
import com.blood.model.Officer;

@WebServlet("/edit-hospital")
public class EditHospitalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Officer h = new Officer();
        h.setId(Integer.parseInt(request.getParameter("id")));
        h.setName(request.getParameter("name"));
        h.setEmail(request.getParameter("email"));
        h.setPhone(request.getParameter("phone"));
        h.setAddress(request.getParameter("address"));

        new OfficerDAO().updateHospital(h);
        response.sendRedirect("manage-hospitals");
    }
}

package com.blood.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.OfficerDAO;

@WebServlet("/delete-hospital")
public class DeleteHospitalServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new OfficerDAO().deleteHospital(id);
        response.sendRedirect("manage-hospitals");
    }
}

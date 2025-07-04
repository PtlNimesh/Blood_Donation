package com.blood.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.OfficerDAO;
import com.blood.model.Officer;

@WebServlet("/manage-hospitals")
public class ManageHospitalServlet extends HttpServlet {
    OfficerDAO dao = new OfficerDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Officer> hospitals = dao.getAllHospitals();
        request.setAttribute("hospitals", hospitals);
        request.getRequestDispatcher("manage_hospitals.jsp").forward(request, response);
    }
}

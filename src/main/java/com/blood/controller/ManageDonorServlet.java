package com.blood.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.DonorDAO;
import com.blood.model.Donor;

@WebServlet("/manage-donors")
public class ManageDonorServlet extends HttpServlet {
    private DonorDAO donorDAO = new DonorDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Donor> donorList = donorDAO.getAllDonors();
        request.setAttribute("donors", donorList);
        request.getRequestDispatcher("manage_donors.jsp").forward(request, response);
    }
}

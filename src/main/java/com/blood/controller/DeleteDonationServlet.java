package com.blood.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.DonationDAO;

@WebServlet("/deletedonation")
public class DeleteDonationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            DonationDAO dao = new DonationDAO();
            boolean result = dao.deleteDonationById(id);

            if (result) {
                response.sendRedirect("viewdonation"); // reload the donation list
            } else {
                response.getWriter().println("Error deleting donation.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Invalid request.");
        }
    }
}

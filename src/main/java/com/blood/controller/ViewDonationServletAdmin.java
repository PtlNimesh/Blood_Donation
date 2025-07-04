package com.blood.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.DonationDAO;
import com.blood.model.Donation;

@WebServlet("/viewdonationadmin")
public class ViewDonationServletAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DonationDAO dao = new DonationDAO();
        List<Donation> donationList = dao.getAllDonations();
        request.setAttribute("donations", donationList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view_donation_from_admin.jsp");
        dispatcher.forward(request, response);
    }
}

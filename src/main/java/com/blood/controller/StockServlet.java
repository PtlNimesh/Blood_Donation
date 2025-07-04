package com.blood.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.BloodStockDAO;
import com.blood.dao.BloodStockDAOImpl;
import com.blood.dao.DonationCenterDAO;
import com.blood.dao.DonationCenterDAOImpl;
import com.blood.model.BloodStock;
import com.blood.model.DonationCenter;

@WebServlet("/viewstocks")
public class StockServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BloodStockDAO stockDAO;
    private DonationCenterDAO centerDAO;

    @Override
    public void init() {
        try {
            stockDAO = new BloodStockDAOImpl();
            centerDAO = new DonationCenterDAOImpl();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get filter parameters from the request
        String centerId = request.getParameter("centerId");
        String bloodType = request.getParameter("bloodType");

        // Set default values if no filters selected
        if (centerId == null || centerId.trim().isEmpty()) {
            centerId = "all";
        }
        if (bloodType == null || bloodType.trim().isEmpty()) {
            bloodType = "all";
        }

        // Get filtered stock list from DAO
        List<BloodStock> stocks = stockDAO.getStocks(centerId, bloodType);

        // Get donation centers for dropdown list
        List<DonationCenter> centers = centerDAO.getAllCenters();

        // Set attributes for the JSP
        request.setAttribute("stocks", stocks);
        request.setAttribute("centers", centers);
        request.setAttribute("selectedCenter", centerId);
        request.setAttribute("selectedBloodType", bloodType);

        // Forward to the view
        request.getRequestDispatcher("stocks.jsp").forward(request, response);
    }
}

package com.blood.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blood.dao.DashboardDAO;
import com.blood.util.DBUtil;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    // Already implemented GET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect("admin_login.jsp");
            return;
        }

        try {
            Connection conn = DBUtil.getConnection();
            DashboardDAO dao = new DashboardDAO(conn);

            int totalDonors = dao.getTotalDonors();
            int totalUnits = dao.getTotalBloodUnits();
            int pendingRequests = dao.getPendingRequests();

            request.setAttribute("totalDonors", totalDonors);
            request.setAttribute("totalUnits", totalUnits);
            request.setAttribute("pendingRequests", pendingRequests);

            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Fix: Support POST by delegating to GET
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

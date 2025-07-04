package com.blood.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.util.DBUtil;

@WebServlet("/AddDonationServlet")
public class AddDonationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int donorId = Integer.parseInt(request.getParameter("donorId"));
        String name = request.getParameter("name");
        String donationDate = request.getParameter("donationDate");
        String bloodGroup = request.getParameter("bloodGroup");
        String location = request.getParameter("location");

        try (Connection con = DBUtil.getConnection()) {
            String sql = "INSERT INTO donations (donor_id,donor_name, donation_date, blood_group, location) VALUES (?,?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, donorId);
            ps.setString(2, name);
            ps.setString(3, donationDate);
            ps.setString(4, bloodGroup);
            ps.setString(5, location);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("jsp/add_success.jsp?msg=Donation Recorded successfully");
            } else {
                response.getWriter().println("<h2>❌ Failed to record donation.</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}

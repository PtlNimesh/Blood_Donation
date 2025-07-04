package com.blood.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.BloodStockDAO;
import com.blood.dao.BloodStockDAOImpl;
import com.blood.model.BloodStock;

@WebServlet("/AddBloodStockServlet")
public class AddBloodStockServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from form

        String bloodType = request.getParameter("blood_type");
        String unitsStr = request.getParameter("units");
        String centerId = request.getParameter("center_id");

        try {
            int units = Integer.parseInt(unitsStr);

            // Create model object
            BloodStock stock = new BloodStock();
            stock.setBloodType(bloodType);
            stock.setUnits(units);
            stock.setCenterId(centerId);

            // Call DAO to insert
            BloodStockDAO dao = new BloodStockDAOImpl();
            boolean inserted = dao.addStock(stock);

            // Redirect with status parameter
            if (inserted) {
                response.sendRedirect("add_blood_stock_update.jsp?status=success");
            } else {

                response.sendRedirect("add_blood_stock_update.jsp?status=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add_stock_update.jsp?status=error");
        }
    }
}

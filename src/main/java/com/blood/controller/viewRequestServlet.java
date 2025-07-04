package com.blood.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blood.dao.BloodRequestDAO;
import com.blood.model.BloodRequest;

@WebServlet("/viewrequest")
public class viewRequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BloodRequestDAO dao = new BloodRequestDAO();
        List<BloodRequest> requestsList = dao.getAllRequests();
        request.setAttribute("requests", requestsList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view_requests.jsp");
        dispatcher.forward(request, response);
    }
}

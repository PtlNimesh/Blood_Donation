<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.blood.model.BloodStock, com.blood.model.DonationCenter, java.util.List" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
    List<BloodStock> stocks = (List<BloodStock>) request.getAttribute("stocks");
    List<DonationCenter> centers = (List<DonationCenter>) request.getAttribute("centers");
    String selectedCenter = (String) request.getAttribute("selectedCenter");
    String selectedBloodType = (String) request.getAttribute("selectedBloodType");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blood Stock - Admin Panel</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f9fafb;
        }

        header {
            background-color: #e53935;
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav {
            background-color: #d32f2f;
            display: flex;
            justify-content: space-between;
            padding: 0 30px;
        }

        nav .nav-left, nav .nav-right {
            display: flex;
        }

        nav a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #b71c1c;
        }

        .main-content {
            max-width: 1100px;
            margin: auto;
            padding: 30px 16px 100px;
        }

        h1.page-title {
            text-align: center;
            font-size: 36px;
            color: #b91c1c;
            margin-bottom: 32px;
        }

        form {
            background: #fff;
            padding: 24px;
            border-radius: 8px;
            margin-bottom: 32px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: grid;
            gap: 20px;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 4px;
        }

        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background: #dc2626;
            color: #fff;
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background: #b91c1c;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
        }

        th {
            background-color: #f3f4f6;
            font-weight: bold;
            color: #374151;
        }

        tr:nth-child(even) {
            background-color: #f9fafb;
        }

        tr:hover {
            background-color: #f1f5f9;
        }

        .text-center {
            text-align: center;
        }

        .text-red {
            color: #dc2626;
        }

        footer {
            background-color: #e53935;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

<header>
    <h1>Admin Dashboard</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="admin_dashboard.jsp">Dashboard</a>
        <a href="manage-donors">Manage Donors</a>
        <a href="manage_hospitals.jsp">Manage Hospitals</a>
        <a href="viewrequest">View Requests</a>
        <a href="viewdonationadmin">View Donations</a>
        <a href="viewstocks">Stock</a>
    </div>
    <div class="nav-right">
        <a href="LogoutServlet">Logout</a>
    </div>
</nav>

<div class="main-content">
    <h1 class="page-title">Blood Stock Levels</h1>

    <!-- Filters -->
    <form method="get" action="viewstocks">
        <div>
            <label for="centerId">Filter by Center</label>
            <select name="centerId" id="centerId">
                <option value="all" <%= "all".equals(selectedCenter) ? "selected" : "" %>>All Centers</option>
                <% if (centers != null) {
                    for (DonationCenter center : centers) { %>
                        <option value="<%= center.getId() %>" <%= center.getId().equals(selectedCenter) ? "selected" : "" %>>
                            <%= center.getName() %>
                        </option>
                <% } } else { %>
                    <option disabled>No centers available</option>
                <% } %>
            </select>
        </div>
        <div>
            <label for="bloodType">Filter by Blood Type</label>
            <select name="bloodType" id="bloodType">
                <option value="all" <%= "all".equals(selectedBloodType) ? "selected" : "" %>>All Blood Types</option>
                <% String[] bloodTypes = {"A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"}; 
                   for (String type : bloodTypes) { %>
                    <option value="<%= type %>" <%= type.equals(selectedBloodType) ? "selected" : "" %>><%= type %></option>
                <% } %>
            </select>
        </div>
        <div style="align-self: end; text-align: right;">
            <button type="submit">Apply Filters</button>
        </div>
    </form>

    <!-- Table -->
    <div>
        <table>
            <thead>
                <tr>
                    <th>Blood Type</th>
                    <th>Units</th>
                    <th>Center</th>
                    <th>Last Updated</th>
                </tr>
            </thead>
            <tbody>
                <% if (stocks != null && !stocks.isEmpty()) {
                    for (BloodStock stock : stocks) { %>
                        <tr>
                            <td><%= stock.getBloodType() %></td>
                            <td><%= stock.getUnits() %></td>
                            <td><%= stock.getCenterName() %></td>
                            <td><%= stock.getLastUpdated() %></td>
                        </tr>
                <%  }
                } else { %>
                    <tr>
                        <td colspan="4" class="text-center text-red">No blood stock data available for selected filters.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

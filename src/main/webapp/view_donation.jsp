<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.blood.model.Donation" %>

<%
    if (session.getAttribute("officerId") == null) {
        response.sendRedirect("officer_login.jsp");
        return;
    }
    String officerName = (String) session.getAttribute("officerName");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Donations</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #e53935;
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav {
            background-color: #c62828;
            display: flex;
            justify-content: space-between;
            padding: 10px 30px;
        }

        .nav-left, .nav-right {
            display: flex;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            display: block;
        }

        nav a:hover {
            background-color: #b71c1c;
        }

        main {
            padding: 40px;
            text-align: center;
        }

        table {
            width: 80%;
            margin: 40px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #e53935;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
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
    <h1>Donation Records</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="officer_dashboard.jsp">Home</a>
        <a href="add_donation.jsp">Add Donation</a>
        <a href="viewdonation">View Donations</a>
        <a href="add_blood_stock_update.jsp">Add Blood Stock Update</a>
    </div>
    <div class="nav-right">
        <a href="LogoutServlet">Logout</a>
    </div>
</nav>

<main>
    <table>
        <tr>
            
            <th>Donor Name</th>
            <th>Blood Group</th>
            <th>Date</th>
            <th>Location</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <%
            List<Donation> donations = (List<Donation>) request.getAttribute("donations");
            if (donations != null && !donations.isEmpty()) {
                for (Donation d : donations) {
        %>
        <tr>
           
            <td><%= d.getDonorName() %></td>
            <td><%= d.getBloodGroup() %></td>
            <td><%= d.getDate() %></td>
            <td><%= d.getLocation() %></td>
            <td>
                <a class="action-btn edit-btn" href="editdonation.jsp?id=<%= d.getId() %>">Edit</a>
            </td>
            <td>
                <a class="action-btn delete-btn" href="deletedonation?id=<%= d.getId() %>" onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
            </td>
        </tr>
        <%      }
            } else { %>
        <tr>
            <td colspan="7">No donation records found.</td>
        </tr>
        <% } %>
    </table>
</main>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

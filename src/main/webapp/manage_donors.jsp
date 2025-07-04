<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.blood.model.Donor" %>
<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    List<Donor> donors = (List<Donor>) request.getAttribute("donors");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Donors - Blood Bank Admin</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
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

        .nav-left, .nav-right {
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

        .logout-btn {
            background-color: #fff;
            color: #e53935;
            padding: 8px 15px;
            margin: 10px;
            border: 1px solid #e53935;
            border-radius: 5px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #ffcdd2;
        }

        .main-content {
            padding: 30px;
        }

        h2 {
            color: #d32f2f;
        }

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background: #c62828;
            color: white;
        }

        .btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            color: white;
            border-radius: 3px;
            text-decoration: none;
        }

        .edit {
            background: #0288d1;
        }

        .delete {
            background: #d32f2f;
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
        <a href="#">Manage Donors</a>
        <a href="manage-hospitals">Manage Hospitals</a>
        <a href="viewrequest">View Requests</a>
        <a href="viewdonationadmin">View Donations</a>
        <a href="viewstocks">Stock</a>
    </div>
    <div class="nav-right">
        <a href="LogoutServlet">Logout</a>
    </div>
</nav>

<div class="main-content">
    <h2>Manage Donors</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Blood Group</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Actions</th>
        </tr>
        <%
            if (donors != null && !donors.isEmpty()) {
                for (Donor d : donors) {
        %>
        <tr>
            <td><%= d.getId() %></td>
            <td><%= d.getName() %></td>
            <td><%= d.getBloodGroup() %></td>
            <td><%= d.getPhone() %></td>
            <td><%= d.getEmail() %></td>
            <td><%= d.getAddress() %></td>
            <td>
                <a class="btn edit" href="edit_donor.jsp?id=<%= d.getId() %>">Edit</a>
                <a class="btn delete" href="deletedonor?id=<%= d.getId() %>" onclick="return confirm('Are you sure you want to delete this donor?')">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7">No donors found.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

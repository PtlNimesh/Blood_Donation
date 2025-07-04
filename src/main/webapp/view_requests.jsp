<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.blood.model.BloodRequest" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Requests</title>
    <link rel="stylesheet" href="css/style.css">
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
    <h1>Request Records</h1>
</header>

<nav>
    <div class="nav-left">
       <a href="admin_dashboard.jsp">Dashboard</a>
        <a href="manage-donors">Manage Donors</a>
        <a href="manage-hospitals">Manage Hospitals</a>
        <a href="viewrequest">View Requests</a>
        <a href="viewdonationadmin">View Donations</a>
        <a href="viewstocks">Stock</a>
    </div>
    <div class="nav-right">
        <a href="LogoutServlet">Logout</a>
    </div>
</nav>

<main>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone number</th>
            <th>Blood Group</th>
            <th>Location</th>
           
        </tr>
        <%
            List<BloodRequest> requests = (List<BloodRequest>) request.getAttribute("requests");
            if (requests != null && !requests.isEmpty()) {
                for (BloodRequest r : requests) {
        %>
        <tr>
            <td><%= r.getName() %></td>
            <td><%= r.getEmail() %></td>
            <td><%= r.getPhone() %></td>
            <td><%= r.getBloodGroup() %></td>
            <td><%= r.getLocation() %></td>
        
        </tr>
        <%      }
            } else { %>
        <tr>
            <td colspan="5">No donation records found.</td>
        </tr>
        <% } %>
    </table>
</main>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

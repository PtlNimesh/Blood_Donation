<%@ page session="true" %>
<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Blood Bank System</title>
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

        .welcome {
            color: #d32f2f;
        }

        .card {
            background: white;
            padding: 20px;
            margin-top: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
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
        <a href="#">Dashboard</a>
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

<div class="main-content">
    <h1 class="welcome">Welcome, <%= session.getAttribute("adminUsername") %>!</h1>

    <div class="card">
        <h3>Quick Stats</h3>
        <ul>
            <li>Total Donors: <%= request.getAttribute("totalDonors") %></li>
            <li>Total Blood Units: <%= request.getAttribute("totalUnits") %></li>
            <li>Pending Requests: <%= request.getAttribute("pendingRequests") %></li>
        </ul>
        
    </div>

    <div class="card">
        <h3>Recent Activity</h3>
        <p>View logs, new registrations, and donations here...</p>
    </div>
</div>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

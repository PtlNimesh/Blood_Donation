<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("officerId") == null) {
        response.sendRedirect("officer_login.jsp");
        return;
    }

    String officerName = session.getAttribute("officerName").toString();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Officer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
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

        footer {
            background-color: #e53935;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        

        h2 {
            color: #c62828;
        }
    </style>
</head>
<body>

<header>
    <h1>Hospital Dashboard</h1>
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
    <h2>Welcome, <%= officerName %>!</h2>
   </main>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

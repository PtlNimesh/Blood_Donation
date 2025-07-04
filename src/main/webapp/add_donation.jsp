<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" %>
<%
    HttpSession officerSession = request.getSession(false);
    if (officerSession == null || officerSession.getAttribute("officerId") == null) {
        response.sendRedirect("officer_login.jsp");
        return;
    }

    String officerName = officerSession.getAttribute("officerName").toString();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Record Blood Donation</title>
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
        }

        .container {
            width: 400px;
            margin: 0 auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            color: #c62828;
            text-align: center;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type=submit] {
            background-color: #e53935;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #c62828;
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
    <div class="container">
        <h2>Record Blood Donation</h2>
        <form action="AddDonationServlet" method="post">
            <input type="number" name="donorId" placeholder="Donor ID" required />
            <input type="text" name="name" placeholder="Name" />
            <input type="date" name="donationDate" required />
            <select name="bloodGroup" required>
                <option value="">Select Blood Group</option>
                <option>A+</option><option>A-</option>
                <option>B+</option><option>B-</option>
                <option>AB+</option><option>AB-</option>
                <option>O+</option><option>O-</option>
            </select>
            <input type="text" name="location" placeholder="Location" required />
            <input type="submit" value="Record Donation" />
        </form>
    </div>
</main>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

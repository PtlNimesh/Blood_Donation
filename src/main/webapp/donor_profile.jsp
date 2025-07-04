<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.blood.dao.DonorDAO" %>
<%@ page import="com.blood.model.Donor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("donorId") == null) {
        response.sendRedirect("donor_login.jsp");
        return;
    }

    int donorId = (Integer) session.getAttribute("donorId");
    DonorDAO dao = new DonorDAO();
    Donor donor = dao.getDonorById(donorId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Donor Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #e53935;
            padding: 20px;
            color: white;
            text-align: center;
        }
        .container {
            max-width: 700px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2 {
            color: #e53935;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }
        .profile-info {
            margin-top: 20px;
        }
        .profile-info label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
        }
        .logout-btn {
            float: right;
            margin-top: -50px;
        }
        .logout-btn a {
            color: white;
            background-color: #c62828;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
        }
        .logout-btn a:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Welcome, <%= donor.getName() %></h1>
    <div class="logout-btn">
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">
    <h2>My Profile</h2>
    <div class="profile-info">
        <p><label>Name:</label> <%= donor.getName() %></p>
        <p><label>Email:</label> <%= donor.getEmail() %></p>
        <p><label>Phone:</label> <%= donor.getPhone() %></p>
        <p><label>Address:</label> <%= donor.getAddress() %></p>
        <p><label>Blood Group:</label> <%= donor.getBloodGroup() %></p>
    </div>
</div>

</body>
</html>

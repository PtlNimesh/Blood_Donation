<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("donorId") == null) {
        response.sendRedirect("donorLogin.jsp");
        return;
    }

    int donorId = Integer.parseInt(session.getAttribute("donorId").toString());

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    java.util.Date lastDonation = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "Nimesh@2005");

        ps = con.prepareStatement("SELECT * FROM donations WHERE donor_id = ? ORDER BY donation_date DESC");
        ps.setInt(1, donorId);
        rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Donor Dashboard</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
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

        h2, h3 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #e53935;
            color: white;
        }

        p {
            text-align: center;
        }
    </style>
</head>
<body>

<header>
    <h1>Donor Dashboard - Blood Bank & Donation System</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="#">Dashboard</a>
        <a href="requestBlood.jsp">Request Blood</a>
    </div>
    <div class="nav-right">
        <a href="LogoutServlet">Logout</a>
    </div>
</nav>

<h2>Welcome Donor</h2>
<h3>Your Donation History</h3>

<table>
    <tr><th>Date</th><th>Blood Group</th><th>Location</th></tr>
    <%
        while (rs.next()) {
            java.sql.Date date = rs.getDate("donation_date");
            if (lastDonation == null) lastDonation = new java.util.Date(date.getTime());
    %>
        <tr>
            <td><%= date %></td>
            <td><%= rs.getString("blood_group") %></td>
            <td><%= rs.getString("location") %></td>
        </tr>
    <%
        }
    %>
</table>

<h3>Eligibility Status:</h3>
<%
    boolean eligible = true;
    if (lastDonation != null) {
        long daysSinceLastDonation = (new java.util.Date().getTime() - lastDonation.getTime()) / (1000 * 60 * 60 * 24);
        eligible = daysSinceLastDonation >= 90;
    }

    if (eligible) {
%>
    <p style="color:green;">&#9989 You are eligible to donate.</p>
<%
    } else {
%>
    <p style="color:red;"> Not eligible yet. Wait at least 3 months between donations.</p>
<%
    }
%>

</body>
</html>

<%
    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignored) {}
        try { if (ps != null) ps.close(); } catch (Exception ignored) {}
        try { if (con != null) con.close(); } catch (Exception ignored) {}
    }
%>

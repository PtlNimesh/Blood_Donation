<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - Blood Bank & Donation Management System</title>
    <link rel="stylesheet" href="../css/style.css">
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
            max-width: 900px;
            margin: auto;
        }

        h2 {
            color: #c62828;
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

        ul {
            margin-top: 10px;
            padding-left: 20px;
        }
    </style>
</head>
<body>

<header>
    <h1>About Us</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="index.jsp">Home</a>
        <a href="becomeDonor.jsp">Become a Donor</a>
        <a href="requestBlood.jsp">Request a Blood</a>
        <a href="#">About Us</a>
        <a href="contact.jsp">Contact Us</a>
    </div>
    <div class="nav-right">
        <a href="Login.jsp">Admin/Hospital Login</a>
        <a href="donorLogin.jsp">Donor Login</a>
    </div>
</nav>

<main>
    <h2>Who We Are?</h2>
    <p>
        We are a non-profit organization committed to making blood donation accessible, efficient, and transparent. Our Blood Bank & Donation Management System connects donors, recipients, hospitals, and camps on one platform.
    </p>

    <h2>Our Mission</h2>
    <p>
        To save lives by ensuring a reliable, safe, and readily available blood supply. We aim to modernize blood donation processes and increase awareness across communities.
    </p>

    <h2>What We Do?</h2>
    <ul>
        <li>Maintain blood stock and donor records</li>
        <li>Organize donation camps and track contributions</li>
        <li>Enable real-time blood requests</li>
        <li>Promote awareness about safe donation practices</li>
    </ul>
</main>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

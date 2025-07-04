<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us - Blood Bank & Donation Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        header, footer {
            background-color: #e53935;
            color: white;
            text-align: center;
            padding: 20px;
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
            max-width: 800px;
            margin: auto;
        }
        h2 {
            color: #c62828;
        }
        .contact-info {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
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
    <h1>Contact Us</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="index.jsp">Home</a>
        <a href="becomeDonor.jsp">Become a Donor</a>
        <a href="requestBlood.jsp">Request a Blood</a>
        <a href="about.jsp">About Us</a>
        <a href="#">Contact Us</a>
    </div>
    <div class="nav-right">
       <a href="Login.jsp">Admin/Hospital Login</a>
        <a href="donorLogin.jsp">Donor Login</a>
    </div>
    </div>
</nav>

<main>
    <div class="contact-info">
        <h2>We’d love to hear from you</h2>
        <p>For any questions, suggestions, or assistance, please feel free to reach out.</p>
        <p><strong>Email:</strong> support@bloodbank.org</p>
        <p><strong>Phone:</strong> +91 98765 43210</p>
        <p><strong>Address:</strong> LDCE, Ahmdabad, India</p>
    </div>
</main>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Blood Bank & Donation Management System</title>
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
            text-align: center;
        }
        img {
            width: 550px;
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
            <h1>Welcome to Blood Bank & Donation Management System</h1>
        </header>

        <nav>
            <div class="nav-left">
                <a href="#">Home</a>
                <a href="becomeDonor.jsp">Become a Donor</a>
                <a href="requestBlood.jsp">Request a Blood</a>
                <a href="about.jsp">About Us</a>
                <a href="contact.jsp">Contact Us</a>
            </div>
            <div class="nav-right">
                <a href="Login.jsp">Admin/Hospital Login</a>
                <a href="donorLogin.jsp">Donor Login</a>
               
            </div>
        </nav>

        <main>
            <h2>Donate Blood, Save Lives</h2>
            <img src="./img/home_blood.png" alt="Blood">
            <h4>Every blood donation is a LifeSaving gift.</h4>
            <p>Join our mission to save lives by becoming a blood donor
                today.</p>
        </main>

        <footer>
            &copy; 2025 Blood Bank System. All rights reserved.
        </footer>

    </body>
</html>

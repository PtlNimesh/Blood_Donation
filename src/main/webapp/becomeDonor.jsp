<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Become a Donor - Blood Bank & Donation Management System</title>
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
            display: flex;
            justify-content: center;
        }

        .form-container {
            width: 500px;
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        h2 {
            text-align: center;
            color: #e53935;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #e53935;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
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
    <h1>Register Donor</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="index.jsp">Home</a>
        <a href="#">Become a Donor</a>
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
    <div class="form-container">
        <h2>Become a Blood Donor</h2>
        <form action="becomedonor" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="phone" placeholder="Phone Number" required>
            <input type="text" name="address" placeholder="Address" required>
            <select name="bloodGroup" required>
                <option value="">-- Select Blood Group --</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>
            <input type="submit" value="Register as Donor">
        </form>
    </div>
</main>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donor Login - Blood Bank System</title>
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

        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #e53935;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #e53935;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #c62828;
        }

        .register-link {
            text-align: center;
            margin-top: 10px;
        }

        .register-link a {
            color: #e53935;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
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
    </style>
</head>
<body>

<header>
    <h1>Donor Login</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="index.jsp">Home</a>
        <a href="becomeDonor.jsp">Become a Donor</a>
        <a href="requestBlood.jsp">Request a Blood</a>
        <a href="about.jsp">About Us</a>
        <a href="contact.jsp">Contact Us</a>
    </div>
    <div class="nav-right">
        <a href="Login.jsp">Admin/Hospital Login</a>
        <a href="#">Donor Login</a>
    </div>
</nav>

<div class="login-container">
    <h2>Donor Login</h2>
    <form action="DonorLoginServlet" method="post">
        <input type="text" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="submit" value="Login" />
    </form>

    <div class="register-link">
        Not a donor yet? <a href="becomeDonor.jsp">Register here</a>
    </div>

    <div class="error">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </div>
</div>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

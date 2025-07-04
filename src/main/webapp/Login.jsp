<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin/Hospital Login - Blood Bank System</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
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

        .form-container {
            width: 500px;
            margin: 80px auto 100px;
            background-color: white;
            padding: 30px;
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
            margin: 10px 0 20px;
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
    <h1>Admin & Hospital Login</h1>
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
        <a href="#">Admin/Hospital Login</a>
        <a href="donorLogin.jsp">Donor Login</a>
    </div>
</nav>

<div class="form-container">
    <h2>Admin / Hospital Login</h2>
    <form method="post" action="LoginServlet">
        <input type="text" name="username" placeholder="Username or Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <select name="role" required>
            <option value="">-- Login as --</option>
            <option value="admin">Admin</option>
            <option value="hospital">Hospital</option>
        </select>
        <input type="submit" value="Login">
    </form>
</div>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

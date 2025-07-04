<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donation Added</title>
    <link rel="stylesheet" href="css/style.css">
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
            text-align: center;
            padding: 60px;
        }

        .btn-container {
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            background-color: #e53935;
            color: white;
            padding: 12px 25px;
            margin: 10px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #b71c1c;
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
    <h1>Blood Bank Management System</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="officer_dashboard.jsp">Home</a>
        
    </div>
    <div class="nav-right">
        <a href="LogoutServlet">Logout</a>
    </div>
</nav>

<main>
    <h2 style="color: green;">Donation Added Successfully!</h2>

    <div class="btn-container">
        <a class="btn" href="../add_donation.jsp">Add Another Donation</a>
        <a class="btn" href="../viewdonation">View Donations</a>
        <a class="btn" href="../officer_dashboard.jsp">Back to Dashboard</a>
    </div>
</main>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

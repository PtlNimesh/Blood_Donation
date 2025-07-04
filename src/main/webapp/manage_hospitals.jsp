<%@ page import="com.blood.model.Officer, java.util.List" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    List<Officer> hospitals = (List<Officer>) request.getAttribute("hospitals");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Hospitals</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
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

        .main-content {
            padding: 30px;
        }

        h2 {
            color: #d32f2f;
        }

        form {
            margin-bottom: 30px;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        form input[type="text"],
        form input[type="email"] {
            padding: 8px;
            margin: 5px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        form input[type="submit"] {
            padding: 8px 16px;
            margin: 5px;
            background-color: #d32f2f;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #b71c1c;
        }

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background: #c62828;
            color: white;
        }

        .btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            color: white;
            border-radius: 3px;
            text-decoration: none;
        }

        .edit {
            background: #0288d1;
        }

        .delete {
            background: #d32f2f;
        }

        .edit:hover {
            background: #0277bd;
        }

        .delete:hover {
            background: #c62828;
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

        .action-form input[type="text"],
        .action-form input[type="email"] {
            width: 150px;
        }

        .action-form {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
        }
    </style>
</head>
<body>

<header>
    <h1>Admin Dashboard</h1>
</header>

<nav>
    <div class="nav-left">
        <a href="admin_dashboard.jsp">Dashboard</a>
        <a href="manage-donors">Manage Donors</a>
        <a href="#">Manage Hospitals</a>
        <a href="viewrequest">View Requests</a>
        <a href="viewdonationadmin">View Donations</a>
        <a href="viewstocks">Stock</a>
    </div>
    <div class="nav-right">
        <a href="LogoutServlet">Logout</a>
    </div>
</nav>

<div class="main-content">
    <h2>Manage Hospitals</h2>

    <!-- <form method="post" action="add-hospital">
        <input type="text" name="name" placeholder="Hospital Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="text" name="phone" placeholder="Phone Number" required />
        <input type="text" name="address" placeholder="Address" required />
        <input type="submit" value="Add Hospital" />
    </form> -->

    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>Actions</th>
        </tr>
        <% for (Officer h : hospitals) { %>
        <tr>
            <td><%= h.getId() %></td>
            <td><%= h.getName() %></td>
            <td><%= h.getEmail() %></td>
            <td><%= h.getPhone() %></td>
            <td><%= h.getAddress() %></td>
            <td>
                <form class="action-form" action="edit-hospital" method="post">
                    <input type="hidden" name="id" value="<%= h.getId() %>" />
                    <input type="text" name="name" value="<%= h.getName() %>" required />
                    <input type="email" name="email" value="<%= h.getEmail() %>" required />
                    <input type="text" name="phone" value="<%= h.getPhone() %>" required />
                    <input type="text" name="address" value="<%= h.getAddress() %>" required />
                    <input type="submit" value="Update" class="btn edit" />
                    <a href="delete-hospital?id=<%= h.getId() %>" class="btn delete" onclick="return confirm('Are you sure you want to delete this hospital?');">Delete</a>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<footer>
    &copy; 2025 Blood Bank System. All rights reserved.
</footer>

</body>
</html>

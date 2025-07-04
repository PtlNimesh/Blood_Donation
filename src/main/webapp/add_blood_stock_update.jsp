<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ page session="true" %>
        <%@ page import="javax.servlet.http.*, javax.servlet.*" %>
            <% if (session.getAttribute("officerId")==null) { response.sendRedirect("officer_login.jsp"); return; }
                String officerName=session.getAttribute("officerName").toString(); String centerId=(String)
                session.getAttribute("centerId"); String status=request.getParameter("status"); %>

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Add Blood Stock</title>
                    <style>
                        body {
                            font-family: Arial, sans-serif;
                            background: #f4f4f4;
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
                            background-color: #c62828;
                            display: flex;
                            justify-content: space-between;
                            padding: 10px 30px;
                        }

                        .nav-left,
                        .nav-right {
                            display: flex;
                        }

                        nav a {
                            color: white;
                            text-decoration: none;
                            padding: 10px 15px;
                            display: block;
                        }

                        nav a:hover {
                            background-color: #b71c1c;
                        }

                        main {
                            padding: 40px;
                            max-width: 600px;
                            margin: auto;
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

                        form {
                            background-color: #fff;
                            padding: 30px;
                            border-radius: 8px;
                            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                        }

                        label {
                            font-weight: bold;
                            display: block;
                            margin-top: 15px;
                        }

                        select,
                        input[type="text"],
                        input[type="number"] {
                            width: 100%;
                            padding: 10px;
                            margin-top: 5px;
                            border-radius: 4px;
                            border: 1px solid #ccc;
                        }

                        button,
                        .btn {
                            margin-top: 20px;
                            padding: 10px 20px;
                            background-color: #c62828;
                            color: white;
                            border: none;
                            border-radius: 4px;
                            cursor: pointer;
                        }

                        .btn-secondary {
                            background-color: #555;
                            text-decoration: none;
                            display: inline-block;
                        }

                        h2 {
                            color: #c62828;
                            text-align: center;
                        }

                        input[type="date"] {
                            width: 100%;
                            padding: 10px;
                            margin-top: 5px;
                            border-radius: 4px;
                            border: 1px solid #ccc;
                            font-family: Arial, sans-serif;
                            font-size: 14px;
                        }
                    </style>
                </head>

                <body>

                    <%-- Alert Popup on Page Load --%>
                        <% if ("success".equals(status)) { %>
                            <script>
                                window.onload = function () {
                                    alert("✅ Blood stock added successfully!");
                                };
                            </script>
                            <% } else if ("error".equals(status)) { %>
                                <script>
                                    window.onload = function () {
                                        alert("❌ Failed to add blood stock. Please try again.");
                                    };
                                </script>
                                <% } %>

                                    <header>
                                        <h1>Hospital Dashboard</h1>
                                    </header>

                                    <nav>
                                        <div class="nav-left">
                                            <a href="officer_dashboard.jsp">Home</a>
                                            <a href="add_donation.jsp">Add Donation</a>
                                            <a href="viewdonation">View Donations</a>
                                            <a href="#">Add Blood Stock Update</a>
                                        </div>
                                        <div class="nav-right">
                                            <a href="LogoutServlet">Logout</a>
                                        </div>
                                    </nav>

                                    <main>
                                        <h2>Add Blood Stock Update</h2>

                                        <form action="AddBloodStockServlet" method="post">

                                            <label for="blood_type">Blood Group</label>
                                            <select name="blood_type" required>
                                                <option value>-- Select --</option>
                                                <option>A+</option>
                                                <option>A-</option>
                                                <option>B+</option>
                                                <option>B-</option>
                                                <option>O+</option>
                                                <option>O-</option>
                                                <option>AB+</option>
                                                <option>AB-</option>
                                            </select>

                                            <label for="units">Units (in ml)</label>
                                            <input type="number" name="units" required />

                                            <label for="date">Date</label>
                                            <input type="date" name="date" class="date-input" required />

                                            <% if (centerId==null) { %>
                                                <label for="center_id">Center ID</label>
                                                <input type="text" name="center_id" required />
                                                <% } else { %>
                                                    <input type="hidden" name="center_id" value="<%= centerId %>" />
                                                    <% } %>

                                                        <button type="submit">Submit</button>
                                                        <a href="viewdonation" class="btn btn-secondary">Back to
                                                            View</a>

                                        </form>
                                    </main>

                                    <footer>
                                        &copy; 2025 Blood Bank System. All rights reserved.
                                    </footer>

                </body>

                </html>
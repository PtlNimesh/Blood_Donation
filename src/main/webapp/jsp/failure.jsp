<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Error</title></head>
<body>
    <h2 style="color:red;"><%= request.getParameter("msg") %></h2>
    <a href="../index.jsp">Back to Home</a>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Blood Stock</title>
    <style>
        body { font-family: Arial; background: #f9fafb; padding: 40px; }
        .form-box {
            max-width: 400px; margin: auto; background: #fff; padding: 24px;
            border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }
        label { display: block; margin-top: 12px; }
        input, select {
            width: 100%; padding: 8px; margin-top: 4px; border: 1px solid #ccc; border-radius: 4px;
        }
        button {
            margin-top: 20px; background: #dc2626; color: white;
            padding: 10px 16px; border: none; border-radius: 4px;
        }
        button:hover { background: #b91c1c; }
    </style>
</head>
<body>
<div class="form-box">
    <h2>Add Blood Stock</h2>
    <form action="AddStockServlet" method="post">
        <label for="bloodType">Blood Type</label>
        <select name="bloodType" required>
            <option value="">Select Blood Type</option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
        </select>

        <label for="units">Units Collected</label>
        <input type="number" name="units" min="1" required />

        <label for="centerId">Center ID</label>
        <input type="number" name="centerId" required />

        <button type="submit">Add Stock</button>
    </form>
</div>
</body>
</html>

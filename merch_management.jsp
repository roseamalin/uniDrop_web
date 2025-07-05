<%-- 
    Document   : merch_management.jsp
    Created on : Jul 5, 2025, 6:33:47 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Merchandise Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff;
            padding: 20px;
        }
        h1 {
            color: #1e3a8a;
            text-align: center;
        }
        .form-container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #f97316;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #fb923c;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .btn-update,
        .btn-delete {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-update {
            background-color: #3b82f6;
            color: white;
        }
        .btn-delete {
            background-color: #ef4444;
            color: white;
        }
        .btn-update:hover {
            background-color: #60a5fa;
        }
        .btn-delete:hover {
            background-color: #f87171;
        }
    </style>
</head>
<body>

<h1>Merchandise Management</h1>

<div class="form-container">
    <h2>Add New Merchandise</h2>
    <form action="add_merchandise_process.jsp" method="POST">
        <div class="form-group">
            <label for="name">Merchandise Name:</label>
            <input type="text" id="name" name="name" required />
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required step="0.01" />
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required />
        </div>
        <input type="submit" value="Add Merchandise" />
    </form>
</div>

<h2>Existing Merchandise</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>Lanyard</td>
            <td>5.00</td>
            <td>100</td>
            <td>
                <form action="update_merchandise_process.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="1" />
                    <input type="number" name="new_quantity" required placeholder="New Qty" />
                    <input type="submit" class="btn-update" value="Update" />
                </form>
                <form action="delete_merchandise_process.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="1" />
                    <input type="submit" class="btn-delete" value="Delete" />
                </form>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td>T-Shirt</td>
            <td>20.00</td>
            <td>50</td>
            <td>
                <form action="update_merchandise_process.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="2" />
                    <input type="number" name="new_quantity" required placeholder="New Qty" />
                    <input type="submit" class="btn-update" value="Update" />
                </form>
                <form action="delete_merchandise_process.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="2" />
                    <input type="submit" class="btn-delete" value="Delete" />
                </form>
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td>Badge</td>
            <td>3.00</td>
            <td>20</td>
            <td>
                <form action="update_merchandise_process.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="3" />
                    <input type="number" name="new_quantity" required placeholder="New Qty" />
                    <input type="submit" class="btn-update" value="Update" />
                </form>
                <form action="delete_merchandise_process.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="3" />
                    <input type="submit" class="btn-delete" value="Delete" />
                </form>
            </td>
        </tr>
    </tbody>
</table>

</body>
</html>

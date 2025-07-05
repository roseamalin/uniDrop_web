<%-- 
    Document   : orderSummary
    Created on : Jul 5, 2025, 6:35:38 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="util.DBConnection" %>
<%@ page session="true" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }

    String username = (String) sessionObj.getAttribute("username");
    int orderID = (sessionObj.getAttribute("orderID") != null) ? (int) sessionObj.getAttribute("orderID") : -1;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8fafc;
            padding: 30px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1e3a8a;
            padding: 15px 20px;
            border-radius: 8px;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        .nav-buttons button {
            padding: 8px 16px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #ef4444;
            color: white;
            transition: background-color 0.3s;
        }

        .nav-buttons button:hover {
            background-color: #dc2626;
        }

        .summary {
            margin-top: 30px;
            font-size: 18px;
            color: #334155;
        }

        .summary span {
            font-weight: bold;
            color: #0f172a;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #f1f5f9;
        }

        .total {
            text-align: right;
            font-size: 18px;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<header>
    <h1>Order Summary</h1>
    <div class="nav-buttons">
        <button onclick="location.href='logout.jsp'">Logout</button>
    </div>
</header>

<div class="summary">
    Thank you, <strong><%= username %></strong>!<br>
    Your order has been placed successfully.<br>
    Order ID: <span><%= orderID %></span>
</div>

<table>
    <thead>
        <tr>
            <th>Item</th>
            <th>Price (RM)</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody>
    <%
        double total = 0.0;
        try {
            Connection conn = DBConnection.createConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT m.merchName, m.merchPrice, om.merchQty " +
                "FROM ORDER_MERCH om JOIN MERCHANDISE m ON om.merchID = m.merchID " +
                "WHERE om.orderID = ?");
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("merchName");
                double price = rs.getDouble("merchPrice");
                int qty = rs.getInt("merchQty");
                double subtotal = price * qty;
                total += subtotal;
    %>
        <tr>
            <td><%= name %></td>
            <td><%= String.format("%.2f", price) %></td>
            <td><%= qty %></td>
            <td><%= String.format("%.2f", subtotal) %></td>
        </tr>
    <%
            }
        } catch (Exception e) {
            out.println("Error loading order: " + e.getMessage());
        }
    %>
    </tbody>
</table>

<p class="total">Total: RM <%= String.format("%.2f", total) %></p>

</body>
</html>

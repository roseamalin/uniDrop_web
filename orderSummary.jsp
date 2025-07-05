<%-- 
    Document   : orderSummary
    Created on : Jul 5, 2025, 6:35:38 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    Order ID: <span id="order-id">Loading...</span>
</div>

<table id="summary-table">
    <thead>
        <tr>
            <th>Item</th>
            <th>Price (RM)</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>

<p class="total" id="order-total">Subtotal: RM 0.00</p>

<script>
    const cart = JSON.parse(sessionStorage.getItem('cart')) || [];
    const orderId = sessionStorage.getItem('orderId') || "N/A";

    function renderSummary() {
        document.getElementById("order-id").textContent = orderId;

        let tbody = document.querySelector("#summary-table tbody");
        tbody.innerHTML = "";
        let total = 0;

        cart.forEach(item => {
            let subtotal = item.price * item.quantity;
            total += subtotal;

            tbody.innerHTML += `
                <tr>
                    <td>${item.name}</td>
                    <td>${item.price.toFixed(2)}</td>
                    <td>${item.quantity}</td>
                    <td>${subtotal.toFixed(2)}</td>
                </tr>`;
        });

        document.getElementById("order-total").textContent = "Total: RM " + total.toFixed(2);
    }

    renderSummary();
</script>
</body>
</html>

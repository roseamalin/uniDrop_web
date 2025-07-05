<%-- 
    Document   : cart
    Created on : May 25, 2025, 4:19:06 AM
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.CartItem" %>
<%
    // Assume the cart is stored in session as a List<CartItem>
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }
    double totalPrice = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f8fafc;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            margin-bottom: 20px;
        }
        th, td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        .btn {
            padding: 6px 10px;
            background-color: #3b82f6;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-red {
            background-color: #ef4444;
        }
        .btn-orange {
            background-color: #f97316;
        }
    </style>
</head>
<body>

<h2>🛒 Your Cart</h2>

<% if (cart.size() == 0) { %>
    <p>Your cart is empty. <a href="shop.jsp">Continue Shopping</a></p>
<% } else { %>
    <form action="updateCart.jsp" method="post">
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Subtotal</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% for (CartItem item : cart) {
                   double itemTotal = item.getPrice() * item.getQuantity();
                   totalPrice += itemTotal;
            %>
                <tr>
                    <td><%= item.getName() %></td>
                    <td>$<%= item.getPrice() %></td>
                    <td>
                        <button formaction="updateCart.jsp" name="action" value="decrease:<%= item.getId() %>" class="btn">−</button>
                        <%= item.getQuantity() %>
                        <button formaction="updateCart.jsp" name="action" value="increase:<%= item.getId() %>" class="btn">+</button>
                    </td>
                    <td>$<%= String.format("%.2f", itemTotal) %></td>
                    <td>
                        <button formaction="updateCart.jsp" name="action" value="remove:<%= item.getId() %>" class="btn btn-red">Remove</button>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>

        <h3>Total Price: $<%= String.format("%.2f", totalPrice) %></h3>

        <button type="submit" formaction="checkout.jsp" class="btn btn-orange">Proceed to Checkout</button>
        <a href="shop.jsp" class="btn">← Continue Shopping</a>
    </form>
<% } %>

</body>
</html>

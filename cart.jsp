<%@ page import="java.util.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>
<%@ page session="true" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }

    String username = (String) sessionObj.getAttribute("username");
    int custID = -1;
    try {
        Connection conn = DBConnection.createConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT custID FROM CUSTOMERS WHERE username = ?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            custID = rs.getInt("custID");
        }
    } catch (Exception e) {
        out.println("Database error: " + e.getMessage());
    }

    // Simulated cart from session or database. Replace with real data.
    List<Map<String, Object>> cart = (List<Map<String, Object>>) sessionObj.getAttribute("cart");
    if (cart == null) cart = new ArrayList<>();
    double total = 0.0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cart - Merchandise Store</title>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f0f7ff; padding: 20px; }
    h1 { color: #1e3a8a; }
    table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
    th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    th { background-color: #e2e8f0; }
    .checkout-btn {
      background-color: #2563eb;
      color: white;
      padding: 10px 16px;
      font-size: 16px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
    .checkout-btn:hover { background-color: #3b82f6; }
  </style>
</head>
<body>

  <h1>Your Cart</h1>
  <form action="PlaceOrderServlet" method="post">
    <table>
      <thead>
        <tr>
          <th>Item</th>
          <th>Price (RM)</th>
          <th>Quantity</th>
          <th>Subtotal (RM)</th>
        </tr>
      </thead>
      <tbody>
        <%
          for (Map<String, Object> item : cart) {
              int merchID = (int) item.get("merchID");
              String name = (String) item.get("name");
              double price = (double) item.get("price");
              int quantity = (int) item.get("quantity");
              double subtotal = price * quantity;
              total += subtotal;
        %>
        <tr>
          <td><%= name %></td>
          <td><%= String.format("%.2f", price) %></td>
          <td><%= quantity %></td>
          <td><%= String.format("%.2f", subtotal) %></td>
        </tr>
        <input type="hidden" name="merchID" value="<%= merchID %>">
        <input type="hidden" name="quantity" value="<%= quantity %>">
        <% } %>
      </tbody>
    </table>

    <h3>Total: RM <%= String.format("%.2f", total) %></h3>
    <button type="submit" class="checkout-btn">Place Order</button>
  </form>

</body>
</html>

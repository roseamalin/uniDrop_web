<%-- 
    Document   : profile
    Created on : Jul 7, 2025, 10:54:19 PM
    Author     : najlaa
--%>

<%@ page import="java.sql.*, javax.servlet.http.*, util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    HttpSession sessionObj = request.getSession(false);
    String username = null;
    if (sessionObj != null) {
        username = (String) sessionObj.getAttribute("username");
    }
    if (username == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }

    String name = "", address = "", email = "", phone = "";
    String errorMessage = "", successMessage = "";

    if (request.getAttribute("error") != null) {
        errorMessage = (String) request.getAttribute("error");
    }
    if (request.getAttribute("success") != null) {
        successMessage = (String) request.getAttribute("success");
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        conn = DBConnection.createConnection();
        ps = conn.prepareStatement("SELECT custname, custaddress, custemail, custphone FROM CUSTOMERS WHERE username = ?");
        ps.setString(1, username);
        rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("custname");
            address = rs.getString("custaddress");
            email = rs.getString("custemail");
            phone = rs.getString("custphone");
        } else {
            errorMessage = "User profile not found.";
        }
    } catch (Exception e) {
        errorMessage = "Database error: " + e.getMessage();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignore) {}
        try { if (ps != null) ps.close(); } catch (Exception ignore) {}
        try { if (conn != null) conn.close(); } catch (Exception ignore) {}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #eaf0f7;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }
    .profile-container {
      background-color: #ffffff;
      padding: 30px;
      width: 400px;
      border-radius: 10px;
      border: 1px solid #cbd5e1;
      box-sizing: border-box;
    }
    h2 {
      text-align: center;
      color: #1e3a8a;
      margin-bottom: 25px;
    }
    .info-group {
      margin-bottom: 18px;
    }
    label {
      display: block;
      margin-bottom: 6px;
      font-weight: bold;
      color: #1f2937;
    }
    input[type="text"], input[type="email"], input[type="tel"], input[type="password"] {
      width: 100%;
      padding: 10px;
      font-size: 15px;
      border: 1.5px solid #cbd5e1;
      border-radius: 6px;
      box-sizing: border-box;
      color: #1f2937;
    }
    input:focus {
      border-color: #3b82f6;
      background-color: #f9fbfe;
      outline: none;
    }
    .update-btn {
      width: 100%;
      background-color: #f97316;
      color: white;
      padding: 12px;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 8px;
      margin-top: 15px;
      cursor: pointer;
    }
    .update-btn:hover {
      background-color: #fb923c;
    }
    .message {
      text-align: center;
      margin-bottom: 15px;
      font-weight: bold;
    }
    .error { color: red; }
    .success { color: green; }
    </style>
</head>
<body>

<form class="profile-container" action="CustUpdateProfile" method="post">
    <h2>User Profile</h2>

    <% if (!errorMessage.isEmpty()) { %>
        <div class="message error"><%= errorMessage %></div>
    <% } %>
    <% if (!successMessage.isEmpty()) { %>
        <div class="message success"><%= successMessage %></div>
    <% } %>

    <div class="info-group">
        <label>Full Name:</label>
        <input type="text" name="name" value="<%= name %>" required />
    </div>

    <div class="info-group">
        <label>Address:</label>
        <input type="text" name="address" value="<%= address %>" required />
    </div>

    <div class="info-group">
        <label>Email:</label>
        <input type="email" name="email" value="<%= email %>" required />
    </div>

    <div class="info-group">
        <label>Phone:</label>
        <input type="tel" name="phone" value="<%= phone %>" pattern="[0-9]{10,15}" required />
    </div>

    <div class="info-group">
        <label>New Password:</label>
        <input type="password" name="password" placeholder="Leave blank to keep current password" />
    </div>

    <input type="hidden" name="username" value="<%= username %>" />

    <button type="submit" class="update-btn">Update Profile</button>
</form>

</body>
</html>

<%-- 
    Document   : index
    Created on : Jul 5, 2025, 6:10:41 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Merch Store Homepage</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f0f7ff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .content-box {
            background-color: white;
            border: 2px solid #ccc;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .login-button {
            padding: 15px 30px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            background-color: #4169E1;
            color: white;
            transition: background-color 0.3s;
        }

        .login-button:hover {
            background-color: #AEC6CF;
        }

        .register-line {
            font-size: 14px;
            color: #555;
        }

        .register-line a {
            color: #007BFF;
            text-decoration: none;
        }

        .register-line a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="content-box">
        <h1>Welcome to Our Merch Store</h1>

        <div class="button-container">
            <a href="customer_login.jsp">
                <button class="login-button">Login as Customer</button>
            </a>
            <a href="admin_login.jsp">
                <button class="login-button">Login as Admin</button>
            </a>
        </div>
        <div class="register-line">
            <p>Don't have an account? <a href="customer_register.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>

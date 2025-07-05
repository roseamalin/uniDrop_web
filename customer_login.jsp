<%-- 
    Document   : customer_login
    Created on : Jul 5, 2025, 6:14:06 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Customer Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 10px;
        }

        .login-form {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            width: 360px;
            box-sizing: border-box;
            border: 1px solid #cbd5e1;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            color: #1e3a8a;
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #1f2937;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1.5px solid #cbd5e1;
            border-radius: 6px;
            font-size: 15px;
            color: #1f2937;
            box-sizing: border-box;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #3b82f6;
            outline: none;
            background-color: #f9fbfe;
        }

        .submit-btn {
            width: 100%;
            background-color: #4169E1;
            color: white;
            border: none;
            padding: 13px 0;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background-color: #5a85ec;
        }
    </style>
</head>
<body>

    <form class="login-form" action="CustLoginServlet" method="POST">
        <h2>Customer Login</h2>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="submit-btn">Login</button>
    </form>

    <script>
        document.querySelector(".login-form").addEventListener("submit", function(event) {
            // Prevent default form submission for client-side validation
            event.preventDefault(); 

            const username = document.getElementById("username").value;
            const password = document.getElementById("password").value;

            // Client-side validation (optional)
            if (username === "customer" && password === "password") {
                window.location.href = "user_panel.jsp"; // Redirect to user panel
            } else {
                alert("Invalid login. Try again.");
            }
        });
    </script>

</body>
</html>

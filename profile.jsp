<%-- 
    Document   : profile
    Created on : Jul 5, 2025, 6:39:51 PM
    Author     : User
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
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

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border: 1.5px solid #cbd5e1;
            border-radius: 6px;
            box-sizing: border-box;
        }

        input:focus {
            border-color: #3b82f6;
            background-color: #f9fbfe;
            outline: none;
        }

        .readonly {
            background-color: #f3f4f6;
        }

        .update-btn {
            width: 100%;
            background-color: #0ea5e9;
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
            background-color: #38bdf8;
        }
    </style>
</head>
<body>

<form class="profile-container" action="updated_profile.jsp" method="POST">
    <h2>User Profile</h2>

    <div class="info-group">
        <label>Full Name:</label>
        <input type="text" name="name" value="John Doe" class="readonly" readonly />
    </div>

    <div class="info-group">
        <label>Home Address:</label>
        <input type="text" name="address" value="123 Main St, City, Country" class="readonly" readonly />
    </div>

    <div class="info-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="johndoe" required />
    </div>

    <div class="info-group">
        <label for="email">Email Address:</label>
        <input type="email" id="email" name="email" value="johndoe@example.com" required />
    </div>

    <div class="info-group">
        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" value="+1234567890" pattern="[+0-9\s\-]+" required />
    </div>

    <div class="info-group">
        <label for="password">New Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter new password" />
    </div>

    <button type="submit" class="update-btn">Update Profile</button>
</form>

</body>
</html>

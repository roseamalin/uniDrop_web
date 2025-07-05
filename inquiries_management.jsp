<%-- 
    Document   : inquiries_management
    Created on : Jul 5, 2025, 6:30:38 PM
    Author     : User
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Inquiry Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff;
            padding: 20px;
        }

        h1 {
            color: #1e3a8a;
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }

        th, td {
            padding: 14px 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #1e3a8a;
            color: white;
            font-weight: 600;
        }

        td.message-cell {
            text-align: left;
            max-width: 350px;
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        form {
            margin: 0;
            display: inline-block;
        }

        select, button {
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 5px;
            border: 1px solid #ccc;
            cursor: pointer;
            margin-left: 6px;
            vertical-align: middle;
        }

        select {
            min-width: 110px;
        }

        button.update-btn {
            background-color: #3b82f6;
            border: none;
            color: white;
            transition: background-color 0.3s ease;
        }

        button.update-btn:hover {
            background-color: #60a5fa;
        }

        button.delete-btn {
            background-color: #ef4444;
            border: none;
            color: white;
            transition: background-color 0.3s ease;
            margin-left: 12px;
        }

        button.delete-btn:hover {
            background-color: #f87171;
        }
    </style>
</head>
<body>

<h1>Admin Inquiry Management</h1>

<table>
    <thead>
        <tr>
            <th>Inquiry ID</th>
            <th>Message</th>
            <th>Inquiry Date</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>101</td>
            <td class="message-cell">When will the event merchandise be restocked?</td>
            <td>2025-05-20</td>
            <td>
                <form action="update_inquiry_status.jsp" method="POST">
                    <input type="hidden" name="inquiryID" value="101" />
                    <select name="inquiryStatus" required>
                        <option value="Pending" selected>Pending</option>
                        <option value="Resolved">Resolved</option>
                    </select>
                    <button type="submit" class="update-btn">Update</button>
                </form>
            </td>
            <td>
                <form action="delete_inquiry.jsp" method="POST" onsubmit="return confirm('Are you sure you want to delete this inquiry?');">
                    <input type="hidden" name="inquiryID" value="101" />
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </td>
        </tr>
        <tr>
            <td>102</td>
            <td class="message-cell">Can I get a discount on bulk merchandise purchases?</td>
            <td>2025-05-21</td>
            <td>
                <form action="update_inquiry_status.jsp" method="POST">
                    <input type="hidden" name="inquiryID" value="102" />
                    <select name="inquiryStatus" required>
                        <option value="Pending">Pending</option>
                        <option value="Resolved" selected>Resolved</option>
                    </select>
                    <button type="submit" class="update-btn">Update</button>
                </form>
            </td>
            <td>
                <form action="delete_inquiry.jsp" method="POST" onsubmit="return confirm('Are you sure you want to delete this inquiry?');">
                    <input type="hidden" name="inquiryID" value="102" />
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </td>
        </tr>
    </tbody>
</table>

</body>
</html>

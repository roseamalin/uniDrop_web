<%-- 
    Document   : user_panel
    Created on : Jul 5, 2025, 6:21:08 PM
    Author     : User
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Panel - Merchandise Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #1e3a8a;
            color: white;
            padding: 15px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        .nav-buttons button {
            margin-left: 10px;
            padding: 8px 14px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #f97316;
            color: white;
        }

        .nav-buttons button:hover {
            background-color: #fb923c;
        }

        .container {
            padding: 25px;
            max-width: 900px;
            margin: auto;
        }

        h2 {
            color: #1e3a8a;
            margin-top: 30px;
        }

        .merch-section,
        .package-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 8px;
        }

        .card h3 {
            margin-top: 0;
        }

        form {
            margin-top: 30px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
        }

        .submit-btn {
            margin-top: 10px;
            background-color: #1e40af;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #3b82f6;
        }

        .note {
            font-size: 14px;
            color: #475569;
            margin-top: 8px;
        }
    </style>
</head>
<body>

<header>
    <h1>Merchandise Store - User Panel</h1>
    <div class="nav-buttons">
        <button onclick="location.href='cart.jsp'"> View Cart</button>
        <button onclick="location.href='profile.jsp'"> Profile</button>
        <button onclick="location.href='logout.jsp'"> Logout</button>
    </div>
</header>

<div class="container">

    <h2>Available Merchandise</h2>
    <div class="merch-section">
        <div class="card">
            <h3>Lanyard</h3>
            <p>High quality printed lanyard with clip.</p>
            <p>Price: RM5.00 <br><strong>Membership Price: RM4.50</strong></p>
            <button onclick="addToCart('Lanyard', 5.00)">Add to Cart</button>
        </div>
        <div class="card">
            <h3>T-Shirt</h3>
            <p>Cotton shirt with event logo.</p>
            <p>Price: RM20.00 <br><strong>Membership Price: RM18.00</strong></p>
            <button onclick="addToCart('T-Shirt', 20.00)">Add to Cart</button>
        </div>
        <div class="card">
            <h3>Badge</h3>
            <p>Custom enamel badge.</p>
            <p>Price: RM3.00 <br><strong>Membership Price: RM2.50</strong></p>
            <button onclick="addToCart('Badge', 3.00)">Add to Cart</button>
        </div>
    </div>

    <h2>Merch Packages</h2>
    <div class="package-section">
        <div class="card">
            <h3>Package A</h3>
            <p>Includes: Lanyard + T-Shirt + Badge</p>
            <p>Price: RM26.00 <br><strong>Membership Price: RM23.00</strong></p>
            <button onclick="addToCart('Package A', 26.00)">Add to Cart</button>
        </div>
        <div class="card">
            <h3>Package B</h3>
            <p>Includes: 2 T-Shirts + Lanyard</p>
            <p>Price: RM40.00 <br><strong>Membership Price: RM36.00</strong></p>
            <button onclick="addToCart('Package B', 40.00)">Add to Cart</button>
        </div>
    </div>

    <h2>Submit Your Inquiry</h2>
    <form action="submitInquiry.jsp" method="post">
        <label for="inquiry">Your Message:</label>
        <textarea name="inquiry" id="inquiry" rows="5" required></textarea>
        <button type="submit" class="submit-btn">Send Inquiry</button>
    </form>

    <h2>About Us</h2>
    <p class="note">
        Welcome to our official merch store! We provide high-quality and affordable event merchandise, available individually or in bundles. Members enjoy special discounted pricing.
    </p>

</div>

<!-- 🛒 Cart functionality script -->
<script>
    function addToCart(name, price) {
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        let existingItem = cart.find(item => item.name === name);

        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            cart.push({ name, price, quantity: 1 });
        }

        localStorage.setItem('cart', JSON.stringify(cart));
        alert(name + " added to cart.");
    }
</script>

</body>
</html>

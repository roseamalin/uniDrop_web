<%-- 
    Document   : admin_dashboard
    Created on : Jul 5, 2025, 6:28:22 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard - Campus Event & Club Merchandise</title>
    <style>
        /* Reset & base */
        * {
            box-sizing: border-box;
        }
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f7ff;
            height: 100vh;
            display: flex;
            overflow: hidden;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background: #1e3a8a;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            flex-shrink: 0;
        }
        .sidebar h2 {
            text-align: center;
            margin: 0 0 30px;
            font-weight: 700;
            font-size: 22px;
            user-select: none;
        }
        .nav-links {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            padding: 0;
            margin: 0;
            list-style: none;
        }
        .nav-links li {
            margin: 10px 0;
        }
        .nav-links li a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
            border-left: 4px solid transparent;
            user-select: none;
        }
        .nav-links li a:hover, .nav-links li a.active {
            background-color: #3b82f6;
            border-left-color: #f97316;
        }
        .nav-links li a .icon {
            margin-right: 15px;
            font-size: 18px;
            width: 24px;
            text-align: center;
        }

        /* Main content */
        .main-content {
            flex-grow: 1;
            padding: 30px 40px;
            overflow-y: auto;
        }
        .header {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
        }
        .header h1 {
            font-size: 28px;
            color: #1e3a8a;
            margin: 0;
            user-select: none;
        }

        /* Stats cards container */
        .cards {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: nowrap;
            max-width: 800px;
            margin: 0 auto;
        }

        /* Individual card */
        .card {
            background: white;
            border-radius: 10px;
            padding: 25px 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            user-select: none;
            width: 220px;
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }
        .card .icon {
            font-size: 32px;
            color: #f97316;
            margin-bottom: 15px;
        }
        .card h3 {
            margin: 0 0 10px;
            font-size: 20px;
            color: #1e3a8a;
            font-weight: 700;
        }
        .card .value {
            font-size: 28px;
            font-weight: 700;
            color: #3b82f6;
        }

        /* Responsive adjustments */
        @media (max-width: 700px) {
            .cards {
                flex-wrap: wrap;
                max-width: 100%;
                justify-content: center;
                gap: 20px;
            }
            .card {
                width: 100%;
                max-width: 320px;
            }
            body, html {
                flex-direction: column;
                height: auto;
            }
            .sidebar {
                width: 100%;
                flex-direction: row;
                padding: 10px 0;
                overflow-x: auto;
            }
            .sidebar h2 {
                font-size: 18px;
                margin: 0 10px;
            }
            .nav-links {
                flex-direction: row;
                padding: 0 10px;
            }
            .nav-links li {
                margin: 0 10px;
            }
            .nav-links li a {
                padding: 8px 12px;
                border-left: none;
                border-bottom: 3px solid transparent;
            }
            .nav-links li a:hover, .nav-links li a.active {
                border-left: none;
                border-bottom-color: #f97316;
                background-color: transparent;
            }
            .nav-links li a .icon {
                margin-right: 6px;
            }
            .main-content {
                padding: 20px 15px;
            }
        }
    </style>
    <!-- Add icon library CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>

<nav class="sidebar">
    <h2>Merch Admin</h2>
    <ul class="nav-links">
        <li><a href="admin_dashboard.jsp" class="active"><span class="icon"><i class="fas fa-home"></i></span><span class="text">Dashboard</span></a></li>
        <li><a href="merch_management.jsp"><span class="icon"><i class="fas fa-tshirt"></i></span><span class="text">Merchandise</span></a></li>
        <li><a href="order_management.jsp"><span class="icon"><i class="fas fa-receipt"></i></span><span class="text">Orders</span></a></li>
        <li><a href="inquiries_management.jsp"><span class="icon"><i class="fas fa-question-circle"></i></span><span class="text">Inquiries</span></a></li>
        <li><a href="admin_profile.jsp"><span class="icon"><i class="fas fa-user-cog"></i></span><span class="text">Profile</span></a></li>
        <li><a href="logout.jsp"><span class="icon"><i class="fas fa-sign-out-alt"></i></span><span class="text">Logout</span></a></li>
    </ul>
</nav>

<main class="main-content">
    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>

    <section class="cards" aria-label="Dashboard summary cards">
        <article class="card">
            <span class="icon"><i class="fas fa-tshirt"></i></span>
            <h3>Total Merchandise</h3>
            <div class="value" id="totalMerch">58</div>
        </article>

        <article class="card">
            <span class="icon"><i class="fas fa-receipt"></i></span>
            <h3>Total Orders</h3>
            <div class="value" id="totalOrders">123</div>
        </article>

        <article class="card">
            <span class="icon"><i class="fas fa-question-circle"></i></span>
            <h3>Total Inquiries</h3>
            <div class="value" id="totalInquiries">15</div>
        </article>
    </section>
</main>

</body>
</html>

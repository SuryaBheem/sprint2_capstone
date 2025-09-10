<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Pizza Store</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --dominos-blue: #006491;
            --dominos-red: #e31837;
            --light-shadow: rgba(0, 0, 0, 0.08);
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #006491 0%, #e31837 100%);
            background-attachment: fixed;
            background-size: cover;
            background-repeat: no-repeat;
        }

        /* Sidebar */
        .sidebar {
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
            height: 100vh;
            width: 260px;
            position: fixed;
            padding: 30px 20px;
            border-top-right-radius: 30px;
            border-bottom-right-radius: 30px;
            box-shadow: 5px 0 20px var(--light-shadow);
        }

        .sidebar h4 {
            margin-bottom: 30px;
            font-size: 1.6rem;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 10px;
            color: white;
            padding: 12px 16px;
            margin-bottom: 15px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.3s, transform 0.2s;
        }

        .sidebar a:hover {
            background-color: var(--dominos-red);
            transform: translateX(5px);
        }

        /* Main Content */
        .content {
            margin-left: 270px;
            padding: 40px;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            color: #fff;
            min-height: 100vh;
        }

        .dashboard-header {
            background-color: rgba(0, 100, 145, 0.9);
            color: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 25px var(--light-shadow);
        }

        .summary-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }

        .summary-card {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 8px 20px var(--light-shadow);
            text-align: center;
            color: white;
            transition: transform 0.3s ease;
        }

        .summary-card:hover {
            transform: scale(1.05);
        }

        .summary-card h5 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .summary-card .icon {
            font-size: 30px;
            margin-bottom: 10px;
            color: var(--dominos-red);
        }

        .card {
            border: none;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 10px 25px var(--light-shadow);
            color: white;
        }

        .card-header {
            background-color: rgba(0, 100, 145, 0.9);
            color: white;
            font-weight: 600;
            font-size: 1.3rem;
            padding: 20px;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        .card-body {
            padding: 30px;
        }

        .btn-custom {
            background-color: var(--dominos-red);
            color: white;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 10px;
            transition: 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #c3142f;
            transform: scale(1.05);
        }

        .form-control {
            border-radius: 10px;
            padding: 10px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                border-radius: 0;
                position: static;
            }

            .content {
                margin-left: 0;
                padding: 20px;
            }

            .summary-cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h4>🍕 Admin Panel</h4>
        <p>Hello, <strong>${admin.username}</strong></p>
        <a href="/admin/menu">🍕 Manage Menu</a>
        <a href="/admin/menu/add">➕ Add Menu Item</a>
        <a href="/admin/orders/manage">📦 View Orders</a>
        <a href="/admin/orders/revenue">💰 Revenue</a>
        <a href="/api/admin/logout">🚪 Logout</a>
    </div>

    <!-- Content -->
    <div class="content">
        <div class="dashboard-header">
            <h2>Welcome back, ${admin.username}!</h2>
            <p>Email: <strong>${admin.email}</strong></p>
        </div>

        <!-- Summary Cards -->
        <div class="summary-cards">
            <div class="summary-card">
                <div class="icon">📦</div>
                <h5>Total Orders</h5>
                <p><strong>125</strong></p>
            </div>
            <div class="summary-card">
                <div class="icon">💵</div>
                <h5>Revenue</h5>
                <p><strong>₹18,750</strong></p>
            </div>
            <div class="summary-card">
                <div class="icon">👨‍🍳</div>
                <h5>Customers</h5>
                <p><strong>42</strong></p>
            </div>
        </div>

        <!-- Bill Generator -->
        <div class="card">
            <div class="card-header">🧾 Generate Bill for Customer</div>
            <div class="card-body">
                <form action="/admin/orders/generate-bill" method="get" class="form-inline">
                    <div class="form-group mb-2 mr-3">
                        <label for="customerId" class="sr-only">Customer ID</label>
                        <input type="number" name="customerId" id="customerId" class="form-control" placeholder="Enter Customer ID" required>
                    </div>
                    <button type="submit" class="btn btn-custom mb-2">Generate Bill</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>

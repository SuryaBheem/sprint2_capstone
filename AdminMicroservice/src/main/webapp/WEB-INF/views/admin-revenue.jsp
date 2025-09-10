<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Monthly Revenue | Pizza Store</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style>
    :root {
        --dominos-blue: #006491;
        --dominos-red: #e31837;
        --dominos-green: #28a745;
        --light-bg: #f0f2f5;
        --light-white: rgba(255, 255, 255, 0.9);
    }

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(to bottom right, var(--dominos-blue), var(--dominos-red));
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .card {
        background: var(--light-white);
        padding: 35px 40px;
        border-radius: 20px;
        width: 420px;
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        backdrop-filter: blur(8px);
    }

    h2 {
        text-align: center;
        color: var(--dominos-blue);
        font-weight: 600;
        margin-bottom: 25px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-weight: 500;
        margin-bottom: 6px;
        color: #333;
    }

    input[type="number"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 15px;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: var(--dominos-green);
        color: white;
        border: none;
        border-radius: 10px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    button:hover {
        background-color: #218838;
        transform: translateY(-2px);
    }

    .dashboard-btn {
        background-color: var(--dominos-blue);
        margin-top: 12px;
    }

    .dashboard-btn:hover {
        background-color: #005078;
    }

    .revenue-info {
        margin-top: 25px;
        padding: 15px;
        background-color: #eafaf1;
        border-left: 6px solid var(--dominos-green);
        border-radius: 12px;
        text-align: center;
        animation: fadeIn 0.8s ease-in-out;
    }

    .revenue-info p {
        margin: 0;
        font-size: 16px;
        color: #333;
    }

    .revenue-info h3 {
        margin-top: 8px;
        font-size: 26px;
        color: var(--dominos-green);
    }

    .pizza-icon {
        font-size: 50px;
        display: block;
        text-align: center;
        margin-bottom: 15px;
        color: var(--dominos-red);
        animation: pop 0.8s ease-in-out;
    }

    @keyframes pop {
        0% { transform: scale(0.8); opacity: 0.5; }
        100% { transform: scale(1); opacity: 1; }
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    a {
        text-decoration: none;
    }
</style>
</head>
<body>

    <div class="card">
        <div class="pizza-icon">🍕</div>
        <h2>View Monthly Revenue</h2>

        <form action="/admin/orders/calculate-revenue" method="get">
            <div class="form-group">
                <label for="month">Month</label>
                <input type="number" name="month" id="month" min="1" max="12" required>
            </div>
            <div class="form-group">
                <label for="year">Year</label>
                <input type="number" name="year" id="year" min="2000" required>
            </div>
            <button type="submit">📊 View Revenue</button>
        </form>

        <%
        Double totalRevenue = (Double) request.getAttribute("totalRevenue");
        Integer month = (Integer) request.getAttribute("month");
        Integer year = (Integer) request.getAttribute("year");

        if (totalRevenue != null) {
        %>
        <div class="revenue-info">
            <p>Total Revenue for <strong><%=month%>/<%=year%></strong> is:</p>
            <h3>₹<%=totalRevenue%></h3>
        </div>
        <%
        }
        %>

        <a href="/api/admin/dashboard">
            <button class="dashboard-btn">🏠 Back to Dashboard</button>
        </a>
    </div>

</body>
</html>

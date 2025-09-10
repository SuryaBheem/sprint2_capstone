<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pizza Store Dashboard</title>

<!-- Bootstrap & Google Fonts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #002B5C, #E31837);
	font-family: 'Rubik', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

.dashboard-container {
	background-color: #ffffff;
	padding: 40px 30px;
	border-radius: 15px;
	max-width: 720px;
	width: 100%;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
	border-top: 8px solid #E31837;
	text-align: center;
}

.dashboard-container h2 {
	color: #002B5C;
	font-weight: 700;
	margin-bottom: 10px;
}

.dashboard-container p {
	color: #444;
	font-size: 18px;
	margin-bottom: 25px;
}

.store-info {
	background: #002B5C;
	color: white;
	padding: 15px;
	border-radius: 8px;
	margin-bottom: 30px;
	font-size: 16px;
}

.btn-custom {
	width: 220px;
	margin: 10px 10px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 8px;
	padding: 12px;
}

.btn-menu {
	background-color: #E31837;
	color: white;
}

.btn-menu:hover {
	background-color: #c3142e;
}

.btn-cart {
	background-color: #ffc107;
	color: #212529;
}

.btn-history {
	background-color: #17a2b8;
	color: white;
}

.btn-logout {
	background-color: #dc3545;
	color: white;
}

.footer {
	margin-top: 30px;
	font-size: 14px;
	color: #999;
}
</style>
</head>
<body>

	<div class="dashboard-container">
		<div class="store-info">
			<strong>🍕 Welcome to Pizza Store!</strong><br> Serving fresh,
			delicious, and cheesy pizzas straight from our oven to your doorstep!
		</div>

		<h2>Welcome, ${Customer.username}!</h2>
		<p>
			Your Email: <strong>${Customer.email}</strong>
		</p>

		<div class="mt-4">
			<a href="/menu" class="btn btn-menu btn-custom">View Menu</a> <a
				href="http://localhost:8082/api/cart/show"
				class="btn btn-cart btn-custom">View Cart</a> <a
				href="/api/order/history" class="btn btn-history btn-custom">Order
				History</a> <a href="/api/users/logout"
				class="btn btn-logout btn-custom">Logout</a>
		</div>

		<div class="footer">© 2025 Pizza Store. All rights reserved.</div>
	</div>

</body>
</html>

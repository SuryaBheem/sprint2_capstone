<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Payment Successful</title>
<!-- Bootstrap & Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(to right, #0062cc, #e31837);
	/* Domino's gradient */
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background: #ffffff;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
	text-align: center;
	max-width: 480px;
	width: 100%;
	border-top: 6px solid #0062cc;
}

h2 {
	color: #e31837;
	font-weight: bold;
	margin-bottom: 10px;
}

.dominos-title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #0062cc;
}

.dominos-title span {
	color: #e31837;
}

.pizza-img {
	width: 80px;
	margin-bottom: 15px;
}

p {
	font-size: 18px;
	color: #444;
	margin: 10px 0;
}

.btn-custom {
	font-size: 16px;
	font-weight: 600;
	border-radius: 8px;
	padding: 12px 15px;
	margin: 10px 5px 0;
	width: 100%;
}

.btn-primary {
	background-color: #0062cc;
	border: none;
}

.btn-info {
	background-color: #e31837;
	border: none;
}

.btn-primary:hover {
	background-color: #004fa1;
}

.btn-info:hover {
	background-color: #c1112e;
}

.fa-circle-check {
	font-size: 40px;
	color: #e31837;
	margin-bottom: 10px;
}
</style>
</head>

<body>
	<div class="container">
		<img src="https://img.icons8.com/emoji/96/pizza-emoji.png" alt="Pizza"
			class="pizza-img" />
		<div class="dominos-title">
			Domino's <span>Payment</span>
		</div>

		<i class="fas fa-circle-check"></i>
		<h2>Payment Successful!</h2>
		<p>Thank you for your payment.</p>

		<hr>
		<p>
			<i class="fas fa-receipt"></i><strong>Order ID:</strong>
			${payment.orderId}
		</p>
		<p>
			<i class="fas fa-money-bill"></i><strong>Total Amount Paid:</strong>
			₹${payment.amount}
		</p>
		<p>
			<i class="fas fa-credit-card"></i><strong>Payment Method:</strong>
			${payment.paymentMethod}
		</p>
		<hr>

		<a href="api/users/dashboard" class="btn btn-primary btn-custom"><i
			class="fas fa-home"></i> Go to Dashboard</a> <a href="/api/order/history"
			class="btn btn-info btn-custom"><i class="fas fa-list-ul"></i>
			Order History</a>
	</div>
</body>
</html>
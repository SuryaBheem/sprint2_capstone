<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Payment</title>
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
	/* Domino’s Blue to Red Gradient */
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.payment-container {
	background: #ffffff;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	width: 420px;
	text-align: center;
	border-top: 6px solid #0062cc;
}

.pizza-img {
	width: 70px;
	margin-bottom: 10px;
}

.dominos-title {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 20px;
}

.dominos-title .blue {
	color: #0062cc;
}

.dominos-title .red {
	color: #e31837;
}

p {
	font-size: 16px;
	color: #333;
}

label {
	font-weight: 600;
	margin-top: 15px;
	display: block;
	color: #333;
}

select {
	width: 100%;
	padding: 10px;
	border-radius: 8px;
	border: 1px solid #ccc;
	font-size: 16px;
	margin-top: 10px;
}

option {
	padding: 10px;
}

button {
	background-color: #e31837; /* Domino’s Red */
	color: white;
	font-size: 17px;
	font-weight: bold;
	padding: 12px;
	width: 100%;
	border: none;
	border-radius: 8px;
	margin-top: 25px;
	transition: background 0.3s ease;
}

button:hover {
	background-color: #c51129;
}

.fa-credit-card {
	color: #0062cc;
	margin-right: 8px;
}
</style>
</head>
<body>
	<div class="payment-container">
		<img src="https://img.icons8.com/emoji/96/pizza-emoji.png" alt="Pizza"
			class="pizza-img" />
		<div class="dominos-title">
			<span class="blue">Domino's</span> <span class="red">Payment</span>
		</div>

		<form action="processPayment" method="post">
			<input type="hidden" name="orderId" value="${orderId}"> <input
				type="hidden" name="totalPrice" value="${totalPrice}">

			<p>
				<strong>Order ID:</strong> ${orderId}
			</p>
			<p>
				<strong>Total Price:</strong> ₹${totalPrice}
			</p>

			<label for="paymentMethod"><i class="fas fa-credit-card"></i>
				Select Payment Method</label> <select name="paymentMethod" required>
				<option value="Credit Card">💳 Credit Card</option>
				<option value="Debit Card">🏦 Debit Card</option>
				<option value="UPI">📱 UPI</option>
				<option value="Net Banking">💻 Net Banking</option>
				<option value="Cash on Delivery">💵 Cash on Delivery</option>
			</select>
			
			
		

			<button type="submit">
				<i class="fas fa-check-circle"></i> Pay Now
			</button>
		</form>
	</div>
</body>
</html>

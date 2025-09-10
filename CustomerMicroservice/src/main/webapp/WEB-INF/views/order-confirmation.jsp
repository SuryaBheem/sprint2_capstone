<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.example.CustomerMicroservice.model.Order"%>
<jsp:useBean id="order"
	class="com.example.CustomerMicroservice.model.Order" scope="request" />

<!DOCTYPE html>
<html>
<head>
<title>Order Confirmation</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(to right, #0062cc, #e31837);
	/* Domino's theme */
	color: white;
	padding: 50px 15px;
}

.container {
	background: white;
	color: #333;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	max-width: 500px;
	margin: auto;
}

h2 {
	color: #0062cc; /* Domino's blue */
	font-weight: bold;
	margin-bottom: 10px;
}

p {
	font-size: 18px;
	margin: 10px 0;
}

.btn {
	padding: 10px 20px;
	margin-top: 15px;
	border: none;
	font-weight: bold;
	border-radius: 25px;
	text-transform: uppercase;
	transition: 0.3s;
}

.btn-primary {
	background-color: #0062cc;
	color: white;
}

.btn-primary:hover {
	background-color: #004ea1;
}

.btn-danger {
	background-color: #e31837;
	color: white;
}

.btn-danger:hover {
	background-color: #b41127;
}

.btn-block {
	width: 100%;
}

.footer {
	margin-top: 20px;
	font-size: 14px;
	color: #666;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container text-center">
		<h2>Order Placed Successfully!</h2>
		<p>Thank you for your delicious order!</p>

		<p>
			<strong>Order ID:</strong> ${order.orderId}
		</p>
		<p>
			<strong>Total Price:</strong> ₹${order.totalPrice}
		</p>
		<p>
			<strong>Order Date:</strong> ${order.orderDate}
		</p>
		<p>
			<strong>Mode of Delivery:</strong> ${order.modeOfDelivery}
		</p>

		<%
		if ("Pending".equals(order.getOrderStatus()) || "Processing".equals(order.getOrderStatus())) {
		%>
		<form action="/proceedToPayment" method="post">
			<input type="hidden" name="orderId" value="${order.orderId}">
			<input type="hidden" name="totalPrice" value="${order.totalPrice}">
			<button type="submit" class="btn btn-primary btn-block">Proceed
				to Payment</button>
		</form>
		<%
		}
		%>

		<%
		if (!order.getOrderStatus().equals("Cancelled") && !order.getOrderStatus().equals("Delivered")) {
		%>
		<form action="/api/order/cancelOrder" method="post">
			<input type="hidden" name="orderId" value="${order.orderId}">
			<button type="submit" class="btn btn-danger btn-block">Cancel
				Order</button>
		</form>
		<%
		}
		%>

		<div class="footer">&copy; 2025 Domino’s Style Pizza Store.
			Crust us, you'll love it!</div>
	</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.AdminMicroservice.model.Order"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Orders</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap & Fonts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #002b5c, #e31837);
	background-size: cover;
	font-family: 'Roboto', sans-serif;
	color: #333;
	margin: 0;
	padding: 0;
}

.container {
	background-color: rgba(255, 255, 255, 0.97);
	padding: 40px 30px;
	border-radius: 15px;
	margin-top: 60px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

h2 {
	font-weight: bold;
	color: #002b5c;
	text-align: center;
	margin-bottom: 30px;
}

.table th {
	background-color: #002b5c;
	color: white;
}

.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f8f9fa;
}

.table-hover tbody tr:hover {
	background-color: #e7f1ff;
	transform: scale(1.01);
	transition: 0.2s ease-in-out;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
}

.btn-sm {
	font-size: 0.8rem;
	padding: 6px 12px;
	border-radius: 5px;
}

.btn-success {
	background-color: #28a745;
	border: none;
}

.btn-success:hover {
	background-color: #218838;
}

.btn-danger {
	background-color: #dc3545;
	border: none;
}

.btn-danger:hover {
	background-color: #c82333;
}

.btn-primary {
	background-color: #002b5c;
	border: none;
}

.btn-primary:hover {
	background-color: #001d3a;
}

.alert-info {
	font-size: 1.1rem;
}

@media ( max-width : 768px) {
	.container {
		padding: 20px;
	}
	.table th, .table td {
		font-size: 0.85rem;
	}
}
</style>
</head>
<body>

	<div class="container">
		<h2>
			<i class="fas fa-tasks"></i> Pending Orders
		</h2>

		<%
		List<Order> orders = (List<Order>) request.getAttribute("orders");
		if (orders != null && !orders.isEmpty()) {
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		%>

		<table class="table table-bordered table-striped table-hover mt-4">
			<thead class="thead-dark">
				<tr>
					<th>Order ID</th>
					<th>Customer ID</th>
					<th>Total Price (₹)</th>
					<th>Order Date</th>
					<th>Status</th>
					<th>Mode</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Order order : orders) {
				%>
				<tr>
					<td><%=order.getOrderId()%></td>
					<td><%=order.getCustomerId()%></td>
					<td><%=String.format("%.2f", order.getTotalPrice())%></td>
					<td><%=sdf.format(order.getOrderDate())%></td>
					<td><%=order.getOrderStatus()%></td>
					<td><%=order.getModeOfDelivery()%></td>
					<td>
						<form action="/admin/orders/accept" method="post"
							style="display: inline;">
							<input type="hidden" name="orderId"
								value="<%=order.getOrderId()%>">
							<button type="submit" class="btn btn-success btn-sm">Accept</button>
						</form>
						<form action="/admin/orders/reject" method="post"
							style="display: inline;">
							<input type="hidden" name="orderId"
								value="<%=order.getOrderId()%>">
							<button type="submit" class="btn btn-danger btn-sm">Reject</button>
						</form>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<%
		} else {
		%>
		<div class="alert alert-info text-center mt-4">No pending orders
			to display.</div>
		<%
		}
		%>

		<div class="text-center mt-4">
			<a href="/api/admin/dashboard" class="btn btn-primary"> Go to Dashboard </a>
		</div>
	</div>

	<!-- Font Awesome (for icons) -->
	<script src="https://kit.fontawesome.com/a076d05399.js"
		crossorigin="anonymous"></script>

</body>
</html>

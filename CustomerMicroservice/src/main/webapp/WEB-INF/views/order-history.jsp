<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page
	import="java.util.List, com.example.CustomerMicroservice.model.Order"%>

<!DOCTYPE html>
<html>
<head>
<title>Order History</title>
<!-- Bootstrap + Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(to right, #0062cc, #e31837);
	text-align: center;
	padding: 40px;
	color: #333;
}

.container {
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	max-width: 1000px;
	margin: auto;
}

h2 {
	color: #e31837;
	margin-bottom: 25px;
	font-weight: bold;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 14px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #0062cc;
	color: white;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

.message {
	font-size: 18px;
	color: #555;
	margin-top: 20px;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	margin-top: 20px;
	background: #e31837;
	color: white;
	text-decoration: none;
	border-radius: 8px;
	border: none;
	font-weight: 600;
}

.btn:hover {
	background: #c3112e;
}

.btn-danger {
	background: #dc3545;
}

.btn-danger:hover {
	background: #b52a36;
}

.btn-primary {
	background-color: #0062cc;
}

.btn-primary:hover {
	background-color: #004fa1;
}

.icon {
	margin-right: 6px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>
			<i class="fas fa-history icon"></i> Your Order History
		</h2>

		<script>
            <%if (request.getAttribute("message") != null) {%>
                alert("<%=request.getAttribute("message")%>");
            <%}%>
            <%if (request.getAttribute("error") != null) {%>
                alert("<%=request.getAttribute("error")%>
			");
		<%}%>
			
		</script>

		<%
		List<Order> orders = (List<Order>) request.getAttribute("orders");
		%>

		<%
		if (orders == null || orders.isEmpty()) {
		%>
		<p class="message">
			<i class="fas fa-pizza-slice icon"></i>No orders found.
		</p>
		<%
		} else {
		%>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th><i class="fas fa-receipt icon"></i>Order ID</th>
					<th><i class="fas fa-rupee-sign icon"></i>Total Price</th>
					<th><i class="fas fa-calendar-alt icon"></i>Order Date</th>
					<th><i class="fas fa-motorcycle icon"></i>Delivery Mode</th>
					<th><i class="fas fa-tasks icon"></i>Action</th>
					<th><i class="fas fa-info-circle icon"></i>Order Status</th>
					<th><i class="fas fa-credit-card icon"></i>Payment Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Order order : orders) {
				%>
				<tr>
					<td><%=order.getOrderId()%></td>
					<td>₹<%=order.getTotalPrice()%></td>
					<td><%=order.getOrderDate()%></td>
					<td><%=order.getModeOfDelivery()%></td>
					<td>
						<%
						if (!order.getOrderStatus().equals("Cancelled") && !order.getOrderStatus().equals("Delivered")) {
						%>
						<form action="/api/order/cancelOrder" method="post">
							<input type="hidden" name="orderId"
								value="<%=order.getOrderId()%>">
							<button type="submit" class="btn btn-danger btn-sm">Cancel</button>
						</form> <%
 } else {
 %> <span style="color: gray;">N/A</span> <%
 }
 %>
					</td>
					<td><%=order.getOrderStatus()%></td>
					<td><%=order.getPaymentStatus()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		}
		%>

		<a href="http://localhost:8082/api/users/dashboard"
			class="btn btn-primary"><i class="fas fa-arrow-left icon"></i>Back
			to Dashboard</a>
	</div>
</body>
</html>

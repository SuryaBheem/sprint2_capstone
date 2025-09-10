<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.AdminMicroservice.model.Order"%>

<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
int customerId = (int) request.getAttribute("customerId");
double totalAmount = (double) request.getAttribute("totalPrice");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Bill</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<style>
body {
	background: linear-gradient(to right, #002b5c, #e31837);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #333;
	padding: 40px 0;
}

.bill-container {
	background-color: #ffffff;
	padding: 40px;
	max-width: 900px;
	margin: auto;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

h2 {
	color: #002b5c;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 25px;
}

th, td {
	border: 1px solid #ddd;
	padding: 14px;
	text-align: center;
}

th {
	background-color: #002b5c;
	color: white;
}

tr:nth-child(even) {
	background-color: #f8f9fa;
}

h3 {
	text-align: right;
	margin-top: 10px;
	color: #e31837;
	font-weight: bold;
}

.btn-dashboard {
	background-color: #e31837;
	color: white;
	font-size: 16px;
	padding: 10px 25px;
	border: none;
	border-radius: 30px;
	display: inline-flex;
	align-items: center;
	text-decoration: none;
	transition: 0.3s ease;
}

.btn-dashboard i {
	margin-right: 8px;
}

.btn-dashboard:hover {
	background-color: #c3152f;
	text-decoration: none;
}
</style>
</head>
<body>

	<div class="bill-container">
		<h2>
			<i class="fas fa-receipt"></i> Bill for Customer ID:
			<%=customerId%>
		</h2>

		<table>
			<thead>
				<tr>
					<th>Order ID</th>
					<th>Order Date</th>
					<th>Bill Amount (₹)</th>
					<th>Mode of Delivery</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Order order : orders) {
				%>
				<tr>
					<td><%=order.getOrderId()%></td>
					<td><%=order.getOrderDate()%></td>
					<td><%=order.getTotalPrice()%></td>
					<td><%=order.getModeOfDelivery()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<h3>
			Total Bill: ₹<%=totalAmount%></h3>

		<div class="text-left mt-4">
			<a href="/api/admin/dashboard" class="btn-dashboard"> <i
				class="fas fa-arrow-left"></i> Back to Dashboard
			</a>
		</div>
	</div>

</body>
</html>

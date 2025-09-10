<%@ page
	import="java.util.List, com.example.CustomerMicroservice.model.MenuItem"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Pizza Menu</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(to right, #0062cc, #e31837);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	background-color: #fff;
	padding: 30px;
	border-radius: 15px;
	max-width: 1000px;
	width: 95%;
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.2);
}

h2 {
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}

h2 .blue {
	color: #0062cc;
}

h2 .red {
	color: #e31837;
}

.table thead {
	background-color: #0062cc;
	color: white;
}

.btn-primary, .btn-danger, .btn-success {
	font-weight: bold;
	border-radius: 20px;
}

.btn-primary {
	background-color: #0062cc;
	border-color: #0062cc;
}

.btn-danger {
	background-color: #e31837;
	border-color: #e31837;
}

.btn-success {
	background-color: #28a745;
	border-color: #28a745;
}

.text-danger {
	font-weight: bold;
}

input[readonly] {
	background-color: #f8f9fa;
}
</style>
</head>
<body>
	<div class="container">
		<h2>
			<span class="blue">Domino's</span> <span class="red">Pizza
				Menu</span>
		</h2>
		<table class="table table-bordered text-center">
			<thead>
				<tr>
					<th>Name</th>
					<th>Category</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Add to Cart</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<MenuItem> menuItems = (List<MenuItem>) request.getAttribute("menuItems");
				if (menuItems != null && !menuItems.isEmpty()) {
					for (MenuItem menuItem : menuItems) {
				%>
				<tr>
					<td><%=menuItem.getName()%></td>
					<td><%=menuItem.getCategory()%></td>
					<td>&#8377; <%=menuItem.getPrice()%></td>
					<td>
						<div class="d-flex justify-content-center align-items-center">
							<button type="button" class="btn btn-sm btn-danger mr-2"
								onclick="changeQuantity('<%=menuItem.getId()%>', -1)">-</button>
							<input type="text" id="qty-<%=menuItem.getId()%>" value="1"
								readonly style="width: 40px; text-align: center;">
							<button type="button" class="btn btn-sm btn-success ml-2"
								onclick="changeQuantity('<%=menuItem.getId()%>', 1)">+</button>
						</div>
					</td>
					<td>
						<form action="api/cart/add" method="post">
							<input type="hidden" name="itemId" value="<%=menuItem.getId()%>">
							<input type="hidden" name="quantity"
								id="form-qty-<%=menuItem.getId()%>" value="1">
							<button type="submit" class="btn btn-success">Add to
								Cart</button>
						</form>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="5" class="text-danger">No items available.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<div class="text-center mt-4">
			<a href="api/users/dashboard" class="btn btn-primary mr-3">Dashboard</a>
			<a href="api/cart/show" class="btn btn-primary">View Cart</a>
		</div>
	</div>

	<script>
		function changeQuantity(id, delta) {
			const qtyInput = document.getElementById("qty-" + id);
			const formQtyInput = document.getElementById("form-qty-" + id);
			let qty = parseInt(qtyInput.value) + delta;
			if (qty < 1)
				qty = 1;
			qtyInput.value = qty;
			formQtyInput.value = qty;
		}
	</script>
</body>
</html>

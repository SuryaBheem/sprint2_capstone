<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.CustomerMicroservice.model.Cart"%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background: linear-gradient(to right, #0062cc, #e31837);
	/* Domino's Blue & Red */
	color: white;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
	background-color: white;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
	color: #333;
	margin-top: 60px;
}

h2 {
	color: #0062cc;
	font-weight: bold;
	text-align: center;
}

.table thead {
	background-color: #0062cc;
	color: white;
}

.table tfoot {
	background-color: #e31837;
	color: white;
}

.btn-primary {
	background-color: #0062cc;
	border-color: #0056b3;
	border-radius: 20px;
	font-weight: bold;
}

.btn-danger {
	background-color: #e31837;
	border-color: #bd2130;
	border-radius: 20px;
	font-weight: bold;
}

.btn-checkout {
	background-color: #0062cc;
	color: white;
	border: none;
	border-radius: 20px;
	padding: 10px;
	font-weight: bold;
	width: 100%;
}

.btn-checkout:hover {
	background-color: #004f9e;
}

select {
	border-radius: 5px;
	padding: 5px 10px;
	margin-top: 5px;
	font-weight: bold;
}

label {
	font-weight: bold;
	color: #333;
}

.footer {
	margin-top: 40px;
	font-size: 14px;
	color: #e0e0e0;
	text-align: center;
}

.alert-warning {
	background-color: #fff3cd;
	color: #856404;
	border-radius: 10px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Your Cart</h2>

		<% if (request.getAttribute("error") != null) { %>
		<div class="alert alert-danger">
			<%= request.getAttribute("error") %>
		</div>
		<% } %>

		<%
        List<Cart> cartItems = (List<Cart>) request.getAttribute("cartItems");
        Integer customerId = (Integer) request.getAttribute("customerId");
        double grandTotal = 0.0;
        if (cartItems == null || cartItems.isEmpty()) {
    %>
		<p class="alert alert-warning text-center">Your cart is empty.</p>
		<%
        } else {
    %>
		<table class="table table-bordered mt-4 text-center">
			<thead>
				<tr>
					<th>Item Name</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
                for (Cart cartItem : cartItems) {
                    double total = cartItem.getQuantity() * cartItem.getMenuItem().getPrice();
                    grandTotal += total;
            %>
				<tr>
					<td><%= cartItem.getMenuItem().getName() %></td>
					<td><%= cartItem.getQuantity() %></td>
					<td>&#8377;<%= cartItem.getMenuItem().getPrice() %></td>
					<td>&#8377;<%= total %></td>
					<td>
						<form action="http://localhost:8082/api/cart/delete" method="post">
							<input type="hidden" name="itemId"
								value="<%= cartItem.getMenuItem().getId() %>">
							<button type="submit" class="btn btn-danger btn-sm">Delete</button>
						</form>
					</td>
				</tr>
				<%
                }
            %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" class="text-right"><strong>Grand
							Total:</strong></td>
					<td colspan="2"><strong>&#8377;<%= grandTotal %></strong></td>
				</tr>
			</tfoot>
		</table>
		<%
        }
    %>

		<hr>

		<!-- Checkout Form -->
		<form action="http://localhost:8082/api/order/checkout" method="post">
			<input type="hidden" name="customerId" value="<%= customerId %>">
			<input type="hidden" name="totalPrice" value="<%= grandTotal %>">

			<label for="modeOfDelivery">Choose Delivery Mode:</label> <select
				name="modeOfDelivery" id="modeOfDelivery"
				class="form-control w-50 mb-3" required>
				<option value="Home Delivery">🚚 Home Delivery</option>
				<option value="Pickup">🏬 Pickup</option>
				<option value="Dine-In">🍽️ Dine-In</option>
			</select>

			<button type="submit" class="btn-checkout">Place Order & Pay</button>
		</form>

		<div class="text-center mt-3">
			<a href="http://localhost:8082/menu" class="btn btn-primary">Back
				to Menu</a>
		</div>
	</div>

	<div class="footer">&copy; 2025 Domino’s Style Pizza Store. All
		Rights Reserved.</div>
</body>
</html>

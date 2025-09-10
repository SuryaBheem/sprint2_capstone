<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.example.AdminMicroservice.model.MenuItem"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Menu</title>

<!-- Bootstrap, Fonts, Icons -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to bottom right, rgba(0, 43, 92, 0.9),
		rgba(227, 24, 55, 0.9)),
		url('https://images.unsplash.com/photo-1600891964092-4316c288032d?auto=format&fit=crop&w=1950&q=80')
		no-repeat center center fixed;
	background-size: cover;
	font-family: 'Roboto', sans-serif;
	color: #fff;
}

.header {
	background-color: rgba(255, 255, 255, 0.1);
	padding: 20px 0;
	text-align: center;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
	margin-bottom: 40px;
}

.header h1 {
	color: #ffffff;
	font-weight: bold;
	font-size: 2.5rem;
}

.header span {
	font-size: 1.2rem;
	color: #e0e0e0;
}

.container {
	background-color: rgba(255, 255, 255, 0.95);
	padding: 40px;
	border-radius: 20px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
	backdrop-filter: blur(10px);
}

h2 {
	color: #e31837;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}

.table {
	border-radius: 10px;
	overflow: hidden;
}

.table th {
	background-color: #002b5c;
	color: white;
}

.table-hover tbody tr:hover {
	transform: scale(1.01);
	transition: all 0.2s ease-in-out;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	background-color: #f1f1f1;
}

.btn-danger {
	background-color: #e31837;
	border: none;
}

.btn-primary {
	background-color: #002b5c;
	border: none;
}

.btn-secondary {
	background-color: #6c757d;
	border: none;
}

.btn-success {
	background-color: #28a745;
	border: none;
}

.btn i {
	margin-right: 5px;
}

.text-danger {
	color: #e31837 !important;
}

.text-center a.btn {
	margin: 0 10px;
}

@media ( max-width : 768px) {
	.container {
		padding: 20px;
	}
	h2 {
		font-size: 1.8rem;
	}
	.header h1 {
		font-size: 2rem;
	}
}
</style>
</head>
<body>

	<%
    Long paidOrderId = (Long) session.getAttribute("paidOrderId");
    if (paidOrderId != null) {
%>
	<script>
    const orderId = '<%= paidOrderId %>';
    setInterval(function () {
        fetch('check-order-status?orderId=' + orderId)
            .then(response => response.text())
            .then(status => {
                if (status === 'Accepted') {
                    window.location.href = 'order-history.jsp';
                }
            });
    }, 5000);
</script>
	<% } %>

	<div class="header">
		<h1>
			<i class="fas fa-pizza-slice"></i> PizzaHub Admin
		</h1>
		<span>Manage your menu just like Domino’s would 🍕</span>
	</div>

	<div class="container mt-3">
		<h2>
			<i class="fas fa-utensils"></i> Manage Menu
		</h2>

		<table class="table table-bordered table-hover mt-4">
			<thead>
				<tr>
					<th>ID</th>
					<th>Item Name</th>
					<th>Category</th>
					<th>Price (Rs)</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<% 
                List<MenuItem> menuList = (List<MenuItem>) request.getAttribute("menuList");
                if (menuList != null && !menuList.isEmpty()) {
                    for (MenuItem menu : menuList) { 
            %>
				<tr>
					<td><%= menu.getId() %></td>
					<td><%= menu.getName() %></td>
					<td><%= menu.getCategory() %></td>
					<td><%= menu.getPrice() %></td>
					<td><a href="/admin/menu/delete/<%= menu.getId() %>"
						class="btn btn-danger btn-sm"> <i class="fas fa-trash-alt"></i>
							Delete
					</a>

						<form action="/admin/menu/edit" method="post"
							style="display: inline;">
							<input type="hidden" name="id" value="<%= menu.getId() %>">
							<button type="submit" class="btn btn-primary btn-sm">
								<i class="fas fa-edit"></i> Update
							</button>
						</form></td>
				</tr>
				<% 
                    }
                } else { 
            %>
				<tr>
					<td colspan="5" class="text-center text-danger">No menu items
						available.</td>
				</tr>
				<% } %>
			</tbody>
		</table>

		<div class="text-center mt-4">
			<a href="http://localhost:8080/api/admin/dashboard"
				class="btn btn-secondary"> <i class="fas fa-arrow-left"></i>
				Back to Dashboard
			</a> <a href="/admin/menu/add" class="btn btn-success"> <i
				class="fas fa-plus-circle"></i> Add Menu Item
			</a>
		</div>
	</div>

</body>
</html>

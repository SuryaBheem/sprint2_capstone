<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.example.AdminMicroservice.model.MenuItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Menu</title>

<!-- Bootstrap & Fonts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>

<style>
body {
	background: linear-gradient(to bottom right, rgba(0, 43, 92, 0.85),
		rgba(227, 24, 55, 0.85)),
		url('https://images.unsplash.com/photo-1594007654729-407eedc4be00?auto=format&fit=crop&w=1950&q=80')
		no-repeat center center fixed;
	background-size: cover;
	font-family: 'Roboto', sans-serif;
	color: #ffffff;
}

.container {
	background-color: rgba(255, 255, 255, 0.96);
	padding: 40px;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
	margin-top: 60px;
}

h2 {
	color: #e31837;
	font-weight: bold;
}

.table {
	background-color: #ffffff;
}

.thead-dark th {
	background-color: #002b5c;
	color: white;
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

.text-danger {
	color: #e31837 !important;
}

.btn i {
	margin-right: 5px;
}

.text-center a.btn {
	margin: 0 10px;
}

.page-header {
	text-align: center;
	margin-bottom: 30px;
}

.page-header i {
	color: #e31837;
	font-size: 2rem;
}

.page-header h2 {
	display: inline-block;
	margin-left: 10px;
	color: #002b5c;
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<i class="fas fa-pizza-slice"></i>
			<h2>Manage Pizza Menu</h2>
		</div>

		<table class="table table-bordered mt-4">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th><i class="fas fa-pizza-slice"></i> Item Name</th>
					<th><i class="fas fa-layer-group"></i> Category</th>
					<th><i class="fas fa-rupee-sign"></i> Price (Rs)</th>
					<th><i class="fas fa-cogs"></i> Actions</th>
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
					<td>
						<!-- Edit first -->
						<form action="/admin/menu/edit" method="post" style="display: inline;">
							<input type="hidden" name="id" value="<%= menu.getId() %>">
							<button type="submit" class="btn btn-primary btn-sm">
								<i class="fas fa-edit"></i> Update
							</button>
						</form>
						<!-- Then Delete -->
						<a href="/admin/menu/delete/<%= menu.getId() %>" class="btn btn-danger btn-sm">
							<i class="fas fa-trash-alt"></i> Delete
						</a>
					</td>
				</tr>
				<% 
                        }
                    } else { 
                %>
				<tr>
					<td colspan="5" class="text-center text-danger">No menu items available.</td>
				</tr>
				<% } %>
			</tbody>
		</table>

		<div class="text-center mt-4">
			<a href="http://localhost:8080/api/admin/dashboard"
				class="btn btn-secondary"> 
				<i class="fas fa-arrow-left"></i> Back to Dashboard
			</a> 
			<a href="/admin/menu/add" class="btn btn-success"> 
				<i class="fas fa-plus-circle"></i> Add Menu Item
			</a>
		</div>
	</div>

</body>
</html>

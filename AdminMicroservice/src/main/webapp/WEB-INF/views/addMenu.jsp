<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Menu Item</title>

<!-- Bootstrap & Fonts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to bottom right, rgba(0, 43, 92, 0.85),
		rgba(227, 24, 55, 0.85)),
		url('https://images.unsplash.com/photo-1601924582971-1c2f97fe96bc?auto=format&fit=crop&w=1950&q=80')
		no-repeat center center fixed;
	background-size: cover;
	font-family: 'Roboto', sans-serif;
	color: #fff;
}

.form-container {
	max-width: 550px;
	background-color: #ffffff;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

h2 {
	color: #e31837;
	font-weight: bold;
}

label {
	font-weight: 600;
	color: #002b5c;
}

.btn-success {
	background-color: #e31837;
	border: none;
}

.btn-success:hover {
	background-color: #c91630;
}

.btn-secondary {
	background-color: #002b5c;
	border: none;
}

.btn-secondary:hover {
	background-color: #001a4d;
}

.form-group i {
	color: #e31837;
	margin-right: 5px;
}

.btn i {
	margin-right: 5px;
}
</style>
</head>
<body>
	<div
		class="container d-flex justify-content-center align-items-center vh-100">
		<div class="form-container">
			<h2 class="text-center mb-4">
				<i class="fas fa-plus-circle"></i> Add New Menu Item
			</h2>

			<form action="/admin/menu/one" method="post">
				<div class="form-group">
					<label for="name"><i class="fas fa-pizza-slice"></i> Item
						Name:</label> <input type="text" class="form-control" id="name"
						name="name" required>
				</div>

				<div class="form-group">
					<label for="category"><i class="fas fa-layer-group"></i>
						Category:</label> <select class="form-control" id="category"
						name="category" required>
						<option value="Pizza">Pizza</option>
						<option value="Sides">Sides</option>
						<option value="Beverages">Beverages</option>
					</select>
				</div>

				<div class="form-group">
					<label for="price"><i class="fas fa-rupee-sign"></i> Price
						(Rs):</label> <input type="number" class="form-control" id="price"
						name="price" required>
				</div>

				<button type="submit" class="btn btn-success btn-block">
					<i class="fas fa-plus"></i> Add Item
				</button>
			</form>

			<a href="/admin/menu" class="btn btn-secondary btn-block mt-3"> <i
				class="fas fa-arrow-left"></i> Back to Menu
			</a>
		</div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Domino's Admin - Register</title>

<!-- Bootstrap & Google Fonts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap"
	rel="stylesheet" />

<style>
body {
	background: linear-gradient(to right, #002B5C, #E31837);
	min-height: 100vh;
	font-family: 'Rubik', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
}

.register-box {
	background-color: #ffffff;
	padding: 40px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
	width: 100%;
	max-width: 460px;
}

.brand-title {
	font-size: 2rem;
	color: #E31837;
	text-align: center;
	margin-bottom: 10px;
	font-weight: bold;
}

.highlight-text {
	color: #002B5C;
	font-weight: bold;
	text-align: center;
	margin-bottom: 20px;
}

.pizza-icon {
	text-align: center;
	margin-bottom: 15px;
}

.pizza-icon img {
	width: 60px;
}

.form-control {
	background-color: #f1f1f1;
	border: 2px solid #ccc;
	border-radius: 8px;
}

.form-control:focus {
	box-shadow: 0 0 10px #002B5C;
	border-color: #002B5C;
}

.btn-register {
	background-color: #002B5C;
	border: none;
	border-radius: 25px;
	font-weight: bold;
	color: white;
	font-size: 1.1rem;
	transition: background-color 0.3s ease;
}

.btn-register:hover {
	background-color: #E31837;
}

label {
	font-weight: bold;
	color: #333;
}

.login-link {
	text-align: center;
	margin-top: 20px;
}

.login-link a {
	color: #002B5C;
	font-weight: bold;
	text-decoration: none;
}

.login-link a:hover {
	color: #E31837;
}

.alert-danger {
	background-color: #ffe2e2;
	color: #B00020;
	border: 1px solid #E31837;
}
</style>
</head>
<body>

	<div class="register-box">
		<!-- Pizza Icon -->
		<div class="pizza-icon">
			<img src="https://cdn-icons-png.flaticon.com/512/1404/1404945.png"
				alt="Pizza Icon" />
		</div>
		<div class="brand-title">Domino's Admin Portal</div>
		<p class="highlight-text">Create your admin account 🍕</p>

		<!-- Error Message -->
		<% String errorMessage = (String) request.getAttribute("message"); %>
		<% if (errorMessage != null) { %>
		<div class="alert alert-danger text-center"><%= errorMessage %></div>
		<% } %>

		<form action="/api/admin/register" method="POST">
			<!-- Username -->
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username" class="form-control"
					placeholder="Enter your username" required />
			</div>

			<!-- Email -->
			<div class="form-group">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" class="form-control" placeholder="Enter your email"
					required />
			</div>

			<!-- Password -->
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" class="form-control"
					placeholder="Create a password" required />
			</div>

			<!-- Register Button -->
			<button type="submit" class="btn btn-register btn-block mt-3">Register</button>
		</form>

		<div class="login-link">
			<a href="/api/admin/login">Already an admin? Login here</a>
		</div>
	</div>

</body>
</html>

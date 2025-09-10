<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Domino's Register</title>

<!-- Bootstrap & Google Fonts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>

<!-- Custom CSS -->
<style>
body {
	background: linear-gradient(to right, #002B5C, #E31837);
	font-family: 'Rubik', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

.register-box {
	background-color: #ffffff;
	padding: 40px;
	border-radius: 18px;
	max-width: 460px;
	width: 100%;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
}

.logo {
	text-align: center;
	margin-bottom: 20px;
}

.logo img {
	width: 60px;
}

h2 {
	color: #E31837;
	text-align: center;
	font-weight: bold;
	margin-bottom: 10px;
}

.highlight-text {
	color: #002B5C;
	font-weight: bold;
	text-align: center;
	margin-bottom: 20px;
}

.form-group label {
	color: #002B5C;
	font-weight: bold;
	display: flex;
	align-items: center;
}

.form-group label i {
	margin-right: 8px;
	color: #E31837;
}

.form-control {
	background-color: #f1f1f1;
	border: 2px solid #ccc;
	border-radius: 8px;
	padding: 12px;
	transition: border-color 0.3s;
}

.form-control:focus {
	border-color: #002B5C;
	box-shadow: 0 0 10px #002B5C;
}

.btn-register {
	background-color: #002B5C;
	color: white;
	font-weight: bold;
	width: 100%;
	padding: 12px;
	border: none;
	border-radius: 25px;
	font-size: 1.1rem;
	transition: background-color 0.3s ease;
}

.btn-register:hover {
	background-color: #E31837;
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

.alert {
	font-size: 0.9rem;
	background-color: #ffe2e2;
	color: #B00020;
	border: 1px solid #E31837;
}
</style>
</head>
<body>

	<div class="register-box">
		<div class="logo">
			<img src="https://cdn-icons-png.flaticon.com/512/1404/1404945.png"
				alt="Pizza Icon">
		</div>

		<h2>Domino's Pizza Store</h2>
		<p class="highlight-text">Create your account 🍕</p>

		<%
		String errorMessage = (String) request.getAttribute("message");
		if (errorMessage != null) {
		%>
		<div class="alert text-center"><%= errorMessage %></div>
		<%
		}
		%>

		<form action="/api/users/register" method="POST">
			<div class="form-group">
				<label for="username"><i class="fas fa-user"></i> Username</label> <input
					type="text" id="username" name="username" class="form-control"
					placeholder="PizzaLover123" required>
			</div>
			<div class="form-group">
				<label for="email"><i class="fas fa-envelope"></i> Email</label> <input
					type="email" id="email" name="email" class="form-control"
					placeholder="toppings@example.com" required>
			</div>
			<div class="form-group">
				<label for="password"><i class="fas fa-lock"></i> Password</label> <input
					type="password" id="password" name="password" class="form-control"
					placeholder="••••••••" required>
			</div>
			<button type="submit" class="btn btn-register mt-3">Register</button>
		</form>

		<div class="login-link">
			<a href="/api/users/login">Already a user? Login here</a>
		</div>
	</div>

</body>
</html>

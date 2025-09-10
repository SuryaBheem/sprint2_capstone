<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Pizza Delight Admin - Login</title>

<!-- Bootstrap & Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&family=Roboto&display=swap"
	rel="stylesheet" />

<style>
body {
	background: linear-gradient(to right, #006491, #e4002b);
	min-height: 100vh;
	font-family: 'Roboto', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
}

.login-box {
	background-color: #ffffff;
	padding: 40px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
	width: 100%;
	max-width: 460px;
}

.brand-title {
	font-family: 'Pacifico', cursive;
	font-size: 2.5rem;
	color: #002B5C;
	text-align: center;
	margin-bottom: 10px;
}

.highlight-text {
	color: #E31837;
	font-weight: bold;
	text-align: center;
	margin-bottom: 20px;
}

.pizza-icon {
	text-align: center;
	margin-bottom: 15px;
}

.pizza-icon img {
	width: 70px;
	animation: float 3s ease-in-out infinite;
}

@
keyframes float { 0%, 100% {
	transform: translateY(0);
}

50
%
{
transform
:
translateY(
-10px
);
}
}
.form-control {
	background-color: #f1f1f1;
	border: 2px solid #ccc;
	border-left: none;
	border-radius: 0 8px 8px 0;
}

.form-control:focus {
	box-shadow: 0 0 10px #002B5C;
	border-color: #002B5C;
}

.btn-login {
	background-color: #002B5C;
	border: none;
	border-radius: 25px;
	font-weight: bold;
	color: white;
	font-size: 1.1rem;
	transition: background-color 0.3s ease;
}

.btn-login:hover {
	background-color: #E31837;
	color: white;
}

label {
	font-weight: bold;
	color: #333;
}

.register-link {
	text-align: center;
	margin-top: 20px;
}

.register-link a {
	color: #002B5C;
	font-weight: bold;
	text-decoration: none;
}

.register-link a:hover {
	color: #E31837;
}

.alert-success {
	background-color: #e7f9f0;
	color: #1e7e34;
	border: 1px solid #28a745;
}

.input-group-text {
	border: none;
	padding: 0;
}

.icon-circle {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	font-size: 1.2rem;
}

.bg-blue {
	background-color: #002B5C;
	color: white;
}

.bg-red {
	background-color: #E31837;
	color: white;
}
</style>
</head>
<body>

	<div class="login-box">
		<div class="pizza-icon">
			<img src="https://cdn-icons-png.flaticon.com/512/1404/1404945.png"
				alt="Pizza Icon" />
		</div>
		<div class="brand-title">Pizza Delight Admin</div>
		<p class="highlight-text">Welcome back! Please login 🍕</p>

		<!-- Display logout message -->
		<% String logoutMessage = (String) request.getAttribute("logoutMessage"); %>
		<% if (logoutMessage != null) { %>
		<div class="alert alert-success text-center"><%= logoutMessage %></div>
		<% } %>

		<!-- Login Form -->
		<form action="/api/admin/login" method="POST">
			<!-- Email -->
			<div class="form-group">
				<label for="email">Email</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text icon-circle bg-blue"> <i
							class="fas fa-envelope"></i>
						</span>
					</div>
					<input type="email" id="email" name="email" class="form-control"
						placeholder="Enter your email" required />
				</div>
			</div>

			<!-- Password -->
			<div class="form-group">
				<label for="password">Password</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text icon-circle bg-red"> <i
							class="fas fa-lock"></i>
						</span>
					</div>
					<input type="password" id="password" name="password"
						class="form-control" placeholder="Enter your password" required />
				</div>
			</div>

			<!-- Login Button -->
			<button type="submit" class="btn btn-login btn-block mt-3">Log
				In</button>
		</form>

		<div class="register-link">
			<a href="/api/admin/register">Don't have an account? Register
				here</a>
		</div>
	</div>

</body>
</html>

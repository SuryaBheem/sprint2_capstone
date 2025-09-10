<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Success</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background: linear-gradient(to right, #002b5c, #e31837);
	color: white;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	background-color: rgba(255, 255, 255, 0.95);
	padding: 40px;
	border-radius: 20px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
	text-align: center;
}

h2 {
	color: #28a745;
	font-weight: bold;
}

.btn-primary {
	background-color: #002b5c;
	border: none;
	font-weight: 600;
}

.btn-primary:hover {
	background-color: #001c3e;
}
</style>
</head>
<body>
	<div class="container">
		<h2>${message}</h2>
		<div class="mt-4">
			<a href="/api/admin/login" class="btn btn-primary">Go to Login</a>
		</div>
	</div>
</body>
</html>

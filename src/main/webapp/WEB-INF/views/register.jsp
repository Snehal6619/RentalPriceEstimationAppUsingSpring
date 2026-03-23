<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>User Registration</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<style>
body {
	background: url("https://images.unsplash.com/photo-1600585154340-be6161a56a0c") no-repeat center center/cover;
	position: relative;
	margin: 0;
}

/* Dark overlay */
body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.65);
	z-index: 0;
}

.overlay {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	position: relative;
	z-index: 1;
}

.main-container {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Glass card */
.card {
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(12px);
	border-radius: 20px;
	color: white;
	width: 400px;
}

.card h3 {
	font-weight: bold;
	background: linear-gradient(to right, #00c6ff, #0072ff);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.form-control {
	background: rgba(255, 255, 255, 0.85);
	border-radius: 10px;
}

.form-control:focus {
	box-shadow: 0 0 10px #00c6ff;
	border-color: #00c6ff;
}

.btn-primary {
	border-radius: 25px;
	font-weight: bold;
	transition: 0.3s;
}

.btn-primary:hover {
	background-color: #00c6ff;
	border-color: #00c6ff;
}

footer {
	background: rgba(0, 0, 0, 0.9);
}
</style>
</head>

<body>
	<div class="overlay">
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="home">RentPredictApp</a>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about">About</a></li>
						<li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
					</ul>

					<div>
						<a href="lg" class="btn btn-primary me-3">Login</a>
						<a href="reg" class="btn btn-outline-info">Register</a>
					</div>
				</div>
			</div>
		</nav>

		<!-- Registration Form -->
		<div class="main-container">
			<div class="card shadow p-4">
				<h3 class="text-center mb-4">Register Here</h3>

				<form id="regForm" onsubmit="return validateForm(event)">
					<div class="mb-3">
						<label class="form-label">Enter Your Name</label>
						<input type="text" class="form-control" id="username" required />
					</div>

					<div class="mb-3">
						<label class="form-label">Email</label>
						<input type="email" class="form-control" id="email" required />
					</div>

					<div class="mb-3">
						<label class="form-label">Contact</label>
						<input type="text" class="form-control" id="contact" required />
					</div>

					<div class="mb-3">
						<label class="form-label">Password</label>
						<input type="password" class="form-control" id="password" required />
					</div>

					<div class="d-grid gap-2">
						<button type="submit" class="btn btn-primary">Register</button>
						<button type="reset" class="btn btn-secondary">Cancel</button>
					</div>
				</form>
			</div>
		</div>

		<!-- Footer -->
		<footer class="text-white text-center p-3">
			© 2026 Rental Price Prediction System
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
function validateForm(event)
{
event.preventDefault();

let username=document.getElementById("username").value.trim();
let email=document.getElementById("email").value.trim();
let contact=document.getElementById("contact").value.trim();
let password=document.getElementById("password").value.trim();

if(username==""){ alert("Name is required"); return false; }
if(username.length<3){ alert("Name must be at least 3 characters"); return false; }

let emailPattern=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;
if(!emailPattern.test(email)){ alert("Enter valid email"); return false; }

let phonePattern=/^[0-9]{10}$/;
if(!phonePattern.test(contact)){ alert("Contact must be 10 digits"); return false; }

if(password.length<6){ alert("Password must be at least 6 characters"); return false; }

let user={ username,email,contact,password };

fetch("register",{
method:"POST",
headers:{ "Content-Type":"application/json" },
body: JSON.stringify(user)
})
.then(res => res.text())
.then(msg => {
alert(msg);
})
.catch(err=>{
console.log(err);
alert(err);
});

return false;
}
</script>
</body>
</html>
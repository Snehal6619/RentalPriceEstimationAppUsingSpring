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
        background-image: url(<%=request.getContextPath()%>/resources/images/housebg.png");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	margin: 0;
}

.overlay {
	background-color: rgba(255, 255, 255, 0.4);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.main-container {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
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
						<li class="nav-item"><a class="nav-link" href="home">Home</a>
						</li>

						<li class="nav-item"><a class="nav-link active" href="about">About</a>
						</li>

						<li class="nav-item"><a class="nav-link" href="contact">Contact</a>
						</li>
					</ul>

					<div>
						<a href="lg" class="btn btn-primary me-3">Login</a> <a href="reg"
							class="btn btn-outline-info">Register</a>
					</div>
				</div>
			</div>
		</nav>

		<!-- Registration Form -->

		<div class="main-container">
			<div class="card shadow p-4" style="width: 400px">
				<h3 class="text-center mb-4">Register Here</h3>

				<form id="regForm" onsubmit="return validateForm(event)">
					<div class="mb-3">
						<label class="form-label">Enter Your Name</label> <input
							type="text" class="form-control" autofocus="autofocus" required
							id="username" />
					</div>

					<div class="mb-3">
						<label class="form-label">Email</label> <input type="email"
							class="form-control" required id="email" />
					</div>

					<div class="mb-3">
						<label class="form-label">Contact</label> <input type="text"
							class="form-control" required id="contact" />
					</div>

					<div class="mb-3">
						<label class="form-label">Password</label> <input type="password"
							class="form-control" required id="password" />
					</div>

					<div class="d-grid gap-2">
						<button type="submit" class="btn btn-primary">Register</button>

						<button type="reset" class="btn btn-secondary">Cancel</button>
					</div>
				</form>
			</div>
		</div>

		<!-- Footer -->

		<footer class="bg-dark text-white text-center p-3"> © 2026
			Rental Price Prediction System </footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>

function validateForm(event)
{

event.preventDefault(); // page reload stop

let username=document.getElementById("username").value.trim();
let email=document.getElementById("email").value.trim();
let contact=document.getElementById("contact").value.trim();
let password=document.getElementById("password").value.trim();


// Validation

if(username=="")
{
alert("Name is required");
return false;
}

if(username.length<3)
{
alert("Name must be at least 3 characters");
return false;
}

let emailPattern=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;

if(!emailPattern.test(email))
{
alert("Enter valid email");
return false;
}

let phonePattern=/^[0-9]{10}$/;

if(!phonePattern.test(contact))
{
alert("Contact must be 10 digits");
return false;
}

if(password.length<6)
{
alert("Password must be at least 6 characters");
return false;
}


// Object create

let user={
username:username,
email:email,
contact:contact,
password:password
};


// Fetch API
		 fetch("register",{
		      method:"POST",
		      headers:{
		         "Content-Type":"application/json"
		      },
		      body: JSON.stringify(user)
		   })
		   .then(res => res.text())
		   .then(msg => {
			alert(msg);
			console.log(msg);
		   }).
		   catch((err)=>{
				console.log(err);
			   alert(err);
		   });
return false;
}

</script>
</body>
</html>
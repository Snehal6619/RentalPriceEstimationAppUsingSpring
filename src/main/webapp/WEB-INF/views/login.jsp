<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Rental Price Estimation</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <style>
      body {
        background-image: url(<%=request.getContextPath()%>/resources/images/housebg.png");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
      }

      /* light transparent overlay */
      .overlay {
        /* image che transparency jar kami jast kara y che asle tar he 0.3 vali value change kara y che  */
        background-color: rgba(255, 255, 255, 0.3);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
      }
    </style>
  </head>

  <body>
    <div class="overlay">
      <!-- Navbar -->
       <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="home">RentPredictApp</a>

        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a class="nav-link" href="home">Home</a>
            </li>

            <li class="nav-item">
              <a class="nav-link active" href="about">About</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="contact">Contact</a>
            </li>
          </ul>

          <div>
            <a href="lg" class="btn btn-primary me-3">Login</a>
            <a href="reg" class="btn btn-outline-info">Register</a>
          </div>
        </div>
      </div>
    </nav>

      <!-- Login Section -->
      <div
        class="container flex-grow-1 d-flex justify-content-center align-items-center"
      >
        <div class="col-md-4">
          <div class="card shadow p-4">
            <h3 class="text-center mb-4">Login Here</h3>

           <form id="loginForm" onsubmit="return loginUser(event)">
              <div class="mb-3">
                <label class="form-label">Username</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Enter username"
                  autofocus="autofocus"
                  id="username"
                  required="required"
                />
              </div>

              <div class="mb-3">
                <label class="form-label">Password</label>
                <input
                  type="password"
                  class="form-control"
                  placeholder="Enter password"
                  required="required"
                  id="password"
                />
              </div>

              <div class="d-flex">
                <button type="submit" class="btn btn-primary me-5">
                  Login
                </button>

                <button type="reset" class="btn btn-secondary">Cancel</button>
              </div>
              <div id="msg" class="text-danger mt-2"></div>
            </form>
          </div>
        </div>
      </div>

      <!-- Footer -->
     <footer class="bg-dark text-light pt-4 mt-auto">
      <div class="container">
        <div class="row">

        <!-- Copyright -->
        <div class="text-center pb-3">
          © 2026 Rental Price Estimation System | All Rights Reserved
        </div>
      </div>
    </footer>
 </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <script>

function loginUser(event)
{

event.preventDefault(); // form reload stop

let username=document.getElementById("username").value.trim();
let password=document.getElementById("password").value.trim();


// validation

if(username=="")
{
alert("Username required");
return false;
}

if(username.length<3)
{
alert("Username must be minimum 3 characters");
return false;
}

if(password=="")
{
alert("Password required");
return false;
}

if(password.length<6)
{
alert("Password must be minimum 6 characters");
return false;
}


// object create

let user={
username:username,
password:password
};


// fetch API

fetch("login",{
	      method:"POST",
	      headers:{
	         "Content-Type":"application/json"
	      },
	      body: JSON.stringify(user)
	   }).
	  then((res)=>res.text())
	 .then(msg => {

	      if(msg === "User Login Success"){
	          window.location.href="${pageContext.request.contextPath}/user/userDashboard";
	      }
	      else if(msg ==="Admin Login Success")
	    	  {
	    	  window.location.href="${pageContext.request.contextPath}/admin/adminDashboard";
	    	  }
	      else{
	          document.getElementById("msg").innerHTML = msg;
	      }
	   }).
	catch((err)=>{
		console.log(err);
	});
return false;

}

</script>
  </body>
</html>
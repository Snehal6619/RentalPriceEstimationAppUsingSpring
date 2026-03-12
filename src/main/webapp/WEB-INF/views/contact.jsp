<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact - Rental Price Estimation</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>

  <body class="bg-light d-flex flex-column min-vh-100">
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

    <!-- Contact Section -->
    <div class="container mt-5 flex-grow-1">
      <div class="row align-items-center mt-4">
        <!-- Left Image -->
        <div class="col-md-6 text-center">
          <img
             src="<%= request.getContextPath()%>/resources/img/contactImg.avif"
            class="img-fluid"
            style="max-width: 500px"
            alt="Contact Image"
          />
        </div>

        <!-- Contact Form -->
        <div class="col-md-6">
          <div class="card shadow p-4">
            <h3 class="mb-3 text-center">Contact Us</h3>

           <form id="contactForm" onsubmit="return sendInquiry(event)">
              <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Enter your name"
                  autofocus="autofocus"
                  required="required"
                  id="name"
                />
              </div>

              <div class="mb-3">
                <label class="form-label">Email</label>
                <input
                  type="email"
                  class="form-control"
                  placeholder="Enter your email"
                  id="email"
                  required="required"
                />
              </div>

              <div class="mb-3">
                <label class="form-label">Message</label>
                <textarea
                  class="form-control"
                  rows="4"
                  placeholder="Write your message"
                  id="message"
                ></textarea>
              </div>

              <button type="submit" class="btn btn-success w-100">
                Send Inquiry
              </button>
            </form>
          </div>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <script>

function sendInquiry(event)
{

event.preventDefault(); // page reload stop

let name=document.getElementById("name").value.trim();
let email=document.getElementById("email").value.trim();
let message=document.getElementById("message").value.trim();


// validation

if(name=="")
{
alert("Name is required");
return false;
}

if(name.length<3)
{
alert("Name must be minimum 3 characters");
return false;
}

let emailPattern=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;

if(!emailPattern.test(email))
{
alert("Enter valid email");
return false;
}

if(message=="")
{
alert("Message cannot be empty");
return false;
}


// object

let inquiry={
name:name,
email:email,
message:message
};


// fetch API

fetch("saveInquiry",
{
method:"POST",

headers:
{
"Content-Type":"application/json"
},

body:JSON.stringify(inquiry)

})

.then(response=>response.text())

.then(data=>{
alert(data);
document.getElementById("contactForm").reset();
})

.catch(error=>{
alert("Error : "+error);
});

return false;

}

</script>
  </body>
</html>
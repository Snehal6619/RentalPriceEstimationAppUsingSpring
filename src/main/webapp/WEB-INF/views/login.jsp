<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Rental Price Estimation</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <style>
      body {
        background: url("https://images.unsplash.com/photo-1600585154340-be6161a56a0c") no-repeat center center/cover;
        position: relative;
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

      .container,
      .navbar,
      footer {
        position: relative;
        z-index: 1;
      }

      /* Glass Card */
      .card {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
        border-radius: 20px;
        color: white;
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
         
          <a class="navbar-brand fw-bold d-flex align-items-center" href="#">
  <i class="fa-solid fa-house text-warning me-2 fs-4"></i>
  <span class="fs-5">RentPredictApp</span>
</a>

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
                <a class="nav-link" href="about">About</a>
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
      <div class="container flex-grow-1 d-flex justify-content-center align-items-center">
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
                  id="username"
                  required
                />
              </div>

              <div class="mb-3">
                <label class="form-label">Password</label>
                <input
                  type="password"
                  class="form-control"
                  placeholder="Enter password"
                  id="password"
                  required
                />
              </div>

              <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Login</button>
                <button type="reset" class="btn btn-secondary">Cancel</button>
              </div>

              <div id="msg" class="text-warning mt-2"></div>
            </form>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <footer class="text-light pt-4 mt-auto">
        <div class="container">
          <div class="text-center pb-3">
            © 2026 Rental Price Estimation System | All Rights Reserved
          </div>
        </div>
      </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <script>
      function loginUser(event) {
        event.preventDefault();

        let username = document.getElementById("username").value.trim();
        let password = document.getElementById("password").value.trim();

        if (username == "") {
          alert("Username required");
          return false;
        }

        if (username.length < 3) {
          alert("Username must be minimum 3 characters");
          return false;
        }

        if (password == "") {
          alert("Password required");
          return false;
        }

        if (password.length < 6) {
          alert("Password must be minimum 6 characters");
          return false;
        }

        let user = {
          username: username,
          password: password
        };

        fetch("login", {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify(user)
        })
          .then(res => res.text())
          .then(msg => {
            if (msg === "User Login Success") {
              window.location.href = "${pageContext.request.contextPath}/user/userDashboard";
            } else if (msg === "Admin Login Success") {
              window.location.href = "${pageContext.request.contextPath}/admin/adminDashboard";
            } else {
              document.getElementById("msg").innerHTML = msg;
            }
          })
          .catch(err => console.log(err));

        return false;
      }
    </script>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home page</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>

  <body class="bg-light d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="#">RentPredictApp</a>

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
              <a class="nav-link active" href="home">Home</a>
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

    <!-- Main Section -->
    <div class="container mt-5 flex-grow-1">
      <div class="row align-items-center mt-5">
        <!-- Left Image -->
        <div class="col-md-6 text-center">
          <img
            src="<%= request.getContextPath()%>/resources/img/homeImg.jpeg"
            class="img-fluid"
            style="max-width: 600px"
            alt="Rental Price Estimation Logo"
          />
        </div>

        <!-- Right Card Content -->
        <div class="col-md-6">
          <div class="card shadow p-4">
            <h2 class="display-3 text-center text-black fw-bold mb-3">Welcome to Rental Price Estimation System</h2>
          </div>
        </div>
      </div>
    </div>

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
  </body>
</html>
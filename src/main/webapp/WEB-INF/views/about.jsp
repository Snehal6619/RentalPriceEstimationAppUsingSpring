<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About - Rental Price Estimation</title>

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

    <!-- About Section -->
    <div class="container mt-5 flex-grow-1">
      <div class="row justify-content-center">
        <div class="col-md-10">
          <div class="card shadow p-4">
            <h2 class="text-center mb-4">About Our System</h2>

            <p>
              The Rental Price Estimation Model is a machine learning-based
              system designed to predict the monthly rental price of properties
              using historical rental data. The system uses a Linear Regression
              algorithm to analyze the relationship between property features
              and rental prices.
            </p>

            <p>
              The model considers various factors such as: State City Location
              Area (square feet) Number of bedrooms Number of bathrooms
              Amenities (parking, lift, security) Proximity to facilities
              (metro, school, hospital) After training on past rental listings,
              the system predicts rent for new properties. This helps landlords
              set competitive prices and tenants understand fair market value
            </p>

            <h5 class="mt-4">Main Features</h5>

            <ul>
              <li>User registration and login system</li>

              <li>Admin management system</li>

              <li>Add and manage property information</li>

              <li>To develop a rental price prediction system</li>

              <li>To implement Linear Regression algorithm</li>

              <li>Simple and user-friendly web interface</li>
            </ul>
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
  </body>
</html>
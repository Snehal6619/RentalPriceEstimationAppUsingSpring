<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <style>
      body.bg-slider {
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        animation: bgFade 25s infinite;
      }

      @keyframes bgFade {
        0% {
          background-image: url("https://images.unsplash.com/photo-1560448204-e02f11c3d0e2");
        }
        25% {
          background-image: url("https://images.unsplash.com/photo-1507089947368-19c1da9775ae");
        }
        50% {
          background-image: url("https://images.unsplash.com/photo-1572120360610-d971b9d7767c");
        }
        75% {
          background-image: url("https://images.unsplash.com/photo-1600585154340-be6161a56a0c");
        }
        100% {
          background-image: url("https://images.unsplash.com/photo-1560448204-e02f11c3d0e2");
        }
      }

      /* HERO SECTION */
      .hero {
        height: 80vh;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: black;
      }

      .hero h1 {
        font-size: 48px;
        font-weight: bold;
        background: linear-gradient(to right, #00c6ff, #0072ff);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
      }

      .hero p {
        font-size: 18px;
        margin-top: 10px;
      }

      .hero .btn {
        margin-top: 20px;
        padding: 10px 25px;
        font-size: 18px;
        border-radius: 30px;
      }

      .container,
      .navbar,
      footer {
        position: relative;
        z-index: 1;
      }

      footer {
        background: rgba(0, 0, 0, 0.9);
      }
    </style>
  </head>

  <body class="bg-slider d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        
        <a class="navbar-brand fw-bold d-flex align-items-center" href="#">
  <i class="fa-solid fa-house text-warning me-2 fs-4"></i>
  <span class="fs-5">RentPredict</span>
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
            <a href="lg" class="btn btn-outline-light me-2">Login</a>
            <a  href="reg" class="btn btn-success">Register</a>
          </div>
        </div>
      </div>
    </nav>

    <!-- 🔥 HERO SECTION -->
    <div class="hero">
      <div>
        <h1>Welcome to RentPredict</h1>
        <p>
          Predict rental prices smartly using advanced data & machine learning
        </p>
        <a  href="reg" class="btn btn-primary">Get Started</a>
      </div>
    </div>

    <!-- Footer -->
    <footer class="text-light pt-4 mt-auto">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <h5>RentPredictApp</h5>
            <p>
              Rental Price Estimation System helps users predict property rental
              prices using property data and machine learning techniques.
            </p>
          </div>

          <div class="col-md-4">
            <h5>Quick Links</h5>
            <ul class="list-unstyled">
              <li><a  href="home" class="text-light">Home</a></li>
              <li><a href="about" class="text-light">About</a></li>
              <li><a href="contact" class="text-light">Contact</a></li>
              <li><a href="lg" class="text-light">Login</a></li>
            </ul>
          </div>

          <div class="col-md-4">
            <h5>Contact</h5>
            <p>Email: rentpredict@gmail.com</p>
            <p>Phone: +91 9876543210</p>
            <p>Location: Pune, India</p>
          </div>
        </div>

        <hr class="bg-light" />
        <div class="text-center pb-3">
          © 2026 Rental Price Estimation System | All Rights Reserved
        </div>
      </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
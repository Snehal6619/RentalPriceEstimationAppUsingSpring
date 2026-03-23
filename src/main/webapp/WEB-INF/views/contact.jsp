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

    <style>
      body {
        background: url("https://images.unsplash.com/photo-1507089947368-19c1da9775ae") no-repeat center center/cover;
        position: relative;
      }

      /* Overlay */
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

      .container,
      .navbar,
      footer {
        position: relative;
        z-index: 1;
      }

      /* Center Section */
      .contact-box {
        height: 80vh;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      /* Glass Card */
      .card {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
        border-radius: 20px;
        color: white;
        width: 100%;
        max-width: 450px;
      }

      /* Heading Style */
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

      .btn-success {
        border-radius: 25px;
        font-weight: bold;
        transition: 0.3s;
      }

      .btn-success:hover {
        background-color: #00c6ff;
        border-color: #00c6ff;
      }

      footer {
        background: rgba(0, 0, 0, 0.9);
      }
    </style>
  </head>

  <body class="d-flex flex-column min-vh-100">
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
              <a class="nav-link" href="about">About</a>
            </li>

            <li class="nav-item">
              <a class="nav-link active" href="contact">Contact</a>
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
    <div class="container flex-grow-1 contact-box">
      <div class="card shadow p-4">
        <h3 class="mb-3 text-center">Contact Us</h3>

        <form id="contactForm" onsubmit="return sendInquiry(event)">
          <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" placeholder="Enter your name" id="name" required />
          </div>

          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" placeholder="Enter your email" id="email" required />
          </div>

          <div class="mb-3">
            <label class="form-label">Message</label>
            <textarea class="form-control" rows="4" placeholder="Write your message" id="message"></textarea>
          </div>

          <button type="submit" class="btn btn-success w-100">
            Send Inquiry
          </button>
        </form>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <script>
      function sendInquiry(event) {
        event.preventDefault();

        let name = document.getElementById("name").value.trim();
        let email = document.getElementById("email").value.trim();
        let message = document.getElementById("message").value.trim();

        if (name == "") {
          alert("Name is required");
          return false;
        }

        if (name.length < 3) {
          alert("Name must be minimum 3 characters");
          return false;
        }

        let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailPattern.test(email)) {
          alert("Enter valid email");
          return false;
        }

        if (message == "") {
          alert("Message cannot be empty");
          return false;
        }

        let inquiry = { name, email, message };

        fetch("saveInquiry", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(inquiry)
        })
          .then(res => res.text())
          .then(data => {
            alert(data);
            document.getElementById("contactForm").reset();
          })
          .catch(err => alert("Error: " + err));

        return false;
      }
    </script>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.model.Customer" %>
<%
    Customer c = (Customer) session.getAttribute("customer");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Online Donation Management System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .hero {
            background: url('https://images.unsplash.com/photo-1583946263659-8c580b798a15?auto=format&fit=crop&w=1350&q=80') no-repeat center center;
            background-size: cover;
            color: white;
            height: 400px;
            position: relative;
        }
        .hero-overlay {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(0, 0, 0, 0.55);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .hero-text {
            text-align: center;
            max-width: 700px;
        }
        .section-icon {
            font-size: 48px;
            color: #0d6efd;
            margin-bottom: 15px;
        }
        .footer {
            background-color: #212529;
            color: #adb5bd;
            padding: 20px 0;
            text-align: center;
            margin-top: 60px;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: #fff !important;
            letter-spacing: 1.2px;
        }
        /* Prevent margin collapse with strong top margin below navbar */
        body > *:not(nav.navbar) {
            margin-top: 1rem;
        }
    </style>
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand" href="HomePage.jsp">Online Donation</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain" 
                aria-controls="navbarMain" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="customerHome.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewOrders">Orders</a>
                </li>
            </ul>
            <form class="d-flex">
                <a href="logout" class="btn btn-outline-light">Logout</a>
            </form>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero mb-5">
    <div class="hero-overlay">
        <div class="hero-text px-3">
            <h1 class="display-4 fw-bold">Welcome to Online Donation Management System, <%= c != null ? c.getName() : "Guest" %></h1>
            <p class="lead mt-3">Making a difference by connecting donors and those in need.<br>
            Donate blood, food, clothes, and more to bring hope and support to communities.</p>
        </div>
    </div>
</section>

<!-- About Section -->
<section class="container">
    <div class="row text-center mb-4">
        <h2 class="mb-3">About Donation Management</h2>
        <p class="col-md-8 mx-auto fs-5 text-secondary">
            Our platform helps coordinate donations efficiently and transparently. Whether it's blood for medical emergencies, food for the hungry, or clothing for those in need, we bring together donors and recipients to maximize positive impact.
        </p>
    </div>

    <!-- Donation Types -->
    <div class="row g-4">
        <!-- Blood Donation -->
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <i class="bi bi-droplet section-icon"></i>
                    <h4 class="card-title">Blood Donation</h4>
                    <p class="card-text text-muted">
                        Save lives by donating blood regularly. Our system matches you with hospitals and blood banks in urgent need.
                    </p>
                </div>
            </div>
        </div>

        <!-- Food Donation -->
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <i class="bi bi-basket section-icon"></i>
                    <h4 class="card-title">Food Donation</h4>
                    <p class="card-text text-muted">
                        Share non-perishable or cooked food with people in need. We help ensure food reaches local shelters and food banks.
                    </p>
                </div>
            </div>
        </div>

        <!-- Other Causes -->
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <i class="bi bi-heart-pulse section-icon"></i>
                    <h4 class="card-title">Other Donations</h4>
                    <p class="card-text text-muted">
                        Donate clothes, medicines, educational materials, or support emergency relief efforts through our trusted network.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Call to Action -->
<section class="text-center my-5">
    <div class="container">
        <h3>Ready to make a difference?</h3>
        <p>Join us today and start donating to transform lives.</p>
        <a href="donation.jsp" class="btn btn-primary btn-lg px-5">Register as Donor</a>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    &copy; 2025 Online Donation Management System. All rights reserved.
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

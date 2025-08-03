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
    <title>Customer Home - Your Company Name</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
            color: #333;
        }
        .card {
            border-radius: 1rem;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: #fff !important;
            letter-spacing: 1.2px;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 15px 0;
            text-align: center;
            font-size: 0.9rem;
            color: #6c757d;
            margin-top: 4rem;
        }
    </style>
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
                    <a class="nav-link active" aria-current="page" href="HomePage.jsp">Home</a>
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

<!-- Main Content -->
<div class="container d-flex align-items-center justify-content-center" style="min-height: 75vh;">
    <div class="card shadow-lg col-md-8 p-4">
        <div class="card-body text-center">
            <h1 class="mb-3">Welcome, <%= c.getName() %>!</h1>
            <p class="lead text-secondary mb-4">You have successfully logged in. Enjoy exploring our services and have a great experience.</p>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    &copy; 2025 Your Company Name. All rights reserved.
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

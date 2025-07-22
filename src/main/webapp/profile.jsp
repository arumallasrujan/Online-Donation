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
    <title>My Profile - Your Company Name</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
            color: #333;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: #fff !important;
            letter-spacing: 1.2px;
        }
        .card-profile {
            border-radius: 1rem;
            max-width: 600px;
            margin: 2rem auto;
            background-color: #fff;
            box-shadow: 0 8px 24px rgb(0 0 0 / 0.15);
        }
        .profile-label {
            font-weight: 600;
            color: #555;
        }
        footer.footer {
            background-color: #f8f9fa;
            padding: 15px 0;
            text-align: center;
            font-size: 0.9rem;
            color: #6c757d;
            margin-top: 4rem;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand" href="#">YourCompany</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain" 
                aria-controls="navbarMain" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="customerHome.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="profile.jsp">Profile</a>
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

<!-- Profile Card -->
<div class="card card-profile p-4">
    <h3 class="text-center mb-4">My Profile</h3>
    <div class="row mb-3">
        <div class="col-sm-4 profile-label">ID:</div>
        <div class="col-sm-8"><%= c.getId() %></div>
    </div>
    <div class="row mb-3">
        <div class="col-sm-4 profile-label">Name:</div>
        <div class="col-sm-8"><%= c.getName() %></div>
    </div>
    <div class="row mb-3">
        <div class="col-sm-4 profile-label">Gender:</div>
        <div class="col-sm-8"><%= c.getGender() %></div>
    </div>
    <div class="row mb-3">
        <div class="col-sm-4 profile-label">Date of Birth:</div>
        <div class="col-sm-8"><%= c.getDateofbirth() %></div>
    </div>
    <div class="row mb-3">
        <div class="col-sm-4 profile-label">Email:</div>
        <div class="col-sm-8"><%= c.getEmail() %></div>
    </div>
    <div class="row mb-3">
        <div class="col-sm-4 profile-label">Location:</div>
        <div class="col-sm-8"><%= c.getLocation() %></div>
    </div>
    <div class="row mb-0">
        <div class="col-sm-4 profile-label">Contact:</div>
        <div class="col-sm-8"><%= c.getContact() %></div>
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

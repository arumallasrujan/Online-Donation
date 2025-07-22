<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center mb-3">
        <div class="col-md-6 text-center">
            <span class="text-muted">Already a customer? 
                <a href="customerlogin.jsp" class="text-primary fw-bold text-decoration-none">Login here</a>
            </span>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg border-0">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0">Customer Registration Form</h3>
                </div>
                <div class="card-body">
                    <form method="post" action="insertcustomer">
                        <div class="mb-3">
                            <label class="form-label">Enter Name</label>
                            <input type="text" class="form-control" name="cname" placeholder="Enter your full name" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Select Gender</label><br>
                            <div class="form-check form-check-inline">
                                <input type="radio" name="cgender" class="form-check-input" value="Male" required>
                                <label class="form-check-label">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" name="cgender" class="form-check-input" value="Female" required>
                                <label class="form-check-label">Female</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" name="cgender" class="form-check-input" value="Others" required>
                                <label class="form-check-label">Others</label>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Select Date of Birth</label>
                            <input type="date" class="form-control" name="cdob" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Enter Email ID</label>
                            <input type="email" class="form-control" name="cemail" placeholder="example@domain.com" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Enter Password</label>
                            <input type="password" class="form-control" name="cpwd" placeholder="Create a strong password" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Enter Location</label>
                            <input type="text" class="form-control" name="clocation" placeholder="Your city or address" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Enter Contact</label>
                            <input type="tel" class="form-control" name="ccontact" placeholder="Phone number" pattern="[0-9]{10}" title="Enter 10 digit phone number" required>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success">Register</button>
                            <button type="reset" class="btn btn-secondary">Clear</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center text-muted">
                    &copy; 2025 Your Company
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS CDN (Optional, for any interactive components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

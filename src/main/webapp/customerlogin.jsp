<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Login</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h3>Customer Login Form</h3>
                </div>
                <div class="card-body">
                    <!-- Display message if present -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-danger text-center">${message}</div>
                    </c:if>

                    <form method="post" action="checkcustomerlogin">
                        <div class="mb-3">
                            <label class="form-label">Enter Email</label>
                            <input type="text" class="form-control" name="cemail" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Enter Password</label>
                            <input type="password" class="form-control" name="cpwd" required>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success">Login</button>
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

<!-- Bootstrap JS CDN (optional for Bootstrap components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

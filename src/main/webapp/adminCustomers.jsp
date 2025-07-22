<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Customers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-5">
    <h2>All Registered Customers</h2>
    
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary mb-3">Back to Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/donations" class="btn btn-primary mb-3 ms-2">View All Donations</a>

    <table class="table table-bordered table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Email</th>
                <th>Location</th>
                <th>Contact</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.gender}</td>
                    <td>${customer.dateofbirth}</td>
                    <td>${customer.email}</td>
                    <td>${customer.location}</td>
                    <td>${customer.contact}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

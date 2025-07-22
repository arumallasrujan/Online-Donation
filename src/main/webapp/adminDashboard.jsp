<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-5 text-center">
    <h2>Welcome Admin</h2>
    <a href="${pageContext.request.contextPath}/admin/customers" class="btn btn-primary m-2">View All Customers</a>
    <a href="${pageContext.request.contextPath}/admin/donations" class="btn btn-primary m-2">View All Donations</a>
    <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-danger m-2">Logout</a>
</div>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Donations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-5">
    <h2>All Donations</h2>
    
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary mb-3">Back to Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/customers" class="btn btn-primary mb-3 ms-2">View All Customers</a>
    
    <table class="table table-bordered table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Donation Type</th>
                <th>Donor Name</th>
                <th>Donor Email</th>
                <th>Address</th>
                <th>Mobile</th>
                <th>Details</th>
                <th>Document</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="donation" items="${donations}">
                <tr>
                    <td>${donation.id}</td>
                    <td>${donation.donationType}</td>
                    <td>${donation.donorName}</td>
                    <td>${donation.donorEmail}</td>
                    <td>${donation.address}</td>
                    <td>${donation.mobile}</td>
                    <td>${donation.details}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty donation.documentPath}">
                                <a href="${pageContext.request.contextPath}/uploaded_docs/${donation.documentPath}" target="_blank">View</a>
                            </c:when>
                            <c:otherwise>
                                No Document
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

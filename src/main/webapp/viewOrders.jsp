<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Your Donations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h2>Your Donations</h2>
    <c:choose>
        <c:when test="${empty donations}">
            <div class="alert alert-info">You have not made any donations yet.</div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Donation Type</th>
                        <th>Donor Name</th>
                        <th>Address</th>
                        <th>Mobile</th>
                        <th>Details</th>
                        <th>Document</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="don" items="${donations}">
                        <tr>
                            <td>${don.donationType}</td>
                            <td>${don.donorName}</td>
                            <td>${don.address}</td>
                            <td>${don.mobile}</td>
                            <td>${don.details}</td>
                            <td>
                                <c:if test="${not empty don.documentPath}">
                                    <a href="${pageContext.request.contextPath}/files/${don.documentPath}" target="_blank" rel="noopener noreferrer" title="View the donation document">
                                        View Document
                                    </a>
                                </c:if>
                                <c:if test="${empty don.documentPath}">
                                    No Document
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
    <a href="${pageContext.request.contextPath}/donation" class="btn btn-primary mt-3">Make a New Donation</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

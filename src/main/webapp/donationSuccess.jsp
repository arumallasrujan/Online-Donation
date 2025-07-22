<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Donation" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donation Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-success">
        <h2>Thank You for Your Donation!</h2>
        <p>Your donation has been registered successfully.</p>
    </div>

    <h4>Donation Details</h4>
    <%
        Donation donation = (Donation) request.getAttribute("donation");
        if (donation == null) {
            donation = (Donation) session.getAttribute("donation");
        }
    %>
    <table class="table table-bordered">
        <tr><th>Donation Type</th><td><%= donation.getDonationType() %></td></tr>
        <tr><th>Donor Name</th><td><%= donation.getDonorName() %></td></tr>
        <tr><th>Address</th><td><%= donation.getAddress() %></td></tr>
        <tr><th>Mobile</th><td><%= donation.getMobile() %></td></tr>
        <tr><th>Details</th><td><%= donation.getDetails() %></td></tr>
    </table>

    <a href="donation" class="btn btn-primary">Make Another Donation</a>
    <a href="HomePage" class="btn btn-primary">Home</a>
</div>
</body>
</html>

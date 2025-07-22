<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Make a Donation</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
        }
        .card-header {
            background: #007bff;
            color: white;
            border-bottom: none;
        }
        .form-control, .form-select {
            border-radius: 12px;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
            border-radius: 12px;
        }
        .btn-outline-secondary {
            border-radius: 12px;
        }
        .card-footer {
            background: #f8f9fa;
        }
        .shadow-custom {
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<!-- Donation Form Section -->
<section class="my-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-7 col-lg-6">
        <div class="card shadow-custom">
          <div class="card-header text-center py-4">
            <h3 class="mb-0">Make a Donation</h3>
            <small class="opacity-75">Help make a difference by donating</small>
          </div>
          <div class="card-body p-4">
            <form method="post" action="submitDonation" enctype="multipart/form-data" autocomplete="off">
              
              <!-- Donation Type -->
              <div class="mb-3">
                <label for="donationType" class="form-label fw-semibold">Donation Type</label>
                <select class="form-select shadow-sm" id="donationType" name="donationType" required>
                  <option value="" disabled selected>Select donation type</option>
                  <option value="blood">Blood Donation</option>
                  <option value="food">Food Donation</option>
                  <option value="other">Other Donations</option>
                </select>
              </div>
              
              <!-- Donor Name -->
              <div class="mb-3">
                <label for="donorName" class="form-label fw-semibold">Your Name</label>
                <input type="text" id="donorName" name="donorName" class="form-control shadow-sm" placeholder="Full Name" required>
              </div>

              <!-- Address -->
              <div class="mb-3">
                <label for="address" class="form-label fw-semibold">Address</label>
                <textarea id="address" name="address" rows="2" class="form-control shadow-sm" placeholder="Your complete address" required></textarea>
              </div>

              <!-- Mobile Number -->
              <div class="mb-3">
                <label for="mobile" class="form-label fw-semibold">Mobile Number</label>
                <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" maxlength="10" class="form-control shadow-sm" placeholder="10-digit mobile number" required>
              </div>

              <!-- Donation Details -->
              <div class="mb-3">
                <label for="details" class="form-label fw-semibold">Details</label>
                <textarea id="details" name="details" rows="4" class="form-control shadow-sm" placeholder="Describe your donation (e.g., blood group, food type, items, etc.)" required></textarea>
              </div>

              <!-- Upload PDF -->
              <div class="mb-4">
                <label for="document" class="form-label fw-semibold">Upload Document (PDF)</label>
                <input type="file" id="document" name="document" accept="application/pdf" class="form-control shadow-sm" required>
                <small class="form-text text-muted">Attach certificates or proof of donation (max 2MB).</small>
              </div>

              <!-- Buttons -->
              <div class="d-grid gap-2">
                <button type="submit" class="btn btn-success btn-lg fw-semibold shadow-sm">Submit Donation</button>
                <button type="reset" class="btn btn-outline-secondary btn-lg fw-semibold shadow-sm">Clear Form</button>
              </div>

            </form>
          </div>
          <div class="card-footer text-center text-muted small">
            &copy; 2025 Your Company Name
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

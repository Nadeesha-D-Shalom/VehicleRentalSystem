<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Car Rental Reservation</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background: url('images/logWall.jpg') no-repeat center center fixed;
      background-size: cover;
      font-family: Arial, sans-serif;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.85);
      max-width: 700px;
      margin: 60px auto;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.25);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input, select {
      width: 100%;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }

    .row {
      display: flex;
      gap: 15px;
    }

    .row .form-group {
      flex: 1;
    }

    .submit-btn {
      width: 100%;
      padding: 12px;
      background-color: #28a745;
      color: white;
      font-weight: bold;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .submit-btn:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>
<div class="form-container">
  <h2>Car Rental Reservation form</h2>
  <form action="BookingServlet" method="post">
    <div class="row">
      <div class="form-group">
        <label>First Name</label>
        <input type="text" name="firstName" required>
      </div>
      <div class="form-group">
        <label>Last Name</label>
        <input type="text" name="lastName" required>
      </div>
    </div>

    <div class="form-group">
      <label>Age</label>
      <input type="number" name="age" required>
    </div>

    <div class="form-group">
      <label>Email</label>
      <input type="email" name="email" required>
    </div>

    <div class="form-group">
      <label>Phone Number</label>
      <input type="tel" name="phone" pattern="[0-9]{10}" required>
    </div>

    <div class="form-group">
      <label>Address</label>
      <input type="text" name="address1" placeholder="Street Address" required>
      <input type="text" name="address2" placeholder="Street Address Line 2">
      <div class="row">
        <div class="form-group">
          <input type="text" name="city" placeholder="City">
        </div>
        <div class="form-group">
          <input type="text" name="state" placeholder="State / Province">
        </div>
      </div>
      <input type="text" name="zip" placeholder="Postal / Zip Code">
    </div>

    <div class="row">
      <div class="form-group">
        <label>Pick-up Date</label>
        <input type="date" name="pickupDate" required>
      </div>
      <div class="form-group">
        <label>Drop-off Date</label>
        <input type="date" name="dropoffDate" required>
      </div>
    </div>

    <div class="row">
      <div class="form-group">
        <label>Pick-up Location</label>
        <input type="text" name="pickupLocation" required>
      </div>
      <div class="form-group">
        <label>Drop-off Location</label>
        <input type="text" name="dropoffLocation" required>
      </div>
    </div>

    <button type="submit" class="submit-btn">Submit</button>
  </form>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Booking Successful</title>

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f0f8ff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .message-box {
      background: white;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0,0,0,0.2);
      text-align: center;
      max-width: 600px;
    }
    h1 {
      color: green;
      margin-bottom: 20px;
    }
    p {
      font-size: 18px;
      color: #333;
    }
  </style>
</head>
<body>
<div class="message-box">
  <h1>Booking Successful ✅</h1>
  <p>Your booking was successfully received.</p>
  <p>Our team will contact you within <strong>12 hours</strong>.</p>
  <p>Please be patient. Thank you for choosing us!</p>
  <a href="dashboard.jsp">Back to Home</a>
</div>
</body>
</html>

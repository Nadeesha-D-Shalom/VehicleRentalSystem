<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Promotion" %>
<!DOCTYPE html>
<html>
<head>
  <title>Special Offers & Events | RentC</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: url('images/logWall.jpg') no-repeat center center fixed;
      padding: 30px;
    }
    h2 {
      text-align: center;
      color: #ffffff;
      margin-bottom: 30px;
      font-weight: 600;
    }
    .promo-card {
      border-radius: 16px;
      background-color: white;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      padding: 25px;
      margin-bottom: 25px;
      transition: transform 0.3s ease;
    }
    .promo-card:hover {
      transform: translateY(-5px);
    }
    .promo-title {
      font-size: 1.4rem;
      color: #2e7d32;
      font-weight: 600;
    }
    .promo-date {
      font-size: 0.95rem;
      color: #555;
      margin-bottom: 10px;
    }
    .promo-note {
      font-size: 1rem;
      color: #444;
    }
  </style>
</head>
<body>

<h2> Current Promotions & Offers</h2>

<div class="container">
  <div class="row">
    <%
      List<Promotion> promos = (List<Promotion>) request.getAttribute("promos");
      if (promos != null && !promos.isEmpty()) {
        for (Promotion p : promos) {
    %>
    <div class="col-md-6">
      <div class="promo-card">
        <h3 class="promo-title"> <%= p.getTitle() %> — <%= p.getDiscount() %>% OFF</h3>
        <p class="promo-date">Valid From <strong><%= p.getStartDate() %></strong> to <strong><%= p.getEndDate() %></strong></p>
        <p class="promo-note"><%= p.getNote() %></p>
      </div>
    </div>
    <%
      }
    } else {
    %>
    <div class="col-12 text-center">
      <p class="alert alert-info">No active promotions at the moment.</p>
    </div>
    <% } %>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

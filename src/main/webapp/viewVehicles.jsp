<%@ page import="java.util.LinkedList" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Vehicle" %>
<%@ page import="com.example.vehiclerentalsystem.management.VehicleManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>View Vehicles</title>
  <link rel="stylesheet" href="viweCSS.css">
</head>
<body>

<div class="container">
  <h2 style="text-align:center;">Registered Vehicles</h2>

  <%
    VehicleManager.loadVehicles();  // Ensure latest data is loaded
    LinkedList<Vehicle> vehicles = VehicleManager.getAllVehicles();

    for (Vehicle v : vehicles) {
  %>
  <div class="car-details card-animate">
    <img src="<%= request.getContextPath() + "/vehicle_uploads/" + v.getPhotoFileName() %>" alt="Car Image">
    <div class="car-title"><%= v.getBrand() %> <%= v.getModel() %></div>
    <div class="price">$<%= v.getPrice() %> <span class="per-day">/ Day</span></div>
    <div class="features">
      <span><i class="fas fa-users"></i> <%= v.getPassengers() %> Passengers</span>
      <span><i class="fas fa-suitcase"></i> <%= v.getLuggage() %> Luggages</span>
      <span><i class="fas fa-snowflake"></i> <%= v.getAc() %></span>
    </div>
    <p><%= v.getDescription() %></p>
  </div>
  <% } %>

</div>

</body>
</html>

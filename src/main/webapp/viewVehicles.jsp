<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Vehicle" %>
<!DOCTYPE html>
<html>
<head>
  <title>Registered Vehicles</title>
  <style>
    body { font-family: Arial, sans-serif; padding: 20px; }
    .vehicle-card {
      border: 1px solid #ccc;
      padding: 16px;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

<h2>Registered Vehicles</h2>

<%
  List<Vehicle> vehicleList = (List<Vehicle>) request.getAttribute("vehicleList");
  if (vehicleList != null && !vehicleList.isEmpty()) {
    for (Vehicle v : vehicleList) {
%>
<div class="vehicle-card">
  <h3><%= v.getBrand() %> <%= v.getModel() %></h3>
  <p><strong>Year:</strong> <%= v.getYear() %></p>
  <p><strong>Price:</strong> $<%= v.getPrice() %></p>
  <p><strong>Type:</strong> <%= v.getVehicleType() %></p>
  <p><strong>Transmission:</strong> <%= v.getTransmission() %></p>
  <p><strong>Fuel:</strong> <%= v.getFuelType() %></p>
  <p><strong>Engine:</strong> <%= v.getEngine() %></p>
  <p><strong>Passengers:</strong> <%= v.getPassengers() %> | <strong>Luggage:</strong> <%= v.getLuggage() %></p>
  <p><strong>AC:</strong> <%= v.getAc() %> | <strong>Mileage:</strong> <%= v.getMileage() %> km</p>
  <p><strong>Reg No:</strong> <%= v.getRegNumber() %></p>
  <p><strong>Description:</strong> <%= v.getDescription() %></p>
</div>
<%
  }
} else {
%>
<p>No vehicles registered yet.</p>
<%
  }
%>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Vehicle" %>
<%@ page import="com.example.vehiclerentalsystem.management.VehicleManager" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Vehicles</title>
  <link rel="stylesheet" href="stylesCar.css">
</head>
<body>
<div class="sidebar">
  <h1>RentC</h1>
  <a href="adminDashboard.jsp">Dashboard</a>
  <a href="adminHomePage.jsp">Home</a>
  <a href="manageBookings">Manage Bookings</a>
  <a href="manageUsers">Manage Users</a>
  <a href="manage_cars.jsp">Manage Car</a>
  <a href="index.html">Logout</a>
</div>

<div class="main">
  <div class="top-bar">
    <span class="admin-label">Manage Cars</span>
  </div>
  <div class="button-group">
    <form method="get" action="vehicleList" style="display:inline;">
      <input type="hidden" name="sortBy" value="availability"/>
      <button class="active-btn">Show Available</button>
    </form>

    <form method="get" action="register.jsp" style="display:inline;">
      <button class="new-btn">Add New Vehicle</button>
    </form>
  </div>
  <h2>Registered Vehicles</h2>

  <table>
    <thead>
    <tr>
      <th>Brand</th>
      <th>Model</th>
      <th>Type</th>
      <th>Year</th>
      <th>Price</th>
      <th>Availability</th>
      <th>Update Status</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Vehicle> vehicleList = VehicleManager.getAllVehiclesIncludingUnavailable();
      for (Vehicle v : vehicleList) {
    %>
    <tr>
      <td><%= v.getBrand() %></td>
      <td><%= v.getModel() %></td>
      <td><%= v.getVehicleType() %></td>
      <td><%= v.getYear() %></td>
      <td>Rs. <%= v.getPrice() %></td>
      <td>
          <span style="color:<%= v.getAvailability().equalsIgnoreCase("available") ? "green" : "red" %>;">
            <%= v.getAvailability() %>
          </span>
      </td>
      <td>
        <form method="post" action="updateAvailability">
          <input type="hidden" name="regNumber" value="<%= v.getRegNumber() %>"/>
          <select name="availability">
            <option value="available" <%= v.getAvailability().equalsIgnoreCase("available") ? "selected" : "" %>>Available</option>
            <option value="unavailable" <%= v.getAvailability().equalsIgnoreCase("unavailable") ? "selected" : "" %>>Unavailable</option>
          </select>
          <button type="submit">Update</button>
        </form>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
  String username = (String) session.getAttribute("username");
  String role = (String) session.getAttribute("role");

  if (username == null || role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
<div class="sidebar">
  <h1>RentC</h1>
  <a href="adminDashboard.jsp">Dashboard</a>
  <a href="adminHomePage.jsp">Home</a>
  <a href="manageBookings">Manage Bookings</a>
  <a href="manageUsers">Manage Users</a>
  <a href="manage_cars.jsp">Manage Car</a>
  <a href="index.html" style="color: red;">🚪 Logout</a>
</div>

<div class="main">
  <div class="top-bar">
    <span class="admin-label">Welcome, <%= username %> 👑</span>
    <button class="profile-btn"><i class="fas fa-user-circle"></i></button>
  </div>


  <div class="bookings">
    <h2 style="margin: 20px 0;">Recent Car Bookings</h2>
    <table>
      <thead>
      <tr>
        <th>Booking</th>
        <th>Subject</th>
        <th>Status</th>
        <th>Date</th>
        <th>Amount</th>
      </tr>
      </thead>
      <tbody>
      <%
        String filePath = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/acceptedBookings.txt";
        File file = new File(filePath);
        if (file.exists()) {
          try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
              String[] p = line.split(",");
              if (p.length == 5) {
      %>
      <tr>
        <td><%= p[0] %></td> <!-- Booking ID -->
        <td><%= p[1] %></td> <!-- Subject (Customer Name) -->
        <td><span class="status-done"><%= p[2] %></span></td> <!-- Status -->
        <td><%= p[3] %></td> <!-- Pickup Date -->
        <td>Rs.<%= p[4] %></td> <!-- Total Price -->
      </tr>
      <%
          }
        }
      } catch (Exception e) {
      %>
      <tr><td colspan="5">Error loading bookings</td></tr>
      <%
        }
      } else {
      %>
      <tr><td colspan="5">No recent bookings found.</td></tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>
</div>
<script src="script.js"></script>
</body>
</html>

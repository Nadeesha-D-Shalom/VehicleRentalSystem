<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Booking" %>
<%@ page import="jakarta.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Bookings</title>
  <link rel="stylesheet" href="stylesCar.css" />
  <style>
    .dropdown {
      position: relative;
      display: inline-block;
    }
    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      min-width: 140px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      z-index: 1;
    }
    .dropdown-content form {
      margin: 0;
    }
    .dropdown-content button {
      background: none;
      border: none;
      padding: 10px 16px;
      width: 100%;
      text-align: left;
      cursor: pointer;
      font-family: inherit;
    }
    .dropdown-content button:hover {
      background-color: #eee;
    }
    .dropdown:hover .dropdown-content {
      display: block;
    }
  </style>
</head>
<body>

<div class="sidebar">
  <h1>RentC</h1>
  <a href="adminDashboard.jsp">Dashboard</a>
  <a href="adminHomePage.jsp">Home</a>
  <a href="manageBookings">Manage Bookings</a>
  <a href="manageUsers">Manage Users</a>
  <a href="manageCars">Manage Car</a>
  <a href="manageFeedback">Manage Feedback</a>
  <a href="manage_promotions.jsp">Manage Promotions</a>
  <a href="manageAdmins">Manage Admins</a>
  <a href="index.html" style="color: red;">🚪 Logout</a>
</div>

<div class="main">
  <div class="top-bar">
    <span class="admin-label">Manage Bookings</span>
    <button class="profile-btn" title="Profile">
      <svg viewBox="0 0 24 24" width="24" height="24">
        <path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/>
      </svg>
    </button>
  </div>

  <h2>Car Bookings</h2>
  <table>
    <thead>
    <tr>
      <th>Booking ID</th>
      <th>Name</th>
      <th>Age</th>
      <th>Email</th>
      <th>Phone</th>
      <th>Pickup</th>
      <th>Drop-off</th>
      <th>Pickup Location</th>
      <th>Drop-off Location</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
      if (bookings != null && !bookings.isEmpty()) {
        for (Booking b : bookings) {
          long days = java.time.temporal.ChronoUnit.DAYS.between(
                  java.time.LocalDate.parse(b.getPickupDate()),
                  java.time.LocalDate.parse(b.getDropoffDate())) + 1;
          double total = days * 10000.0; // Assume fixed rate (or fetch dynamically if needed)
    %>
    <tr>
      <td><%= b.getBookingId() %></td>
      <td><%= b.getFirstName() %> <%= b.getLastName() %></td>
      <td><%= b.getAge() %></td>
      <td><%= b.getEmail() %></td>
      <td><%= b.getPhone() %></td>
      <td><%= b.getPickupDate() %></td>
      <td><%= b.getDropoffDate() %></td>
      <td><%= b.getPickupLocation() %></td>
      <td><%= b.getDropoffLocation() %></td>
      <td>
        <div class="dropdown">
          <button class="action-btn">☰</button>
          <div class="dropdown-content">
            <form method="post" action="acceptBooking">
              <input type="hidden" name="bookingId" value="<%= b.getBookingId() %>"/>
              <input type="hidden" name="subject" value="<%= b.getFirstName() + " " + b.getLastName() %>"/>
              <input type="hidden" name="pickupDate" value="<%= b.getPickupDate() %>"/>
              <input type="hidden" name="dropoffDate" value="<%= b.getDropoffDate() %>"/>
              <input type="hidden" name="price" value="10000.0"/>
              <button type="submit">✅ Accept</button>
            </form>
            <form method="post" action="deleteBooking" onsubmit="return confirm('Delete this booking?')">
              <input type="hidden" name="bookingId" value="<%= b.getBookingId() %>"/>
              <button type="submit" style="color:red;">🗑 Delete</button>
            </form>
          </div>
        </div>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="10" style="text-align:center;">No booking data found.</td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
</body>
</html>

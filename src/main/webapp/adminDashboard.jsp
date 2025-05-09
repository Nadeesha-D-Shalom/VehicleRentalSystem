<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <a href="manage_cars.html">Manage Cars</a>
  <a href="manage_users.html">Manage Users</a>
  <a href="manage_bookings.html">Manage Bookings</a>
  <a href="index.html" style="color: red;">🚪 Logout</a>
</div>

<div class="main">
  <div class="top-bar">
    <span class="admin-label">Welcome, <%= username %> 👑</span>
    <button class="profile-btn"><i class="fas fa-user-circle"></i></button>
  </div>

  <div class="cards">
    <div class="card">
      <h2>71</h2>
      <p>Total rental cars</p>
    </div>
    <div class="card">
      <h2>23</h2>
      <p>Total available cars</p>
    </div>
    <div class="card">
      <h2>48</h2>
      <p>Total car lists</p>
    </div>
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
      <tr>
        <td>EN1501488</td>
        <td>BMW 320d</td>
        <td><span class="status-done">Done</span></td>
        <td>26 Sep 2019</td>
        <td>Rs.30,000</td>
      </tr>
      <tr>
        <td>EN1501438</td>
        <td>Toyota Premio</td>
        <td><span class="status-progress">Progress</span></td>
        <td>26 Sep 2019</td>
        <td>Rs.45,000</td>
      </tr>
      </tbody>
    </table>
  </div>
</div>
<script src="script.js"></script>
</body>
</html>

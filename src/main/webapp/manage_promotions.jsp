<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Promotion" %>
<%@ page import="com.example.vehiclerentalsystem.management.PromotionManager" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Promotions</title>
  <link rel="stylesheet" href="stylesCar.css">
  <style>
    .form-box {
      background: #f9f9f9;
      padding: 20px;
      border-radius: 10px;
      width: 400px;
      margin-bottom: 30px;
    }

    .form-box label {
      font-weight: bold;
    }

    .form-box input, .form-box textarea {
      width: 100%;
      padding: 8px;
      margin-top: 4px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }

    .add-btn {
      background: linear-gradient(135deg, #28a745, #218838);
      color: white;
      padding: 10px 20px;
      font-weight: bold;
      border: none;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.15);
      transition: background 0.3s ease;
    }

    .add-btn:hover {
      background: linear-gradient(135deg, #218838, #1e7e34);
      cursor: pointer;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px;
      border: 1px solid #ccc;
    }

    th {
      background-color: #f1f1f1;
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
  <a href="index.html" style="color: red;">Logout</a>
</div>

<div class="main">
  <div class="top-bar">
    <span class="admin-label">Manage Promotions</span>
  </div>

  <h2>Add New Promotion</h2>
  <div class="form-box">
    <form method="post" action="promotionServlet">
      <input type="hidden" name="action" value="add"/>

      <label>Title</label>
      <input type="text" name="title" required/>

      <label>Start Date</label>
      <input type="date" name="startDate" required/>

      <label>End Date</label>
      <input type="date" name="endDate" required/>

      <label>Discount %</label>
      <input type="number" name="discount" required/>

      <label>Note</label>
      <textarea name="note" rows="3"></textarea>

      <button type="submit" class="add-btn">Add Promotion</button>
    </form>
  </div>

  <h2>Active Promotions</h2>
  <table>
    <thead>
    <tr>
      <th>Title</th>
      <th>From</th>
      <th>To</th>
      <th>Discount</th>
      <th>Note</th>
      <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Promotion> promos = new PromotionManager().getAllPromotions();
      for (Promotion p : promos) {
    %>
    <tr>
      <td><%= p.getTitle() %></td>
      <td><%= p.getStartDate() %></td>
      <td><%= p.getEndDate() %></td>
      <td><%= p.getDiscount() %>%</td>
      <td><%= p.getNote() %></td>
      <td>
        <form method="post" action="promotionServlet">
          <input type="hidden" name="action" value="delete"/>
          <input type="hidden" name="title" value="<%= p.getTitle() %>"/>
          <button type="submit">Delete</button>
        </form>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Feedback" %>
<%@ page import="com.example.vehiclerentalsystem.management.FeedbackManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Feedback</title>
    <link rel="stylesheet" href="stylesCar.css">
</head>
<body>

<div class="sidebar">
    <h1>RentC</h1>
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="adminHomePage.jsp">Home</a>
    <a href="manageBookings">Manage Bookings</a>
    <a href="manageUsers">Manage Users</a>
    <a href="manageCars">Manage Car</a>
    <a href="manage_feedback.jsp">Manage Feedback</a>
    <a href="manage_promotions.jsp">Manage Promotions</a>
    <a href="manageAdmins">Manage Admins</a>
    <a href="index.html" style="color: red;">🚪 Logout</a>
</div>

<div class="main">
    <div class="top-bar">
        <span class="admin-label">Manage Feedback</span>
    </div>

    <h2>User Feedback</h2>

    <table>
        <thead>
        <tr>
            <th>Vehicle Reg</th>
            <th>Username</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            FeedbackManager manager = new FeedbackManager();
            List<Feedback> feedbackList = manager.getAllFeedback();
            for (Feedback f : feedbackList) {
        %>
        <tr>
            <td><%= f.getVehicleReg() %></td>
            <td><%= f.getUsername() %></td>
            <td>
                <%
                    int stars = f.getRating();
                    for (int i = 0; i < stars; i++) { out.print("⭐"); }
                    for (int i = stars; i < 5; i++) { out.print("☆"); }
                %>
            </td>
            <td><%= f.getComment() %></td>
            <td>
                <form method="post" action="manageFeedback">
                    <input type="hidden" name="vehicleReg" value="<%= f.getVehicleReg() %>"/>
                    <input type="hidden" name="username" value="<%= f.getUsername() %>"/>
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.io.*, com.example.vehiclerentalsystem.classes.User" %>

<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = request.getParameter("username");
    User selectedUser = null;

    String userFile = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/user.txt";
    try (BufferedReader reader = new BufferedReader(new FileReader(userFile))) {
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length == 4 && parts[0].equals(username)) {
                selectedUser = new User(parts[0], parts[1], parts[2], parts[3]);
                break;
            }
        }
    } catch (IOException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f1f1;
            padding: 40px;
        }
        .form-box {
            width: 400px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        h2 {
            text-align: center;
        }
        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="form-box">
    <h2>Edit User</h2>

    <form action="updateUser" method="post">
        <input type="hidden" name="username" value="<%= selectedUser != null ? selectedUser.getUsername() : "" %>" />

        <label>Password</label>
        <input type="text" name="password" value="<%= selectedUser != null ? selectedUser.getPassword() : "" %>" required />

        <label>Phone</label>
        <input type="text" name="phone" value="<%= selectedUser != null ? selectedUser.getPhone() : "" %>" required />

        <label>NIC</label>
        <input type="text" name="nic" value="<%= selectedUser != null ? selectedUser.getNIC() : "" %>" required />

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>

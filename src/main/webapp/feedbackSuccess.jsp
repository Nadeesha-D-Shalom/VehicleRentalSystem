<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Feedback Submitted | Rent C</title>
  <link rel="stylesheet" href="css/bootstrap.css"/>
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Poppins', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .success-box {
      background: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
      text-align: center;
    }

    h2 {
      color: #28a745;
    }

    .btn-back {
      margin-top: 20px;
      background-color: #007bff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      text-decoration: none;
    }

    .btn-back:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<div class="success-box">
  <h2>✅ Thank You, <%= username %>!</h2>
  <p>Your feedback has been successfully submitted.</p>
  <a href="dashboard.jsp" class="btn-back">Back to Dashboard</a>
</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  String regNumber = request.getParameter("regNumber");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Leave Feedback | Rent C</title>
  <link rel="stylesheet" href="css/bootstrap.css"/>
  <style>
    body {
      background: #f0f0f0;
      font-family: 'Poppins', sans-serif;
      padding: 40px;
    }
    .form-container {
      max-width: 600px;
      margin: auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      margin-bottom: 30px;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>Leave Feedback</h2>
  <form action="submitFeedback" method="post">
    <input type="hidden" name="username" value="<%= username %>"/>

    <div class="mb-3">
      <label for="vehicleReg" class="form-label">Vehicle Registration Number</label>
      <input type="text" class="form-control" name="vehicleReg" id="vehicleReg"
             value="<%= regNumber != null ? regNumber : "" %>" required/>
    </div>

    <div class="mb-3">
      <label for="rating" class="form-label">Rating (1 to 5)</label>
      <select class="form-select" name="rating" id="rating" required>
        <option value="">Choose...</option>
        <option value="5">⭐ 5 - Excellent</option>
        <option value="4">⭐ 4 - Good</option>
        <option value="3">⭐ 3 - Average</option>
        <option value="2">⭐ 2 - Poor</option>
        <option value="1">⭐ 1 - Bad</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="comment" class="form-label">Comment</label>
      <textarea class="form-control" name="comment" id="comment" rows="4" placeholder="Write your experience..." required></textarea>
    </div>

    <div class="text-center">
      <button type="submit" class="btn btn-primary">Submit Feedback</button>
    </div>
  </form>
</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Vehicle" %>
<%@ page import="com.example.vehiclerentalsystem.management.FeedbackManager" %>
<%@ page import="java.lang.StringBuilder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vehicle Listings | RentC</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, rgba(113, 158, 255, 0.6), rgba(92, 104, 237, 0.85));
            margin: 0;
            padding: 30px 10px;
            overflow-x: hidden;
        }
        h1 {
            text-align: center;
            margin-bottom: 40px;
            font-size: 2.5rem;
            font-weight: 600;
            color: #1a237e;
        }
        .card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 10px 28px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 220px;
            object-fit: cover;
        }
        .vehicle-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #0d47a1;
        }
        .card-text {
            font-size: 0.95rem;
            color: #424242;
        }
        .price {
            color: #2e7d32;
            font-size: 1.1rem;
            font-weight: 600;
        }
        .btn-rent {
            background: linear-gradient(135deg, #42a5f5, #1e88e5);
            border: none;
            color: white;
            font-weight: 500;
            transition: background 0.3s ease;
        }
        .btn-rent:hover {
            background: linear-gradient(135deg, #1976d2, #0d47a1);
        }
        .badge-status {
            font-size: 0.85rem;
            padding: 5px 12px;
            border-radius: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="animate__animated animate__fadeInDown">🚗 Explore Our Vehicles</h1>

    <!-- Sorting Dropdown -->
    <form method="get" action="vehicleList" class="mb-4 text-center">
        <label for="sortBy" class="me-2 fw-semibold">Sort By:</label>
        <select name="sortBy" id="sortBy" onchange="this.form.submit()" class="form-select d-inline-block w-auto">
            <%
                String sortBy = (String) request.getAttribute("sortBy");
            %>
            <option value="">Default</option>
            <option value="price" <%= "price".equals(sortBy) ? "selected" : "" %>>Price (Low to High)</option>
            <option value="availability" <%= "availability".equals(sortBy) ? "selected" : "" %>>Availability</option>
        </select>
    </form>

    <div class="row g-4 row-cols-1 row-cols-md-3">
        <%
            List<Vehicle> vehicleList = (List<Vehicle>) request.getAttribute("vehicleList");
            FeedbackManager feedbackManager = new FeedbackManager();

            if (vehicleList != null && !vehicleList.isEmpty()) {
                for (Vehicle v : vehicleList) {
                    double avgRating = feedbackManager.getAverageRatingForVehicle(v.getRegNumber());
                    int fullStars = (int) avgRating;
                    boolean halfStar = avgRating - fullStars >= 0.5;
        %>
        <div class="col animate__animated animate__fadeInUp">
            <div class="card h-100">
                <img src="images/<%= v.getImageName() != null ? v.getImageName() : "default-car.jpg" %>" class="card-img-top" alt="<%= v.getBrand() + " " + v.getModel() %>">
                <div class="card-body d-flex flex-column">
                    <h5 class="vehicle-title"><%= v.getBrand() %> <%= v.getModel() %> (<%= v.getYear() %>)</h5>
                    <p class="card-text mb-2">
                        Type: <%= v.getVehicleType() %><br>
                        Transmission: <%= v.getTransmission() %><br>
                        Fuel: <%= v.getFuelType() %><br>
                        AC: <%= v.getAc() %><br>
                        Color: <%= v.getColor() %>
                    </p>
                    <p class="mb-2">
                        <span class="badge-status <%= "available".equalsIgnoreCase(v.getAvailability()) ? "bg-success text-white" : "bg-danger text-white" %>">
                            <%= v.getAvailability().toUpperCase() %>
                        </span>
                    </p>

                    <!-- ⭐ Dynamic Rating Display -->
                    <p class="mb-2">
                        <%
                            StringBuilder stars = new StringBuilder();
                            for (int i = 0; i < fullStars; i++) stars.append("⭐");
                            if (halfStar) stars.append("✩");
                            for (int i = fullStars + (halfStar ? 1 : 0); i < 5; i++) stars.append("☆");
                            stars.append(" (" + String.format("%.1f", avgRating) + " avg)");
                            out.print(stars.toString());
                        %>
                    </p>

                    <p class="price">LKR <%= v.getPrice() %> / day</p>

                    <% if ("available".equalsIgnoreCase(v.getAvailability())) { %>
                    <a href="booking.jsp?regNumber=<%= v.getRegNumber() %>" class="btn btn-rent mb-2">Rent Now</a>
                    <a href="feedbackForm.jsp?regNumber=<%= v.getRegNumber() %>" class="btn btn-outline-primary">Leave Feedback</a>
                    <% } else { %>
                    <button class="btn btn-secondary mb-2" disabled>Not Available</button>
                    <a href="feedbackForm.jsp?regNumber=<%= v.getRegNumber() %>" class="btn btn-outline-primary">Leave Feedback</a>
                    <% } %>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12">
            <div class="alert alert-warning text-center">
                No vehicles available at the moment.
            </div>
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

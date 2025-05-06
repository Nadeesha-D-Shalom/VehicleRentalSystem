<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Vehicle" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vehicle Listings | RentC</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <!-- Animate.css -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #e8f5e9);
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
            animation: fadeInDown 1s ease;
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
        .alert {
            animation: fadeIn 1s ease;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="animate__animated animate__fadeInDown">🚗 Explore Our Vehicles</h1>
    <div class="row g-4 row-cols-1 row-cols-md-3">

        <%
            List<Vehicle> vehicleList = (List<Vehicle>) request.getAttribute("vehicleList");
            if (vehicleList != null && !vehicleList.isEmpty()) {
                for (Vehicle v : vehicleList) {
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
                    <p class="price">LKR <%= v.getPrice() %> / day</p>
                    <a href="booking.jsp?regNumber=<%= v.getRegNumber() %>" class="btn btn-rent mt-auto">Rent Now</a>
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

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

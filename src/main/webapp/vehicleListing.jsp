<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Vehicle" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vehicle Listings | RentC</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f8;
        }
        .card {
            border-radius: 15px;
            transition: transform 0.2s ease-in-out;
        }
        .card:hover {
            transform: scale(1.03);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .vehicle-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <h1 class="text-center mb-4">Available Vehicles</h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <%
            List<Vehicle> vehicleList = (List<Vehicle>) request.getAttribute("vehicleList");
            if (vehicleList != null && !vehicleList.isEmpty()) {
                for (Vehicle v : vehicleList) {
        %>
        <div class="col">
            <div class="card shadow-sm">
                <img src="images/<%= v.getImageName() %>" class="card-img-top" alt="<%= v.getModel() %>">
                <div class="card-body">
                    <h5 class="vehicle-title"><%= v.getBrand() %> <%= v.getModel() %> (<%= v.getYear() %>)</h5>
                    <p class="card-text">
                        Type: <%= v.getVehicleType() %><br>
                        Transmission: <%= v.getTransmission() %><br>
                        Fuel: <%= v.getFuelType() %><br>
                        AC: <%= v.getAc() %><br>
                        Color: <%= v.getColor() %>
                    </p>
                    <p class="text-success fw-bold">LKR <%= v.getPrice() %>/day</p>
                    <a href="booking.jsp?regNumber=<%= v.getRegNumber() %>" class="btn btn-primary w-100">Rent Now</a>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12">
            <div class="alert alert-info text-center" role="alert">
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

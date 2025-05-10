<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Vehicle | RentC</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/logWall.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .form-container {
            background: rgba(0, 0, 0, 0.75);
            padding: 30px;
            border-radius: 10px;
            width: 450px;
        }

        h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input, select, button {
            padding: 10px;
            font-size: 14px;
            border-radius: 6px;
            border: none;
            margin-bottom: 12px;
        }

        input, select {
            background: rgba(255, 255, 255, 0.73);
            color: #000;
        }

        button {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .alert, .error {
            text-align: center;
            font-weight: bold;
            font-size: 14px;
            padding: 8px 0;
        }

        .alert {
            color: #00ffcc;
        }

        .error {
            color: #ff4c4c;
        }

        @media (max-width: 500px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Register New Vehicle</h2>

    <form action="registerVehicle" method="post">
        <div id="message"></div>

        <input type="text" name="brand" placeholder="Brand" required>
        <input type="text" name="model" placeholder="Model" required>
        <input type="number" name="price" placeholder="Price per Day ($)" required>
        <input type="number" name="year" placeholder="Year of Manufacture" required>

        <select name="vehicleType" required>
            <option value="">Select Vehicle Type</option>
            <option>SUV</option>
            <option>Sedan</option>
            <option>Hatchback</option>
            <option>Convertible</option>
            <option>Van</option>
            <option>Truck</option>
        </select>

        <select name="transmission" required>
            <option value="">Transmission Type</option>
            <option>Automatic</option>
            <option>Manual</option>
        </select>

        <select name="fuelType" required>
            <option value="">Fuel Type</option>
            <option>Petrol</option>
            <option>Diesel</option>
            <option>Electric</option>
            <option>Hybrid</option>
        </select>

        <input type="text" name="engine" placeholder="Engine Capacity" required>
        <input type="number" name="doors" placeholder="Number of Doors" required>
        <input type="text" name="color" placeholder="Color" required>
        <input type="number" name="passengers" placeholder="Passenger Capacity" required>
        <input type="number" name="luggage" placeholder="Luggage Capacity" required>

        <select name="ac" required>
            <option value="">A/C Available?</option>
            <option>Yes</option>
            <option>No</option>
        </select>

        <input type="number" step="0.1" name="mileage" placeholder="Mileage (km/L)" required>
        <input type="text" name="regNumber" placeholder="Vehicle Registration Number" required>

        <button type="submit">Add Vehicle</button>
    </form>
</div>

<script>
    const params = new URLSearchParams(window.location.search);
    const messageDiv = document.getElementById("message");
    if (params.get("success") === "1") {
        messageDiv.innerHTML = "<div class='alert'>✅ Vehicle added successfully!</div>";
    } else if (params.get("error")) {
        messageDiv.innerHTML = "<div class='error'>❌ Failed to add vehicle. Check fields.</div>";
    }
</script>

</body>
</html>

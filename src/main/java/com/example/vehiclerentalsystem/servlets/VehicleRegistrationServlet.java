package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Vehicle;
import com.example.vehiclerentalsystem.management.VehicleManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/registerVehicle")
public class VehicleRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Vehicle vehicle = new Vehicle();

            // Set basic string values
            vehicle.setBrand(request.getParameter("brand"));
            vehicle.setModel(request.getParameter("model"));
            vehicle.setVehicleType(request.getParameter("vehicleType"));
            vehicle.setTransmission(request.getParameter("transmission"));
            vehicle.setFuelType(request.getParameter("fuelType"));
            vehicle.setEngine(request.getParameter("engine"));
            vehicle.setColor(request.getParameter("color"));
            vehicle.setAc(request.getParameter("ac"));
            vehicle.setRegNumber(request.getParameter("regNumber"));
            vehicle.setDescription(request.getParameter("description"));

            // Set and validate numeric values
            vehicle.setPrice(Double.parseDouble(safe(request, "price")));
            vehicle.setYear(Integer.parseInt(safe(request, "year")));
            vehicle.setDoors(Integer.parseInt(safe(request, "doors")));
            vehicle.setPassengers(Integer.parseInt(safe(request, "passengers")));
            vehicle.setLuggage(Integer.parseInt(safe(request, "luggage")));
            vehicle.setMileage(Double.parseDouble(safe(request, "mileage")));

            // Save vehicle to file
            VehicleManager.addVehicle(vehicle);
            response.sendRedirect("dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect("vehicleRegistation.html?error=1");
        }
    }

    // Helper method for safe value extraction
    private String safe(HttpServletRequest req, String param) throws Exception {
        String value = req.getParameter(param);
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException("Missing field: " + param);
        }
        return value.trim();
    }
}

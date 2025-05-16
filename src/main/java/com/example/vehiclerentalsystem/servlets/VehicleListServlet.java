package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Vehicle;
import com.example.vehiclerentalsystem.management.VehicleManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet("/vehicleList")
public class VehicleListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Vehicle> vehicles = VehicleManager.getAllVehiclesIncludingUnavailable(); // Show all vehicles

        String sortBy = request.getParameter("sortBy");
        if ("price".equalsIgnoreCase(sortBy)) {
            vehicles.sort(Comparator.comparingDouble(Vehicle::getPrice));
        } else if ("availability".equalsIgnoreCase(sortBy)) {
            vehicles.sort(Comparator.comparing(Vehicle::getAvailability)); // alphabetic sort
        }

        request.setAttribute("vehicleList", vehicles);
        request.setAttribute("sortBy", sortBy); // Send sort selection back
        request.getRequestDispatcher("vehicleListing.jsp").forward(request, response);
    }
}

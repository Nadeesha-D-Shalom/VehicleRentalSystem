package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.management.VehicleManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateAvailability")
public class UpdateAvailabilityServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String regNumber = request.getParameter("regNumber");
        String availability = request.getParameter("availability");

        if (regNumber != null && availability != null) {
            VehicleManager.updateAvailability(regNumber, availability);
        }

        response.sendRedirect("manage_cars.jsp");
    }
}

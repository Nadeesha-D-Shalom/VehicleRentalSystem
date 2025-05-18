package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Vehicle;
import com.example.vehiclerentalsystem.management.VehicleManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/vehicleList")
public class VehicleListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sortBy = request.getParameter("sortBy");
        List<Vehicle> vehicles = VehicleManager.getAllVehiclesSorted(sortBy);

        request.setAttribute("vehicleList", vehicles);
        request.setAttribute("sortBy", sortBy);
        request.getRequestDispatcher("vehicleListing.jsp").forward(request, response);
    }
}

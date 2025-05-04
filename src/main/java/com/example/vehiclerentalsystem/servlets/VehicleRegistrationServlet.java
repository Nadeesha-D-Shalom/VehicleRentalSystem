package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Vehicle;
import com.example.vehiclerentalsystem.management.VehicleManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/registerVehicle")
@MultipartConfig
public class VehicleRegistrationServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "vehicle_uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        double price = Double.parseDouble(request.getParameter("price"));
        int year = Integer.parseInt(request.getParameter("year"));
        String vehicleType = request.getParameter("vehicle_type");
        String transmission = request.getParameter("transmission");
        String fuelType = request.getParameter("fuel_type");
        String engine = request.getParameter("engine");
        int doors = Integer.parseInt(request.getParameter("doors"));
        String color = request.getParameter("color");
        int passengers = Integer.parseInt(request.getParameter("passengers"));
        int luggage = Integer.parseInt(request.getParameter("luggage"));
        String ac = request.getParameter("ac");
        double mileage = Double.parseDouble(request.getParameter("mileage"));
        String regNumber = request.getParameter("reg_number");
        String description = request.getParameter("description");

        Part photoPart = request.getPart("photo");
        String fileName = Paths.get(photoPart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        photoPart.write(filePath);

        Vehicle vehicle = new Vehicle();
        vehicle.setBrand(brand);
        vehicle.setModel(model);
        vehicle.setPrice(price);
        vehicle.setYear(year);
        vehicle.setVehicleType(vehicleType);
        vehicle.setTransmission(transmission);
        vehicle.setFuelType(fuelType);
        vehicle.setEngine(engine);
        vehicle.setDoors(doors);
        vehicle.setColor(color);
        vehicle.setPassengers(passengers);
        vehicle.setLuggage(luggage);
        vehicle.setAc(ac);
        vehicle.setMileage(mileage);
        vehicle.setRegNumber(regNumber);
        vehicle.setDescription(description);
        vehicle.setPhotoFileName(fileName);

        VehicleManager.addVehicle(vehicle);

        response.setContentType("text/html");
        response.getWriter().write(
                "<h1>Vehicle Registered Successfully!</h1>" +
                        "<a href='vehicleRegistation.html'>Register Another Vehicle</a>"
        );
    }
}

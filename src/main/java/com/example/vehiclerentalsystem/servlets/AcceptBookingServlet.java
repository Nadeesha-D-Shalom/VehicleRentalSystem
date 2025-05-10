package com.example.vehiclerentalsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebServlet("/acceptBooking")
public class AcceptBookingServlet extends HttpServlet {
    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/acceptedBookings.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = request.getParameter("bookingId");
        String subject = request.getParameter("subject");
        String pickupDateStr = request.getParameter("pickupDate");
        String dropoffDateStr = request.getParameter("dropoffDate");
        double pricePerDay = Double.parseDouble(request.getParameter("price"));

        long rentalDays = ChronoUnit.DAYS.between(
                LocalDate.parse(pickupDateStr),
                LocalDate.parse(dropoffDateStr)) + 1;

        double totalPrice = rentalDays * pricePerDay;

        String line = bookingId + "," + subject + ",Done," + pickupDateStr + "," + totalPrice;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(line);
            writer.newLine();
        }

        response.sendRedirect("manageBookings");
    }
}

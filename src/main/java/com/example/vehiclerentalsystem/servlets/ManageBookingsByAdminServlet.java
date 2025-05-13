package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.*;

@WebServlet("/manageBookings")
public class ManageBookingsByAdminServlet extends HttpServlet {
    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/rented.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Booking> bookings = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] p = line.split(",");
                if (p.length == 15) {
                    bookings.add(new Booking(p[0], p[1], p[2], Integer.parseInt(p[3]), p[4], p[5],
                            p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]));
                }
            }
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("manage_car_booking.jsp").forward(request, response);
    }
}

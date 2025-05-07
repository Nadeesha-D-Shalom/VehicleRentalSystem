package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Booking;
import com.example.vehiclerentalsystem.management.BookingManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private BookingManager bookingManager;

    @Override
    public void init() {
        bookingManager = new BookingManager();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = BookingManager.generateBookingId();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");

        String pickupDate = request.getParameter("pickupDate");
        String dropoffDate = request.getParameter("dropoffDate");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropoffLocation");

        Booking booking = new Booking(bookingId, firstName, lastName, age, email, phone,
                address1, address2, city, state, zip, pickupDate, dropoffDate,
                pickupLocation, dropoffLocation);

        bookingManager.addBooking(booking);

        response.sendRedirect("bookingSuccess.jsp");
    }
}

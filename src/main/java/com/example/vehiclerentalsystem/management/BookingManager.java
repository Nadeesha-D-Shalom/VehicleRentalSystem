package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Booking;

import java.io.*;
import java.util.UUID;

public class BookingManager {
    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/rented.txt";

    public BookingManager() {

        File file = new File(FILE_PATH);
        try {
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            System.out.println("Error creating booking file: " + e.getMessage());
        }
    }

    public void addBooking(Booking booking) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(booking.toFileString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error writing booking: " + e.getMessage());
        }
    }

    public static String generateBookingId() {
        return "BOOK-" + UUID.randomUUID().toString().substring(0, 8);
    }
}

package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Vehicle;

import java.io.*;
import java.util.LinkedList;
import java.util.List;

public class VehicleManager {

    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/vehicle.txt";
    private static final LinkedList<Vehicle> vehicleList = new LinkedList<>();

    // Add and save
    public static void addVehicle(Vehicle vehicle) {
        vehicleList.add(vehicle);
        saveToFile(vehicle);
    }

    // Save one vehicle to file
    private static void saveToFile(Vehicle vehicle) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(vehicle.toString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error writing vehicle to file: " + e.getMessage());
        }
    }

    // Load all vehicles from file
    public static List<Vehicle> loadAllVehicles() {
        LinkedList<Vehicle> list = new LinkedList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                Vehicle vehicle = Vehicle.fromString(line);
                if (vehicle != null) list.add(vehicle);
            }
        } catch (IOException e) {
            System.out.println("Error reading vehicle list: " + e.getMessage());
        }
        return list;
    }

    public static List<Vehicle> getAllVehicles() {
        return new LinkedList<>(vehicleList); // shallow copy
    }
}

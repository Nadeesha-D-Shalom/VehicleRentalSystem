package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Vehicle;

import java.io.*;
import java.util.LinkedList;
import java.util.List;

public class VehicleManager {
    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/vehicle.txt";
    private static final LinkedList<Vehicle> vehicleList = new LinkedList<>();

    public static void addVehicle(Vehicle vehicle) {
        vehicleList.add(vehicle);
        saveToFile(vehicle);
    }

    private static void saveToFile(Vehicle vehicle) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(vehicle.toString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error writing vehicle to file: " + e.getMessage());
        }
    }

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
        if (vehicleList.isEmpty()) {
            vehicleList.addAll(loadAllVehicles());
        }

        List<Vehicle> availableVehicles = new LinkedList<>();
        for (Vehicle v : vehicleList) {
            if ("available".equalsIgnoreCase(v.getAvailability())) {
                availableVehicles.add(v);
            }
        }
        return availableVehicles;
    }

    public static List<Vehicle> getAllVehiclesIncludingUnavailable() {
        // Optional: if you need admin to see all vehicles
        if (vehicleList.isEmpty()) {
            vehicleList.addAll(loadAllVehicles());
        }
        return new LinkedList<>(vehicleList);
    }

    public static void updateAvailability(String regNumber, String newStatus) {
        List<Vehicle> allVehicles = loadAllVehicles();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Vehicle v : allVehicles) {
                if (v.getRegNumber().equalsIgnoreCase(regNumber)) {
                    v.setAvailability(newStatus);
                }
                writer.write(v.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error updating vehicle availability: " + e.getMessage());
        }

        // Sync in-memory list
        vehicleList.clear();
        vehicleList.addAll(loadAllVehicles());
    }
}

package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Vehicle;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleManager {
    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalProject/vehicle.txt";
    private static final VehicleLinkedList vehicleList = new VehicleLinkedList();

    public static void addVehicle(Vehicle vehicle) {
        vehicleList.addVehicle(vehicle);
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
        List<Vehicle> list = new ArrayList<>();
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

    public static List<Vehicle> getAllVehiclesSorted(String sortBy) {
        vehicleList.clear();
        List<Vehicle> rawList = loadAllVehicles();

        for (Vehicle v : rawList) {
            vehicleList.addVehicle(v);
        }

        if ("price".equalsIgnoreCase(sortBy)) {
            vehicleList.selectionSortByRentPrice();
        } else if ("availability".equalsIgnoreCase(sortBy)) {
            vehicleList.selectionSortByAvailability();
        }

        List<Vehicle> sortedList = new ArrayList<>();
        vehicleList.forEach(sortedList::add);
        return sortedList;
    }

    public static List<Vehicle> getAllVehiclesIncludingUnavailable() {
        return loadAllVehicles();
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

        vehicleList.clear();
        for (Vehicle v : loadAllVehicles()) {
            vehicleList.addVehicle(v);
        }
    }
}

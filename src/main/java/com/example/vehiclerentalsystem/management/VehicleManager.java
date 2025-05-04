package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Vehicle;

import java.io.*;
import java.util.LinkedList;

public class VehicleManager {

    private static final String FILE_PATH = "vehicle.txt";
    private static LinkedList<Vehicle> vehicleList = new LinkedList<>();

    // Add new vehicle to list and save to file
    public static void addVehicle(Vehicle vehicle) {
        vehicleList.add(vehicle);
        saveToFile(vehicle);
    }

    // Save vehicle to file (append mode)
    private static void saveToFile(Vehicle vehicle) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(
                    vehicle.getBrand() + "," +
                            vehicle.getModel() + "," +
                            vehicle.getPrice() + "," +
                            vehicle.getYear() + "," +
                            vehicle.getVehicleType() + "," +
                            vehicle.getTransmission() + "," +
                            vehicle.getFuelType() + "," +
                            vehicle.getEngine() + "," +
                            vehicle.getDoors() + "," +
                            vehicle.getColor() + "," +
                            vehicle.getPassengers() + "," +
                            vehicle.getLuggage() + "," +
                            vehicle.getAc() + "," +
                            vehicle.getMileage() + "," +
                            vehicle.getRegNumber() + "," +
                            vehicle.getDescription() + "," +
                            vehicle.getPhotoFileName()
            );
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Load all vehicles from file to LinkedList (optional)
    public static void loadVehicles() {
        vehicleList.clear();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 17) {
                    Vehicle vehicle = new Vehicle();
                    vehicle.setBrand(parts[0]);
                    vehicle.setModel(parts[1]);
                    vehicle.setPrice(Double.parseDouble(parts[2]));
                    vehicle.setYear(Integer.parseInt(parts[3]));
                    vehicle.setVehicleType(parts[4]);
                    vehicle.setTransmission(parts[5]);
                    vehicle.setFuelType(parts[6]);
                    vehicle.setEngine(parts[7]);
                    vehicle.setDoors(Integer.parseInt(parts[8]));
                    vehicle.setColor(parts[9]);
                    vehicle.setPassengers(Integer.parseInt(parts[10]));
                    vehicle.setLuggage(Integer.parseInt(parts[11]));
                    vehicle.setAc(parts[12]);
                    vehicle.setMileage(Double.parseDouble(parts[13]));
                    vehicle.setRegNumber(parts[14]);
                    vehicle.setDescription(parts[15]);
                    vehicle.setPhotoFileName(parts[16]);

                    vehicleList.add(vehicle);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static LinkedList<Vehicle> getAllVehicles() {
        return vehicleList;
    }
}

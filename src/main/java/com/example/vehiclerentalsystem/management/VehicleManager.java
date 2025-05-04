package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Vehicle;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class VehicleManager {

    private static final String FILE_PATH = "vehicle.txt";

    public static void saveVehicle(Vehicle vehicle) {
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
}

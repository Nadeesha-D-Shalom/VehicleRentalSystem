package com.example.vehiclerentalsystem.management;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class AdminManager {

    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalProject/admins.txt";

    public boolean validateAdmin(String username, String password) {
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2 && parts[0].trim().equals(username) && parts[1].trim().equals(password)) {
                    return true;
                }
            }
        } catch (IOException e) {
            System.out.println("Admin file error: " + e.getMessage());
        }
        return false;
    }
}

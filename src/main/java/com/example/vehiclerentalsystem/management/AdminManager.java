package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Admin;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

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

    public List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    admins.add(new Admin(parts[0], parts[1], parts[2], parts[3]));
                }
            }
        } catch (IOException e) {
            System.out.println("Failed to load admins: " + e.getMessage());
        }
        return admins;
    }

    public void addAdmin(Admin admin) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(admin.getUsername() + "," + admin.getPassword() + "," + admin.getPhone() + "," + admin.getNIC());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error saving admin: " + e.getMessage());
        }
    }

    public void updateAdmin(String username, String newPassword, String newPhone, String newNIC) {
        List<Admin> admins = getAllAdmins();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Admin a : admins) {
                if (a.getUsername().equals(username)) {
                    a.setPassword(newPassword);
                    a.setPhone(newPhone);
                    a.setNic(newNIC);
                }
                writer.write(a.getUsername() + "," + a.getPassword() + "," + a.getPhone() + "," + a.getNIC());
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error updating admin: " + e.getMessage());
        }
    }

    public void deleteAdmin(String username) {
        List<Admin> admins = getAllAdmins();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Admin a : admins) {
                if (!a.getUsername().equals(username)) {
                    writer.write(a.getUsername() + "," + a.getPassword() + "," + a.getPhone() + "," + a.getNIC());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            System.out.println("Error deleting admin: " + e.getMessage());
        }
    }
}

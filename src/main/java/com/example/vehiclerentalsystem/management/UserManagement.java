package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.RegularUser;
import com.example.vehiclerentalsystem.classes.User;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserManagement {
    private final String filePath = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalProject/user.txt";
    private List<User> userList;

    public UserManagement() {
        userList = new ArrayList<>();
        loadUsers();
    }

    public void loadUsers() {
        userList.clear();
        File file = new File(filePath);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = User.fromString(line);
                if (user != null) {
                    userList.add(user);
                }
            }
        } catch (IOException e) {
            System.out.println("Failed to load users: " + e.getMessage());
        }
    }

    public boolean validateUser(String username, String password) {
        loadUsers();
        for (User user : userList) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    public void saveUsers() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (User user : userList) {
                writer.write(user.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Failed to save users: " + e.getMessage());
        }
    }

    public boolean userExists(String username) {
        return userList.stream().anyMatch(u -> u.getUsername().equalsIgnoreCase(username));
    }

    public void addUser(String username, String password, String phone, String NIC) {
        userList.add(new RegularUser(username, password, phone, NIC));
    }

    public List<User> getAllUsers() {
        return new ArrayList<>(userList);
    }
}

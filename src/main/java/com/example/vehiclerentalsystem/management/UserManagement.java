package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.User;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserManagement {
    private static final String FILE_PATH = "user.txt";
    private List<User> userList;

    public UserManagement() {
        userList = new ArrayList<>();
        loadUsers(); // automatically load when initialized
    }

    public void loadUsers() {
        userList.clear();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = User.fromString(line);
                if (user != null) {
                    userList.add(user);
                }
            }
        } catch (IOException e) {
            System.out.println("user.txt not found. Starting with an empty list.");
        }
    }

    public void saveUsers() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : userList) {
                writer.write(user.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean userExists(String username) {
        return userList.stream().anyMatch(u -> u.getUsername().equalsIgnoreCase(username));
    }

    public void addUser(String username, String password, String phone) {
        userList.add(new User(username, password, phone));
    }

    public User validateUser(String username, String password) {
        return userList.stream()
                .filter(u -> u.getUsername().equalsIgnoreCase(username) && u.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }

    public List<User> getAllUsers() {
        return new ArrayList<>(userList);
    }
}

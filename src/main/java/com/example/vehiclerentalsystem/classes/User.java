package com.example.vehiclerentalsystem.classes;

public class User {
    private String username;
    private String password;
    private String phone;
    public String role;

    // get regular user details
    public User(String username, String password, String phone) {
        this.username = username;
        this.password = password;
        this.phone = phone;
    }

    // get admin details
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }


    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getPhone() {
        return phone;
    }
    public String getRole() {
        return role;
    }

    public static User fromString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 3) {
            return new User(parts[0].trim(), parts[1].trim(), parts[2].trim());
        }
        return null;
    }

    @Override
    public String toString() {
        return username + "," + password + "," + phone;
    }
}

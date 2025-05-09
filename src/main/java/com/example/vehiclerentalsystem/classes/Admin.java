package com.example.vehiclerentalsystem.classes;

public class Admin extends User {
    public Admin(String username, String password) {
        super(username, password, "admin-phone", "admin-nic");
    }

    @Override
    public String getRole() {
        return "admin";
    }
}

package com.example.vehiclerentalsystem.classes;

public class RegularUser extends User {
    public RegularUser(String username, String password, String phone) {
        super(username, password, phone);
    }

    @Override
    public String getRole() {
        return "user";
    }
}

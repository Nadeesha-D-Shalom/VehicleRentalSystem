package com.example.vehiclerentalsystem.classes;

public class RegularUser extends User {
    public RegularUser(String username, String password, String phone, String NIC) {
        super(username, password, phone, NIC);
    }

    @Override
    public String getRole() {
        return "user.txt";
    }
}

package com.example.vehiclerentalsystem.classes;

public class Admin extends User {

    public Admin(String username, String password, String phone, String nic) {
        super(username, password, phone, nic);
    }

    @Override
    public String getRole() {
        return "admin";
    }

    public void setPassword(String password) {
        super.setPassword(password);
    }

    public void setPhone(String phone) {
        super.setPhone(phone);
    }

    public void setNic(String nic) {
        super.setNIC(nic);
    }
}

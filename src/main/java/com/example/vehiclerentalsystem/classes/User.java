package com.example.vehiclerentalsystem.classes;

public class User {
    private String username;
    private String password;
    private String phone;
    protected String NIC;

    public User(String username, String password, String phone, String NIC) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.NIC = NIC;
    }

    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getPhone() { return phone; }
    public String getNIC() { return NIC; }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getRole() {
        return "unknown";
    }

    public static User fromString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 4) {
            return new RegularUser(parts[0].trim(), parts[1].trim(), parts[2].trim(), parts[3].trim());
        }
        return null;
    }

    @Override
    public String toString() {
        return username + "," + password + "," + phone + "," + NIC;
    }
}

package com.example.vehiclerentalsystem.classes;

public class Feedback {
    private String vehicleReg;
    private String username;
    private int rating; // out of 5
    private String comment;

    public Feedback(String vehicleReg, String username, int rating, String comment) {
        this.vehicleReg = vehicleReg;
        this.username = username;
        this.rating = rating;
        this.comment = comment;
    }

    public String toFileString() {
        return vehicleReg + "," + username + "," + rating + "," + comment.replace(",", " ");
    }

    public static Feedback fromString(String line) {
        String[] parts = line.split(",", 4);
        return new Feedback(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3]);
    }

    // Getters
    public String getVehicleReg() { return vehicleReg; }
    public String getUsername() { return username; }
    public int getRating() { return rating; }
    public String getComment() { return comment; }
}

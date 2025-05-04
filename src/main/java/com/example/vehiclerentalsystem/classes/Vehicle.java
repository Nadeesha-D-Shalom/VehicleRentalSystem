package com.example.vehiclerentalsystem.classes;

public class Vehicle {
    private String brand;
    private String model;
    private double price;
    private int year;
    private String vehicleType;
    private String transmission;
    private String fuelType;
    private String engine;
    private int doors;
    private String color;
    private int passengers;
    private int luggage;
    private String ac;
    private double mileage;
    private String regNumber;
    private String description;
    private String photoFileName;

    public Vehicle(String brand, String model, double price, int year, String vehicleType, String transmission,
                   String fuelType, String engine, int doors, String color, int passengers, int luggage,
                   String ac, double mileage, String regNumber, String description, String photoFileName) {
        this.brand = brand;
        this.model = model;
        this.price = price;
        this.year = year;
        this.vehicleType = vehicleType;
        this.transmission = transmission;
        this.fuelType = fuelType;
        this.engine = engine;
        this.doors = doors;
        this.color = color;
        this.passengers = passengers;
        this.luggage = luggage;
        this.ac = ac;
        this.mileage = mileage;
        this.regNumber = regNumber;
        this.description = description;
        this.photoFileName = photoFileName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public int getDoors() {
        return doors;
    }

    public void setDoors(int doors) {
        this.doors = doors;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getPassengers() {
        return passengers;
    }

    public void setPassengers(int passengers) {
        this.passengers = passengers;
    }

    public int getLuggage() {
        return luggage;
    }

    public void setLuggage(int luggage) {
        this.luggage = luggage;
    }

    public String getAc() {
        return ac;
    }

    public void setAc(String ac) {
        this.ac = ac;
    }

    public double getMileage() {
        return mileage;
    }

    public void setMileage(double mileage) {
        this.mileage = mileage;
    }

    public String getRegNumber() {
        return regNumber;
    }

    public void setRegNumber(String regNumber) {
        this.regNumber = regNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }

    // Add Getters and Setters here if needed
}

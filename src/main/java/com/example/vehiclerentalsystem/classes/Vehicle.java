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

    // Default constructor
    public Vehicle() {}

    // Getters and Setters
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public String getTransmission() { return transmission; }
    public void setTransmission(String transmission) { this.transmission = transmission; }

    public String getFuelType() { return fuelType; }
    public void setFuelType(String fuelType) { this.fuelType = fuelType; }

    public String getEngine() { return engine; }
    public void setEngine(String engine) { this.engine = engine; }

    public int getDoors() { return doors; }
    public void setDoors(int doors) { this.doors = doors; }

    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    public int getPassengers() { return passengers; }
    public void setPassengers(int passengers) { this.passengers = passengers; }

    public int getLuggage() { return luggage; }
    public void setLuggage(int luggage) { this.luggage = luggage; }

    public String getAc() { return ac; }
    public void setAc(String ac) { this.ac = ac; }

    public double getMileage() { return mileage; }
    public void setMileage(double mileage) { this.mileage = mileage; }

    public String getRegNumber() { return regNumber; }
    public void setRegNumber(String regNumber) { this.regNumber = regNumber; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    @Override
    public String toString() {
        return brand + "," + model + "," + price + "," + year + "," + vehicleType + "," +
                transmission + "," + fuelType + "," + engine + "," + doors + "," + color + "," +
                passengers + "," + luggage + "," + ac + "," + mileage + "," + regNumber + "," + description;
    }

    public static Vehicle fromString(String line) {
        String[] parts = line.split(",", -1);
        if (parts.length != 16) return null;

        Vehicle v = new Vehicle();
        v.setBrand(parts[0]);
        v.setModel(parts[1]);
        v.setPrice(Double.parseDouble(parts[2]));
        v.setYear(Integer.parseInt(parts[3]));
        v.setVehicleType(parts[4]);
        v.setTransmission(parts[5]);
        v.setFuelType(parts[6]);
        v.setEngine(parts[7]);
        v.setDoors(Integer.parseInt(parts[8]));
        v.setColor(parts[9]);
        v.setPassengers(Integer.parseInt(parts[10]));
        v.setLuggage(Integer.parseInt(parts[11]));
        v.setAc(parts[12]);
        v.setMileage(Double.parseDouble(parts[13]));
        v.setRegNumber(parts[14]);
        v.setDescription(parts[15]);

        return v;
    }
}

package com.example.vehiclerentalsystem.classes;

public class Vehicle {
    private String brand, model, vehicleType, transmission, fuelType, engine;
    private String color, ac, regNumber, imageName;
    private double price, mileage;
    private int year, doors, passengers, luggage;

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public String getTransmission() { return transmission; }
    public void setTransmission(String transmission) { this.transmission = transmission; }

    public String getFuelType() { return fuelType; }
    public void setFuelType(String fuelType) { this.fuelType = fuelType; }

    public String getEngine() { return engine; }
    public void setEngine(String engine) { this.engine = engine; }

    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    public String getAc() { return ac; }
    public void setAc(String ac) { this.ac = ac; }

    public String getRegNumber() { return regNumber; }
    public void setRegNumber(String regNumber) { this.regNumber = regNumber; }

    public String getImageName() { return imageName; }
    public void setImageName(String imageName) { this.imageName = imageName; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getMileage() { return mileage; }
    public void setMileage(double mileage) { this.mileage = mileage; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public int getDoors() { return doors; }
    public void setDoors(int doors) { this.doors = doors; }

    public int getPassengers() { return passengers; }
    public void setPassengers(int passengers) { this.passengers = passengers; }

    public int getLuggage() { return luggage; }
    public void setLuggage(int luggage) { this.luggage = luggage; }

    @Override
    public String toString() {
        return brand + ";" + model + ";" + vehicleType + ";" + transmission + ";" + fuelType + ";" +
                engine + ";" + color + ";" + ac + ";" + regNumber + ";" + price + ";" + year + ";" +
                doors + ";" + passengers + ";" + luggage + ";" + mileage + ";" + imageName;
    }

    public static Vehicle fromString(String line) {
        try {
            String[] parts = line.split(";", -1);
            if (parts.length != 16) {
                System.out.println("Skipping invalid line (wrong field count): " + line);
                return null;
            }

            Vehicle v = new Vehicle();
            v.setBrand(parts[0]);
            v.setModel(parts[1]);
            v.setVehicleType(parts[2]);
            v.setTransmission(parts[3]);
            v.setFuelType(parts[4]);
            v.setEngine(parts[5]);
            v.setColor(parts[6]);
            v.setAc(parts[7]);
            v.setRegNumber(parts[8]);
            v.setPrice(Double.parseDouble(parts[9]));
            v.setYear(Integer.parseInt(parts[10]));
            v.setDoors(Integer.parseInt(parts[11]));
            v.setPassengers(Integer.parseInt(parts[12]));
            v.setLuggage(Integer.parseInt(parts[13]));
            v.setMileage(Double.parseDouble(parts[14]));
            v.setImageName(parts[15]);

            return v;

        } catch (Exception e) {
            System.out.println("Error parsing vehicle from line: " + line);
            e.printStackTrace();
            return null;
        }
    }
}
package com.example.vehiclerentalsystem.classes;

public class Booking {
    private String bookingId;
    private String firstName;
    private String lastName;
    private int age;
    private String email;
    private String phone;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String pickupDate;
    private String dropoffDate;
    private String pickupLocation;
    private String dropoffLocation;

    public Booking(String bookingId, String firstName, String lastName, int age, String email, String phone,
                   String address1, String address2, String city, String state, String zip,
                   String pickupDate, String dropoffDate, String pickupLocation, String dropoffLocation) {
        this.bookingId = bookingId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.email = email;
        this.phone = phone;
        this.address1 = address1;
        this.address2 = address2;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.pickupDate = pickupDate;
        this.dropoffDate = dropoffDate;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
    }

    public String toFileString() {
        return bookingId + "," + firstName + "," + lastName + "," + age + "," + email + "," + phone + "," +
                address1 + "," + address2 + "," + city + "," + state + "," + zip + "," +
                pickupDate + "," + dropoffDate + "," + pickupLocation + "," + dropoffLocation;
    }

    // ✅ Getter methods
    public String getBookingId() { return bookingId; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public int getAge() { return age; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getAddress1() { return address1; }
    public String getAddress2() { return address2; }
    public String getCity() { return city; }
    public String getState() { return state; }
    public String getZip() { return zip; }
    public String getPickupDate() { return pickupDate; }
    public String getDropoffDate() { return dropoffDate; }
    public String getPickupLocation() { return pickupLocation; }
    public String getDropoffLocation() { return dropoffLocation; }
}

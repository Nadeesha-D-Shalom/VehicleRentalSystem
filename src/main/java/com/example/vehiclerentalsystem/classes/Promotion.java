package com.example.vehiclerentalsystem.classes;

public class Promotion {
    private String title;
    private String startDate;
    private String endDate;
    private int discount;
    private String note;

    public Promotion(String title, String startDate, String endDate, int discount, String note) {
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
        this.discount = discount;
        this.note = note;
    }

    public String toFileString() {
        return title + "," + startDate + "," + endDate + "," + discount + "," + note.replace(",", " ");
    }

    public static Promotion fromString(String line) {
        String[] p = line.split(",", 5);
        return new Promotion(p[0], p[1], p[2], Integer.parseInt(p[3]), p[4]);
    }

    public String getTitle() { return title; }
    public String getStartDate() { return startDate; }
    public String getEndDate() { return endDate; }
    public int getDiscount() { return discount; }
    public String getNote() { return note; }
}

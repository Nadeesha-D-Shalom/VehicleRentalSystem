package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Promotion;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PromotionManager {
    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalProject/promotions.txt";

    public void addPromotion(Promotion promo) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(promo.toFileString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error writing promotion: " + e.getMessage());
        }
    }

    public List<Promotion> getAllPromotions() {
        List<Promotion> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                list.add(Promotion.fromString(line));
            }
        } catch (IOException e) {
            System.out.println("Error reading promotions: " + e.getMessage());
        }
        return list;
    }

    public void deletePromotion(String title) {
        List<Promotion> list = getAllPromotions();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Promotion p : list) {
                if (!p.getTitle().equalsIgnoreCase(title)) {
                    writer.write(p.toFileString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            System.out.println("Error deleting promotion: " + e.getMessage());
        }
    }
}

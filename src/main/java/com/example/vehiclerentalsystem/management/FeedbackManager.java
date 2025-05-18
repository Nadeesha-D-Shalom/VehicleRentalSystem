package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Feedback;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackManager {
    private static final String FILE_PATH = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/feedback.txt";

    public void addFeedback(Feedback feedback) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(feedback.toFileString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error saving feedback: " + e.getMessage());
        }
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                list.add(Feedback.fromString(line));
            }
        } catch (IOException e) {
            System.out.println("Error reading feedback: " + e.getMessage());
        }
        return list;
    }

    public void deleteFeedback(String vehicleReg, String username) {
        List<Feedback> feedbackList = getAllFeedback();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Feedback f : feedbackList) {
                if (!(f.getVehicleReg().equalsIgnoreCase(vehicleReg) && f.getUsername().equalsIgnoreCase(username))) {
                    writer.write(f.toFileString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            System.out.println("Error deleting feedback: " + e.getMessage());
        }
    }


    public double getAverageRatingForVehicle(String vehicleReg) {
        List<Feedback> all = getAllFeedback();
        int sum = 0, count = 0;

        for (Feedback f : all) {
            if (f.getVehicleReg().equalsIgnoreCase(vehicleReg)) {
                sum += f.getRating();
                count++;
            }
        }
        return count > 0 ? (double) sum / count : 0.0;
    }
}

package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.RegularUser;
import com.example.vehiclerentalsystem.classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/manageUsers")
public class ManageUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userFilePath = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/user.txt";

        List<User> users = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(userFilePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    String maskedPassword = "*".repeat(parts[1].length());
                    users.add(new RegularUser(parts[0], maskedPassword, parts[2], parts[3]));
                }
            }
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("manage_users.jsp").forward(request, response);
    }
}

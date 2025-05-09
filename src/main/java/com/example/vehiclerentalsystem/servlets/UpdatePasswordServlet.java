package com.example.vehiclerentalsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
    private static final String USER_FILE = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalSystem/user.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("updatePassword.jsp?error=Password+confirmation+does+not+match");
            return;
        }

        List<String> users = new ArrayList<>();
        boolean updated = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(USER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 3 && parts[0].equals(username) && parts[1].trim().equals(oldPassword.trim())) {
                    // Match found, update password
                    parts[1] = newPassword;
                    String updatedLine = String.join(",", parts);
                    users.add(updatedLine);
                    updated = true;
                } else {
                    users.add(line);
                }
            }
        }

        if (updated) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(USER_FILE))) {
                for (String u : users) {
                    writer.write(u);
                    writer.newLine();
                }
            }
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("updatePassword.jsp?error=Incorrect+old+password");
        }
    }
}

package com.example.vehiclerentalsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
    private static final String USER_FILE = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalProject/user.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        String oldPassword = request.getParameter("oldPassword").trim();
        String newPassword = request.getParameter("newPassword").trim();
        String confirmPassword = request.getParameter("confirmPassword").trim();

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("updatePassword.jsp?error=Password+confirmation+does+not+match");
            return;
        }

        List<String> updatedUsers = new ArrayList<>();
        boolean updated = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(USER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");

                if (parts.length >= 4) {
                    String fileUsername = parts[0].trim();
                    String filePassword = parts[1].trim();

                    if (fileUsername.equals(username) && filePassword.equals(oldPassword)) {
                        parts[1] = newPassword; // Update password
                        updatedUsers.add(String.join(",", parts));
                        updated = true;
                    } else {
                        updatedUsers.add(line);
                    }
                } else {
                    updatedUsers.add(line);
                }
            }
        }

        if (updated) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(USER_FILE))) {
                for (String u : updatedUsers) {
                    writer.write(u);
                    writer.newLine();
                }
            }
            session.invalidate();
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("updatePassword.jsp?error=Incorrect+old+password");
        }
    }
}
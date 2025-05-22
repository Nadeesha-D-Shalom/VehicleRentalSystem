package com.example.vehiclerentalsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private static final String USER_FILE = "E:/SLIIT_Bacholer/_1_Year_sem2/OOP_FinalGoupProject/VehicleRentalProject/user.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");
        String inputPassword = request.getParameter("password");

        List<String> users = new ArrayList<>();
        boolean deleted = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(USER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2 && parts[0].equals(username) && parts[1].equals(inputPassword)) {
                    deleted = true;
                    continue; // skip this line
                }
                users.add(line);
            }
        }

        if (deleted) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(USER_FILE))) {
                for (String u : users) {
                    writer.write(u);
                    writer.newLine();
                }
            }
            session.invalidate();
            response.sendRedirect("index.html");
        } else {
            response.sendRedirect("deleteAccount.jsp?error=Incorrect+password");
        }
    }
}

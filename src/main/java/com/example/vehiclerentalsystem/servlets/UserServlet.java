package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.management.UserManagement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/registerUser")
public class UserServlet extends HttpServlet {
    private final UserManagement userManagement = new UserManagement();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String NIC = request.getParameter("nic");

        if (username == null || password == null || phone == null || NIC == null ||
                username.trim().isEmpty() || password.trim().isEmpty() || phone.trim().isEmpty() || NIC.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("userRegistation.jsp").forward(request, response);
            return;
        }

        if (!phone.matches("^(\\+94|0)?7\\d{8}$")) {
            request.setAttribute("errorMessage", "Invalid phone number format.");
            request.getRequestDispatcher("userRegistation.jsp").forward(request, response);
            return;
        }

        if (userManagement.userExists(username)) {
            request.setAttribute("errorMessage", "Username already exists.");
            request.getRequestDispatcher("userRegistation.jsp").forward(request, response);
            return;
        }

        userManagement.addUser(username, password, phone, NIC);
        userManagement.saveUsers();

        response.sendRedirect("login.jsp");
    }
}

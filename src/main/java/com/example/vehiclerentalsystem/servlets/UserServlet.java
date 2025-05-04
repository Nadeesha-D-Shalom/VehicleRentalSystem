package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.management.UserManagement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class UserServlet extends HttpServlet {
    private final UserManagement userManagement = new UserManagement();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        // ✅ Basic null or empty check
        if (username == null || password == null || phone == null ||
                username.trim().isEmpty() || password.trim().isEmpty() || phone.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // ✅ Validate phone number format
        if (!phone.matches("^(\\+94|0)?7\\d{8}$")) {
            request.setAttribute("errorMessage", "Invalid phone number format.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // ✅ Check if user exists
        if (userManagement.userExists(username)) {
            request.setAttribute("errorMessage", "Username already exists.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // ✅ Register user
        userManagement.addUser(username, password, phone);
        userManagement.saveUsers();

        response.sendRedirect("login.jsp");
    }
}

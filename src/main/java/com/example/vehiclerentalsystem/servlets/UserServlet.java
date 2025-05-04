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

        if (username == null || password == null || phone == null ||
                username.trim().isEmpty() || password.trim().isEmpty() || phone.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (userManagement.userExists(username)) {
            request.setAttribute("errorMessage", "Username already exists.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        userManagement.addUser(username, password, phone);
        userManagement.saveUsers();

        // Corrected JSP page name
        response.sendRedirect("login.jsp");
    }
}

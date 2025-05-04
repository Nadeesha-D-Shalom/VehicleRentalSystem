package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.User;
import com.example.vehiclerentalsystem.management.UserManagement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserManagement userManagement = new UserManagement();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        List<User> users = userManagement.getAllUsers();
        boolean validUser = users.stream()
                .anyMatch(u -> u.getUsername().equals(username) && u.getPassword().equals(password));

        if (validUser) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}

package com.example.vehiclerentalsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Don't create if doesn't exist
        if (session != null) {
            session.invalidate(); // Invalidate session
        }

        response.sendRedirect("index.html"); // Redirect to public homepage
    }
}

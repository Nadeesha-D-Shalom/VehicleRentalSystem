package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Feedback;
import com.example.vehiclerentalsystem.management.FeedbackManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/manageFeedback")
public class ManageFeedbackServlet extends HttpServlet {
    private FeedbackManager feedbackManager = new FeedbackManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Feedback> feedbackList = feedbackManager.getAllFeedback();
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("manage_feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String vehicleReg = request.getParameter("vehicleReg");
        String username = request.getParameter("username");

        feedbackManager.deleteFeedback(vehicleReg, username);
        response.sendRedirect("manageFeedback");
    }
}

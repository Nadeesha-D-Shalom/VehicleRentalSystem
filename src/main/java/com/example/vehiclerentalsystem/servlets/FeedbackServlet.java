package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Feedback;
import com.example.vehiclerentalsystem.management.FeedbackManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/submitFeedback")
public class FeedbackServlet extends HttpServlet {
    private FeedbackManager feedbackManager = new FeedbackManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String vehicleReg = request.getParameter("vehicleReg");
        String username = request.getParameter("username");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        Feedback feedback = new Feedback(vehicleReg, username, rating, comment);
        feedbackManager.addFeedback(feedback);

        response.sendRedirect("feedbackSuccess.jsp");
    }
}

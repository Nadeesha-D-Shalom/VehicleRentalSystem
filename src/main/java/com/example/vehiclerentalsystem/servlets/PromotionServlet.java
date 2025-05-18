package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Promotion;
import com.example.vehiclerentalsystem.management.PromotionManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/promotionServlet")
public class PromotionServlet extends HttpServlet {
    private PromotionManager manager = new PromotionManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            String title = request.getParameter("title");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            int discount = Integer.parseInt(request.getParameter("discount"));
            String note = request.getParameter("note");

            Promotion promo = new Promotion(title, startDate, endDate, discount, note);
            manager.addPromotion(promo);
        } else if ("delete".equalsIgnoreCase(action)) {
            String title = request.getParameter("title");
            manager.deletePromotion(title);
        }

        response.sendRedirect("manage_promotions.jsp");
    }
}

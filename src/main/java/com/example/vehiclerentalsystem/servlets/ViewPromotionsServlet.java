package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Promotion;
import com.example.vehiclerentalsystem.management.PromotionManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/promotions")
public class ViewPromotionsServlet extends HttpServlet {
    private PromotionManager manager = new PromotionManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Promotion> promos = manager.getAllPromotions();
        request.setAttribute("promos", promos);
        request.getRequestDispatcher("promotions.jsp").forward(request, response);
    }
}

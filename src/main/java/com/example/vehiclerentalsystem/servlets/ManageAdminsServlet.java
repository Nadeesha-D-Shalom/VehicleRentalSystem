package com.example.vehiclerentalsystem.servlets;

import com.example.vehiclerentalsystem.classes.Admin;
import com.example.vehiclerentalsystem.management.AdminManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/manageAdmins")
public class ManageAdminsServlet extends HttpServlet {
    private final AdminManager adminManager = new AdminManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Admin> adminList = adminManager.getAllAdmins();
        request.setAttribute("adminList", adminList);
        request.getRequestDispatcher("manage_admins.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String nic = request.getParameter("nic");

            Admin newAdmin = new Admin(username, password, phone, nic);
            adminManager.addAdmin(newAdmin);
            response.sendRedirect("manageAdmins");

        } else if ("update".equalsIgnoreCase(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String nic = request.getParameter("nic");

            adminManager.updateAdmin(username, password, phone, nic);
            response.sendRedirect("manageAdmins");

        } else if ("delete".equalsIgnoreCase(action)) {
            String username = request.getParameter("username");
            adminManager.deleteAdmin(username);
            response.sendRedirect("manageAdmins");

        } else {
            response.sendRedirect("manageAdmins");
        }
    }
}

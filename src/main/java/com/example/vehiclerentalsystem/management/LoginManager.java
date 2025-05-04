package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.User;
import java.util.List;

public class LoginManager {

    private final UserManagement userManagement;

    public LoginManager(UserManagement userManagement) {
        this.userManagement = userManagement;
    }

    public User login(String username, String password) {
        List<User> users = userManagement.getAllUsers();
        for (User user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }
}

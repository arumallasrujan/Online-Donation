package com.example.demo.controller;

import com.example.demo.model.Admin;
import com.example.demo.model.Customer;
import com.example.demo.model.Donation;
import com.example.demo.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/login")
    public String showLogin() {
        return "adminLogin"; 
    }

    // Process admin login
    @PostMapping("/login")
    public String processLogin(@RequestParam String username,
                               @RequestParam String password,
                               HttpServletRequest request,
                               Model model) {

        Admin admin = adminService.findByUsername(username);

        if (admin != null && admin.getPassword().equals(password)) {
            // login success: store admin info in session
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            return "redirect:/admin/dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "adminLogin";
        }
    }

    // Admin dashboard page
    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }
        return "adminDashboard"; // create a simple dashboard JSP or redirect
    }

    // Show all customers
    @GetMapping("/customers")
    public String viewAllCustomers(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }
        List<Customer> customers = adminService.findAllCustomers();
        model.addAttribute("customers", customers);
        return "adminCustomers";  // adminCustomers.jsp
    }

    // Show all donations
    @GetMapping("/donations")
    public String viewAllDonations(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }
        List<Donation> donations = adminService.findAllDonations();
        model.addAttribute("donations", donations);
        return "adminDonations";  // adminDonations.jsp
    }

    // Logout admin
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
}

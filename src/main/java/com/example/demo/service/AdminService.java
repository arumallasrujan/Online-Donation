package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Admin;
import com.example.demo.model.Customer;
import com.example.demo.model.Donation;

public interface AdminService {

    // Admin management
    void saveAdmin(Admin admin);
    Admin findByUsername(String username);
    List<Admin> findAllAdmins();

    // Retrieve all customers and donations
    List<Customer> findAllCustomers();
    List<Donation> findAllDonations();
}

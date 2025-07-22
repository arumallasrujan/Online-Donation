package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Admin;
import com.example.demo.model.Customer;
import com.example.demo.model.Donation;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.CustomerRepo;
import com.example.demo.repository.DonationRepository;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private CustomerRepo customerRepository;

    @Autowired
    private DonationRepository donationRepository;

    @Override
    public void saveAdmin(Admin admin) {
        adminRepository.save(admin);
    }

    @Override
    public Admin findByUsername(String username) {
        return adminRepository.findByUsername(username);
    }

    @Override
    public List<Admin> findAllAdmins() {
        return adminRepository.findAll();
    }

    @Override
    public List<Customer> findAllCustomers() {
        return customerRepository.findAll();
    }

    @Override
    public List<Donation> findAllDonations() {
        return donationRepository.findAll();
    }
}

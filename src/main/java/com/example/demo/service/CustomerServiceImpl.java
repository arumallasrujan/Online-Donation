package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Customer;
import com.example.demo.repository.CustomerRepo;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepo customerRepository;

    @Override
    public String customerRegistration(Customer customer) {
        customerRepository.save(customer);
        return "Customer Registered Successfully";
    }

    @Override
    public Customer checkCustomerLogin(String email, String password) {
        return customerRepository.checkCustomerLogin(email, password); // assuming this method exists in repo
    }

    @Override
    public List<Customer> findAllCustomers() {
        return customerRepository.findAll();  // assuming CustomerRepo extends JpaRepository
    }
}

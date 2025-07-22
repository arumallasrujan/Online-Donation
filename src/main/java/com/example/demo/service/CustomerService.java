package com.example.demo.service;


import java.util.List;

import com.example.demo.model.Customer;

public interface CustomerService {
	public String customerRegistration(Customer customer);
	public Customer checkCustomerLogin(String email,String password);
	
	List<Customer> findAllCustomers();
}

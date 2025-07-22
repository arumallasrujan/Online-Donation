package com.example.demo.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Customer;
import com.example.demo.service.CustomerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class CustomerController{
	
	
	@Autowired
	public CustomerService customerservice;
	
	@GetMapping("customerreg")
	public ModelAndView customerreg() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("customerreg");
		return mv;
	}
	
	@GetMapping("customerlogin")
	public ModelAndView customerlogin() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("customerlogin");
		return mv;
	}
	
	@PostMapping("insertcustomer")
	public ModelAndView insertcustomer(HttpServletRequest request) {
		String name=request.getParameter("cname");
		String gender=request.getParameter("cgender");
		String dob=request.getParameter("cdob");
		String email=request.getParameter("cemail");
		String location=request.getParameter("clocation");
		String contact=request.getParameter("ccontact");
		String password=request.getParameter("cpwd");
		Customer customer=new Customer();
		customer.setName(name);
		customer.setGender(gender);
		customer.setDateofbirth(dob);
		customer.setEmail(email);
		customer.setLocation(location);
		customer.setContact(contact);
		customer.setPassword(password);
		
		
		String message =customerservice.customerRegistration(customer);
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("customerlogin");
		mv.addObject("message",message);
		return mv;
	}
	
	@PostMapping("checkcustomerlogin")
	public ModelAndView checkcustomerlogin(HttpServletRequest request) {
		
		ModelAndView mv=new ModelAndView();
		String cemail=request.getParameter("cemail");
		String cpwd=request.getParameter("cpwd");
		
		Customer customer= customerservice.checkCustomerLogin(cemail,cpwd);
		if(customer!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("customer", customer);  //Session Object
			mv.setViewName("HomePage");
		}
		else {
			mv.setViewName("customerlogin");
			mv.addObject("message", "Login Failed");
		}
		
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView customerlogout(HttpSession session) {
	    if (session != null) {
	        session.invalidate(); // Properly log the user out
	    }
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("customerlogin");
	    return mv;
	}

	
}

package com.example.demo.controller;

import com.example.demo.model.Customer;
import com.example.demo.model.Donation;
import com.example.demo.service.DonationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class DonationController {

    @Autowired
    private DonationService donationService;

    @Value("${app.upload.dir}")
    private String uploadDir;  // Injected upload directory path from properties

    @GetMapping("/donation")
    public String showDonationForm() {
        return "donation";
    }

    @GetMapping("/HomePage")
    public String showHomePage() {
        return "HomePage";
    }

    @PostMapping("/submitDonation")
    public String submitDonation(
            @RequestParam("donationType") String donationType,
            @RequestParam("donorName") String donorName,
            @RequestParam("address") String address,
            @RequestParam("mobile") String mobile,
            @RequestParam("details") String details,
            @RequestParam("document") MultipartFile document,
            HttpServletRequest request,
            Model model) {

        Customer customer = (Customer) request.getSession().getAttribute("customer");
        if (customer == null) {
            return "redirect:/customerlogin";
        }

        Donation donation = new Donation();
        donation.setDonationType(donationType);
        donation.setDonorName(donorName);
        donation.setAddress(address);
        donation.setMobile(mobile);
        donation.setDetails(details);

        // Set logged-in user email
        donation.setDonorEmail(customer.getEmail());

        // Save donation along with the uploaded file
        boolean saved = donationService.saveDonation(donation, document);

        if (saved) {
            request.getSession().setAttribute("donation", donation);
            return "redirect:/donationSuccess";
        } else {
            model.addAttribute("error", "Failed to submit donation. Please try again.");
            return "donation";
        }
    }

    @GetMapping("/donationSuccess")
    public String showDonationSuccess(HttpServletRequest request, Model model) {
        Donation donation = (Donation) request.getSession().getAttribute("donation");
        if (donation == null) {
            return "redirect:/donation";
        }
        model.addAttribute("donation", donation);
        request.getSession().removeAttribute("donation");
        return "donationSuccess";
    }

    // View all donations by logged-in user
    @GetMapping("/viewOrders")
    public String viewOrders(HttpServletRequest request, Model model) {
        Customer customer = (Customer) request.getSession().getAttribute("customer");
        if (customer == null) {
            return "redirect:/customerlogin";
        }
        List<Donation> donations = donationService.getDonationsByDonorEmail(customer.getEmail());
        model.addAttribute("donations", donations);
        return "viewOrders";
    }

    // Serve uploaded PDF files via /files/{fileName}
    @GetMapping("/files/{fileName:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String fileName) {
        try {
            Path filePath = Paths.get(uploadDir).resolve(fileName).normalize();
            if (!Files.exists(filePath) || !Files.isReadable(filePath)) {
                return ResponseEntity.notFound().build();
            }
            Resource resource = new UrlResource(filePath.toUri());
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(resource);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }
}

package com.example.demo.service;

import com.example.demo.model.Donation;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface DonationService {
    boolean saveDonation(Donation donation, MultipartFile document);
    List<Donation> getDonationsByDonorEmail(String donorEmail);
    List<Donation> findAllDonations();
}

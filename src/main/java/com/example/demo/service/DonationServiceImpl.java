package com.example.demo.service;

import com.example.demo.model.Donation;
import com.example.demo.repository.DonationRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.List;

@Service
public class DonationServiceImpl implements DonationService {

    @Autowired
    private DonationRepository donationRepository;

    private static final String UPLOAD_DIR = "uploaded_docs/";

    @Override
    public boolean saveDonation(Donation donation, MultipartFile document) {
        try {
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            if (document != null && !document.isEmpty()) {
                String originalFileName = StringUtils.cleanPath(document.getOriginalFilename());
                String savedFileName = System.currentTimeMillis() + "_" + originalFileName;

                Path destination = Paths.get(UPLOAD_DIR).toAbsolutePath().normalize().resolve(savedFileName);
                Files.copy(document.getInputStream(), destination, StandardCopyOption.REPLACE_EXISTING);

                donation.setDocumentPath(savedFileName);
            }

            donationRepository.save(donation);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Donation> getDonationsByDonorEmail(String donorEmail) {
        return donationRepository.findByDonorEmail(donorEmail);
    }

    @Override
    public List<Donation> findAllDonations() {
        return donationRepository.findAll();
    }
}

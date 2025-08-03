package com.example.demo.service;

import com.example.demo.model.Donation;
import com.example.demo.repository.DonationRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.UUID;

@Service
public class DonationServiceImpl implements DonationService {

    @Autowired
    private DonationRepository donationRepository;

    @Value("${app.upload.dir}")
    private String uploadDir;   // Injected upload directory path

    @Override
    public boolean saveDonation(Donation donation, MultipartFile document) {
        try {
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            if (document != null && !document.isEmpty()) {
                // Clean original filename to prevent security issues
                String originalFileName = StringUtils.cleanPath(document.getOriginalFilename());

                // Extract file extension (including the dot)
                String extension = "";
                int extIndex = originalFileName.lastIndexOf('.');
                if (extIndex >= 0) {
                    extension = originalFileName.substring(extIndex);
                }

                // Generate a unique filename: timestamp + UUID + extension
                String savedFileName = System.currentTimeMillis() + "_" + UUID.randomUUID() + extension;

                // Resolve the target path for file saving
                Path destination = Paths.get(uploadDir).toAbsolutePath().normalize().resolve(savedFileName);

                // Copy the uploaded file to the target location (replacing existing file if any)
                Files.copy(document.getInputStream(), destination, StandardCopyOption.REPLACE_EXISTING);

                // Set filename in Donation entity (filename only)
                donation.setDocumentPath(savedFileName);

                System.out.println("File saved at: " + destination.toString());
            }

            // Save the Donation entity to the database
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

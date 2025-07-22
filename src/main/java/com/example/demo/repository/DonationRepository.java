package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.Donation;
import java.util.List;

public interface DonationRepository extends JpaRepository<Donation, Long> {
    // Find donations by donorEmail
    List<Donation> findByDonorEmail(String donorEmail);
}

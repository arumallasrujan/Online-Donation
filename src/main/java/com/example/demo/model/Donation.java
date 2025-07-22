package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "donations")
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="donation_type", nullable=false)
    private String donationType;

    @Column(name="donor_name", nullable=false)
    private String donorName;

    @Column(name="address", length=500, nullable=false)
    private String address;

    @Column(name="mobile", length=15, nullable=false)
    private String mobile;

    @Column(name="details", length=1000, nullable=false)
    private String details;

    @Column(name="document_path")
    private String documentPath;

    @Column(name="donor_email", nullable=false, length=100)
    private String donorEmail;          // <-- Add this field

    // Getters and setters

    public Long getId() { return id; }
    public String getDonationType() { return donationType; }
    public void setDonationType(String donationType) { this.donationType = donationType; }
    public String getDonorName() { return donorName; }
    public void setDonorName(String donorName) { this.donorName = donorName; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }
    public String getDetails() { return details; }
    public void setDetails(String details) { this.details = details; }
    public String getDocumentPath() { return documentPath; }
    public void setDocumentPath(String documentPath) { this.documentPath = documentPath; }
    
    public String getDonorEmail() { return donorEmail; }
    public void setDonorEmail(String donorEmail) { this.donorEmail = donorEmail; }
}

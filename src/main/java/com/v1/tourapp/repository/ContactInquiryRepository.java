package com.v1.tourapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.v1.tourapp.entity.ContactInquiry;

public interface ContactInquiryRepository extends JpaRepository<ContactInquiry, Long>{
    
}

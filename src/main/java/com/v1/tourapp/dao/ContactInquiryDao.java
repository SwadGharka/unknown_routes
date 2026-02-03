package com.v1.tourapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.v1.tourapp.entity.ContactInquiry;

public interface ContactInquiryDao extends JpaRepository<ContactInquiry, Long>{
    
}

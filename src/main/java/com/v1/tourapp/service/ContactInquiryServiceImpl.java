package com.v1.tourapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v1.tourapp.entity.ContactInquiry;
import com.v1.tourapp.repository.ContactInquiryRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ContactInquiryServiceImpl implements ContactInquiryService{

    @Autowired
    ContactInquiryRepository contactInquiryRepository;

    public ContactInquiry save(ContactInquiry contactInquiry){
        return contactInquiryRepository.saveAndFlush(contactInquiry);
    }
}

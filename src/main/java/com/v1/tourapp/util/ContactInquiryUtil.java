package com.v1.tourapp.util;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.v1.tourapp.entity.ContactInquiry;
import com.v1.tourapp.service.ContactInquiryService;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ContactInquiryUtil {

    @Autowired
    ContactInquiryService contactInquiryService;
    
    public JSONObject saveInquiry(String payload){
        JSONObject response = new JSONObject();
        response.put("status", 0);
        response.put("message", "Invalid reqest");
        try {
            JSONObject request = new JSONObject(payload);
            String name = request.optString("name");
            String email = request.optString("email");
            String number = request.optString("number");
            String message = request.optString("message");
            String travelType = request.optString("travelType");
            Integer persionCount = request.optInt("persionCount");
            Long packageId = request.optLong("packageId");
            if(!ValidatorUtil.isValid(name)) return response.put("message", "Please fill the Name");
            if(!ValidatorUtil.isValid(number)) return response.put("message", "Please fill the Number");

            ContactInquiry contactInquiry = new ContactInquiry();
            contactInquiry.setName(name);
            contactInquiry.setEmail(email);
            contactInquiry.setNumber(number);
            contactInquiry.setPackageId(packageId);
            contactInquiry.setPersionCount(persionCount);
            contactInquiry.setMessage(message);
            contactInquiry.setInquiryCode(ValidatorUtil.generateInquiryCode(travelType));
            contactInquiryService.save(contactInquiry);
            response.put("message", "Inquiry save successfully");
            response.put("status", 1);
        } catch (Exception e) {
            log.error("Exception caught in saveNewTravelPackage :: ", e);
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }
}

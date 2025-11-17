package com.v1.tourapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.v1.tourapp.dto.Payload;
import com.v1.tourapp.util.PackageUtil;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiController {

	@Autowired
	BaseController baseController;
	
    @Autowired
    PackageUtil packageUtil;

    @PostMapping("/save-category")
    public ResponseEntity<String> saveCategory(@RequestBody Payload payload) {
        return ResponseEntity.ok().body(packageUtil.saveCategory(payload.getPayload()).toString());
    }

    @PostMapping("/get-category")
    public ResponseEntity<String> getCategory(@RequestBody Payload payload) {
        return ResponseEntity.ok().body(packageUtil.getAllCategoriesNameAndIds().toString());
    }

    @PostMapping("/get-all-categories")
    public ResponseEntity<String> getAllCategories(@RequestBody Payload payload) {
    	ResponseEntity<String> responseEntity = ResponseEntity.ok().body(packageUtil.getAllCategories().toString());
        return responseEntity;
    }

    @PostMapping("/save-travel-package")
	public ResponseEntity<String> saveNewTravelPackage(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(packageUtil.saveNewTravelPackage(payload.getPayload()).toString());
	}

    @PostMapping("/save-activities")
	public ResponseEntity<String> saveActivities(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(packageUtil.saveActivities(payload.getPayload()).toString());
	}

    @PostMapping("/get-all-activities-by-packageId")
	public ResponseEntity<String> getAllActivitiesByPackageId(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(packageUtil.getAllActivitiesByPackageId(payload.getPayload()).toString());
	}

    @PostMapping("/get-all-packages")
	public ResponseEntity<String> getAllPackage(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(packageUtil.getAllPackage(payload.getPayload()).toString());
	}

    @PostMapping("/save-additional-details")
	public ResponseEntity<String> saveAdditionalDetails(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(packageUtil.saveAdditionalDetails(payload.getPayload()).toString());
	}

}

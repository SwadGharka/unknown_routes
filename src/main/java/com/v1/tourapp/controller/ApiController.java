package com.v1.tourapp.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.v1.tourapp.dto.Payload;
import com.v1.tourapp.util.BlogUtil;
import com.v1.tourapp.util.ContactInquiryUtil;
import com.v1.tourapp.util.PackageUtil;
import com.v1.tourapp.util.UserUtil;
import com.v1.tourapp.util.VehicleUtil;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiController {

	@Autowired
	BaseController baseController;
	
    @Autowired
    PackageUtil packageUtil;
    
    @Autowired
    VehicleUtil vehicleUtil;
    
    @Autowired
    UserUtil userUtil;
    
    @Autowired
    ContactInquiryUtil contactInquiryUtil;
    
    @Autowired
    BlogUtil blogUtil;

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
    
    @PostMapping("/save-vehicle")
	public ResponseEntity<String> saveVehicle(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(vehicleUtil.saveVehicle(payload.getPayload()).toString());
    }
    
    @PostMapping("/get-all-vehicle")
	public ResponseEntity<String> getAllVehicles(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(vehicleUtil.getAllVehicles().toString());
	}
    
    @PostMapping("/get-packages-by-id")
	public ResponseEntity<String> getPackageById(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(packageUtil.getPackageById(payload.getPayload()).toString());
	}

    @PostMapping("/get-all-packages-list")
	public ResponseEntity<String> getAllPackageForList(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(packageUtil.getAllPackageForList(payload.getPayload()).toString());
	}

    @PostMapping("/package-active-deactive")
	public ResponseEntity<String> packageActiveDeactive(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(packageUtil.packageActiveDeactive(payload.getPayload()).toString());
	}

    @PostMapping("/login")
	public ResponseEntity<String> userLogin(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(userUtil.userLogin(payload.getPayload()).toString());
	}

    @PostMapping("/save-package-inquiry")
	public ResponseEntity<String> saveInquiry(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(contactInquiryUtil.saveInquiry(payload.getPayload()).toString());
	}
    
	@PostMapping("/save-blog")
	public ResponseEntity<String> saveBlog(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(blogUtil.saveBlog(payload.getPayload()).toString());
	}
	@PostMapping("/slug-check")
	public ResponseEntity<String> checkSlugIsExist(@RequestBody Payload payload) {
		return ResponseEntity.ok().body(blogUtil.checkSlugIsExist(payload.getPayload()).toString());
	}
	
	@PostMapping("/get-all-blog-list")
	public ResponseEntity<String> getAllBlogList() {
		return ResponseEntity.ok().body(blogUtil.getAllBlogList().toString());
	}

	@PostMapping("/update-blog-image")
	public ResponseEntity<String> updateBlogImage(@RequestParam("file") MultipartFile file) throws IOException {
		return ResponseEntity.ok().body(blogUtil.updateBlogImage(file).toString());
	}

	@PostMapping("/update-blog-status")
	public ResponseEntity<String> updateBlogStatus(@RequestBody Payload payload) throws IOException {
		return ResponseEntity.ok().body(blogUtil.updateBlogStatus(payload.getPayload()).toString());
	}

	@PostMapping("/get-blog-by-id")
	public ResponseEntity<String> getBlogById(@RequestBody Payload payload) throws IOException {
		return ResponseEntity.ok().body(blogUtil.getBlogById(payload.getPayload()).toString());
	}
}

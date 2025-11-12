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
@RequestMapping("/api/category")
@CrossOrigin
public class CategoryController {

	@Autowired
	BaseController baseController;
	
    @Autowired
    PackageUtil packageUtil;

    @PostMapping("/save-category")
    public ResponseEntity<String> saveCategory(@RequestBody Payload payload) {
        return ResponseEntity.ok().body(packageUtil.saveCategory(payload.getPayload()).toString());
    }

    @PostMapping("/save-package")
	public String savePackage(Model model) {
		baseController.updateModel(model);
        // TODO work in progress 
		return "addPackage";
	}
}

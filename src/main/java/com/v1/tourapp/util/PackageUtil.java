package com.v1.tourapp.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.v1.tourapp.entity.Category;
import com.v1.tourapp.entity.Packages;
import com.v1.tourapp.service.CategoryService;

@Component
public class PackageUtil {
    
	@Autowired
	CategoryService categoryService;

    public JSONObject saveCategory(String payload){
        JSONObject response = new JSONObject();
        try {
            JSONObject request = new JSONObject(payload);
            String name = request.optString("name");
            String description = request.optString("description");
            String iconUrl = request.optString("iconUrl");
            String metaValue = request.optString("metaValue");
            Boolean status = request.optBoolean("status");
            Category category = new Category();
            category.setName(name);
            category.setDescription(description);
            category.setIconUrl(iconUrl);
            category.setMetaValue(metaValue);
            category.setStatus(status);
            categoryService.saveCategory(category);
            response.put("status", 1);
            response.put("message", "Category add successfully");
        } catch (Exception e) {
            // TODO: handle exception
            response.put("status", 0);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }
    
    public JSONObject getAllCategories() {
    	JSONObject response = new JSONObject();
    	JSONArray categories = new JSONArray();
    	List<Category> allCategories = categoryService.getAllCategories();
    	
    	for (int i = 0; i < allCategories.size() && allCategories.get(i).getStatus(); i++) {
    		Category category = allCategories.get(i);
    		JSONObject categoryJson = new JSONObject();
    		categoryJson.put("id", category.getId());
    		categoryJson.put("name", category.getName());
    		categoryJson.put("description", category.getDescription());
    		categoryJson.put("iconUrl", category.getIconUrl());
    		categoryJson.put("metaValue", category.getMetaValue());
    		categories.put(categoryJson);
		}
    	
    	response.put("categories", categories);
    	response.put("message", "All categorys");
        response.put("status", 1);
        return response;
    }

    public JSONObject getAllCategoriesNameAndIds(){
        List<Object[]> data = categoryService.getAllCategoriesNameAndIds();
        JSONObject response = new JSONObject();
        JSONArray categoryArray = new JSONArray();
        data.forEach(obj -> {
            JSONObject categoryData = new JSONObject();
            categoryData.put(obj[0] != null ? obj[0].toString() : "0", obj[1] != null ? obj[1].toString() : "N/A");
            categoryArray.put(categoryData);
        });
        response.put("categoryList", categoryArray);
        response.put("message", "All categorys");
        response.put("status", 1);
        return response;
    }

    
    public JSONObject saveNewTravelPackage(String payload){
        JSONObject response = new JSONObject();
        response.put("status", 0);
        response.put("message", "Invalid request");
        try {
            JSONObject request = new JSONObject(payload);
            String packageName = request.optString("packageName");
            String description = request.optString("description");
            String majorAttractionsList = request.optString("majorAttractionsList");
            String imageUrl = request.optString("imageUrl");
            String destination = request.optString("destination");
            int days = request.optInt("days");
            String amount = request.optString("amount");
            String members = request.optString("members");
            boolean status = request.optBoolean("status");
            Integer categoryId = request.optInt("categoryId");
            if(!ValidatorUtil.isValid(packageName)) return response.put("message", "Please fill the Name of package.");
            if(!ValidatorUtil.isValid(description)) return response.put("message", "Please fill the Description.");
            if(!ValidatorUtil.isValid(imageUrl)) return response.put("message", "Please give the Image URL.");
            if(!ValidatorUtil.isValid(destination)) return response.put("message", "Please fill the Destination.");
            if(!ValidatorUtil.isValid(days)) return response.put("message", "Please select the Number of Days.");
            if(!ValidatorUtil.isValid(amount)) return response.put("message", "Please fill the Amount.");
            if(!ValidatorUtil.isValid(members)) return response.put("message", "Please fill the Members.");
            if(!ValidatorUtil.isValid(categoryId)) return response.put("message", "Please select the Category");
            Packages packages = new Packages();
            // packages.set
            response.put("status", 1);
            response.put("message", "Category add successfully");
        } catch (Exception e) {
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }
}
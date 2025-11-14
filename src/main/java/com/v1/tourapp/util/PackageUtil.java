package com.v1.tourapp.util;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.v1.tourapp.entity.Activities;
import com.v1.tourapp.entity.Category;
import com.v1.tourapp.entity.Packages;
import com.v1.tourapp.service.ActivitiesService;
import com.v1.tourapp.service.CategoryService;
import com.v1.tourapp.service.PackageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class PackageUtil {
    
	@Autowired
	CategoryService categoryService;
    
	@Autowired
	PackageService packageService;

    @Autowired
	ActivitiesService activitiesService;

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
            Double amount = request.optDouble("amount");
            String members = request.optString("members");
            boolean status = request.optBoolean("status");
            Long categoryId = request.optLong("categoryId");
            Long packageId = request.optLong("packageId");
            if(!ValidatorUtil.isValid(packageName)) return response.put("message", "Please fill the Name of package.");
            if(!ValidatorUtil.isValid(description)) return response.put("message", "Please fill the Description.");
            if(!ValidatorUtil.isValid(imageUrl)) return response.put("message", "Please give the Image URL.");
            if(!ValidatorUtil.isValid(destination)) return response.put("message", "Please fill the Destination.");
            if(!ValidatorUtil.isValid(days)) return response.put("message", "Please select the Number of Days.");
            if(!ValidatorUtil.isValid(amount)) return response.put("message", "Please fill the Amount.");
            if(!ValidatorUtil.isValid(members)) return response.put("message", "Please fill the Members.");
            if(!ValidatorUtil.isValid(categoryId)) return response.put("message", "Please select the Category");
            Packages packages = packageService.getPackageById(packageId);
            if(packages == null){
                packages = new Packages();
            }
            packages.setName(packageName);
            packages.setDescription(description);
            packages.setImageUrl(imageUrl);
            packages.setDestination(destination);
            packages.setTotalDays(days);
            packages.setMajorAttractionsList(majorAttractionsList);
            packages.setAmount(amount);
            packages.setCategoryId(categoryId);
            packages.setStatus(status);
            packageService.save(packages);
            response.put("packageId", packages.getId());
            response.put("status", 1);
            response.put("message", "Package details save");
        } catch (Exception e) {
            log.info("Exception caught in saveNewTravelPackage :: ", e);
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }

    public JSONObject saveActivities(String payload){
        JSONObject response = new JSONObject();
        response.put("status", 0);
        response.put("message", "Invalid request");
        try {
            JSONObject request = new JSONObject(payload);
            JSONArray activityArray = request.optJSONArray("activityarray");
            Long packageId = request.optLong("packageId");
            if (!ValidatorUtil.isValid(packageId)) {
                return response.put("message", "Package not found for these activities");
            }
            List<Activities> activitiesList = new ArrayList<>();
            for(int i = 0; i < activityArray.length(); i++){
                JSONObject activity = activityArray.getJSONObject(i);
                Integer day = activity.optInt("day");
                Activities activities = activitiesService.getActivitiesByPackageIdAndDay(packageId, day);
                if(activities == null){
                    activities = new Activities();
                }
                activities.setDay(day);
                activities.setHeader(activity.optString("header"));
                activities.setPoints(activity.optString("points"));
                activities.setPackageId(packageId);
                activitiesList.add(activities);
            }
            activitiesService.saveAll(activitiesList);
            response.put("packageId", packageId);
            response.put("status", 1);
            response.put("message", "Package activties save");

        } catch (Exception e) {
            log.info("Exception caught in saveActivities ::", e);
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }

    public JSONObject getAllActivitiesByPackageId(String payload){
        JSONObject response = new JSONObject();
        response.put("status", 0);
        response.put("message", "Invalid request");
        try {
            JSONObject request = new JSONObject(payload);
            Long packageId = request.optLong("packageId");
            List<Activities> activityList = activitiesService.getAllActivitiesByPackageId(packageId);
            JSONArray activityArray = new JSONArray();
            for(Activities activity : activityList){
                JSONObject data = new JSONObject();
                data.put("header", activity.getHeader());
                data.put("point", activity.getPoints());
                data.put("day", activity.getDay());
                activityArray.put(data);
            }
            response.put("activityArray", activityArray);
            response.put("status", 1);
            response.put("message", "Acitivity List");
        } catch (Exception e) {
            log.info("Exception caught in getAllActivitiesByPackageId :: ", e);
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }

    public JSONObject saveAdditionalDetails(String payload){
        JSONObject response = new JSONObject();
        response.put("status", 0);
        response.put("message", "Invalid request");
        try {
            JSONObject request = new JSONObject(payload);
            Long packageId = request.optLong("packageId");
            JSONObject additionalData = request.optJSONObject("additionalData");
            String inclusion = additionalData.optString("inclusion");
            String exclusion = additionalData.optString("exclusion");
            String hotels = additionalData.optString("hotels");
            String flight = additionalData.optString("flight");
            Packages packages = packageService.getPackageById(packageId);
            if(packages == null){
                return response.put("message", "Package not found");
            }
            packages.setInclusion(inclusion);
            packages.setExclusion(exclusion);
            packages.setHotel(hotels);
            packages.setFlight(flight);
            packageService.save(packages);
            response.put("status", 1);
            response.put("message", "Save additional details");
        } catch (Exception e) {
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    } 
}
package com.v1.tourapp.util;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.v1.tourapp.entity.Activities;
import com.v1.tourapp.entity.Category;
import com.v1.tourapp.entity.PackageAndCategoryMapping;
import com.v1.tourapp.entity.Packages;
import com.v1.tourapp.service.ActivitiesService;
import com.v1.tourapp.service.CategoryService;
import com.v1.tourapp.service.PackageAndCategoryMappingService;
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

    @Autowired
	PackageAndCategoryMappingService packageAndCategoryMappingService;

    public JSONObject saveCategory(String payload){
        JSONObject response = new JSONObject();
        try {
            JSONObject request = new JSONObject(payload);
            String name = request.optString("name");
            String description = request.optString("description");
            String iconUrl = request.optString("icon");
            String backgroundColor = request.optString("backgroundColor");
            Boolean status = request.optBoolean("status");
            Category category = new Category();
            category.setName(name);
            category.setDescription(description);
            category.setIcon(iconUrl);
            category.setBackgroundColor(backgroundColor);
            category.setStatus(status);
            categoryService.saveCategory(category);
            response.put("status", 1);
            response.put("message", "Category add successfully");
        } catch (Exception e) {
            log.info("Exception cought in saveCategory :: ", e);
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
    		categoryJson.put("icon", category.getIcon());
    		categoryJson.put("backgroundColor", category.getBackgroundColor());
            List<Long> packageIds = packageAndCategoryMappingService.getAllPackageIdsByCategoryId(category.getId());
    		categoryJson.put("packageCount", ValidatorUtil.isValid(packageIds) ? packageIds.size() : 0);
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
            String inclusionsForCard = request.optString("inclusionsForCard");
            String badge = request.optString("badge");
            String packageColor = request.optString("packageColor");
            boolean status = request.optBoolean("status");
            JSONArray categoryIds = request.optJSONArray("categoryIds");
            Long packageId = request.optLong("packageId");
            if(!ValidatorUtil.isValid(packageName)) return response.put("message", "Please fill the Name of package.");
            if(!ValidatorUtil.isValid(description)) return response.put("message", "Please fill the Description.");
            if(!ValidatorUtil.isValid(imageUrl)) return response.put("message", "Please give the Image URL.");
            if(!ValidatorUtil.isValid(destination)) return response.put("message", "Please fill the Destination.");
            if(!ValidatorUtil.isValid(days)) return response.put("message", "Please select the Number of Days.");
            if(!ValidatorUtil.isValid(amount)) return response.put("message", "Please fill the Amount.");
            if(!ValidatorUtil.isValid(members)) return response.put("message", "Please fill the Members.");
            if(!ValidatorUtil.isValid(packageColor)) return response.put("message", "Please Select Package color.");
            if(categoryIds == null || categoryIds.length() == 0) return response.put("message", "Please select the Category");
            if(!ValidatorUtil.isValid(inclusionsForCard)) return response.put("message", "Please select the Category");
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
            packages.setInclusionsForCard(inclusionsForCard);
            packages.setAmount(amount);
            packages.setMembers(members);
            packages.setStatus(status);
            packages.setBadge(badge);
            packages.setPackageColor(packageColor);
            packageService.save(packages);
            packageAndCategoryMappingService.updateMappingStatusByPachageId(packages.getId(), "N");
            for(int i = 0; i < categoryIds.length(); i++){
                Long categoryId = categoryIds.optLong(i);
                PackageAndCategoryMapping packageAndCategoryMapping = packageAndCategoryMappingService.getPackageAndCategoryMappingByPackageId(packages.getId(), categoryId, "N");
                if(packageAndCategoryMapping == null){
                    packageAndCategoryMapping = new PackageAndCategoryMapping();
                }
                packageAndCategoryMapping.setCategoryId(categoryId);
                packageAndCategoryMapping.setPackageId(packages.getId());
                packageAndCategoryMapping.setActive("Y");
                packageAndCategoryMappingService.save(packageAndCategoryMapping);
            }
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
    
    public JSONObject getAllPackage(String payload){
        JSONObject response = new JSONObject();
        try {
            List<Packages> allPackages = packageService.getAllPackages();
            JSONArray packageArray = new JSONArray();
            for(Packages packages : allPackages ){
                List<Activities> allActivities = activitiesService.getAllActivitiesByPackageId(packages.getId());
                JSONObject packageData = new JSONObject();
                packageData.put("name", packages.getName());
                packageData.put("description", packages.getDescription());
                packageData.put("majorAttractionsList", packages.getMajorAttractionsList());
                packageData.put("imageUrl", packages.getImageUrl());
                packageData.put("destination", packages.getDestination());
                packageData.put("inclusionsForCard", packages.getInclusionsForCard());
                packageData.put("members", packages.getMembers());
                packageData.put("amount", packages.getAmount());
                packageData.put("totalDays", packages.getTotalDays());
                packageData.put("badge", packages.getBadge());
                packageData.put("packageColor", packages.getPackageColor());
                JSONArray activitArray = new JSONArray();
                for (Activities activitie : allActivities) {
                    JSONObject activityObj = new JSONObject();
                    activityObj.put("header", activitie.getHeader());
                    activityObj.put("point", activitie.getPoints());
                    activityObj.put("pakcageId", activitie.getPackageId());
                    activityObj.put("day", activitie.getDay());
                    activitArray.put(activityObj);
                }
                packageData.put("activities", activitArray);
                List<Long> categoryIds = packageAndCategoryMappingService.getAllCategoryIdsByPackageId(packages.getId());
                packageData.put("categoryId", categoryIds);
                packageArray.put(packageData);
            }
            response.put("packages", packageArray);
            response.put("status", 1);
            response.put("message", "All Packages");
            return response;
        } catch (Exception e) {
            log.info("Exception cought in getAllPackage :: ", e);
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }
}
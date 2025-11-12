package com.v1.tourapp.util;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.v1.tourapp.entity.Category;
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
}

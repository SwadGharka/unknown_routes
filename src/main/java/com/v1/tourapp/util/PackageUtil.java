package com.v1.tourapp.util;

import java.util.List;

import org.json.JSONArray;
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
    
    public List<Category> getAllCategories() {
        return categoryService.getAllCategories();
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
}
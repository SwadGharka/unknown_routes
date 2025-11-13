package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.Category;

public interface CategoryService {

	Category saveCategory(Category category);

	List<Category> getAllCategories();
	List<Object[]> getAllCategoriesNameAndIds();

	Category getCategoryById(Long id);

}

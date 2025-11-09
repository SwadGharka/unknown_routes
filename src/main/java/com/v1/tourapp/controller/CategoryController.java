package com.v1.tourapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.v1.tourapp.entity.Category;
import com.v1.tourapp.service.CategoryService;

@Controller
@RequestMapping("/api/category")
@CrossOrigin
public class CategoryController {

	@Autowired
	BaseController baseController;
	
	@Autowired
	CategoryService categoryService;

	@GetMapping("/addCategory")
	public String showAddCategoryPage(Model model) {
		baseController.updateModel(model);
		return "addCategory";
	}
	
	@PostMapping("/save-category")
    public ModelAndView saveCategory(@ModelAttribute Category category) {
        categoryService.saveCategory(category);
        ModelAndView mv = new ModelAndView("add-category");
        mv.addObject("message", "Category added successfully!");
        return mv;
    }
}

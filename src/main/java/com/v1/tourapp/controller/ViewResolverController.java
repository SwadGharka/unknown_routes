package com.v1.tourapp.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/dashboard")
@CrossOrigin
public class ViewResolverController {

    @Autowired
    BaseController baseController;
    
    @GetMapping("/home")
    public String dashboard(Model model) {
        baseController.updateModel(model);
        return "dashboard";
    }
    
    @GetMapping("/home-copy")
    public String copyDashboard(Model model) {
        baseController.updateModel(model);
        return "dashboardCopy";
    }
    
    @GetMapping("/add-package")
	public String addPackage(Model model) {
		baseController.updateModel(model);
		return "addPackage";
	}
    
    
	@GetMapping("/add-category")
    public String showAddCategoryPage(Model model) {
        baseController.updateModel(model);
        return "addCategory";
    }
	
	@GetMapping("/car-rental")
    public String carRentalDashboard(Model model) {
        baseController.updateModel(model);
        return "carRentalHome";
    }
	
	@GetMapping("/addVehical")
    public String addCarRental(Model model) {
        baseController.updateModel(model);
        return "addVehical";
    }

}

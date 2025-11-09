package com.v1.tourapp.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/api/packages")
@CrossOrigin
public class PackageController {

    @Autowired
    BaseController baseController;
    
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        baseController.updateModel(model);
        return "dashboard";
    }
    
    @GetMapping("/dashboard-copy")
    public String copyDashboard(Model model) {
        baseController.updateModel(model);
        return "dashboardCopy";
    }
    
    @GetMapping("/addPackage")
	public String showAddPackage(Model model) {
		baseController.updateModel(model);
		return "addPackage";
	}
    
    
}

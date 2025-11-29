package com.v1.tourapp.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.v1.tourapp.util.PackageUtil;
import com.v1.tourapp.util.SessionUtil;
import com.v1.tourapp.util.ValidatorUtil;

@Controller
@RequestMapping("/dashboard")
@CrossOrigin
public class ViewResolverController {

    @Autowired
    BaseController baseController;

    @Autowired
    SessionUtil sessionUtil;

    @Autowired
    PackageUtil packageUtil;
    
    @GetMapping(value={"","/"})
    public String index(Model model) {
        baseController.updateModel(model);
        return "redirect:/dashboard/login";
    }
    
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
	public String addPackage(Model model, @RequestParam("packageId") @Nullable Integer  packageId) {
        if(sessionUtil.getSession().getAttribute("userName") == null){
            return "redirect:/dashboard/login";
        }
        model.addAttribute("packageId", packageId);
		baseController.updateModel(model);
		return "addPackage";
	}
    
    
	@GetMapping("/add-category")
    public String showAddCategoryPage(Model model) {
        if(sessionUtil.getSession().getAttribute("userName") == null){
            return "redirect:/dashboard/login";
        }
        baseController.updateModel(model);
        return "addCategory";
    }
	
	@GetMapping("/car-rental")
    public String carRentalDashboard(Model model) {
        baseController.updateModel(model);
        return "carRentalHome";
    }
	
	@GetMapping("/addVehicle")
    public String addCarRental(Model model) {
        baseController.updateModel(model);
        return "addVehicle";
	}
	
	@GetMapping("/package-list")
    public String packageList(Model model) {
        if(sessionUtil.getSession().getAttribute("userName") == null){
            return "redirect:/dashboard/login";
        }
        baseController.updateModel(model);
        return "packageList";
    }
	
	@GetMapping("/login")
    public String login(Model model) {
        baseController.updateModel(model);
        if(sessionUtil.getSession().getAttribute("userName") != null){
            return "redirect:/dashboard/home";
        }
        return "login";
    }
    
    @GetMapping("/logout")
	public String userLogOut(HttpSession session) {
		session.invalidate();
        sessionUtil.getSession().setAttribute("userName", null);
        return "redirect:/dashboard/home";
	}

    @GetMapping("/package-details")
    public String getPackageDetails(@RequestParam("payload") String payload, Model model) {
        model.addAttribute("packageId", ValidatorUtil.payloadDecode(payload));
        return "packageDetails";
    }

}

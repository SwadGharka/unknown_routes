package com.v1.tourapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.v1.tourapp.entity.Blog;
import com.v1.tourapp.util.BlogUtil;
import com.v1.tourapp.util.PackageUtil;
import com.v1.tourapp.util.SessionUtil;
import com.v1.tourapp.util.ValidatorUtil;

import jakarta.servlet.http.HttpSession;

@Controller
@CrossOrigin
@RequestMapping(value = {"","/dashboard", "/dashboard/"})
public class ViewResolverController {

    @Autowired
    BaseController baseController;

    @Autowired
    SessionUtil sessionUtil;

    @Autowired
    PackageUtil packageUtil;

    @Autowired
    BlogUtil blogutil;
    
    @GetMapping(value={"", "/"})
    public String index(Model model) {
        baseController.updateModel(model);
        return "redirect:/dashboard/home";
    }
    
    @GetMapping(value={"home"})
    public String dashboard(Model model) {
        baseController.updateModel(model, "OOO Trips - Out Of Office");
        return "dashboard";
    }
    
    @GetMapping("home-copy")
    public String copyDashboard(Model model) {
        baseController.updateModel(model);
        return "dashboardCopy";
    }
    
    @GetMapping("add-package")
	public String addPackage(Model model, @RequestParam("packageId") @Nullable Integer  packageId) {
        if(sessionUtil.getSession().getAttribute("userName") == null){
            return "redirect:/dashboard/login";
        }
        model.addAttribute("packageId", packageId);
		baseController.updateModel(model, "Add Package");
		return "addPackage";
	}
    
    
	@GetMapping("add-category")
    public String showAddCategoryPage(Model model) {
        if(sessionUtil.getSession().getAttribute("userName") == null){
            return "redirect:/dashboard/login";
        }
        baseController.updateModel(model, "Add Category");
        return "addCategory";
    }
	
	@GetMapping("addVehicle")
    public String addCarRental(Model model) {
        baseController.updateModel(model, "Add Vehical");
        return "addVehicle";
	}
	
	@GetMapping("package-list")
    public String packageList(Model model) {
        if(sessionUtil.getSession().getAttribute("userName") == null){
            return "redirect:/dashboard/login";
        }
        baseController.updateModel(model, "Package List");
        return "packageList";
    }
	
	@GetMapping("login")
    public String login(Model model) {
        model.addAttribute("title", "Login");
        baseController.updateModel(model, "Login");
        if(sessionUtil.getSession().getAttribute("userName") != null){
            return "redirect:/dashboard/home";
        }
        return "login";
    }
    
    @GetMapping("logout")
	public String userLogOut(HttpSession session) {
		session.invalidate();
        sessionUtil.getSession().setAttribute("userName", null);
        return "redirect:/dashboard/home";
	}

    @GetMapping("package-details")
    public String getPackageDetails(@RequestParam("payload") String payload, Model model) {
        model.addAttribute("packageId", ValidatorUtil.payloadDecode(payload));
        return "packageDetails";
    }

    @GetMapping("blog-list")
    public String getBlogList(Model model) {
        // model.addAttribute("packageId", ValidatorUtil.payloadDecode(payload));
        model.addAttribute("title", "Blog List");
        return "blog/blogList";
    }

    @GetMapping("new-blog")
    public String newBlogForm(Model model, @RequestParam("blogId") @Nullable String blogId) {
        if(sessionUtil.getSession().getAttribute("userName") == null){
            return "redirect:/dashboard/login";
        }
        model.addAttribute("blogId",blogId);
        if(ValidatorUtil.isValid(blogId)){
            model.addAttribute("title", "Edit Blog");
        }else{
            model.addAttribute("title", "Add New Blog");
        }
        // model.addAttribute("blogPost", new Blog());
        return "blog/blogEditor";
    }

    @GetMapping("view-blog/{slug}")
    public String viewBlog(Model model, @PathVariable("slug") String slug) {
        model.addAttribute("title", "View Blog");
        Blog blog = blogutil.getBlogBySlug(slug);
        if(blog == null){
            return "common/404";
        }
        if(sessionUtil.getSession().getAttribute("userName") != null){
            model.addAttribute("blog", blog);
            return "blog/viewBlog";
        }else{
            if(blog.getStatus().equalsIgnoreCase("PUBLISHED")){
                model.addAttribute("blog", blog);
                return "blog/viewBlog";
            }
        }
        return "common/404";
    }
}

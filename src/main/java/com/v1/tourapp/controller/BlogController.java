package com.v1.tourapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.v1.tourapp.entity.Blog;
import com.v1.tourapp.util.BlogUtil;
import com.v1.tourapp.util.SessionUtil;

@Controller
@CrossOrigin
@RequestMapping(value = {"blog/"})
public class BlogController {

    
    @Autowired
    BlogUtil blogutil;

    @Autowired
    SessionUtil sessionUtil;
    @GetMapping("{slug}")
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

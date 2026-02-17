package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.Blog;

public interface BlogService {
    Blog save(Blog post);
    Blog getBySlug(String slug);
    Blog getBySlug(String slug, String status);
    Blog getBlogById(Integer id);
    Boolean isSlugExists(String slug);
    List<Blog> getAllBlogList(List<String> status);
}


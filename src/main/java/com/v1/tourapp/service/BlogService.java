package com.v1.tourapp.service;

import com.v1.tourapp.entity.Blog;

public interface BlogService {
    Blog save(Blog post);
    Blog getBySlug(String slug);
}


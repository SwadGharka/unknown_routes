package com.v1.tourapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v1.tourapp.dao.BlogDao;
import com.v1.tourapp.entity.Blog;

@Service
public class BlogServiceImpl implements BlogService{

    @Autowired
    private BlogDao blogDao;

    public Blog save(Blog post) {
        return blogDao.save(post);
    }

    public Blog getBySlug(String slug) {
        return blogDao.findBySlug(slug).orElse(null);
    }
}


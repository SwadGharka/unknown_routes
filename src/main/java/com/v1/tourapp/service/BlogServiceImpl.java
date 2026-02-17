package com.v1.tourapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v1.tourapp.dao.BlogDao;
import com.v1.tourapp.entity.Blog;

@Service
public class BlogServiceImpl implements BlogService{

    @Autowired
    private BlogDao blogDao;

    @Override
    public Blog save(Blog post) {
        return blogDao.save(post);
    }

    @Override
    public Blog getBySlug(String slug) {
        return blogDao.findBySlug(slug).orElse(null);
    }
    
    @Override
    public Blog getBySlug(String slug, String status) {
        return blogDao.getBySlugAndStatus(slug, status);
    }

    @Override
    public Boolean isSlugExists(String slug) {
        return blogDao.isSlugExists(slug) > 0;
    }

    @Override
    public List<Blog> getAllBlogList(List<String> status) {
        return blogDao.getAllBlogList(status);
    }

    @Override
    public Blog getBlogById(Integer id) {
        return blogDao.getBlogById(id);
    }
}


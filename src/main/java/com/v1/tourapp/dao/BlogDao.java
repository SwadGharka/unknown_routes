package com.v1.tourapp.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.v1.tourapp.entity.Blog;

public interface BlogDao  extends JpaRepository<Blog, Long> {
        Optional<Blog> findBySlug(String slug);
}

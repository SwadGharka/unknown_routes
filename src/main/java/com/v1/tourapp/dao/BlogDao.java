package com.v1.tourapp.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.v1.tourapp.entity.Blog;

public interface BlogDao  extends JpaRepository<Blog, Long> {
        
        Optional<Blog> findBySlug(String slug);
        @Query(value = "SELECT COUNT(ID) FROM BLOGS WHERE SLUG = ?1", nativeQuery = true)
        Integer isSlugExists(String slug);
        
        @Query(value = "SELECT * FROM BLOGS WHERE STATUS IN (?1) ORDER BY UPDATED_AT DESC ", nativeQuery = true)
        List<Blog> getAllBlogList(List<String> status);
        
        @Query(value = "SELECT * FROM BLOGS WHERE ID = ?1 ", nativeQuery = true)
        Blog getBlogById(Integer id);
        
        @Query(value = "SELECT * FROM BLOGS WHERE SLUG = ?1 AND STATUS = ?2 ", nativeQuery = true)
        Blog getBySlugAndStatus(String slug, String status);
}

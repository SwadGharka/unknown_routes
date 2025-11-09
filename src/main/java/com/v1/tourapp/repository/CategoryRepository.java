package com.v1.tourapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.v1.tourapp.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
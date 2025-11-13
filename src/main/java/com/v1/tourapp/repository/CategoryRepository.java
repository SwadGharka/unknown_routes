package com.v1.tourapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.v1.tourapp.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    
    @Query(value="SELECT ID, NAME FROM CATEGORY WHERE STATUS = TRUE;", nativeQuery = true)
    List<Object[]>getAllCategoriesNameAndIds();
}
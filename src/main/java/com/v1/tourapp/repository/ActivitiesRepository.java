package com.v1.tourapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.v1.tourapp.entity.Activities;

public interface ActivitiesRepository extends JpaRepository<Activities, Long>{
    
    @Query(value = "SELECT * FROM ACTIVITIES WHERE PACKAGE_ID = ?1 AND DAY = ?2 ", nativeQuery = true)
    Activities getActivitiesByPackageIdAndDay(Long packageId, Integer day);
    
    @Query(value = "SELECT * FROM ACTIVITIES WHERE PACKAGE_ID = ?1 ", nativeQuery = true)
    List<Activities> getAllActivitiesByPackageId(Long packageId);
}

package com.v1.tourapp.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.v1.tourapp.entity.PackageAndCategoryMapping;

public interface PackageAndCategoryMappingRepository extends JpaRepository<PackageAndCategoryMapping, Long>{
    
    @Query(value = "SELECT CATEGORY_ID FROM PACKAGES_CATEGORY_MAPPING WHERE PACKAGE_ID = ?1 AND ACTIVE = 'Y' ", nativeQuery = true)
    List<Long> getAllCategoryIdsByPackageId(Long packageId);
    
    @Query(value = "SELECT * FROM PACKAGES_CATEGORY_MAPPING WHERE PACKAGE_ID = ?1 AND CATEGORY_ID = ?2 AND ACTIVE = ?3 ", nativeQuery = true)
    PackageAndCategoryMapping getPackageAndCategoryMappingByPackageId(Long packageId, Long categoryId, String active);

    @Modifying
	@Transactional
    @Query(value = "UPDATE PACKAGES_CATEGORY_MAPPING SET ACTIVE = ?2 WHERE PACKAGE_ID = ?1 ", nativeQuery = true)
    int updateMappingStatusByPachageId(Long packageId, String active);
    
    @Query(value = "SELECT PACKAGE_ID FROM PACKAGES_CATEGORY_MAPPING WHERE CATEGORY_ID = ?1 AND ACTIVE = 'Y' ", nativeQuery = true)
    List<Long> getAllPackageIdsByCategoryId(Long categoryId);
}

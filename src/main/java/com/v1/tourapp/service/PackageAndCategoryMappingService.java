package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.PackageAndCategoryMapping;

public interface PackageAndCategoryMappingService {
    PackageAndCategoryMapping save(PackageAndCategoryMapping packageAndCategoryMapping);
    PackageAndCategoryMapping getPackageAndCategoryMappingByPackageId(Long packageId, Long categoryId, String active);
    List<Long> getAllCategoryIdsByPackageId(Long packageId);
    int updateMappingStatusByPachageId(Long packageId, String active);
    List<Long> getAllPackageIdsByCategoryId(Long categoryId);
}

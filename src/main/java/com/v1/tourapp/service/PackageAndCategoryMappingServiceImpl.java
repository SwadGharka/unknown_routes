package com.v1.tourapp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.v1.tourapp.entity.PackageAndCategoryMapping;
import com.v1.tourapp.repository.PackageAndCategoryMappingRepository;
import org.springframework.stereotype.Service;

@Service
public class PackageAndCategoryMappingServiceImpl implements PackageAndCategoryMappingService{
    
    @Autowired
    PackageAndCategoryMappingRepository packageAndCategoryMappingRepository;

    @Override
    public PackageAndCategoryMapping save(PackageAndCategoryMapping packageAndCategoryMapping){
        return packageAndCategoryMappingRepository.saveAndFlush(packageAndCategoryMapping);
    }

    @Override
    public PackageAndCategoryMapping getPackageAndCategoryMappingByPackageId(Long packageId, Long categoryId, String active){
        return packageAndCategoryMappingRepository.getPackageAndCategoryMappingByPackageId(packageId, categoryId, active);
    }

    @Override
    public List<Object[]> getAllCategoryIdsByPackageId(Long packageId){
        return packageAndCategoryMappingRepository.getAllCategoryIdsByPackageId(packageId);
    }

    @Override
    public List<Long> getAllPackageIdsByCategoryId(Long categoryId){
        return packageAndCategoryMappingRepository.getAllPackageIdsByCategoryId(categoryId);
    }

    @Override
    public int updateMappingStatusByPachageId(Long packageId, String active){
        return packageAndCategoryMappingRepository.updateMappingStatusByPachageId(packageId, active);
    }
}

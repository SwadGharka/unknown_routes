package com.v1.tourapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v1.tourapp.entity.Activities;
import com.v1.tourapp.repository.ActivitiesRepository;

@Service
public class ActivitiesServiceImpl implements ActivitiesService {


    @Autowired
    ActivitiesRepository activitiesRepository;

    @Override
    public List<Activities> saveAll(List<Activities> activities){
        return activitiesRepository.saveAllAndFlush(activities);
    }

    @Override
    public List<Activities> getAllActivitiesByPackageId(Long packageId){
        return activitiesRepository.getAllActivitiesByPackageId(packageId);
    }

    @Override
    public Activities getActivitiesByPackageIdAndDay(Long packageId, Integer day){
        return activitiesRepository.getActivitiesByPackageIdAndDay(packageId, day);
    }
}

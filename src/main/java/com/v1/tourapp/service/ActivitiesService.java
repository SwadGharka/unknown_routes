package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.Activities;

public interface ActivitiesService {
    List<Activities> saveAll(List<Activities> activities);
    List<Activities> getAllActivitiesByPackageId(Long packageId);
    Activities getActivitiesByPackageIdAndDay(Long packageId, Integer day);
}

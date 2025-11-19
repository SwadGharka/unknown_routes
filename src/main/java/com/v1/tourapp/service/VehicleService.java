package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.Vehicle;

public interface VehicleService {

	Vehicle save(Vehicle vehicle);
	List<Object[]> getAllActiveVehicles();
}

package com.v1.tourapp.util;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.v1.tourapp.entity.Vehicle;
import com.v1.tourapp.service.VehicleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class VehicleUtil {

	@Autowired
	VehicleService vehicleService;
	
	
	public JSONObject saveVehicle(String payload){
        JSONObject response = new JSONObject();
        response.put("status", 0);
        response.put("message", "Invalid request");
        try {
        	JSONObject req = new JSONObject(payload);
         	Vehicle vehicle = new Vehicle();
        	vehicle.setName(req.getString("name"));
        	vehicle.setBadgeClass(req.getString("badgeClass"));
        	vehicle.setBadgeLabel(req.getString("badgeLabel"));
        	vehicle.setFeatures(req.getString("features"));
        	vehicle.setPricePerKm(req.getString("price"));
        	vehicle.setSpecBags(req.getJSONObject("specs").getInt("bags"));
        	vehicle.setSpecSeats(req.getJSONObject("specs").getInt("seats"));
        	vehicle.setSpecFuel(req.getJSONObject("specs").getString("fuel"));
        	vehicle.setSpecTransmission(req.getJSONObject("specs").getString("transmission"));
        	vehicle.setTagline(req.getString("tagline"));
        	vehicleService.save(vehicle);
            response.put("status", 1);
            response.put("message", "Save vehicle details.");
        } catch (Exception e) {
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }
	
}

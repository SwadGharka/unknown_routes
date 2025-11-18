package com.v1.tourapp.util;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
            
            response.put("status", 1);
            response.put("message", "Save vehicle details.");
        } catch (Exception e) {
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }
	
}

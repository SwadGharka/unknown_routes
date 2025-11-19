package com.v1.tourapp.util;

import java.util.List;

import org.json.JSONArray;
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
        	vehicle.setActiveStatus(req.getBoolean("status"));
        	vehicleService.save(vehicle);
            response.put("status", 1);
            response.put("message", "Save vehicle details.");
        } catch (Exception e) {
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }
	
	
	public JSONObject getAllVehicles() {
		JSONObject response = new JSONObject();
		JSONArray activeVehicles = new JSONArray();
		try {
			List<Object[]> allVehicles = vehicleService.getAllActiveVehicles();
			
			
			allVehicles.forEach(obj -> {
				JSONObject json = new JSONObject();

				json.put("id", obj[0]);
				json.put("active_status", obj[1]);
				json.put("badge_class", obj[2]);
				json.put("badge_label", obj[3]);
				json.put("features", obj[4]);
				json.put("image", obj[5]); 
				json.put("name", obj[6]);
				json.put("price_per_km", obj[7]);
				json.put("max_no_of_bags", obj[8]);
				json.put("fuel_type", obj[9]);
				json.put("max_pax", obj[10]);
				json.put("gear_type", obj[11]);
				json.put("tagline", obj[12]);
				
				activeVehicles.put(json);
				
			});
			
			
			
			response.put("vehicles", activeVehicles);
			response.put("status", 1);
			response.put("message", "All Active Vehicles");
			return response;
		} catch (Exception e) {
			log.error("Exception cought in getAllVehicles :: ", e);
			response.put("status", 2);
			response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
		}
		return response;
	}
	
}

package com.v1.tourapp.util;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.v1.tourapp.entity.User;
import com.v1.tourapp.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class UserUtil {
    
    @Autowired
    UserService userService;

    @Autowired
    SessionUtil sessionUtil;
    
    public JSONObject userLogin(String payload) {
        JSONObject response = new JSONObject();
        response.put("status", 0);
        response.put("message", "Invalid request");
        try {
            JSONObject request = new JSONObject(payload);
            String userName = request.optString("userName");
            String password = request.optString("password");
            if (ValidatorUtil.isValid(userName)) {
                if (ValidatorUtil.isValid(password)) {
                    User user = userService.getUserByUserName(userName);
                    if (user != null) {
                        if (user.getPassword().equals(ValidatorUtil.getEncryption(password))) {
                            response.put("message", "Welcome " + user.getFullName());
                            response.put("status", 1);
                            HttpSession session = sessionUtil.getSession();
                            session.setAttribute("userName", user.getUserName());
                            return response;
                        } else {
                            response.put("message", "Invalid password");
                            return response;
                        }
                    } else {
                        response.put("message", "Invalid User Name");
                        return response;
                    }
                } else {
                    response.put("message", "Password can not be Empty");
                    return response;
                }
            } else {
                response.put("message", "User Name can not be Empty");
                return response;
            }   
        } catch (Exception e) {
            log.error("Exception caught in userLogin :: ", e);
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
            return response;
        }
    }

    public JSONObject userLogOut(){
        JSONObject response = new JSONObject();
        try {
            sessionUtil.getSession().invalidate();
            sessionUtil.getSession().setAttribute("userName", null);
            response.put("message", "Logout seccussfully");
            response.put("status", 1);
        } catch (Exception e) {
            log.error("Exception caught in userLogOut :: ", e);
            response.put("status", 2);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
            return response;
        }
        return response;
    } 
}

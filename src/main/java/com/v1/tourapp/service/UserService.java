package com.v1.tourapp.service;

import com.v1.tourapp.entity.User;

public interface UserService {
    User saveUser(User user);
    User getUserByUserName(String userName);
}

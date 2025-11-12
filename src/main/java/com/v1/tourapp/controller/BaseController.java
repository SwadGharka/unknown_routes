package com.v1.tourapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import com.v1.tourapp.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class BaseController {

    @Autowired
    SessionUtil sessionUtil;

    @Value("${PATH_FOLDER_JS}")
    protected String PATH_FOLDER_JS;

    @Value("${PATH_FOLDER_CSS}")
    protected String PATH_FOLDER_CSS;

    public Model updateModel(Model model){
        model.addAttribute("BASE_URL", sessionUtil.getBaseUrl());
        model.addAttribute("CONTEXT_PATH", sessionUtil.getContextPath());
        model.addAttribute("PATH_FOLDER_JS", sessionUtil.getBaseUrlWithContextPath()+PATH_FOLDER_JS);
        model.addAttribute("PATH_FOLDER_CSS", sessionUtil.getBaseUrlWithContextPath()+PATH_FOLDER_CSS);
        return model;
    }
}

package com.v1.tourapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class TourAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(TourAppApplication.class, args);
    }
}

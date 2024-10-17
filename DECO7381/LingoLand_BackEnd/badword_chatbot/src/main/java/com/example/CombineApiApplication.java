package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication  // Marks this class as the main Spring Boot application class
@ComponentScan(basePackages = {"com"}) // Specifies which package(s) to scan for Spring Beans
public class CombineApiApplication {
    public static void main(String[] args) {
        // Set the JNA (Java Native Access) library path to locate the Tesseract native library
        System.setProperty("jna.library.path", "/usr/local/Cellar/tesseract/5.4.1/lib");

        // Launch the Spring Boot application
        SpringApplication.run(CombineApiApplication.class, args);
    }
}


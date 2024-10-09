package com.example.chatbot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * The main entry point for the ChatGPT API Spring Boot application.
 *
 * This class is annotated with @SpringBootApplication, which is a convenience annotation
 * that adds the following:s
 * - @Configuration: Marks the class as a source of bean definitions.
 * - @EnableAutoConfiguration: Enables Spring Boot's auto-configuration feature, which automatically
 *   configures the application based on the dependencies present in the classpath.
 * - @ComponentScan: Enables component scanning, which allows Spring to detect and register beans in the application.
 */
@SpringBootApplication
public class ChatGptApiApplication {

    /**
     * The main method, which serves as the entry point for the Spring Boot application.
     *
     * SpringApplication.run() launches the application by:
     * 1. Starting the embedded application server (Tomcat by default).
     * 2. Initialising the Spring application context.
     * 3. Scanning for @Component, @Service, @Repository, and other Spring-managed beans.
     *
     * @param args Command-line arguments passed to the application.
     */
    public static void main(String[] args) {
        // Start the Spring Boot application
        SpringApplication.run(ChatGptApiApplication.class, args);
    }
}

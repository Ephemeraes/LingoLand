package com.example.badwords;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * The main class for the Badwords API Spring Boot application.
 *
 * This class serves as the entry point of the Spring Boot application and is annotated with
 * @SpringBootApplication, which is a convenience annotation that adds the following:
 *
 * 1. @Configuration: Indicates that this class can be used by the Spring IoC container as a source of
 *    bean definitions.
 *
 * 2. @EnableAutoConfiguration: Tells Spring Boot to automatically configure your application based on the
 *    dependencies you have added. This allows the application to automatically set up things like
 *    a web server or database connection.
 *
 * 3. @ComponentScan: Enables component scanning so that the web controllers and other components you
 *    create are automatically discovered and registered as Spring beans.
 */
@SpringBootApplication
public class BadwordsApiApplication {

    /**
     * The main method is the entry point of the Spring Boot application.
     *
     * SpringApplication.run() is a static method used to launch the Spring Boot application.
     * It does the following:
     *
     * 1. Starts the embedded server (such as Tomcat) for web applications.
     * 2. Initialises the Spring application context (IoC container).
     * 3. Auto-configures the application based on the dependencies and annotations present.
     * 4. Scans for Spring components like @Component, @Service, @Repository, and @Controller in the
     *    base package and its sub-packages.
     *
     * @param args Command-line arguments passed to the application (if any).
     */
    public static void main(String[] args) {
        // Start the Spring Boot application
        SpringApplication.run(BadwordsApiApplication.class, args);
    }
}

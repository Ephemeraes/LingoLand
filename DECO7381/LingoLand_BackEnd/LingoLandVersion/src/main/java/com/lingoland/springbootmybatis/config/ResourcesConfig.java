package com.lingoland.springbootmybatis.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 通用配置
 */
@Configuration
public class ResourcesConfig implements WebMvcConfigurer
{

    /**
     * Cross-domain configuration
     */
    @Bean
    public CorsFilter corsFilter()
    {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        // Set the access source address
        config.addAllowedOriginPattern("*");
        // Set the access origin request header
        config.addAllowedHeader("*");
        // Set the access source request method
        config.addAllowedMethod("*");
        // Validity period: 1800 seconds
        config.setMaxAge(1800L);
        // Add a mapping path to intercept all requests
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        // Returns the new CorsFilter
        return new CorsFilter(source);
    }
}

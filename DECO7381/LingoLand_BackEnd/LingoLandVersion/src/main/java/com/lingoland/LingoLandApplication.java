package com.lingoland;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.lingoland.springbootmybatis.mapper")
@SpringBootApplication
public class LingoLandApplication
{
    public static void main( String[] args )
    {
        SpringApplication.run(LingoLandApplication.class, args);
    }
}

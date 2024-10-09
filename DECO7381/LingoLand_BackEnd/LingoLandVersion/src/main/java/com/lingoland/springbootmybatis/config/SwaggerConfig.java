package com.lingoland.springbootmybatis.config;//访问地址： http://localhost:9090/swagger-ui/index.html

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
public class SwaggerConfig {

    @Value("${swagger.enabled}")
    private boolean enabled;

    //reference: https://www.youtube.com/watch?time_continue=237&v=Tx4Fh25KqaU&embeds_referring_euri=https%3A%2F%2Fwww.bing.com%2F&embeds_referring_origin=https%3A%2F%2Fwww.bing.com&source_ve_path=MTM5MTE3LDEzOTExNywyODY2Ng
    @Bean
    public Docket restApi() {
        return new Docket(DocumentationType.OAS_30)
                 .enable(enabled)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                // no annotation version
                // .apis(RequestHandlerSelectors.basePackage("com.lingoland.springbootmybatis.controller"))
                .paths(PathSelectors.any())
                .build();
    }
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("document")
                .description("describe")
                .contact(new Contact("deco7381", null, null))
                .version("version")
                .build();
    }
}

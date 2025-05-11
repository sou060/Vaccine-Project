package com.java.vaccineproject.config;

import org.mockito.Mockito;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Profile;

/**
 * Configuration class to help with Mockito integration.
 * This class is only active in the "test" profile.
 */
@Profile("test")
@Configuration
public class MockitoConfiguration {
    
    /**
     * This is a sample method showing how to create mock beans in a configuration class.
     * Similar methods can be added for other services that need to be mocked.
     * 
     * @return A mock instance that can be injected where the service is needed
     */
    @Bean
    @Primary
    public Object mockitoExampleBean() {
        // This is just a placeholder. Add actual service interfaces here as needed
        return Mockito.mock(Object.class);
    }
}

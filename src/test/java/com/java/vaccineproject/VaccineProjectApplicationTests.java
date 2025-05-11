package com.java.vaccineproject;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * Main application test class that verifies the Spring context loads correctly.
 * This is a smoke test to ensure that the application can start without errors.
 */
@SpringBootTest
class VaccineProjectApplicationTests {
    
    private static final Logger logger = LoggerFactory.getLogger(VaccineProjectApplicationTests.class);

    @Test
    @DisplayName("Test that Spring application context loads successfully")
    void contextLoads() {
        logger.info("Verifying Spring application context loads correctly");
        // This test will fail if the application context cannot start
    }
}

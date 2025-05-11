package com.java.vaccineproject.service;

import com.java.vaccineproject.model.Vaccine;
import com.java.vaccineproject.repo.IVaccineRepo;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class VServiceTest {
    
    private static final Logger logger = LoggerFactory.getLogger(VServiceTest.class);
    
    @Mock
    private IVaccineRepo vaccineRepo;
    
    @InjectMocks
    private VService vService;
    
    private Vaccine vaccine1;
    private Vaccine vaccine2;
    
    @BeforeEach
    void setUp() {
        logger.info("Setting up test vaccines");
        
        vaccine1 = new Vaccine();
        vaccine1.setVaccineId(1);
        vaccine1.setVaccineName("Pfizer-BioNTech");
        vaccine1.setVaccineDescription("mRNA vaccine");
        vaccine1.setVaccineType("mRNA");
        vaccine1.setVaccineCompany("Pfizer");
        
        vaccine2 = new Vaccine();
        vaccine2.setVaccineId(2);
        vaccine2.setVaccineName("Moderna");
        vaccine2.setVaccineDescription("mRNA vaccine");
        vaccine2.setVaccineType("mRNA");
        vaccine2.setVaccineCompany("Moderna");
    }
    
    @Test
    @DisplayName("Should return all vaccines when getVaccines is called")
    void testGetVaccines() {
        logger.debug("Testing getVaccines() method");
        
        // Arrange
        when(vaccineRepo.findAll()).thenReturn(Arrays.asList(vaccine1, vaccine2));
        
        // Act
        List<Vaccine> vaccines = vService.getVaccines();
        
        // Assert
        assertEquals(2, vaccines.size(), "Should return two vaccines");
        assertEquals("Pfizer-BioNTech", vaccines.get(0).getVaccineName(), "First vaccine should be Pfizer");
        assertEquals("Moderna", vaccines.get(1).getVaccineName(), "Second vaccine should be Moderna");
        verify(vaccineRepo, times(1)).findAll();
    }
    
    @Test
    @DisplayName("Should add a new vaccine and return its name")
    void testAddVaccine() {
        logger.debug("Testing addVaccine() method");
        
        // Arrange
        when(vaccineRepo.save(any(Vaccine.class))).thenReturn(vaccine1);
        
        // Act
        String result = vService.addVaccine(vaccine1);
        
        // Assert
        assertEquals("Pfizer-BioNTech", result, "Should return the name of the saved vaccine");
        verify(vaccineRepo, times(1)).save(vaccine1);
    }
    
    @Test
    @DisplayName("Should delete a vaccine by ID")
    void testDeleteVaccine() {
        logger.debug("Testing deleteVaccine() method");
        
        // Arrange
        doNothing().when(vaccineRepo).deleteById(anyInt());
        
        // Act
        vService.deleteVaccine(1);
        
        // Assert
        verify(vaccineRepo, times(1)).deleteById(1);
    }
    
    @Test
    @DisplayName("Should fetch a vaccine by ID when it exists")
    void testFetchVaccineByIdWhenExists() {
        logger.debug("Testing fetchVaccineById() method with existing ID");
        
        // Arrange
        when(vaccineRepo.findById(1)).thenReturn(Optional.of(vaccine1));
        
        // Act
        Vaccine result = vService.fetchVaccineById(1);
        
        // Assert
        assertNotNull(result, "Result should not be null");
        assertEquals("Pfizer-BioNTech", result.getVaccineName(), "Should return correct vaccine");
        verify(vaccineRepo, times(1)).findById(1);
    }
    
    @Test
    @DisplayName("Should return null when fetching a non-existent vaccine by ID")
    void testFetchVaccineByIdWhenNotExists() {
        logger.debug("Testing fetchVaccineById() method with non-existent ID");
        
        // Arrange
        when(vaccineRepo.findById(99)).thenReturn(Optional.empty());
        
        // Act
        Vaccine result = vService.fetchVaccineById(99);
        
        // Assert
        assertNull(result, "Result should be null for non-existent ID");
        verify(vaccineRepo, times(1)).findById(99);
    }
    
    @Test
    @DisplayName("Should filter vaccines by company name")
    void testGetVaccinesByCompanyName() {
        logger.debug("Testing getVaccinesByCompanyName() method");
        
        // Arrange
        when(vaccineRepo.findAll()).thenReturn(Arrays.asList(vaccine1, vaccine2));
        
        // Act
        List<Vaccine> pfizer = vService.getVaccinesByCompanyName("Pfizer");
        List<Vaccine> moderna = vService.getVaccinesByCompanyName("Moderna");
        List<Vaccine> unknown = vService.getVaccinesByCompanyName("Unknown");
        
        // Assert
        assertEquals(1, pfizer.size(), "Should return one Pfizer vaccine");
        assertEquals(1, moderna.size(), "Should return one Moderna vaccine");
        assertEquals(0, unknown.size(), "Should return no vaccines for unknown company");
        assertEquals("Pfizer-BioNTech", pfizer.get(0).getVaccineName(), "Should return correct Pfizer vaccine");
        assertEquals("Moderna", moderna.get(0).getVaccineName(), "Should return correct Moderna vaccine");
        verify(vaccineRepo, times(3)).findAll();
    }
}

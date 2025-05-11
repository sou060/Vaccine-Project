package com.java.vaccineproject.web;

import com.java.vaccineproject.model.Vaccine;
import com.java.vaccineproject.service.ISerivce;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;
import java.util.List;

import static org.hamcrest.Matchers.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(VaccineController.class)
class VaccineControllerTest {

    private static final Logger logger = LoggerFactory.getLogger(VaccineControllerTest.class);
    
    @Autowired
    private MockMvc mockMvc;
    
    @MockBean
    private ISerivce service;
    
    private Vaccine vaccine1;
    private Vaccine vaccine2;
    
    @BeforeEach
    void setUp() {
        logger.info("Setting up test vaccines for controller tests");
        
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
    @DisplayName("Home endpoint should redirect to show-vaccine")
    void testHomeEndpoint() throws Exception {
        logger.debug("Testing home endpoint redirection");
        
        mockMvc.perform(get("/"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/show-vaccine"));
    }
    
    @Test
    @DisplayName("Show-vaccine endpoint should display all vaccines")
    void testShowVaccineEndpoint() throws Exception {
        logger.debug("Testing show-vaccine endpoint");
        
        // Arrange
        List<Vaccine> vaccines = Arrays.asList(vaccine1, vaccine2);
        when(service.getVaccines()).thenReturn(vaccines);
        
        // Act & Assert
        mockMvc.perform(get("/show-vaccine"))
                .andExpect(status().isOk())
                .andExpect(view().name("show-vaccine"))
                .andExpect(model().attribute("vaccine", hasSize(2)))
                .andExpect(model().attribute("vaccine", hasItem(
                        allOf(
                                hasProperty("vaccineId", is(1)),
                                hasProperty("vaccineName", is("Pfizer-BioNTech"))
                        )
                )))
                .andExpect(model().attribute("vaccine", hasItem(
                        allOf(
                                hasProperty("vaccineId", is(2)),
                                hasProperty("vaccineName", is("Moderna"))
                        )
                )));
        
        verify(service, times(1)).getVaccines();
    }
    
    @Test
    @DisplayName("RegisterVaccine GET endpoint should display registration form")
    void testRegisterVaccineGetEndpoint() throws Exception {
        logger.debug("Testing registerVaccine GET endpoint");
        
        mockMvc.perform(get("/registerVaccine"))
                .andExpect(status().isOk())
                .andExpect(view().name("registerVaccine"))
                .andExpect(model().attributeExists("vaccine"));
    }
    
    @Test
    @DisplayName("RegisterVaccine POST endpoint should register a new vaccine")
    void testRegisterVaccinePostEndpoint() throws Exception {
        logger.debug("Testing registerVaccine POST endpoint");
        
        // Arrange
        when(service.addVaccine(any(Vaccine.class))).thenReturn("Pfizer-BioNTech");
        
        // Act & Assert
        mockMvc.perform(post("/registerVaccine")
                        .param("vaccineName", "Pfizer-BioNTech")
                        .param("vaccineDescription", "mRNA vaccine")
                        .param("vaccineType", "mRNA")
                        .param("vaccineCompany", "Pfizer")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED))
                .andExpect(status().isOk())
                .andExpect(view().name("registerVaccine"))
                .andExpect(model().attributeExists("vaccine"));
        
        verify(service, times(1)).addVaccine(any(Vaccine.class));
    }
    
    @Test
    @DisplayName("UpdateVaccine GET endpoint should display update form")
    void testUpdateVaccineGetEndpoint() throws Exception {
        logger.debug("Testing updateVaccine GET endpoint");
        
        // Arrange
        when(service.fetchVaccineById(1)).thenReturn(vaccine1);
        
        // Act & Assert
        mockMvc.perform(get("/updateVaccine")
                        .param("vaccineId", "1"))
                .andExpect(status().isOk())
                .andExpect(view().name("updateVaccine"))
                .andExpect(model().attribute("vaccine", 
                        allOf(
                                hasProperty("vaccineId", is(1)),
                                hasProperty("vaccineName", is("Pfizer-BioNTech"))
                        )
                ));
        
        verify(service, times(1)).fetchVaccineById(1);
    }
    
    @Test
    @DisplayName("UpdateVaccine GET endpoint should redirect when vaccine not found")
    void testUpdateVaccineGetEndpointWhenVaccineNotFound() throws Exception {
        logger.debug("Testing updateVaccine GET endpoint with non-existent ID");
        
        // Arrange
        when(service.fetchVaccineById(99)).thenReturn(null);
        
        // Act & Assert
        mockMvc.perform(get("/updateVaccine")
                        .param("vaccineId", "99"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/show-vaccine"));
        
        verify(service, times(1)).fetchVaccineById(99);
    }
    
    @Test
    @DisplayName("UpdateVaccine POST endpoint should update an existing vaccine")
    void testUpdateVaccinePostEndpoint() throws Exception {
        logger.debug("Testing updateVaccine POST endpoint");
        
        // Arrange
        when(service.addVaccine(any(Vaccine.class))).thenReturn("Pfizer-BioNTech Updated");
        
        // Act & Assert
        mockMvc.perform(post("/updateVaccine")
                        .param("vaccineId", "1")
                        .param("vaccineName", "Pfizer-BioNTech Updated")
                        .param("vaccineDescription", "Updated mRNA vaccine")
                        .param("vaccineType", "mRNA")
                        .param("vaccineCompany", "Pfizer")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/show-vaccine"));
        
        verify(service, times(1)).addVaccine(any(Vaccine.class));
    }
    
    @Test
    @DisplayName("DeleteVaccine endpoint should delete a vaccine")
    void testDeleteVaccineEndpoint() throws Exception {
        logger.debug("Testing deleteVaccine endpoint");
        
        // Arrange
        doNothing().when(service).deleteVaccine(anyInt());
        
        // Act & Assert
        mockMvc.perform(post("/deleteVaccine")
                        .param("vaccineId", "1")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/show-vaccine"));
        
        verify(service, times(1)).deleteVaccine(1);
    }
}

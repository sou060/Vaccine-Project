package com.java.vaccineproject.web;

import com.java.vaccineproject.model.Vaccine;
import com.java.vaccineproject.service.ISerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class VaccineController {

    private ISerivce iSerivce;
    
    @Autowired
    public void setiSerivce(ISerivce iSerivce) {
        this.iSerivce = iSerivce;
    }
    
    @GetMapping("/")
    public String home() {
        return "redirect:/show-vaccine";
    }
    
    @GetMapping("/registerVaccine")
    public String showRegistrationForm(Model model) {
        model.addAttribute("vaccine", new Vaccine());
        return "registerVaccine";
    }
    
    @PostMapping("/registerVaccine")
    public String registerVaccine(@ModelAttribute Vaccine vaccine, Model model) {
        model.addAttribute("vaccine", vaccine);
        iSerivce.addVaccine(vaccine);
        return "registerVaccine";
    }
    
    @GetMapping("/show-vaccine")
    public String getVaccines(Model model) {
        List<Vaccine> vaccines = iSerivce.getVaccines();
        model.addAttribute("vaccine", vaccines);
        return "show-vaccine";
    }
    
    @GetMapping("/updateVaccine")
    public String updateVaccineForm(@RequestParam("vaccineId") Integer id, Model model) {
        Vaccine vaccine = iSerivce.fetchVaccineById(id);
        if (vaccine != null) {
            model.addAttribute("vaccine", vaccine);
            return "updateVaccine";
        }
        return "redirect:/show-vaccine";
    }
    
    @PostMapping("/updateVaccine")
    public String processUpdateVaccine(@ModelAttribute Vaccine vaccine, Model model) {
        if (vaccine != null) {
            iSerivce.addVaccine(vaccine);
            return "redirect:/show-vaccine";
        }
        return "redirect:/show-vaccine";
    }
    
    @PostMapping("/deleteVaccine")
    public String deleteVaccine(@RequestParam("vaccineId") Integer vaccineId) {
        if (vaccineId != null) {
            iSerivce.deleteVaccine(vaccineId);
        }
        return "redirect:/show-vaccine";
    }
}
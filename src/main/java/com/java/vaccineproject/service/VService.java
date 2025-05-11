package com.java.vaccineproject.service;

import com.java.vaccineproject.model.Vaccine;
import com.java.vaccineproject.repo.IVaccineRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VService implements ISerivce {

    IVaccineRepo vaccineRepo;

    @Autowired
    public void setVaccineRepo(IVaccineRepo vaccineRepo) {
        this.vaccineRepo = vaccineRepo;
    }

    @Override
    public List<Vaccine> getVaccines() {
        return (List<Vaccine>)  vaccineRepo.findAll();
    }

    @Override
    public String addVaccine(Vaccine vaccine) {
        return vaccineRepo.save(vaccine).getVaccineName();
    }

    @Override
    public void deleteVaccine(Integer vaccineId) {
        vaccineRepo.deleteById(vaccineId);
    }

    @Override
    public Vaccine fetchVaccineById(Integer vaccineId) {
        return vaccineRepo.findById(vaccineId)
                .orElse(null);
    }

    @Override
    public List<Vaccine> getVaccinesByCompanyName(String vaccineCompanyName) {
        return ((List<Vaccine>) vaccineRepo.findAll())
                .stream()
                .filter(vaccine -> vaccine.getVaccineCompany().equals(vaccineCompanyName))
                .toList();
    }
}

package com.java.vaccineproject.service;

import com.java.vaccineproject.model.Vaccine;

import java.util.List;

public interface ISerivce {
    public List<Vaccine> getVaccines();
    public String addVaccine(Vaccine vaccine);
    public void deleteVaccine(Integer vaccineId);
    public List<Vaccine> getVaccinesByCompanyName(String vaccineCompanyName);
    public Vaccine fetchVaccineById(Integer vaccineId);

}

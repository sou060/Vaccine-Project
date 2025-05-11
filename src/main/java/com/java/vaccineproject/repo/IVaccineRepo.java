package com.java.vaccineproject.repo;

import com.java.vaccineproject.model.Vaccine;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IVaccineRepo extends CrudRepository<Vaccine,Integer> {
    Vaccine findByVaccineName(String vaccineName);
}

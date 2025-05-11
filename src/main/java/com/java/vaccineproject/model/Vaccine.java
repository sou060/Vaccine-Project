package com.java.vaccineproject.model;

import jakarta.persistence.*;

@Entity
@Table(name="vaccine")
public class Vaccine {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer vaccineId;
    private String vaccineName;
    private String vaccineDescription;
    private String vaccineType;
    private String vaccineCompany;

    public String getVaccineCompany() {
        return vaccineCompany;
    }

    public void setVaccineCompany(String vaccineCompany) {
        this.vaccineCompany = vaccineCompany;
    }



    public Vaccine() {
    }


    public Vaccine( String vaccineName, String vaccineDescription, String vaccineType, String vaccineCompany) {
        this.vaccineName = vaccineName;
        this.vaccineDescription = vaccineDescription;
        this.vaccineType = vaccineType;
        this.vaccineCompany = vaccineCompany;
    }

    @Override
    public String toString() {
        return "Vaccine{" +
                "vaccineId=" + vaccineId +
                ", vaccineName='" + vaccineName + '\'' +
                ", vaccineDescription='" + vaccineDescription + '\'' +
                ", vaccineType='" + vaccineType + '\'' +
                ", vaccineCompany='" + vaccineCompany + '\'' +
                '}';
    }

    public Integer getVaccineId() {
        return vaccineId;
    }

    public void setVaccineId(Integer vaccineId) {
        this.vaccineId = vaccineId;
    }

    public String getVaccineName() {
        return vaccineName;
    }

    public void setVaccineName(String vaccineName) {
        this.vaccineName = vaccineName;
    }

    public String getVaccineDescription() {
        return vaccineDescription;
    }

    public void setVaccineDescription(String vaccineDescription) {
        this.vaccineDescription = vaccineDescription;
    }

    public String getVaccineType() {
        return vaccineType;
    }

    public void setVaccineType(String vaccineType) {
        this.vaccineType = vaccineType;
    }
}

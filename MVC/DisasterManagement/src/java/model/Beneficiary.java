/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "beneficiary", schema = "drms")
public class Beneficiary implements Serializable {

    @Id
    private String beneficiary_id;
    private String beneficiary_name;
    private String victim_name;
    private String ifsc;
    private String branch_name;
    private String bank_name;
    private String ac_number;
    private String age_category;
    private String gender;
    @ManyToOne
    @JoinColumn(name = "villagecode")
    private M_village villagecode;

    public Beneficiary() {
    }

    public Beneficiary(String beneficiary_id, String beneficiary_name, String victim_name, String ifsc, String branch_name, String bank_name, String ac_number, String age_category, String gender, M_village villagecode) {
        this.beneficiary_id = beneficiary_id;
        this.beneficiary_name = beneficiary_name;
        this.victim_name = victim_name;
        this.ifsc = ifsc;
        this.branch_name = branch_name;
        this.bank_name = bank_name;
        this.ac_number = ac_number;
        this.age_category = age_category;
        this.gender = gender;
        this.villagecode = villagecode;
    }

    public String getBeneficiary_id() {
        return beneficiary_id;
    }

    public void setBeneficiary_id(String beneficiary_id) {
        this.beneficiary_id = beneficiary_id;
    }

    public String getBeneficiary_name() {
        return beneficiary_name;
    }

    public void setBeneficiary_name(String beneficiary_name) {
        this.beneficiary_name = beneficiary_name;
    }

    public String getVictim_name() {
        return victim_name;
    }

    public void setVictim_name(String victim_name) {
        this.victim_name = victim_name;
    }

    public String getIfsc() {
        return ifsc;
    }

    public void setIfsc(String ifsc) {
        this.ifsc = ifsc;
    }

    public String getBranch_name() {
        return branch_name;
    }

    public void setBranch_name(String branch_name) {
        this.branch_name = branch_name;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getAc_number() {
        return ac_number;
    }

    public void setAc_number(String ac_number) {
        this.ac_number = ac_number;
    }

    public String getAge_category() {
        return age_category;
    }

    public void setAge_category(String age_category) {
        this.age_category = age_category;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public M_village getVillagecode() {
        return villagecode;
    }

    public void setVillagecode(M_village villagecode) {
        this.villagecode = villagecode;
    }

    @Override
    public String toString() {
        return "Beneficiary{" + "beneficiary_id=" + beneficiary_id + ", beneficiary_name=" + beneficiary_name + ", victim_name=" + victim_name + ", ifsc=" + ifsc + ", branch_name=" + branch_name + ", bank_name=" + bank_name + ", ac_number=" + ac_number + ", age_category=" + age_category + ", gender=" + gender + ", villagecode=" + villagecode + '}';
    }

}

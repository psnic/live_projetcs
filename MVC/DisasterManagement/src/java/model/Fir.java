/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import org.springframework.context.annotation.Lazy;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "fir", schema = "drms")
public class Fir implements Serializable {

    @Id
    private String fir_no;
    @ManyToOne
    @JoinColumn(name = "calamity_id")
    private M_calamity calamity_id;
    @ManyToOne
    @JoinColumn(name = "blockcode")
    private M_block blockcode;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date_of_calamity_occurence;
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date time_of_calamity_occurence;
    private int no_villages_affected;
    private int human_population_affected;
    private int people_dead;
    private int people_missing;
    private int people_injured;
    private int animals_dead;
    private int animals_lost;
    private int animals_affected;
    private String crop_affected;
    private int house_fully;
    private int house_partially;
    private String relief_measure;
    private String immediate_response;
    private String forecast;
    private String other_info;
    @ManyToOne
    @JoinColumn(name = "userid")
    private MT_userlogin userid;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date logdate;

    public Fir() {
    }

    public Fir(String fir_no, M_calamity calamity_id, M_block blockcode, Date date_of_calamity_occurence, Date time_of_calamity_occurence, int no_villages_affected, int human_population_affected, int people_dead, int people_missing, int people_injured, int animals_dead, int animals_lost, int animals_affected, String crop_affected, int house_fully, int house_partially, String relief_measure, String immediate_response, String forecast, String other_info, MT_userlogin userid, Date logdate) {
        this.fir_no = fir_no;
        this.calamity_id = calamity_id;
        this.blockcode = blockcode;
        this.date_of_calamity_occurence = date_of_calamity_occurence;
        this.time_of_calamity_occurence = time_of_calamity_occurence;
        this.no_villages_affected = no_villages_affected;
        this.human_population_affected = human_population_affected;
        this.people_dead = people_dead;
        this.people_missing = people_missing;
        this.people_injured = people_injured;
        this.animals_dead = animals_dead;
        this.animals_lost = animals_lost;
        this.animals_affected = animals_affected;
        this.crop_affected = crop_affected;
        this.house_fully = house_fully;
        this.house_partially = house_partially;
        this.relief_measure = relief_measure;
        this.immediate_response = immediate_response;
        this.forecast = forecast;
        this.other_info = other_info;
        this.userid = userid;
        this.logdate = logdate;
    }

    public String getFir_no() {
        return fir_no;
    }

    public void setFir_no(String fir_no) {
        this.fir_no = fir_no;
    }

    public M_calamity getCalamity_id() {
        return calamity_id;
    }

    public void setCalamity_id(M_calamity calamity_id) {
        this.calamity_id = calamity_id;
    }

    public M_block getBlockcode() {
        return blockcode;
    }

    public void setBlockcode(M_block blockcode) {
        this.blockcode = blockcode;
    }

    public Date getDate_of_calamity_occurence() {
        return date_of_calamity_occurence;
    }

    public void setDate_of_calamity_occurence(Date date_of_calamity_occurence) {
        this.date_of_calamity_occurence = date_of_calamity_occurence;
    }

    public Date getTime_of_calamity_occurence() {
        return time_of_calamity_occurence;
    }

    public void setTime_of_calamity_occurence(Date time_of_calamity_occurence) {
        this.time_of_calamity_occurence = time_of_calamity_occurence;
    }

    public int getNo_villages_affected() {
        return no_villages_affected;
    }

    public void setNo_villages_affected(int no_villages_affected) {
        this.no_villages_affected = no_villages_affected;
    }

    public int getHuman_population_affected() {
        return human_population_affected;
    }

    public void setHuman_population_affected(int human_population_affected) {
        this.human_population_affected = human_population_affected;
    }

    public int getPeople_dead() {
        return people_dead;
    }

    public void setPeople_dead(int people_dead) {
        this.people_dead = people_dead;
    }

    public int getPeople_missing() {
        return people_missing;
    }

    public void setPeople_missing(int people_missing) {
        this.people_missing = people_missing;
    }

    public int getPeople_injured() {
        return people_injured;
    }

    public void setPeople_injured(int people_injured) {
        this.people_injured = people_injured;
    }

    public int getAnimals_dead() {
        return animals_dead;
    }

    public void setAnimals_dead(int animals_dead) {
        this.animals_dead = animals_dead;
    }

    public int getAnimals_lost() {
        return animals_lost;
    }

    public void setAnimals_lost(int animals_lost) {
        this.animals_lost = animals_lost;
    }

    public int getAnimals_affected() {
        return animals_affected;
    }

    public void setAnimals_affected(int animals_affected) {
        this.animals_affected = animals_affected;
    }

    public String getCrop_affected() {
        return crop_affected;
    }

    public void setCrop_affected(String crop_affected) {
        this.crop_affected = crop_affected;
    }

    public int getHouse_fully() {
        return house_fully;
    }

    public void setHouse_fully(int house_fully) {
        this.house_fully = house_fully;
    }

    public int getHouse_partially() {
        return house_partially;
    }

    public void setHouse_partially(int house_partially) {
        this.house_partially = house_partially;
    }

    public String getRelief_measure() {
        return relief_measure;
    }

    public void setRelief_measure(String relief_measure) {
        this.relief_measure = relief_measure;
    }

    public String getImmediate_response() {
        return immediate_response;
    }

    public void setImmediate_response(String immediate_response) {
        this.immediate_response = immediate_response;
    }

    public String getForecast() {
        return forecast;
    }

    public void setForecast(String forecast) {
        this.forecast = forecast;
    }

    public String getOther_info() {
        return other_info;
    }

    public void setOther_info(String other_info) {
        this.other_info = other_info;
    }

    public MT_userlogin getUserid() {
        return userid;
    }

    public void setUserid(MT_userlogin userid) {
        this.userid = userid;
    }

    public Date getLogdate() {
        return logdate;
    }

    public void setLogdate(Date logdate) {
        this.logdate = logdate;
    }

    @Override
    public String toString() {
        return "Fir{" + "fir_no=" + fir_no + ", calamity_id=" + calamity_id + ", blockcode=" + blockcode + ", date_of_calamity_occurence=" + date_of_calamity_occurence + ", time_of_calamity_occurence=" + time_of_calamity_occurence + ", no_villages_affected=" + no_villages_affected + ", human_population_affected=" + human_population_affected + ", people_dead=" + people_dead + ", people_missing=" + people_missing + ", people_injured=" + people_injured + ", animals_dead=" + animals_dead + ", animals_lost=" + animals_lost + ", animals_affected=" + animals_affected + ", crop_affected=" + crop_affected + ", house_fully=" + house_fully + ", house_partially=" + house_partially + ", relief_measure=" + relief_measure + ", immediate_response=" + immediate_response + ", forecast=" + forecast + ", other_info=" + other_info + ", userid=" + userid + ", logdate=" + logdate + '}';
    }

}

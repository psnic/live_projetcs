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
@Table(name = "t_property_damaged", schema = "drms")
public class T_Property_Damaged implements Serializable {

    @Id
    private String property_damage_id;
    @ManyToOne
    @JoinColumn(name = "infrastructure_id")
    private M_infrastructure infrastructure_id;
    private int total_damage;
    @ManyToOne
    @JoinColumn(name = "fir_no")
    private Fir fir_no;

    public T_Property_Damaged() {
    }

    public T_Property_Damaged(String property_damage_id, M_infrastructure infrastructure_id, int total_damage, Fir fir_no) {
        this.property_damage_id = property_damage_id;
        this.infrastructure_id = infrastructure_id;
        this.total_damage = total_damage;
        this.fir_no = fir_no;
    }

    public String getProperty_damage_id() {
        return property_damage_id;
    }

    public void setProperty_damage_id(String property_damage_id) {
        this.property_damage_id = property_damage_id;
    }

    public M_infrastructure getInfrastructure_id() {
        return infrastructure_id;
    }

    public void setInfrastructure_id(M_infrastructure infrastructure_id) {
        this.infrastructure_id = infrastructure_id;
    }

    public int getTotal_damage() {
        return total_damage;
    }

    public void setTotal_damage(int total_damage) {
        this.total_damage = total_damage;
    }

    public Fir getFir_no() {
        return fir_no;
    }

    public void setFir_no(Fir fir_no) {
        this.fir_no = fir_no;
    }

    @Override
    public String toString() {
        return "T_Property_Damaged{" + "property_damage_id=" + property_damage_id + ", infrastructure_id=" + infrastructure_id + ", total_damage=" + total_damage + ", fir_no=" + fir_no + '}';
    }
    
}

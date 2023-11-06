/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "m_calamity", schema = "drms")
public class M_calamity  implements Serializable{
    
    @Id
    private String calamity_id;
    
    private String calamity_name;

    public M_calamity() {
    }

    public M_calamity(String calamity_id, String calamity_name) {
        this.calamity_id = calamity_id;
        this.calamity_name = calamity_name;
    }

    public String getCalamity_id() {
        return calamity_id;
    }

    public void setCalamity_id(String calamity_id) {
        this.calamity_id = calamity_id;
    }

    public String getCalamity_name() {
        return calamity_name;
    }

    public void setCalamity_name(String calamity_name) {
        this.calamity_name = calamity_name;
    }

    @Override
    public String toString() {
        return "M_calamity{" + "calamity_id=" + calamity_id + ", calamity_name=" + calamity_name + '}';
    }
    
}

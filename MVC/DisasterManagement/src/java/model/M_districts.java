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
@Table(name = "m_districts", schema = "drms")
public class M_districts  implements Serializable{
    
    @Id
    private String districtcodelgd;
    
    private String districtname;
    
    private String districtshortname;

    public M_districts() {
    }

    public M_districts(String districtcodelgd, String districtname, String districtshortname) {
        this.districtcodelgd = districtcodelgd;
        this.districtname = districtname;
        this.districtshortname = districtshortname;
    }

    public String getDistrictcodelgd() {
        return districtcodelgd;
    }

    public void setDistrictcodelgd(String districtcodelgd) {
        this.districtcodelgd = districtcodelgd;
    }

    public String getDistrictname() {
        return districtname;
    }

    public void setDistrictname(String districtname) {
        this.districtname = districtname;
    }

    public String getDistrictshortname() {
        return districtshortname;
    }

    public void setDistrictshortname(String districtshortname) {
        this.districtshortname = districtshortname;
    }

    @Override
    public String toString() {
        return "M_districts{" + "districtcodelgd=" + districtcodelgd + ", districtname=" + districtname + ", districtshortname=" + districtshortname + '}';
    }
    
}

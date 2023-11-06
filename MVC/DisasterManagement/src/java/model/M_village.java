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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "m_village", schema = "drms")
public class M_village  implements Serializable{
    
    @Id
    private String villagecode;
    
    private String villagename;
    @ManyToOne
    @JoinColumn(name = "blockcode")
    private M_block blockcode;
    @ManyToOne
    @JoinColumn(name = "districtcodelgd")
    private M_districts districtcodelgd;

    public M_village() {
    }
    
    public M_village(String villagecode, String villagename, M_block blockcode, M_districts districtcodelgd) {
        this.villagecode = villagecode;
        this.villagename = villagename;
        this.blockcode = blockcode;
        this.districtcodelgd = districtcodelgd;
    }

    public String getVillagecode() {
        return villagecode;
    }

    public void setVillagecode(String villagecode) {
        this.villagecode = villagecode;
    }

    public String getVillagename() {
        return villagename;
    }

    public void setVillagename(String villagename) {
        this.villagename = villagename;
    }

    public M_block getBlockcode() {
        return blockcode;
    }

    public void setBlockcode(M_block blockcode) {
        this.blockcode = blockcode;
    }

    public M_districts getDistrictcodelgd() {
        return districtcodelgd;
    }

    public void setDistrictcodelgd(M_districts districtcodelgd) {
        this.districtcodelgd = districtcodelgd;
    }

    @Override
    public String toString() {
        return "M_village{" + "villagecode=" + villagecode + ", villagename=" + villagename + ", blockcode=" + blockcode + ", districtcodelgd=" + districtcodelgd + '}';
    }

}

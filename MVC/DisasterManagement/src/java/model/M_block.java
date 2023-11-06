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
@Table(name = "m_block", schema = "drms")
public class M_block  implements Serializable{
    
    @Id
    private int blockcode;
    
    private String blockname;
    @ManyToOne
    @JoinColumn(name = "districtcodelgd")
    private M_districts districtcodelgd;

    public M_block() {
    }

    public M_block(int blockcode, String blockname, M_districts districtcodelgd) {
        this.blockcode = blockcode;
        this.blockname = blockname;
        this.districtcodelgd = districtcodelgd;
    }

    public int getBlockcode() {
        return blockcode;
    }

    public void setBlockcode(int blockcode) {
        this.blockcode = blockcode;
    }

    public String getBlockname() {
        return blockname;
    }

    public void setBlockname(String blockname) {
        this.blockname = blockname;
    }

    public M_districts getDistrictcodelgd() {
        return districtcodelgd;
    }

    public void setDistrictcodelgd(M_districts districtcodelgd) {
        this.districtcodelgd = districtcodelgd;
    }

    @Override
    public String toString() {
        return "M_block{" + "blockcode=" + blockcode + ", blockname=" + blockname + ", districtcodelgd=" + districtcodelgd + '}';
    }
    
}

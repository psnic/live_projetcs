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
@Table(name = "m_status", schema = "drms")
public class M_status  implements Serializable{
    
    @Id
    private String statuscode;
    private String status_desc;
    

    public M_status() {
    }

    public M_status(String statuscode, String status_desc) {
        this.statuscode = statuscode;
        this.status_desc = status_desc;
    }

    public String getStatuscode() {
        return statuscode;
    }

    public void setStatuscode(String statuscode) {
        this.statuscode = statuscode;
    }

    public String getStatus_desc() {
        return status_desc;
    }

    public void setStatus_desc(String status_desc) {
        this.status_desc = status_desc;
    }

    @Override
    public String toString() {
        return "M_status{" + "statuscode=" + statuscode + ", status_desc=" + status_desc + '}';
    }

}

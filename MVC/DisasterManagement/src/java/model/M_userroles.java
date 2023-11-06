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
@Table(name = "m_userroles", schema = "drms")
public class M_userroles  implements Serializable{
    
    @Id
    private String role_code;
    
    private String role_name;
    
    private String role_description;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date entrydate;

    public M_userroles() {
    }

    public M_userroles(String role_code, String role_name, String role_description, Date entrydate) {
        this.role_code = role_code;
        this.role_name = role_name;
        this.role_description = role_description;
        this.entrydate = entrydate;
    }

    public String getRole_code() {
        return role_code;
    }

    public void setRole_code(String role_code) {
        this.role_code = role_code;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getRole_description() {
        return role_description;
    }

    public void setRole_description(String role_description) {
        this.role_description = role_description;
    }

    public Date getEntrydate() {
        return entrydate;
    }

    public void setEntrydate(Date entrydate) {
        this.entrydate = entrydate;
    }

    @Override
    public String toString() {
        return "M_userroles{" + "role_code=" + role_code + ", role_name=" + role_name + ", role_description=" + role_description + ", entrydate=" + entrydate + '}';
    }
    
}

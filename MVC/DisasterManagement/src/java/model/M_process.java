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
@Table(name = "m_process", schema = "drms")
public class M_process  implements Serializable{
    
    @Id
    private String processid;
    private String processname;

    public M_process() {
    }

    public M_process(String processid, String processname) {
        this.processid = processid;
        this.processname = processname;
    }

    public String getProcessid() {
        return processid;
    }

    public void setProcessid(String processid) {
        this.processid = processid;
    }

    public String getProcessname() {
        return processname;
    }

    public void setProcessname(String processname) {
        this.processname = processname;
    }

    @Override
    public String toString() {
        return "M_process{" + "processid=" + processid + ", processname=" + processname + '}';
    }
}

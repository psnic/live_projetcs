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
@Table(name = "m_processflow", schema = "drms")
public class M_processflow  implements Serializable{
    
    @Id
    private String processflowid;
    private String from_processid;
    private String to_processid;
    private String description;

    public M_processflow() {
    }

    public M_processflow(String processflowid, String from_processid, String to_processid, String description) {
        this.processflowid = processflowid;
        this.from_processid = from_processid;
        this.to_processid = to_processid;
        this.description = description;
    }

    public String getProcessflowid() {
        return processflowid;
    }

    public void setProcessflowid(String processflowid) {
        this.processflowid = processflowid;
    }

    public String getFrom_processid() {
        return from_processid;
    }

    public void setFrom_processid(String from_processid) {
        this.from_processid = from_processid;
    }

    public String getTo_processid() {
        return to_processid;
    }

    public void setTo_processid(String to_processid) {
        this.to_processid = to_processid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "M_processflow{" + "processflowid=" + processflowid + ", from_processid=" + from_processid + ", to_processid=" + to_processid + ", description=" + description + '}';
    }

}

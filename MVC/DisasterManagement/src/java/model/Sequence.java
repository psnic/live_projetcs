/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "sequence", schema = "drms")
public class Sequence  implements Serializable{
    
    @Id
    private String sequenceid;
    private int startseq;
    private int endseq;
    private String pattern;

    public Sequence() {
    }

    public Sequence(String sequenceid, int startseq, int endseq, String pattern) {
        this.sequenceid = sequenceid;
        this.startseq = startseq;
        this.endseq = endseq;
        this.pattern = pattern;
    }
    
    public String getSequenceid() {
        return sequenceid;
    }

    public void setSequenceid(String sequenceid) {
        this.sequenceid = sequenceid;
    }

    public int getStartseq() {
        return startseq;
    }

    public void setStartseq(int startseq) {
        this.startseq = startseq;
    }

    public int getEndseq() {
        return endseq;
    }

    public void setEndseq(int endseq) {
        this.endseq = endseq;
    }

    public String getPattern() {
        return pattern;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    @Override
    public String toString() {
        return "Sequence{" + "sequenceid=" + sequenceid + ", startseq=" + startseq + ", endseq=" + endseq + ", pattern=" + pattern + '}';
    }

}

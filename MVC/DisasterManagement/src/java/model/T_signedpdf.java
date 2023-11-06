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
@Table(name = "t_signedpdf", schema = "drms")
public class T_signedpdf  implements Serializable{
    
    @Id
    private String signedpdfid;
    @ManyToOne
    @JoinColumn(name = "proposalid")
    private Proposal proposalid;
    private byte[] filestored;
    
    public T_signedpdf() {
    }

    public T_signedpdf(String signedpdfid, Proposal proposalid, byte[] filestored) {
        this.signedpdfid = signedpdfid;
        this.proposalid = proposalid;
        this.filestored = filestored;
    }

    public String getSignedpdfid() {
        return signedpdfid;
    }

    public void setSignedpdfid(String signedpdfid) {
        this.signedpdfid = signedpdfid;
    }

    public Proposal getProposalid() {
        return proposalid;
    }

    public void setProposalid(Proposal proposalid) {
        this.proposalid = proposalid;
    }

    public byte[] getFilestored() {
        return filestored;
    }

    public void setFilestored(byte[] filestored) {
        this.filestored = filestored;
    }

    @Override
    public String toString() {
        return "T_signedpdf{" + "signedpdfid=" + signedpdfid + ", proposalid=" + proposalid + ", filestored=" + filestored + '}';
    }

}

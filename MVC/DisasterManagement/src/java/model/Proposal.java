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
@Table(name = "proposal", schema = "drms")
public class Proposal  implements Serializable{
    
    @Id
    private String proposalid;
    @ManyToOne
    @JoinColumn(name = "blockcode")
    private M_block blockcode;
    @ManyToOne
    @JoinColumn(name = "statuscode")
    private M_status statuscode;
    @ManyToOne
    @JoinColumn(name = "userid")
    private MT_userlogin userid;

    public Proposal() {
    }

    public Proposal(String proposalid, M_block blockcode, M_status statuscode, MT_userlogin userid) {
        this.proposalid = proposalid;
        this.blockcode = blockcode;
        this.statuscode = statuscode;
        this.userid = userid;
    }

    public String getProposalid() {
        return proposalid;
    }

    public void setProposalid(String proposalid) {
        this.proposalid = proposalid;
    }

    public M_block getBlockcode() {
        return blockcode;
    }

    public void setBlockcode(M_block blockcode) {
        this.blockcode = blockcode;
    }

    public M_status getStatuscode() {
        return statuscode;
    }

    public void setStatuscode(M_status statuscode) {
        this.statuscode = statuscode;
    }

    public MT_userlogin getUserid() {
        return userid;
    }

    public void setUserid(MT_userlogin userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Proposal{" + "proposalid=" + proposalid + ", blockcode=" + blockcode + ", statuscode=" + statuscode + ", userid=" + userid + '}';
    }

}

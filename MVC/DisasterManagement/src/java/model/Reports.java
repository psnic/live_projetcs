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
@Table(name = "reports", schema = "drms")
public class Reports  implements Serializable{
    
    @Id
    private String reportid;
    @ManyToOne
    @JoinColumn(name = "blockcode")
    private M_block blockcode;
    @ManyToOne
    @JoinColumn(name = "statuscode")
    private M_status statuscode;
    @ManyToOne
    @JoinColumn(name = "proposalid")
    private Proposal proposalid;
    @ManyToOne
    @JoinColumn(name = "userid")
    private MT_userlogin userid;
    private String no_of_population_affected;
    private String no_of_family_affected;
    private String no_of_village_affected;
    private String remarks;

    public Reports() {
    }

    public Reports(String reportid, M_block blockcode, M_status statuscode, Proposal proposalid, MT_userlogin userid, String no_of_population_affected, String no_of_family_affected, String no_of_village_affected, String remarks) {
        this.reportid = reportid;
        this.blockcode = blockcode;
        this.statuscode = statuscode;
        this.proposalid = proposalid;
        this.userid = userid;
        this.no_of_population_affected = no_of_population_affected;
        this.no_of_family_affected = no_of_family_affected;
        this.no_of_village_affected = no_of_village_affected;
        this.remarks = remarks;
    }

    public String getReportid() {
        return reportid;
    }

    public void setReportid(String reportid) {
        this.reportid = reportid;
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

    public Proposal getProposalid() {
        return proposalid;
    }

    public void setProposalid(Proposal proposalid) {
        this.proposalid = proposalid;
    }

    public MT_userlogin getUserid() {
        return userid;
    }

    public void setUserid(MT_userlogin userid) {
        this.userid = userid;
    }

    public String getNo_of_population_affected() {
        return no_of_population_affected;
    }

    public void setNo_of_population_affected(String no_of_population_affected) {
        this.no_of_population_affected = no_of_population_affected;
    }

    public String getNo_of_family_affected() {
        return no_of_family_affected;
    }

    public void setNo_of_family_affected(String no_of_family_affected) {
        this.no_of_family_affected = no_of_family_affected;
    }

    public String getNo_of_village_affected() {
        return no_of_village_affected;
    }

    public void setNo_of_village_affected(String no_of_village_affected) {
        this.no_of_village_affected = no_of_village_affected;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "Reports{" + "reportid=" + reportid + ", blockcode=" + blockcode + ", statuscode=" + statuscode + ", proposalid=" + proposalid + ", userid=" + userid + ", no_of_population_affected=" + no_of_population_affected + ", no_of_family_affected=" + no_of_family_affected + ", no_of_village_affected=" + no_of_village_affected + ", remarks=" + remarks + '}';
    }

}

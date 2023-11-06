/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "history_forwarding", schema = "drms")
public class History_forwarding implements Serializable {

    @Id
    private String historyid;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateofforwarding;
    @ManyToOne
    @JoinColumn(name = "statuscode")
    private M_status statuscode;
    @ManyToOne
    @JoinColumn(name = "userid")
    private MT_userlogin userid;
    @ManyToOne
    @JoinColumn(name = "proposalid")
    private Proposal proposalid;
    @ManyToOne
    @JoinColumn(name = "reportid")
    private Reports reportid;
    private String remarks;

    public History_forwarding() {
    }

    public History_forwarding(String historyid, Date dateofforwarding, M_status statuscode, MT_userlogin userid, Proposal proposalid, Reports reportid, String remarks) {
        this.historyid = historyid;
        this.dateofforwarding = dateofforwarding;
        this.statuscode = statuscode;
        this.userid = userid;
        this.proposalid = proposalid;
        this.reportid = reportid;
        this.remarks = remarks;
    }

    public String getHistoryid() {
        return historyid;
    }

    public void setHistoryid(String historyid) {
        this.historyid = historyid;
    }

    public Date getDateofforwarding() {
        return dateofforwarding;
    }

    public void setDateofforwarding(Date dateofforwarding) {
        this.dateofforwarding = dateofforwarding;
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

    public Proposal getProposalid() {
        return proposalid;
    }

    public void setProposalid(Proposal proposalid) {
        this.proposalid = proposalid;
    }

    public Reports getReportid() {
        return reportid;
    }

    public void setReportid(Reports reportid) {
        this.reportid = reportid;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "History_forwarding{" + "historyid=" + historyid + ", dateofforwarding=" + dateofforwarding + ", statuscode=" + statuscode + ", userid=" + userid + ", proposalid=" + proposalid + ", reportid=" + reportid + ", remarks=" + remarks + '}';
    }
}

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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "t_exgratia_form", schema = "drms")
public class T_exgratia_form implements Serializable {

    @Id
    private String t_exgratia_form_id;
    @ManyToOne
    @JoinColumn(name = "beneficiary_id")
    private Beneficiary beneficiary_id;
    @ManyToOne
    @JoinColumn(name = "fir_no")
    private Fir fir_no;
    private int amount;
    private String remarks;
    private String fin_year;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date logdate;
    @ManyToOne
    @JoinColumn(name = "userid")
    private MT_userlogin userid;
    @ManyToOne
    @JoinColumn(name = "norm_code")
    private Exgratia_norm norm_code;
    @ManyToOne
    @JoinColumn(name = "reportid")
    private Reports reportid;
    @ManyToOne
    @JoinColumn(name = "calamity_id")
    private M_calamity calamity_id;

    public T_exgratia_form() {
    }

    public T_exgratia_form(String t_exgratia_form_id, Beneficiary beneficiary_id, Fir fir_no, int amount, String remarks, String fin_year, Date logdate, MT_userlogin userid, Exgratia_norm norm_code, Reports reportid, M_calamity calamity_id) {
        this.t_exgratia_form_id = t_exgratia_form_id;
        this.beneficiary_id = beneficiary_id;
        this.fir_no = fir_no;
        this.amount = amount;
        this.remarks = remarks;
        this.fin_year = fin_year;
        this.logdate = logdate;
        this.userid = userid;
        this.norm_code = norm_code;
        this.reportid = reportid;
        this.calamity_id = calamity_id;
    }

    public String getT_exgratia_form_id() {
        return t_exgratia_form_id;
    }

    public void setT_exgratia_form_id(String t_exgratia_form_id) {
        this.t_exgratia_form_id = t_exgratia_form_id;
    }

    public Beneficiary getBeneficiary_id() {
        return beneficiary_id;
    }

    public void setBeneficiary_id(Beneficiary beneficiary_id) {
        this.beneficiary_id = beneficiary_id;
    }

    public Fir getFir_no() {
        return fir_no;
    }

    public void setFir_no(Fir fir_no) {
        this.fir_no = fir_no;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getFin_year() {
        return fin_year;
    }

    public void setFin_year(String fin_year) {
        this.fin_year = fin_year;
    }

    public Date getLogdate() {
        return logdate;
    }

    public void setLogdate(Date logdate) {
        this.logdate = logdate;
    }

    public MT_userlogin getUserid() {
        return userid;
    }

    public void setUserid(MT_userlogin userid) {
        this.userid = userid;
    }

    public Exgratia_norm getNorm_code() {
        return norm_code;
    }

    public void setNorm_code(Exgratia_norm norm_code) {
        this.norm_code = norm_code;
    }

    public Reports getReportid() {
        return reportid;
    }

    public void setReportid(Reports reportid) {
        this.reportid = reportid;
    }

    public M_calamity getCalamity_id() {
        return calamity_id;
    }

    public void setCalamity_id(M_calamity calamity_id) {
        this.calamity_id = calamity_id;
    }

    @Override
    public String toString() {
        return "T_exgratia_form{" + "t_exgratia_form_id=" + t_exgratia_form_id + ", beneficiary_id=" + beneficiary_id + ", fir_no=" + fir_no + ", amount=" + amount + ", remarks=" + remarks + ", fin_year=" + fin_year + ", logdate=" + logdate + ", userid=" + userid + ", norm_code=" + norm_code + ", reportid=" + reportid + ", calamity_id=" + calamity_id + '}';
    }

}

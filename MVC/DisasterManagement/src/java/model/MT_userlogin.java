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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "mt_userlogin", schema = "drms")
public class MT_userlogin implements Serializable {

    @Id
    private String userid;

    private String username;

    private String userpassword;
    
    @OneToOne
    @JoinColumn(name = "role_code")
    public M_userroles role_code;
    
    @ManyToOne
    @JoinColumn(name = "blockcode")
    public M_block blockcode;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date lastlogin;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date entrydate;

    public MT_userlogin() {
    }

    public MT_userlogin(String userid, String username, String userpassword, M_userroles role_code, M_block blockcode, Date lastlogin, Date entrydate) {
        this.userid = userid;
        this.username = username;
        this.userpassword = userpassword;
        this.role_code = role_code;
        this.blockcode = blockcode;
        this.lastlogin = lastlogin;
        this.entrydate = entrydate;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public M_userroles getRole_code() {
        return role_code;
    }

    public void setRole_code(M_userroles role_code) {
        this.role_code = role_code;
    }

    public M_block getBlockcode() {
        return blockcode;
    }

    public void setBlockcode(M_block blockcode) {
        this.blockcode = blockcode;
    }

    public Date getLastlogin() {
        return lastlogin;
    }

    public void setLastlogin(Date lastlogin) {
        this.lastlogin = lastlogin;
    }

    public Date getEntrydate() {
        return entrydate;
    }

    public void setEntrydate(Date entrydate) {
        this.entrydate = entrydate;
    }

    @Override
    public String toString() {
        return "MT_userlogin{" + "userid=" + userid + ", username=" + username + ", userpassword=" + userpassword + ", role_code=" + role_code + ", blockcode=" + blockcode + ", lastlogin=" + lastlogin + ", entrydate=" + entrydate + '}';
    }

}

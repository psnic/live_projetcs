/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collections;
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

/**
 *
 * @author acer
 */
@Entity
@Table(name = "agendanote", schema = "drms")
public class AgendaNote implements Serializable {

    @Id
    private String noteid;
    private Boolean isapprove = false;
    @OneToOne
    @JoinColumn(name = "districtcodelgd")
    private M_districts districtcodelgd;
    private Integer totalAmount;
    @OneToOne
    @JoinColumn(name = "proposalid")
    private Proposal proposal;
//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
//    @JoinColumn(name = "proposalid")
//    private Set<Proposal> proposal;
    private String calamity_name;
    private String no_of_family_affected;
    private String no_of_village_affected;
    private String note_number;

    public AgendaNote() {
//        this.proposal = Collections.<Proposal>emptySet();
//        this.proposal = new HashSet<>();
    }

//    public AgendaNote(String noteid, M_districts districtcodelgd, Integer totalAmount, Set<Proposal> proposal, String calamity_name, String no_of_family_affected, String no_of_village_affected, String note_number) {
//        this.noteid = noteid;
//        this.districtcodelgd = districtcodelgd;
//        this.totalAmount = totalAmount;
//        this.proposal = proposal;
//        this.calamity_name = calamity_name;
//        this.no_of_family_affected = no_of_family_affected;
//        this.no_of_village_affected = no_of_village_affected;
//        this.note_number = note_number;
//    }

    public AgendaNote(String noteid, M_districts districtcodelgd, Integer totalAmount, Proposal proposal, String calamity_name, String no_of_family_affected, String no_of_village_affected, String note_number) {
        this.noteid = noteid;
        this.districtcodelgd = districtcodelgd;
        this.totalAmount = totalAmount;
        this.proposal = proposal;
        this.calamity_name = calamity_name;
        this.no_of_family_affected = no_of_family_affected;
        this.no_of_village_affected = no_of_village_affected;
        this.note_number = note_number;
    }

    
    
    public String getNoteid() {
        return noteid;
    }

    public void setNoteid(String noteid) {
        this.noteid = noteid;
    }

    public Boolean getIsapprove() {
        return isapprove;
    }

    public void setIsapprove(Boolean isapprove) {
        this.isapprove = isapprove;
    }

    public M_districts getDistrictcodelgd() {
        return districtcodelgd;
    }

    public void setDistrictcodelgd(M_districts districtcodelgd) {
        this.districtcodelgd = districtcodelgd;
    }

    public Integer getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Integer totalAmount) {
        this.totalAmount = totalAmount;
    }

//    public Set<Proposal> getProposal() {
//        return proposal;
//    }
//
//    public void setProposal(Set<Proposal> proposal) {
//        this.proposal = proposal;
//        // Set proposalid for each Proposal in the set
//        for (Proposal p : proposal) {
//            p.setProposalid(this.getNoteid());
//        }
//    }
//
//    public void setSingleProposal(Proposal proposal) {
//        if (this.proposal == null) {
//            this.proposal = new HashSet<>();
//        }
//        this.proposal.add(proposal); // Add the new proposal
//    }

    public Proposal getProposal() {
        return proposal;
    }

    public void setProposal(Proposal proposal) {
        this.proposal = proposal;
    }

    
    public String getCalamity_name() {
        return calamity_name;
    }

    public void setCalamity_name(String calamity_name) {
        this.calamity_name = calamity_name;
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

    public String getNote_number() {
        return note_number;
    }

    public void setNote_number(String note_number) {
        this.note_number = note_number;
    }

    @Override
    public String toString() {
        return "AgendaNote{" + "noteid=" + noteid + ", isapprove=" + isapprove + ", districtcodelgd=" + districtcodelgd + ", totalAmount=" + totalAmount + ", proposal=" + proposal + ", calamity_name=" + calamity_name + ", no_of_family_affected=" + no_of_family_affected + ", no_of_village_affected=" + no_of_village_affected + ", note_number=" + note_number + '}';
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "exgratia_norm", schema = "drms")
public class Exgratia_norm implements Serializable {

    @Id
    private int norm_code;

    private String description;

    private String losstype;

    private String option;

    private int value;
    private int minimum_value;
    @ManyToOne
    @JoinColumn(name = "assistance_head_code")
    private Assistance_head assistance_head_code;
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "lossnorm_document",
            joinColumns = @JoinColumn(name = "norm_code"),
            inverseJoinColumns = @JoinColumn(name = "documentcode"))
    private Set<Document_type> doctype;

    public Exgratia_norm() {
        this.doctype = new HashSet<>();
    }

    public Exgratia_norm(int norm_code, String description, String losstype, String option, int value, int minimum_value, Assistance_head assistance_head_code, Set<Document_type> doctype) {
        this.norm_code = norm_code;
        this.description = description;
        this.losstype = losstype;
        this.option = option;
        this.value = value;
        this.minimum_value = minimum_value;
        this.assistance_head_code = assistance_head_code;
        this.doctype = doctype;
    }

    public int getNorm_code() {
        return norm_code;
    }

    public void setNorm_code(int norm_code) {
        this.norm_code = norm_code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLosstype() {
        return losstype;
    }

    public void setLosstype(String losstype) {
        this.losstype = losstype;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public int getMinimum_value() {
        return minimum_value;
    }

    public void setMinimum_value(int minimum_value) {
        this.minimum_value = minimum_value;
    }

    public Assistance_head getAssistance_head_code() {
        return assistance_head_code;
    }

    public void setAssistance_head_code(Assistance_head assistance_head_code) {
        this.assistance_head_code = assistance_head_code;
    }

    public Set<Document_type> getDoctype() {
        return doctype;
    }

    public void setDoctype(Set<Document_type> doctype) {
        this.doctype = doctype;
    }

    @Override
    public String toString() {
        return "Exgratia_norm{" + "norm_code=" + norm_code + ", description=" + description + ", losstype=" + losstype + ", option=" + option + ", value=" + value + ", minimum_value=" + minimum_value + ", assistance_head_code=" + assistance_head_code + ", doctype=" + doctype + '}';
    }

}

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
@Table(name = "assistance_head", schema = "drms")
public class Assistance_head implements Serializable {

    @Id
    private String assistance_head_code;
    private String description;
    private String sub_window;

    public Assistance_head() {
    }

    public Assistance_head(String assistance_head_code, String description, String sub_window) {
        this.assistance_head_code = assistance_head_code;
        this.description = description;
        this.sub_window = sub_window;
    }

    public String getAssistance_head_code() {
        return assistance_head_code;
    }

    public void setAssistance_head_code(String assistance_head_code) {
        this.assistance_head_code = assistance_head_code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSub_window() {
        return sub_window;
    }

    public void setSub_window(String sub_window) {
        this.sub_window = sub_window;
    }

    @Override
    public String toString() {
        return "Assistance_head{" + "assistance_head_code=" + assistance_head_code + ", description=" + description + ", sub_window=" + sub_window + '}';
    }
    
}

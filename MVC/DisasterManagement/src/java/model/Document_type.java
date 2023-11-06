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
@Table(name = "document_type", schema = "drms")
public class Document_type implements Serializable {

    @Id
    private int documentcode;
    private String description;
    private String document_name;
    private Boolean is_specific;

    public Document_type() {
    }

    public Document_type(int documentcode, String description, String document_name, Boolean is_specific) {
        this.documentcode = documentcode;
        this.description = description;
        this.document_name = document_name;
        this.is_specific = is_specific;
    }

    public int getDocumentcode() {
        return documentcode;
    }

    public void setDocumentcode(int documentcode) {
        this.documentcode = documentcode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDocument_name() {
        return document_name;
    }

    public void setDocument_name(String document_name) {
        this.document_name = document_name;
    }

    public Boolean getIs_specific() {
        return is_specific;
    }

    public void setIs_specific(Boolean is_specific) {
        this.is_specific = is_specific;
    }

    @Override
    public String toString() {
        return "Document_type{" + "documentcode=" + documentcode + ", description=" + description + ", document_name=" + document_name + ", is_specific=" + is_specific + '}';
    }

}

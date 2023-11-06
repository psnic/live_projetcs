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
@Table(name = "document", schema = "drms")
public class Document implements Serializable {

    @Id
    private String documentcode;
    private String documentName;
    private String description;
    private byte[] filestored;
    private String filetype;
    @ManyToOne
    @JoinColumn(name = "fir_no")
    private Fir fir_no;

    public Document() {
    }

    public Document(String documentcode, String documentName, String description, byte[] filestored, String filetype, Fir fir_no) {
        this.documentcode = documentcode;
        this.documentName = documentName;
        this.description = description;
        this.filestored = filestored;
        this.filetype = filetype;
        this.fir_no = fir_no;
    }

    public String getDocumentcode() {
        return documentcode;
    }

    public void setDocumentcode(String documentcode) {
        this.documentcode = documentcode;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getFilestored() {
        return filestored;
    }

    public void setFilestored(byte[] filestored) {
        this.filestored = filestored;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public Fir getFir_no() {
        return fir_no;
    }

    public void setFir_no(Fir fir_no) {
        this.fir_no = fir_no;
    }

    @Override
    public String toString() {
        return "Document{" + "documentcode=" + documentcode + ", documentName=" + documentName + ", description=" + description + ", filestored=" + filestored + ", filetype=" + filetype + ", fir_no=" + fir_no + '}';
    }
    
}

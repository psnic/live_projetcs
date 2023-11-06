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
@Table(name = "document_beneficiary", schema = "drms")
public class Document_beneficiary implements Serializable {

    @Id
    private String bdocumentcode;
    private String documentName;
    private String description;
    private byte[] filestored;
    private String filetype;
    @ManyToOne
    @JoinColumn(name = "beneficiary_id")
    private Beneficiary beneficiary_id;

    public Document_beneficiary() {
    }

    public Document_beneficiary(String bdocumentcode, String documentName, String description, byte[] filestored, String filetype, Beneficiary beneficiary_id) {
        this.bdocumentcode = bdocumentcode;
        this.documentName = documentName;
        this.description = description;
        this.filestored = filestored;
        this.filetype = filetype;
        this.beneficiary_id = beneficiary_id;
    }

    public String getBdocumentcode() {
        return bdocumentcode;
    }

    public void setBdocumentcode(String bdocumentcode) {
        this.bdocumentcode = bdocumentcode;
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

    public Beneficiary getBeneficiary_id() {
        return beneficiary_id;
    }

    public void setBeneficiary_id(Beneficiary beneficiary_id) {
        this.beneficiary_id = beneficiary_id;
    }

    @Override
    public String toString() {
        return "Document_beneficiary{" + "bdocumentcode=" + bdocumentcode + ", documentName=" + documentName + ", description=" + description + ", filestored=" + filestored + ", filetype=" + filetype + ", beneficiary_id=" + beneficiary_id + '}';
    }

}

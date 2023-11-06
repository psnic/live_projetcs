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
@Table(name = "document_report", schema = "drms")
public class Document_report implements Serializable {

    @Id
    private String rdocumentcode;
    private String documentName;
    private String description;
    private byte[] filestored;
    private String filetype;
    @ManyToOne
    @JoinColumn(name = "reportid")
    private Reports reportid;

    public Document_report() {
    }

    public Document_report(String rdocumentcode, String documentName, String description, byte[] filestored, String filetype, Reports reportid) {
        this.rdocumentcode = rdocumentcode;
        this.documentName = documentName;
        this.description = description;
        this.filestored = filestored;
        this.filetype = filetype;
        this.reportid = reportid;
    }

    public String getRdocumentcode() {
        return rdocumentcode;
    }

    public void setRdocumentcode(String rdocumentcode) {
        this.rdocumentcode = rdocumentcode;
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

    public Reports getReportid() {
        return reportid;
    }

    public void setReportid(Reports reportid) {
        this.reportid = reportid;
    }

    @Override
    public String toString() {
        return "Document_report{" + "rdocumentcode=" + rdocumentcode + ", documentName=" + documentName + ", description=" + description + ", filestored=" + filestored + ", filetype=" + filetype + ", reportid=" + reportid + '}';
    }

}

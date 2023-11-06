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
@Table(name = "m_infrastructure", schema = "drms")
public class M_infrastructure implements Serializable {

    @Id
    public Integer infrastructure_id;
    public String infrastructure_name;

    public M_infrastructure() {
    }

    public M_infrastructure(Integer infrastructure_id, String infrastructure_name) {
        this.infrastructure_id = infrastructure_id;
        this.infrastructure_name = infrastructure_name;
    }

    public Integer getInfrastructure_id() {
        return infrastructure_id;
    }

    public void setInfrastructure_id(Integer infrastructure_id) {
        this.infrastructure_id = infrastructure_id;
    }

    public String getInfrastructure_name() {
        return infrastructure_name;
    }

    public void setInfrastructure_name(String infrastructure_name) {
        this.infrastructure_name = infrastructure_name;
    }

    @Override
    public String toString() {
        return "M_infrastructure{" + "infrastructure_id=" + infrastructure_id + ", infrastructure_name=" + infrastructure_name + '}';
    }

}

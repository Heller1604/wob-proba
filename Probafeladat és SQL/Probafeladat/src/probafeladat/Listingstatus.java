/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probafeladat;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "listingstatus", catalog = "wob", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Listingstatus.findAll", query = "SELECT l FROM Listingstatus l"),
    @NamedQuery(name = "Listingstatus.findById", query = "SELECT l FROM Listingstatus l WHERE l.id = :id"),
    @NamedQuery(name = "Listingstatus.findByStatusName", query = "SELECT l FROM Listingstatus l WHERE l.statusName = :statusName")})
public class Listingstatus implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "status_name")
    private String statusName;

    public Listingstatus() {
    }

    public Listingstatus(Integer id) {
        this.id = id;
    }

    public Listingstatus(Integer id, String statusName) {
        this.id = id;
        this.statusName = statusName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
    public static void addListingStatus(Long id,String status_name){
        
     StoredProcedureQuery addListingStatus = Listing.EM.createStoredProcedureQuery("addListingStatus");
        addListingStatus.registerStoredProcedureParameter("idIN", Long.class, ParameterMode.IN);
        addListingStatus.registerStoredProcedureParameter("status_nameIN", String.class, ParameterMode.IN);
        
        addListingStatus.setParameter("idIN", id);
        addListingStatus.setParameter("status_nameIN", status_name);
        
        addListingStatus.execute();
    
    
    }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
   
        if (!(object instanceof Listingstatus)) {
            return false;
        }
        Listingstatus other = (Listingstatus) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "probafeladat.Listingstatus[ id=" + id + " ]";
    }
    
}

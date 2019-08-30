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
@Table(name = "marketplace", catalog = "wob", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Marketplace.findAll", query = "SELECT m FROM Marketplace m"),
    @NamedQuery(name = "Marketplace.findById", query = "SELECT m FROM Marketplace m WHERE m.id = :id"),
    @NamedQuery(name = "Marketplace.findByMarketplaceName", query = "SELECT m FROM Marketplace m WHERE m.marketplaceName = :marketplaceName")})
public class Marketplace implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "marketplace_name")
    private String marketplaceName;

    public Marketplace() {
    }

    public Marketplace(Integer id) {
        this.id = id;
    }

    public Marketplace(Integer id, String marketplaceName) {
        this.id = id;
        this.marketplaceName = marketplaceName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMarketplaceName() {
        return marketplaceName;
    }

    public void setMarketplaceName(String marketplaceName) {
        this.marketplaceName = marketplaceName;
    }

    public static void addMarketplace(Long id,String marketplace_name){
        
     StoredProcedureQuery addMarketplace = Listing.EM.createStoredProcedureQuery("addMarketplace");
     addMarketplace.registerStoredProcedureParameter("idIN", Long.class, ParameterMode.IN);
     addMarketplace.registerStoredProcedureParameter("marketplace_nameIN", String.class, ParameterMode.IN);
        
     addMarketplace.setParameter("idIN", id);
     addMarketplace.setParameter("marketplace_nameIN", marketplace_name);
        
     addMarketplace.execute();
    
    
    }
    
    
    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Marketplace)) {
            return false;
        }
        Marketplace other = (Marketplace) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "probafeladat.Marketplace[ id=" + id + " ]";
    }
    
}

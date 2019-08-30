
package probafeladat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.ParameterMode;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "listing", catalog = "wob", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Listing.findAll", query = "SELECT l FROM Listing l"),
    @NamedQuery(name = "Listing.findById", query = "SELECT l FROM Listing l WHERE l.id = :id"),
    @NamedQuery(name = "Listing.findByTitle", query = "SELECT l FROM Listing l WHERE l.title = :title"),
    @NamedQuery(name = "Listing.findByDescription", query = "SELECT l FROM Listing l WHERE l.description = :description"),
    @NamedQuery(name = "Listing.findByLocationId", query = "SELECT l FROM Listing l WHERE l.locationId = :locationId"),
    @NamedQuery(name = "Listing.findByListingPrice", query = "SELECT l FROM Listing l WHERE l.listingPrice = :listingPrice"),
    @NamedQuery(name = "Listing.findByQuantity", query = "SELECT l FROM Listing l WHERE l.quantity = :quantity"),
    @NamedQuery(name = "Listing.findByStatusId", query = "SELECT l FROM Listing l WHERE l.statusId = :statusId"),
    @NamedQuery(name = "Listing.findByMarketplaceId", query = "SELECT l FROM Listing l WHERE l.marketplaceId = :marketplaceId"),
    @NamedQuery(name = "Listing.findByUploadTime", query = "SELECT l FROM Listing l WHERE l.uploadTime = :uploadTime"),
    @NamedQuery(name = "Listing.findByOwnerEmail", query = "SELECT l FROM Listing l WHERE l.ownerEmail = :ownerEmail")})
public class Listing implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @Column(name = "title")
    private String title;
    @Basic(optional = false)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @Column(name = "location_id")
    private String locationId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "listing_price")
    private BigDecimal listingPrice;
    @Basic(optional = false)
    @Lob
    @Column(name = "currency")
    private String currency;
    @Basic(optional = false)
    @Column(name = "quantity")
    private int quantity;
    @Basic(optional = false)
    @Column(name = "status_id")
    private int statusId;
    @Basic(optional = false)
    @Column(name = "marketplace_id")
    private int marketplaceId;
    @Basic(optional = false)
    @Column(name = "upload_time")
    @Temporal(TemporalType.DATE)
    private Date uploadTime;
    @Basic(optional = false)
    @Column(name = "owner_email")
    private String ownerEmail;
    
    
    public static EntityManager EM =Persistence.createEntityManagerFactory("ProbafeladatPU").createEntityManager();


    public Listing() {
    }

    public Listing(String id) {
        this.id = id;
    }

    public Listing(String id, String title, String description, String locationId, BigDecimal listingPrice, String currency, int quantity, int statusId, int marketplaceId, Date uploadTime, String ownerEmail) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.locationId = locationId;
        this.listingPrice = listingPrice;
        this.currency = currency;
        this.quantity = quantity;
        this.statusId = statusId;
        this.marketplaceId = marketplaceId;
        this.uploadTime = uploadTime;
        this.ownerEmail = ownerEmail;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocationId() {
        return locationId;
    }

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }

    public BigDecimal getListingPrice() {
        return listingPrice;
    }

    public void setListingPrice(BigDecimal listingPrice) {
        this.listingPrice = listingPrice;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getMarketplaceId() {
        return marketplaceId;
    }

    public void setMarketplaceId(int marketplaceId) {
        this.marketplaceId = marketplaceId;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

    public static void addListing(String ID,String title,String description,String location_id,Object listing_price,
        String currency, Long quantity, Long listing_status, Long marketplace,String upload_time,String owner_email){
        
        if (upload_time==null) {
            
            upload_time = "null";
            
        }
         
        StoredProcedureQuery addListing = Listing.EM.createStoredProcedureQuery("addListing");
        addListing.registerStoredProcedureParameter("IDIN", String.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("titleIN", String.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("descriptionIN", String.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("location_idIN", String.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("listing_priceIN", Object.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("currencyIN", String.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("quantityIN", Long.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("status_idIN", Long.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("marketplace_idIN", Long.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("upload_timeIN", String.class, ParameterMode.IN);
        addListing.registerStoredProcedureParameter("owner_emailIN", String.class, ParameterMode.IN);
     
        addListing.setParameter("IDIN", ID);
        addListing.setParameter("titleIN", title);
        addListing.setParameter("descriptionIN", description);
        addListing.setParameter("location_idIN", location_id);
        addListing.setParameter("listing_priceIN", listing_price);
        addListing.setParameter("currencyIN", currency);
        addListing.setParameter("quantityIN", quantity);
        addListing.setParameter("status_idIN", listing_status);
        addListing.setParameter("marketplace_idIN", marketplace);
        addListing.setParameter("upload_timeIN", upload_time);
        addListing.setParameter("owner_emailIN", owner_email);
        
        
        addListing.execute();
    
    }
///////////REPORT//////////////////////////////////////////////////////////////////////////////////////////////
    
    
     public static String getListingCount(){
     
     Query getListingCount = EM.createNativeQuery("SELECT COUNT(`listing`.`title`)FROM `listing`");    
     String c = getListingCount.getSingleResult().toString();
    
     return c;
     } 
     
     public static String getEBAYCount(){
     
     Query getListingCount = EM.createNativeQuery("SELECT COUNT(`listing`.`title`)FROM `listing` WHERE `marketplace_id`=1");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getEBAYPriceGBP(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'GBP'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     public static String getEBAYPriceAUD(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'AUD'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     public static String getEBAYPriceEUR(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'EUR'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getEBAYPriceHUF(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'HUF'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getEBAYPriceJPY(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'JPY'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getEBAYPriceUSD(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'USD'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
          
     public static String getAVGEBAYPriceGBP(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'GBP'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     public static String getAVGEBAYPriceAUD(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'AUD'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     public static String getAVGEBAYPriceEUR(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'EUR'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAVGEBAYPriceHUF(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'HUF'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAVGEBAYPriceJPY(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'JPY'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAVGEBAYPriceUSD(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=1 AND currency = 'USD'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
  
  
     public static String getAMAZONCount(){
     
     Query getListingCount = EM.createNativeQuery("SELECT COUNT(`listing`.`title`)FROM `listing` WHERE `marketplace_id`=2");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAMAZONPriceGBP(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'GBP'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     public static String getAMAZONPriceAUD(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'AUD'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     public static String getAMAZONPriceEUR(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'EUR'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAMAZONPriceHUF(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'HUF'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAMAZONPriceJPY(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'JPY'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAMAZONPriceUSD(){
     
     Query getListingCount = EM.createNativeQuery("SELECT SUM(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'USD'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
          
     public static String getAVGAMAZONPriceGBP(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'GBP'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     public static String getAVGAMAZONPriceAUD(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'AUD'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     public static String getAVGAMAZONPriceEUR(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'EUR'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAVGAMAZONPriceHUF(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'HUF'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAVGAMAZONPriceJPY(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'JPY'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getAVGAMAZONPriceUSD(){
     
     Query getListingCount = EM.createNativeQuery("SELECT AVG(`listing`.`listing_price`)FROM `listing` WHERE `marketplace_id`=2 AND currency = 'USD'");    
     String c = getListingCount.getSingleResult().toString();    
          
          
     return c;     
     }
     
     public static String getBestListerEmail(){
     
     Query getBestListerEmail = EM.createNativeQuery("SELECT owner_email FROM listing GROUP BY owner_email ORDER BY COUNT(owner_email) DESC LIMIT 1");    
     String c = getBestListerEmail.getSingleResult().toString();    
          
          
     return c;     
     }
     
     
     
     
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Listing)) {
            return false;
        }
        Listing other = (Listing) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "probafeladat.Listing[ id=" + id + " ]";
    }
    
}

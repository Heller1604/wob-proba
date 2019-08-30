
package probafeladat;

import java.io.FileReader;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.ParameterMode;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author User
 */
@Entity
@Table(name = "location", catalog = "wob", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Location.findAll", query = "SELECT l FROM Location l"),
    @NamedQuery(name = "Location.findById", query = "SELECT l FROM Location l WHERE l.id = :id"),
    @NamedQuery(name = "Location.findByManagerName", query = "SELECT l FROM Location l WHERE l.managerName = :managerName"),
    @NamedQuery(name = "Location.findByPhone", query = "SELECT l FROM Location l WHERE l.phone = :phone"),
    @NamedQuery(name = "Location.findByAddressPrimary", query = "SELECT l FROM Location l WHERE l.addressPrimary = :addressPrimary"),
    @NamedQuery(name = "Location.findByAddressSecondary", query = "SELECT l FROM Location l WHERE l.addressSecondary = :addressSecondary"),
    @NamedQuery(name = "Location.findByCountry", query = "SELECT l FROM Location l WHERE l.country = :country"),
    @NamedQuery(name = "Location.findByTown", query = "SELECT l FROM Location l WHERE l.town = :town"),
    @NamedQuery(name = "Location.findByPostalCode", query = "SELECT l FROM Location l WHERE l.postalCode = :postalCode")})
public class Location implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @Column(name = "manager_name")
    private String managerName;
    @Basic(optional = false)
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @Column(name = "address_primary")
    private String addressPrimary;
    @Basic(optional = false)
    @Column(name = "address_secondary")
    private String addressSecondary;
    @Basic(optional = false)
    @Column(name = "country")
    private String country;
    @Basic(optional = false)
    @Column(name = "town")
    private String town;
    @Basic(optional = false)
    @Column(name = "postal_code")
    private String postalCode;
    
    

    public Location() {
    }

    public Location(String id) {
        this.id = id;
    }

    public Location(String id, String managerName, String phone, String addressPrimary, String addressSecondary, String country, String town, String postalCode) {
        this.id = id;
        this.managerName = managerName;
        this.phone = phone;
        this.addressPrimary = addressPrimary;
        this.addressSecondary = addressSecondary;
        this.country = country;
        this.town = town;
        this.postalCode = postalCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddressPrimary() {
        return addressPrimary;
    }

    public void setAddressPrimary(String addressPrimary) {
        this.addressPrimary = addressPrimary;
    }

    public String getAddressSecondary() {
        return addressSecondary;
    }

    public void setAddressSecondary(String addressSecondary) {
        this.addressSecondary = addressSecondary;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
    
    static JSONParser parser = new JSONParser();

    
    public static void addLocation(String ID,String manager_name,String phone,String address_primary,String address_secondary,
        String country, String town, String postal_code){
    
        if (address_secondary == null ) {
            
            address_secondary = "null";
        }
        if (postal_code == null ) {
            
            postal_code = "null";
        }
        
    
        StoredProcedureQuery addLocation = Listing.EM.createStoredProcedureQuery("addLocation");
        addLocation.registerStoredProcedureParameter("IDIN", String.class, ParameterMode.IN);
        addLocation.registerStoredProcedureParameter("manager_nameIN", String.class, ParameterMode.IN);
        addLocation.registerStoredProcedureParameter("phoneIN", String.class, ParameterMode.IN);
        addLocation.registerStoredProcedureParameter("address_primaryIN", String.class, ParameterMode.IN);
        addLocation.registerStoredProcedureParameter("address_secondaryIN", String.class, ParameterMode.IN);
        addLocation.registerStoredProcedureParameter("countryIN", String.class, ParameterMode.IN);
        addLocation.registerStoredProcedureParameter("townIN", String.class, ParameterMode.IN);
        addLocation.registerStoredProcedureParameter("postal_codeIN", String.class, ParameterMode.IN);
        
     
        addLocation.setParameter("IDIN", ID);
        addLocation.setParameter("manager_nameIN", manager_name);
        addLocation.setParameter("phoneIN", phone);
        addLocation.setParameter("address_primaryIN", address_primary);
        addLocation.setParameter("address_secondaryIN", address_secondary);
        addLocation.setParameter("countryIN", country);
        addLocation.setParameter("townIN", town);
        addLocation.setParameter("postal_codeIN", postal_code);
        
        addLocation.execute();
        
    }

    public static boolean isLocationID(String ID){
    boolean x = false; 
    int y = 0;
    try {
 
            Object obj = parser.parse(new FileReader(
                    "C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APIlocation.json"));
 
            JSONArray jsonArray = (JSONArray) obj;

    for (int i = 0; i < jsonArray.size(); i++) {

        JSONObject jsonObject = (JSONObject) jsonArray.get(i);    
        String id = (String) jsonObject.get("id");
        if (id.equals(ID)) {
            y++;
            
        }
        
    }
        if (y == 1) {
            
            x=true;
        }
    }catch (Exception e) {
            e.printStackTrace();}
    
    return x;
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
        if (!(object instanceof Location)) {
            return false;
        }
        Location other = (Location) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "probafeladat.Location[ id=" + id + " ]";
    }
    
}

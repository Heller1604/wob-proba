
package probafeladat;

import java.io.*;
import java.math.BigDecimal;
import java.util.List;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.persistence.StoredProcedureQuery;
import static probafeladat.Listing.addListing;
import static probafeladat.Location.isLocationID;


public class Validate {
    
    static int f = 0;
    
    public static void addListings(String ID,String title,String description,String location_id,Object listing_price,
        String currency, Long quantity, Long listing_status, Long marketplace,String upload_time,String owner_email){
        
       
    boolean validemail = true;
    try {
      InternetAddress emailAddr = new InternetAddress(owner_email);
      emailAddr.validate();
    } catch (AddressException ex) {
      validemail = false;
    }
   
    int decimal = 0;
    boolean p = true;
    try{
    Double lp = (Double)listing_price;
    if(lp<0){p = false;}
    decimal = BigDecimal.valueOf(lp).scale();
    }catch (Exception e){
    Long lp = (Long)listing_price;
     if(lp<0){p = false;}
    decimal = BigDecimal.valueOf(lp).scale();
    }
    
    
        if (ID.matches("[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}") 
            && title!= null 
            && description!= null 
            && location_id!= null 
            && isLocationID(location_id)== true 
            && listing_price!= null 
            && p == true  
            &&((decimal == 2)== true)
            && currency!= null 
            && currency.length()== 3 
            && quantity!= null 
            && quantity > 0 
            && listing_status!= null
            &&(listing_status == 1 || listing_status == 2 || listing_status == 3)
            && marketplace!= null
            &&(marketplace == 1 || marketplace ==2)
            && owner_email!= null
            && validemail == true) {
        
        addListing(ID,title,description,location_id,listing_price,currency,quantity,listing_status,marketplace,upload_time,owner_email);    
            
        }else{
            f++;
            System.out.println(f+"  "+title);
        
        }
    }    
            
    public static void writeCSV(String ID,String title,String description,String location_id,Object listing_price,
    String currency, Long quantity, Long listing_status, Long marketplace,String upload_time,String owner_email){
        
       
    boolean validemail = true;
    try {
      InternetAddress emailAddr = new InternetAddress(owner_email);
      emailAddr.validate();
    } catch (AddressException ex) {
      validemail = false;
    }
   
    int decimal = 0;
    boolean p = true;
    try{
    Double lp = (Double)listing_price;
    if(lp<0){p = false;}
    decimal = BigDecimal.valueOf(lp).scale();
    }catch (Exception e){
    Long lp = (Long)listing_price;
     if(lp<0){p = false;}
    decimal = BigDecimal.valueOf(lp).scale();
    }
    String invalidField="";
    
        if (ID.matches("[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}")!= true){
        invalidField ="ID";
        }else if(title== null ){
        invalidField ="title";
        }else if(description== null ){
        invalidField ="description";
        }else if(location_id== null ){
        invalidField ="location_id";
        }else if(isLocationID(location_id)!= true ){
        invalidField ="location_id";
        }else if(listing_price== null){
        invalidField ="listing_price";
        }else if(p != true ){
        invalidField ="listing_price";
        }else if(((decimal == 2)!= true) ){
        invalidField ="listing_price";
        }else if( currency == null){
        invalidField ="currency";
        }else if(currency.length()!= 3){
        invalidField ="currency";
        }else if(quantity== null){
        invalidField ="quantity";
        }else if( quantity <= 0 ){
        invalidField ="quantity";
        }else if(listing_status== null){
        invalidField ="listing_status";
        }else if((listing_status != 1 && listing_status != 2 && listing_status != 3)){
        invalidField ="listing_status";
        }else if(marketplace== null){
        invalidField ="marketplace";
        }else if((marketplace != 1 && marketplace !=2)){
        invalidField ="marketplace";
        }else if(owner_email== null){
        invalidField ="owner_email";
        }else if(validemail == false){
        invalidField ="owner_email";
        }
       
   
    String marketname = "";
    if(marketplace==1){marketname="EBAY";
    }else if(marketplace==2){marketname="AMAZON";}
     
        if (invalidField != "") {
            
        System.out.println(ID +"  "+ marketname +"  "+ invalidField);
     
        }
    
    }      
}

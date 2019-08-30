
package probafeladat;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader; 
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import org.apache.commons.net.ftp.FTPClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import static probafeladat.Listing.addListing;
import static probafeladat.Listing.getAMAZONCount;
import static probafeladat.Listing.getAMAZONPriceAUD;
import static probafeladat.Listing.getAMAZONPriceEUR;
import static probafeladat.Listing.getAMAZONPriceGBP;
import static probafeladat.Listing.getAMAZONPriceHUF;
import static probafeladat.Listing.getAMAZONPriceJPY;
import static probafeladat.Listing.getAMAZONPriceUSD;
import static probafeladat.Listing.getAVGAMAZONPriceAUD;
import static probafeladat.Listing.getAVGAMAZONPriceEUR;
import static probafeladat.Listing.getAVGAMAZONPriceGBP;
import static probafeladat.Listing.getAVGAMAZONPriceHUF;
import static probafeladat.Listing.getAVGAMAZONPriceJPY;
import static probafeladat.Listing.getAVGAMAZONPriceUSD;
import static probafeladat.Listing.getEBAYCount;
//import static probafeladat.Listing.getEBAYPrice;
import static probafeladat.Listing.getEBAYPriceAUD;
import static probafeladat.Listing.getEBAYPriceEUR;
import static probafeladat.Listing.getEBAYPriceGBP;
import static probafeladat.Listing.getEBAYPriceHUF;
import static probafeladat.Listing.getEBAYPriceJPY;
import static probafeladat.Listing.getEBAYPriceUSD;
import static probafeladat.Listing.getAVGEBAYPriceAUD;
import static probafeladat.Listing.getAVGEBAYPriceEUR;
import static probafeladat.Listing.getAVGEBAYPriceGBP;
import static probafeladat.Listing.getAVGEBAYPriceHUF;
import static probafeladat.Listing.getAVGEBAYPriceJPY;
import static probafeladat.Listing.getAVGEBAYPriceUSD;
import static probafeladat.Listing.getBestListerEmail;
import static probafeladat.Listing.getListingCount;
import static probafeladat.Listingstatus.addListingStatus;
import static probafeladat.Location.addLocation;
import static probafeladat.Location.isLocationID;
import static probafeladat.Marketplace.addMarketplace;
import static probafeladat.Validate.addListings;
import static probafeladat.Validate.writeCSV;
import static readAPI.readApi.getlistingJson;
import static readAPI.readApi.getlistingStatusJson;
import static readAPI.readApi.getlocationJson;
import static readAPI.readApi.getmarketplaceJson;


public class Probafeladat {
    
    public static void main(String[] args){
        
          JSONParser parser = new JSONParser();
          

getlistingJson(); 
getlocationJson();
getlistingStatusJson();
getmarketplaceJson();
          
    
////////LISTING///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////          
          
        try {
 
            Object obj = parser.parse(new FileReader(
                    "C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APIlisting.json"));
 
            JSONArray jsonArray = (JSONArray) obj;
    
     String file = "importLog.csv";
        try
        {
        FileWriter fw = new FileWriter(file);
        PrintWriter pw = new PrintWriter(fw, true);
        
        pw.print("ListingId");
        pw.print(";");
        pw.print("MarketplaceName");
        pw.print(";");
        pw.println("InvalidField");
            
 
        for (int i = 0; i < jsonArray.size(); i++) {

            JSONObject jsonObject = (JSONObject) jsonArray.get(i);
            String ID = (String) jsonObject.get("id");
            String title = (String) jsonObject.get("title");
            String description = (String) jsonObject.get("description");
            String location_id = (String) jsonObject.get("location_id"); 
            Object listing_price = (Object) jsonObject.get("listing_price");
            String currency = (String) jsonObject.get("currency"); 
            Long quantity = (Long) jsonObject.get("quantity");
            Long listing_status = (Long) jsonObject.get("listing_status");
            Long marketplace = (Long) jsonObject.get("marketplace");
            String upload_time = (String) jsonObject.get("upload_time");
            String owner_email = (String) jsonObject.get("owner_email_address");

        
//        System.out.println(i+"   id="+ID+"; title="+title+"; description="+ description+"; location_id="+location_id+"; listing_price="+listing_price+"; currency="+currency
//        +"; quantity="+quantity+" listing_status="+listing_status+" marketplace="+marketplace+" upload_time="+upload_time+" owner_email_address="+owner_email); 
     
       addListings(ID,title,description,location_id,listing_price,currency,quantity,listing_status,marketplace,upload_time,owner_email);
//        writeCSV(ID,title,description,location_id,listing_price,currency,quantity,listing_status,marketplace,upload_time,owner_email);
       
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
    
    if(invalidField != ""){
        pw.print(ID);
        pw.print(";");
        pw.print(marketplace);
        pw.print(";");
        pw.println(invalidField);
 
        }   
        }
        pw.close();
        }
        catch (IOException ioe)
        {
        System.out.println(ioe);        
        }
 
        
        } catch (Exception e) {
            e.printStackTrace();
        }

        
////////////LOCATION/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
 
    try {
 
            Object obj = parser.parse(new FileReader(
                    "C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APIlocation.json"));
 
            JSONArray jsonArray = (JSONArray) obj;

    for (int i = 0; i < jsonArray.size(); i++) {

        JSONObject jsonObject = (JSONObject) jsonArray.get(i);    
        String ID = (String) jsonObject.get("id");
        String manager_name = (String) jsonObject.get("manager_name");
        String phone = (String) jsonObject.get("phone");
        String address_primary = (String) jsonObject.get("address_primary");
        String address_secondary = (String) jsonObject.get("address_secondary");
        String country = (String) jsonObject.get("country");
        String town = (String) jsonObject.get("town");
        String postal_code = (String) jsonObject.get("postal_code");
    
    addLocation(ID,manager_name,phone,address_primary,address_secondary,country,town,postal_code);
       
    }
     
    }  catch (Exception e) {
            e.printStackTrace();}
   
 //////LISTINGSTATUS///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

    try {
 
        Object obj = parser.parse(new FileReader(
                "C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APIlistingstatus.json"));
 
        JSONArray jsonArray = (JSONArray) obj;

    for (int i = 0; i < jsonArray.size(); i++) {

        JSONObject jsonObject = (JSONObject) jsonArray.get(i);    
        Long id = (Long) jsonObject.get("id");
        String status_name = (String) jsonObject.get("status_name");
    
    addListingStatus( id, status_name);
    
    }
    
    }  catch (Exception e) {
       e.printStackTrace();}
    
  //////MARKETPLACE/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
    
      try {
 
        Object obj = parser.parse(new FileReader(
                "C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APImarketplace.json"));
 
        JSONArray jsonArray = (JSONArray) obj;
  
    for (int i = 0; i < jsonArray.size(); i++) {

        JSONObject jsonObject = (JSONObject) jsonArray.get(i);    
        Long id = (Long) jsonObject.get("id");
        String marketplace_name = (String) jsonObject.get("marketplace_name");
    
    addMarketplace( id, marketplace_name);
    
    }
    
    }  catch (Exception e) {
       e.printStackTrace();}
    
    
    ///////////////REPORT////////////////////////////////////////////////////////////////////////////////////////////////////////////////////        

        String listingCount = getListingCount();        
        
        System.out.println(listingCount);
        
        String EBAYCount =getEBAYCount();
        
        System.out.println(EBAYCount);
        
        String EBAYPriceGBP =getEBAYPriceGBP();
        
        System.out.println(EBAYPriceGBP+" GBP");
        
        String EBAYPriceAUD =getEBAYPriceAUD();
        
        System.out.println(EBAYPriceAUD+" AUD");
        
        String EBAYPriceEUR =getEBAYPriceEUR();
        
        System.out.println(EBAYPriceEUR+" EUR");
        
        String EBAYPriceHUF =getEBAYPriceHUF();
        
        System.out.println(EBAYPriceHUF+" HUF");
        
        String EBAYPriceJPY =getEBAYPriceJPY();
        
        System.out.println(EBAYPriceJPY+" JPY");
        
        String EBAYPriceUSD =getEBAYPriceUSD();
        
        System.out.println(EBAYPriceUSD+" USD");
        
         
        String AVGEBAYPriceGBP =getAVGEBAYPriceGBP();
        
        System.out.println(AVGEBAYPriceGBP+" GBP");
        
        String AVGEBAYPriceAUD =getAVGEBAYPriceAUD();
        
        System.out.println(AVGEBAYPriceAUD+" AUD");
        
        String AVGEBAYPriceEUR =getAVGEBAYPriceEUR();
        
        System.out.println(AVGEBAYPriceEUR+" EUR");
        
        String AVGEBAYPriceHUF =getAVGEBAYPriceHUF();
        
        System.out.println(AVGEBAYPriceHUF+" HUF");
        
        String AVGEBAYPriceJPY =getAVGEBAYPriceJPY();
        
        System.out.println(AVGEBAYPriceJPY+" JPY");
        
        String AVGEBAYPriceUSD =getAVGEBAYPriceUSD();
        
        System.out.println(AVGEBAYPriceUSD+" USD");
        
        String AMAZONCount =getAMAZONCount();
        
        System.out.println(AMAZONCount);
        
        String AMAZONPriceGBP =getAMAZONPriceGBP();
        
        System.out.println(AMAZONPriceGBP+" GBP");
        
        String AMAZONPriceAUD =getAMAZONPriceAUD();
        
        System.out.println(AMAZONPriceAUD+" AUD");
        
        String AMAZONPriceEUR =getAMAZONPriceEUR();
        
        System.out.println(AMAZONPriceEUR+" EUR");
        
        String AMAZONPriceHUF =getAMAZONPriceHUF();
        
        System.out.println(AMAZONPriceHUF+" HUF");
        
        String AMAZONPriceJPY =getAMAZONPriceJPY();
        
        System.out.println(AMAZONPriceJPY+" JPY");
        
        String AMAZONPriceUSD =getAMAZONPriceUSD();
        
        System.out.println(AMAZONPriceUSD+" USD");
        
         
        String AVGAMAZONPriceGBP =getAVGAMAZONPriceGBP();
        
        System.out.println(AVGAMAZONPriceGBP+" GBP");
        
        String AVGAMAZONPriceAUD =getAVGAMAZONPriceAUD();
        
        System.out.println(AVGAMAZONPriceAUD+" AUD");
        
        String AVGAMAZONPriceEUR =getAVGAMAZONPriceEUR();
        
        System.out.println(AVGAMAZONPriceEUR+" EUR");
        
        String AVGAMAZONPriceHUF =getAVGAMAZONPriceHUF();
        
        System.out.println(AVGAMAZONPriceHUF+" HUF");
        
        String AVGAMAZONPriceJPY =getAVGAMAZONPriceJPY();
        
        System.out.println(AVGAMAZONPriceJPY+" JPY");
        
        String AVGAMAZONPriceUSD =getAVGAMAZONPriceUSD();
        
        System.out.println(AVGAMAZONPriceUSD+" USD");
        
        String BestListerEmail = getBestListerEmail();
        
        System.out.println(BestListerEmail);
        
    
        try
        {
        FileWriter fw = new FileWriter("C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\report.json");
        PrintWriter pw = new PrintWriter(fw, true);
        
        pw.print("{");
        pw.print('"'+"Total listing count"+'"');
        pw.print(":");
        pw.print('"'+listingCount+'"');
        pw.println(",");
        
        pw.print('"'+"Total eBay listing count"+'"');
        pw.print(":");
        pw.print('"'+EBAYCount+'"');
        pw.println(",");
        
        JSONArray EBAYprice = new JSONArray();
	EBAYprice.add(EBAYPriceGBP + " GBP");
	EBAYprice.add(EBAYPriceAUD + " AUD");
	EBAYprice.add(EBAYPriceEUR + " EUR");
        EBAYprice.add(EBAYPriceHUF + " HUF");
	EBAYprice.add(EBAYPriceJPY + " JPY");
	EBAYprice.add(EBAYPriceUSD + " USD");
        
        pw.print('"'+"Total eBay listing price"+'"');
        pw.print(":");
        pw.print(EBAYprice.toJSONString());
        pw.println(",");
        
        JSONArray AVGEBAYprice = new JSONArray();
	AVGEBAYprice.add(AVGEBAYPriceGBP + " GBP");
	AVGEBAYprice.add(AVGEBAYPriceAUD + " AUD");
	AVGEBAYprice.add(AVGEBAYPriceEUR + " EUR");
        AVGEBAYprice.add(AVGEBAYPriceHUF + " HUF");
	AVGEBAYprice.add(AVGEBAYPriceJPY + " JPY");
	AVGEBAYprice.add(AVGEBAYPriceUSD + " USD");
        
        pw.print('"'+"Average eBay listing price"+'"');
        pw.print(":");
        pw.print(AVGEBAYprice.toJSONString());
        pw.println(",");
        
             
        pw.print('"'+"Total Amazon listing count"+'"');
        pw.print(":");
        pw.print('"'+AMAZONCount+'"');
        pw.println(",");
        
        JSONArray AMAZONprice = new JSONArray();
	AMAZONprice.add(AMAZONPriceGBP + " GBP");
	AMAZONprice.add(AMAZONPriceAUD + " AUD");
	AMAZONprice.add(AMAZONPriceEUR + " EUR");
        AMAZONprice.add(AMAZONPriceHUF + " HUF");
	AMAZONprice.add(AMAZONPriceJPY + " JPY");
	AMAZONprice.add(AMAZONPriceUSD + " USD"); 
        
        pw.print('"'+"Total Amazon listing price"+'"');
        pw.print(":");
        pw.print(AMAZONprice.toJSONString());
        pw.println(",");
        
        JSONArray AVGAMAZONprice = new JSONArray();
	AVGAMAZONprice.add(AVGAMAZONPriceGBP + " GBP");
	AVGAMAZONprice.add(AVGAMAZONPriceAUD + " AUD");
	AVGAMAZONprice.add(AVGAMAZONPriceEUR + " EUR");
        AVGAMAZONprice.add(AVGAMAZONPriceHUF + " HUF");
	AVGAMAZONprice.add(AVGAMAZONPriceJPY + " JPY");
	AVGAMAZONprice.add(AVGAMAZONPriceUSD + " USD");
        
        pw.print('"'+"Average Amazon listing price"+'"');
        pw.print(":");
        pw.print(AVGAMAZONprice.toJSONString());
        pw.println(",");
        
        pw.print('"'+"Best lister email address"+'"');
        pw.print(":");
        pw.print('"'+BestListerEmail+'"');
        pw.print("}");
        
        
        pw.close();
        }
        catch (IOException ioe)
        {
        System.out.println(ioe);        
        }
            
  
        
    FTPClient client = new FTPClient();
    FileInputStream fis = null;

    try {
        client.connect("localhost");
        client.login("heller","heller");

      
        String filename = "report.json";
        fis = new FileInputStream(filename);

     
        client.storeFile(filename, fis);
        client.logout();
    } catch (IOException e) {
        e.printStackTrace();
    } finally {
        try {
            if (fis != null) {
                fis.close();
            }
            client.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

        
        
    
        
        }
    
    
    
    
 }

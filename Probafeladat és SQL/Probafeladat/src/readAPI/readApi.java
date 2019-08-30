
package readAPI;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;


public class readApi {
    
    //////READAPI/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////          
          
public static void getlistingJson(){
     try {
    
     String url = "https://my.api.mockaroo.com/listing?key=63304c70";
     URL obj = new URL(url);
     HttpURLConnection con = (HttpURLConnection) obj.openConnection();
     con.setRequestMethod("GET");
     int responseCode = con.getResponseCode();
     System.out.println("\nSending 'GET' request to URL : " + url);
     System.out.println("Response Code : " + responseCode);
     BufferedReader in = new BufferedReader(
             new InputStreamReader(con.getInputStream()));
     String inputLine;
     StringBuffer response = new StringBuffer();
     while ((inputLine = in.readLine()) != null) {
     	response.append(inputLine);
     }
     in.close();
     System.out.println(response.toString());
     
     
     
     try (FileWriter file = new FileWriter("C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APIlisting.json")) {
			file.write(response.toString());
			
		}catch (IOException e) {
               e.printStackTrace();
               
        }
     

   }
        
    catch (Exception e) {
    e.printStackTrace();
       }
   
}

public static void getlocationJson(){
     try {
    
     String url = "https://my.api.mockaroo.com/location?key=63304c70";
     URL obj = new URL(url);
     HttpURLConnection con = (HttpURLConnection) obj.openConnection();
     con.setRequestMethod("GET");
     int responseCode = con.getResponseCode();
     System.out.println("\nSending 'GET' request to URL : " + url);
     System.out.println("Response Code : " + responseCode);
     BufferedReader in = new BufferedReader(
             new InputStreamReader(con.getInputStream()));
     String inputLine;
     StringBuffer response = new StringBuffer();
     while ((inputLine = in.readLine()) != null) {
     	response.append(inputLine);
     }
     in.close();
     System.out.println(response.toString());
     
     
     
     try (FileWriter file = new FileWriter("C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APIlocation.json")) {
			file.write(response.toString());
			
		}catch (IOException e) {
               e.printStackTrace();
               
        }
     

   }
        
    catch (Exception e) {
    e.printStackTrace();
       }
   
}

public static void getlistingStatusJson(){
     try {
    
     String url = "https://my.api.mockaroo.com/listingStatus?key=63304c70";
     URL obj = new URL(url);
     HttpURLConnection con = (HttpURLConnection) obj.openConnection();
     con.setRequestMethod("GET");
     int responseCode = con.getResponseCode();
     System.out.println("\nSending 'GET' request to URL : " + url);
     System.out.println("Response Code : " + responseCode);
     BufferedReader in = new BufferedReader(
             new InputStreamReader(con.getInputStream()));
     String inputLine;
     StringBuffer response = new StringBuffer();
     while ((inputLine = in.readLine()) != null) {
     	response.append(inputLine);
     }
     in.close();
     System.out.println(response.toString());
     
     
     
     try (FileWriter file = new FileWriter("C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APIlistinstatus.json")) {
			file.write(response.toString());
			
		}catch (IOException e) {
               e.printStackTrace();
               
        }
     

   }
        
    catch (Exception e) {
    e.printStackTrace();
       }
   
}

public static void getmarketplaceJson(){
     try {
    
     String url = "https://my.api.mockaroo.com/marketplace?key=63304c70";
     URL obj = new URL(url);
     HttpURLConnection con = (HttpURLConnection) obj.openConnection();
     con.setRequestMethod("GET");
     int responseCode = con.getResponseCode();
     System.out.println("\nSending 'GET' request to URL : " + url);
     System.out.println("Response Code : " + responseCode);
     BufferedReader in = new BufferedReader(
             new InputStreamReader(con.getInputStream()));
     String inputLine;
     StringBuffer response = new StringBuffer();
     while ((inputLine = in.readLine()) != null) {
     	response.append(inputLine);
     }
     in.close();
     System.out.println(response.toString());
     
     
     
     try (FileWriter file = new FileWriter("C:\\Users\\User\\Documents\\NetBeansProjects\\Probafeladat\\src\\readAPI\\JSON\\APImarketplace.json")) {
			file.write(response.toString());
			
		}catch (IOException e) {
               e.printStackTrace();
               
        }
     

   }
        
    catch (Exception e) {
    e.printStackTrace();
       }
   
}
    
}


package probafeladat;


import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author User
 */
public class ListingTest {
    

    @Test
    public void testGetListingCount() {
        System.out.println("getListingCount");
        String expResult = "540";
        String result = Listing.getListingCount();
        assertEquals(expResult, result);
    
    }

    @Test
    public void testGetEBAYCount() {
        System.out.println("getEBAYCount");
        String expResult = "273";
        String result = Listing.getEBAYCount();
        assertEquals(expResult, result);
   
    }

   
    @Test
    public void testGetEBAYPriceGBP() {
        System.out.println("getEBAYPriceGBP");
        String expResult = "19660.65";
        String result = Listing.getEBAYPriceGBP();
        assertEquals(expResult, result);
  
    }

    
    @Test
    public void testGetEBAYPriceAUD() {
        System.out.println("getEBAYPriceAUD");
        String expResult = "24453.50";
        String result = Listing.getEBAYPriceAUD();
        assertEquals(expResult, result);
   
    }

    
    @Test
    public void testGetEBAYPriceEUR() {
        System.out.println("getEBAYPriceEUR");
        String expResult = "19093.71";
        String result = Listing.getEBAYPriceEUR();
        assertEquals(expResult, result);
   
    }

    @Test
    public void testGetEBAYPriceHUF() {
        System.out.println("getEBAYPriceHUF");
        String expResult = "24606.03";
        String result = Listing.getEBAYPriceHUF();
        assertEquals(expResult, result);
   
    }

  
    @Test
    public void testGetEBAYPriceJPY() {
        System.out.println("getEBAYPriceJPY");
        String expResult = "21174.97";
        String result = Listing.getEBAYPriceJPY();
        assertEquals(expResult, result);

    }

   
    @Test
    public void testGetEBAYPriceUSD() {
        System.out.println("getEBAYPriceUSD");
        String expResult = "17276.77";
        String result = Listing.getEBAYPriceUSD();
        assertEquals(expResult, result);

    }

    @Test
    public void testGetAVGEBAYPriceGBP() {
        System.out.println("getAVGEBAYPriceGBP");
        String expResult = "479.528049";
        String result = Listing.getAVGEBAYPriceGBP();
        assertEquals(expResult, result);
    
    }

 
    @Test
    public void testGetAVGEBAYPriceAUD() {
        System.out.println("getAVGEBAYPriceAUD");
        String expResult = "531.597826";
        String result = Listing.getAVGEBAYPriceAUD();
        assertEquals(expResult, result);
    
    }

    @Test
    public void testGetAVGEBAYPriceEUR() {
        System.out.println("getAVGEBAYPriceEUR");
        String expResult = "389.667551";
        String result = Listing.getAVGEBAYPriceEUR();
        assertEquals(expResult, result);
   
    }

 
    @Test
    public void testGetAVGEBAYPriceHUF() {
        System.out.println("getAVGEBAYPriceHUF");
        String expResult = "492.120600";
        String result = Listing.getAVGEBAYPriceHUF();
        assertEquals(expResult, result);
   
    }

    @Test
    public void testGetAVGEBAYPriceJPY() {
        System.out.println("getAVGEBAYPriceJPY");
        String expResult = "516.462683";
        String result = Listing.getAVGEBAYPriceJPY();
        assertEquals(expResult, result);
   
    }

  
    @Test
    public void testGetAVGEBAYPriceUSD() {
        System.out.println("getAVGEBAYPriceUSD");
        String expResult = "375.581957";
        String result = Listing.getAVGEBAYPriceUSD();
        assertEquals(expResult, result);
 
    }

    @Test
    public void testGetAMAZONCount() {
        System.out.println("getAMAZONCount");
        String expResult = "267";
        String result = Listing.getAMAZONCount();
        assertEquals(expResult, result);
     
    }

    
    @Test
    public void testGetAMAZONPriceGBP() {
        System.out.println("getAMAZONPriceGBP");
        String expResult = "22554.71";
        String result = Listing.getAMAZONPriceGBP();
        assertEquals(expResult, result);
        
    }

    
    @Test
    public void testGetAMAZONPriceAUD() {
        System.out.println("getAMAZONPriceAUD");
        String expResult = "18919.01";
        String result = Listing.getAMAZONPriceAUD();
        assertEquals(expResult, result);
    
    }

    @Test
    public void testGetAMAZONPriceEUR() {
        System.out.println("getAMAZONPriceEUR");
        String expResult = "26316.25";
        String result = Listing.getAMAZONPriceEUR();
        assertEquals(expResult, result);
      
    }

    @Test
    public void testGetAMAZONPriceHUF() {
        System.out.println("getAMAZONPriceHUF");
        String expResult = "30985.05";
        String result = Listing.getAMAZONPriceHUF();
        assertEquals(expResult, result);
      
    }

    
    @Test
    public void testGetAMAZONPriceJPY() {
        System.out.println("getAMAZONPriceJPY");
        String expResult = "24684.51";
        String result = Listing.getAMAZONPriceJPY();
        assertEquals(expResult, result);
    
    }

  
    @Test
    public void testGetAMAZONPriceUSD() {
        System.out.println("getAMAZONPriceUSD");
        String expResult = "17465.27";
        String result = Listing.getAMAZONPriceUSD();
        assertEquals(expResult, result);
     
    }

    
    @Test
    public void testGetAVGAMAZONPriceGBP() {
        System.out.println("getAVGAMAZONPriceGBP");
        String expResult = "490.319783";
        String result = Listing.getAVGAMAZONPriceGBP();
        assertEquals(expResult, result);
      
    }

    @Test
    public void testGetAVGAMAZONPriceAUD() {
        System.out.println("getAVGAMAZONPriceAUD");
        String expResult = "497.868684";
        String result = Listing.getAVGAMAZONPriceAUD();
        assertEquals(expResult, result);
      
    }

 
    @Test
    public void testGetAVGAMAZONPriceEUR() {
        System.out.println("getAVGAMAZONPriceEUR");
        String expResult = "487.337963";
        String result = Listing.getAVGAMAZONPriceEUR();
        assertEquals(expResult, result);
     
    }

  
    @Test
    public void testGetAVGAMAZONPriceHUF() {
        System.out.println("getAVGAMAZONPriceHUF");
        String expResult = "607.550000";
        String result = Listing.getAVGAMAZONPriceHUF();
        assertEquals(expResult, result);
       
    }

    @Test
    public void testGetAVGAMAZONPriceJPY() {
        System.out.println("getAVGAMAZONPriceJPY");
        String expResult = "602.061220";
        String result = Listing.getAVGAMAZONPriceJPY();
        assertEquals(expResult, result);
      
    }


    @Test
    public void testGetAVGAMAZONPriceUSD() {
        System.out.println("getAVGAMAZONPriceUSD");
        String expResult = "472.034324";
        String result = Listing.getAVGAMAZONPriceUSD();
        assertEquals(expResult, result);
      
    }

    @Test
    public void testGetBestListerEmail() {
        System.out.println("getBestListerEmail");
        String expResult = "dburrows@live.com";
        String result = Listing.getBestListerEmail();
        assertEquals(expResult, result);
       
    }

    
}

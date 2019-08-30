
package probafeladat;


import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author User
 */
public class LocationTest {
    

 
    @Test
    public void testIsLocationID() {
        System.out.println("isLocationID");
        String ID = "5249f33c-fadf-44d9-ab70-471df29c20a6";
        boolean expResult = true;
        boolean result = Location.isLocationID(ID);
        assertEquals(expResult, result);
      
    }

 
    
}

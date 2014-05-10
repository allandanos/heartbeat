package heartbeat

import grails.test.*

import java.text.SimpleDateFormat;

class SyncServiceTests extends GrailsUnitTestCase {
    
    def sdf = new SimpleDateFormat("MMM dd, yyyy");
    def sdft = new SimpleDateFormat("MMM dd, yyyy HH:mm a");
    
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testDateFormat() {
        
        sdft.parse("May 11, 2014 12:00 AM");

    }
    
    void testFloatFormat() {
        
        Double.valueOf("4.123").floatValue()
    }
    
}

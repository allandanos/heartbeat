package heartbeat

class FloodReport {

    String floodHeight
    int floodHeightRating
    Date floodTime
    String imageUrl
    String details
    float lat
    float lng
    
    
    static constraints = {
        imageUrl nullable: true
        details nullable: true
    }
}

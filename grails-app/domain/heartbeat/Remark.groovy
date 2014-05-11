package heartbeat

class Remark {

    String message
    
    float lat
    float lng
    
    User user
    
    static constraints = {
        lat nullable: true
        lng nullable: true
    }
    
    String toString() {
        return message
    }
    
}

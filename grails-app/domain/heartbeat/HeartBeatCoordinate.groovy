package heartbeat

class HeartBeatCoordinate {
    
    Date dateCreated
    
    float lat
    float lng
    
    HeartBeat heartBeat

    static mapping = {
        sort "email"
    }
    
    static constraints = {
    }
    
    String toString(){
        return "[$lat , $lng] - $dateCreated"
    }
}

package heartbeat

class HeartBeatCoordinate {
    
    Date dateCreated
    
    float lat
    float lng
    
    HeartBeat heartBeat

    static constraints = {
    }
    
    String toString(){
        return "[$lat , $lng] - $dateCreated"
    }
}

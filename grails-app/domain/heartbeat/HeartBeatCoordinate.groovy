package heartbeat

class HeartBeatCoordinate {
    
    Date dateCreated
    
    float lat
    float lon
    
    static belongsTo = [heartBeat: HeartBeat]

    static constraints = {
    }
}

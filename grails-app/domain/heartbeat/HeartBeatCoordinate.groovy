package heartbeat

class HeartBeatCoordinate {
    
    Date dateCreated
    
    float lat
    float lng
    
    static belongsTo = [heartBeat: HeartBeat]

    static constraints = {
    }
}

package heartbeat

class HeartBeatCoordinate {
    
    float lat
    float lon
    
    static belongsTo = [heartBeat: HeartBeat]

    static constraints = {
    }
}

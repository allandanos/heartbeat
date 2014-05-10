package heartbeat

class HeartBeat {
    
    Date start
    Date end
    
    static belongsTo = [user: User]
    static hasMany = [coordinates: HeartBeatCoordinate]

    static constraints = {
    }
}

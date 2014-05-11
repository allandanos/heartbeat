package heartbeat

class HeartBeat {
    
    Date start
    Date end
    
    User user

    static hasMany = [coordinates: HeartBeatCoordinate]

    static constraints = {
        end nullable: true
        user nullable: true
    }
}

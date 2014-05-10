package heartbeat

class AssetHeartBeat {

    Date start
    Date end
    
    static belongsTo = [asset: Asset]
    static hasMany = [coordinates: AssetHeartBeatCoordinate]
    
    static constraints = {
    }
}

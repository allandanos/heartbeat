package heartbeat

class Asset {

    String name
    
    String mobile
    
    static belongsTo = [type: AssetType]
    
    static constraints = {
    }
}

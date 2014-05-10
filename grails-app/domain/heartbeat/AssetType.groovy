package heartbeat

class AssetType {
    
    String name

    static belongsTo = [user: User]
    
    static hasMany = [assets: Asset]
    
    static constraints = {
        
    }
}

package heartbeat

class DailyWeatherForecast {
    
    Date lastUpdate
    String source
    String location
    float lat
    float lng
    
    static hasMany = {data: DailyWeatherForecast}

    static constraints = {
    }
}

package heartbeat

class WeatherForecast {
    
    Date lastUpdate
    String source
    String location
    float lat
    float lng
    
    static hasMany = [data: WeatherForecastData]

    static constraints = {
    }
}

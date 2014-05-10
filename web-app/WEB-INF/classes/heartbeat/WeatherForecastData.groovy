package heartbeat

class WeatherForecastData {

    float percentChanceOfRain
    String chanceOfRain
    String icon
    String time
    
    static belongsTo = [forecast: WeatherForecast]
    
    static constraints = {
        
    }
}

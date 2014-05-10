package heartbeat

class DailyWeatherForecastData {

    Date date
    
    DailyWeatherForecast forecast
    
    static hasMany = [readings: DailyWeatherForecastDataReading]
    
    static constraints = {
        forecast nullable: true
    }
}

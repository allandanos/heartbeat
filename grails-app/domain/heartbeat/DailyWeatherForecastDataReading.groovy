package heartbeat

class DailyWeatherForecastDataReading {

    int rainfall
    int realFeel
    int temperature
    String time
    int windspeed
    int relativeHum
    String windDir
    String icon
    
    DailyWeatherForecastData data
    
    static constraints = {
        rainfall nullable: true, min:0
        realFeel nullable: true, min:0
        temperature nullable: true, min:0
        time nullable: true
        windspeed nullable:true, min:0
        relativeHum nullable: true, min:0
        windDir nullable: true
        time nullable: true
        icon nullable: true
        data nullable: true
    }
}

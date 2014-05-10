package heartbeat

import java.text.SimpleDateFormat;

class SyncService {

    static transactional = false

    SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
    SimpleDateFormat sdfh = new SimpleDateFormat("MMM dd, yyyy HH:00 a");
    SimpleDateFormat sdft = new SimpleDateFormat("MMM dd, yyyy HH:mm a");
    
    final static String DAILY_WEATHER = "DailyWeatherForecast"
    
    def syncFloodReport(year) {
//        def json = grails.converters.JSON.parse( new URL( 'http://202.90.153.89/api/reports/flood/2014' ).text )
//        println json;
        //println JSON.stringify(json);
    }
    
    def syncDailyWeatherForecast() {
        
        def now = new Date()
        def history = SyncHistory.findByTypeAndDateCreated(DAILY_WEATHER, formatHourDate(now))
        
        if (history != null) {
            
            println "Skipping - already syched"
            
        } else {
            println "Synching.."
            
            new SyncHistory (
                type: DAILY_WEATHER,
                dateCreated: formatHourDate(now)
            ).save(flush: true, failOnError: true)
            
            def json = grails.converters.JSON.parse( new URL( 'http://202.90.153.89/api/four_day_forecast' ).text )
        
            for (obj in json) {

                def forecast = new DailyWeatherForecast(
                    lastUpdate: sdft.parse(String.valueOf(obj.last_update)),
                    source:     obj.source,
                    location:   obj.location,
                    lat:        Double.valueOf(obj.lat).floatValue(),
                    lng:        Double.valueOf(obj.lng).floatValue()
                ).save(flush: true, failOnError: true)


                for ( data in obj.data) {

                    new DailyWeatherForecastData (
                        date: sdf.parse(String.valueOf(data.date)),
                        forecast: forecast
                    ).save(flush: true, failOnError: true)

                    for (reading in data.readings) {reading 

                        new DailyWeatherForecastDataReading(
                           rainfall:    reading.rain_fall ? Integer.valueOf(reading.rain_fall) : 0,
                           realFeel:    reading.real_feel ? Integer.valueOf(reading.real_feel) : 0,
                           temperature: reading.temperature ? Integer.valueOf(reading.temperature) : 0,
                           time:        reading.time,
                           windspeed:   reading.windspeed ? Integer.valueOf(reading.windspeed) : 0,
                           relativeHum: reading.relative_hum ? Integer.valueOf(reading.relative_hum) : 0,
                           windDir:     reading.wind_dir,
                           icon:        reading.icon,
                           data:        data
                       ).save(flush: true, failOnError: true)

                    }
                }
            }
            
            println "Sync complete."
        }
        
    }
    
    def syncWeatherForecast() {
//        def json = grails.converters.JSON.parse( new URL( 'http://202.90.153.89/api/four_hour_forecast' ).text )
//        println json;
    }
    
    Date formatHourDate(date) {
        String hourDateStr = sdfh.format(date)
        Date newDate = sdfh.parse(hourDateStr)
        
        return newDate
    }
}

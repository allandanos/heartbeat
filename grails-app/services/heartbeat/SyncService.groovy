package heartbeat

import java.text.SimpleDateFormat;

class SyncService {

    static transactional = false

    SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
    SimpleDateFormat sdfh = new SimpleDateFormat("MMM dd, yyyy HH:00 a");
    SimpleDateFormat sdft = new SimpleDateFormat("MMM dd, yyyy HH:mm a");
    
    final static String DAILY_WEATHER = "DailyWeatherForecast"
    
    def syncFloodReport(years) {

        
        if (FloodReport.count() == 0) {

            println "Synching Flood Reports.."
            
            for (year in years) {
                def json = grails.converters.JSON.parse( new URL( "http://202.90.153.89/api/reports/flood/${year}" ).text )

                for (report in json) {

                    new FloodReport(
                     floodHeight: report.flood_height,
                     floodHeightRating: calcRating(report.flood_height),
                     floodTime: sdft.parse(String.valueOf(report.flood_time)),
                     details:   report.details,
                     lat:        Double.valueOf(report.lat).floatValue(),
                     lng:        Double.valueOf(report.lng).floatValue()
                    ).save(flush: true, failOnError: true)    

                }
            }
            
            println "Sync complete."
        } else {
            println "Already synched"
        }
        
        
    }
    
    def syncDailyWeatherForecast() {
        
        def now = new Date()
        def history = SyncHistory.findByTypeAndDateCreated(DAILY_WEATHER, formatHourDate(now))
        
        if (SyncHistory.count() == 0) {
            
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
    
    private int calcRating(height){
        
        int rating = -1;
      
        if ("No Flood".equals(height)) { rating = 0; }
        else if ("Ankle High".equals(height)) { rating = 1; }
        else if ("Knee High".equals(height)) { rating = 2; }
        else if ("Waist High".equals(height)) { rating = 3; }
        else if ("Neck High".equals(height)) { rating = 4; }
        else if ("Top of Head High".equals(height)) { rating = 5; }
        else if ("1-Storey High".equals(height)) { rating = 6; }
        else if ("1.5-Storeys High".equals(height)) { rating = 7; }
        else if ("2-Storeys or Higher".equals(height)) { rating = 8; }
      
        return rating;

    }
    private Date formatHourDate(date) {
        String hourDateStr = sdfh.format(date)
        Date newDate = sdfh.parse(hourDateStr)
        
        return newDate
    }
}

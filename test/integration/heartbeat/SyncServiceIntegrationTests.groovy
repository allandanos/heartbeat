package heartbeat

import grails.test.*

class SyncServiceIntegrationTests extends GroovyTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSaveData() {
        
        def forecast = new DailyWeatherForecast(
            lastUpdate: new Date(),
            source:     "obj.source",
            location:   "obj.location",
            lat:        1,
            lng:        1
        ).save(flush: true, failOnError: true)
        
        def data = new DailyWeatherForecastData(
            date: new Date(),
            forecast: forecast
        ).save(flush: true, failOnError: true)
        
        def reading = new DailyWeatherForecastDataReading (
            rainfall:    1,
            realFeel:    1,
            temperature: 1,
            time:        new Date(),
            wind:        1,
            relativeHum: 1,
            windDir:     1,
            icon:        "reading.icon",
            data:        data
        ).save(flush: true, failOnError: true)
        

    }
}

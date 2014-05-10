package heartbeat



class SyncWeatherForecastJob {
    static triggers = {
      simple name: 'oneTimeSyncWeatherForecast', startDelay:10000, repeatInterval: 5000l, repeatCount: 0 // execute job only once after 5 seconds
        
    }

    def syncService
    
    def execute() {
        println "SyncWeatherForecastJob"
        
        syncService.syncWeatherForecast()
    }
}

package heartbeat



class SyncDailyWeatherForecastJob {
    static triggers = {
        simple name: 'oneTimeSyncDailyWeatherForecast', startDelay:10000, repeatInterval: 5000l, repeatCount: 0 // execute job only once after 5 seconds
        cron name: 'dailySyncDailyWeatherForecast', cronExpression: "0 0 1 * * ?" // daily every 1:00 AM 
    }

    def syncService
    
    def execute() {
//        println "SyncDailyWeatherForecastJob"
//        syncService.syncDailyWeatherForecast()
    }
}

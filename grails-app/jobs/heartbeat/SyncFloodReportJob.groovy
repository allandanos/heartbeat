package heartbeat



class SyncFloodReportJob {
    static triggers = {
      simple name: 'oneTimeSyncFloodReport', startDelay:10000, repeatInterval: 5000l, repeatCount: 0 // execute job only once after 5 seconds
        
    }

    def syncService
    
    def execute() {
       
        println "SyncFloodReportJob"
        syncService.syncFloodReport()
    }
}

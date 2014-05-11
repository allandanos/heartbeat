package heartbeat

import grails.converters.*

import groovy.sql.Sql

class ApiController {

    def dataSource
    
    def index = { }
    
    def summary = {
        
        def result = [
            weather: [
                last_update: "May 11, 2014 03:00 PM",
                source: "www.Weather-Manila.com (soon to be WISE Program that will run in an IBM supercomputer)",
                location: "Manila",
                lat: 14.597,
                lng: 120.985,
                data: [
                    [
                        "date": "May 11, 2014",			
                        "rainfall": "0",
                        "real_feel": "30",
                        "temperature": "27",
                        "time": "03:00 PM-06:00PM",
                        "windspeed": "0",
                        "relative_hum": "78",
                        "wind_dir": "NE",
                        "icon": "http://nababaha.appspot.com/static/img/34.png"
                    ],
                    [
                        "date": "May 12, 2014",			
                        "rainfall": "0",
                        "real_feel": "30",
                        "temperature": "27",
                        "time": "03:00 PM-06:00PM",
                        "windspeed": "0",
                        "relative_hum": "78",
                        "wind_dir": "NE",
                        "icon": "http://nababaha.appspot.com/static/img/33.png"
                    ],
                    [
                        "date": "May 13, 2014",			
                        "rainfall": "0",
                        "real_feel": "30",
                        "temperature": "27",
                        "time": "03:00 PM-06:00PM",
                        "windspeed": "0",
                        "relative_hum": "78",
                        "wind_dir": "NE",
                        "icon": "http://nababaha.appspot.com/static/img/34.png"
                    ],
                ]
            ],
            flood: [
                flood_height: "Waist High",
                flood_rating: 3,
                flood_time: "Jan 20, 2013 08:00 AM",
                image_url: "",
                details: "people were trapped and rendered isolated due to heavy rains (and increase in water levels)"
            ],
            landslide: [
                landslide_rating: 0,
                details: "people were trapped under the bridge"
            ],
            earthquake: [
                earthquake_rating: 0,
                details: "people were trapped and the caves"
            ]
        ]
        
        render result as XML
        
    }
    
    def heartbeats = {
        
        
        
    }
    
    def pulse = {
        
        try {
            
            def user = User.findById(params.uid)

            if (user){

                def db = new Sql(dataSource)
                def row = db.rows("select id from heart_beat where end is null")

                def session = row ? HeartBeat.findById(row[0].id) : null;

                if (!session){
                    session = new HeartBeat(
                        user: user,
                        start: new Date(),
                        end: null
                    )
                }

                def coordinate = new HeartBeatCoordinate(
                    heartBeat: session,
                    lat: params.lat,
                    lng: params.lng
                ).save(flush: true)

            }

            def res = [result : "saved"]
            render res as JSON
            
        } catch (Exception e) {
            e.printStackTrace()
            def res = [result: "error"] 
            render res as JSON
        }
    }
    
    def pulseStart = {
        
        try {
            
            def user = User.findById(params.uid)

            if (user){
                def pulse = new HeartBeat(
                    user: user,
                    start: new Date(),
                    end: null
                ).save(flush: true)
            }

            def res = [result : "started"]
            render res as JSON
        
        } catch (Exception e) {
            e.printStackTrace()
            def res = [result: "error"] 
            render res as JSON
        }
        
    }
    
    def pulseEnd = {
        
        try {
            
            def user = User.findById(params.uid)
            if (user) {

                def db = new Sql(dataSource)
                def row = db.rows("select id from heart_beat where end is null")
             
                def session = row ? HeartBeat.findById(row[0].id) : null;
                if (session) {
                    session.end = new Date()
                    session.save(flush: true)
                }
                
            }
           
            def res = [result: "ended"] 
            render res as JSON
            
        } catch (Exception e) {
            e.printStackTrace()
            def res = [result: "error"] 
            render res as JSON
        }
        
        
    }
    
    def track = {
        
    }
    
    def trackStart = {
        
    }
    
    def trackEnd = {
        def result = {
            
        }
    }
    
}

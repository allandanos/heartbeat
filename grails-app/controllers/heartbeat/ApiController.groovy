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
                "icon": "http://nababaha.appspot.com/static/img/30.png",
                data: [
                    [
                        "date": "May 11, 2014",			
                        "rainfall": "0",
                        "real_feel": "30",
                        "temperature": "36",
                        "time": "03:00 PM-06:00PM",
                        "windspeed": "0",
                        "relative_hum": "78",
                        "wind_dir": "NE",
                        "icon": "http://nababaha.appspot.com/static/img/30.png"
                    ],
                    [
                        "date": "May 12, 2014",			
                        "rainfall": "0",
                        "real_feel": "37",
                        "temperature": "37",
                        "time": "03:00 PM-06:00PM",
                        "windspeed": "0",
                        "relative_hum": "78",
                        "wind_dir": "NE",
                        "icon": "http://nababaha.appspot.com/static/img/32.png"
                    ],
                    [
                        "date": "May 13, 2014",			
                        "rainfall": "0",
                        "real_feel": "30",
                        "temperature": "34",
                        "time": "03:00 PM-06:00PM",
                        "windspeed": "0",
                        "relative_hum": "78",
                        "wind_dir": "NE",
                        "icon": "http://nababaha.appspot.com/static/img/30.png"
                    ],
                ]
            ],
            flood: [
                flood_height: "No Flood",
                flood_rating: 3,
                flood_time: "May 11, 2014 03:00 PM",
                image_url: "",
                details: ""
            ],
            landslide: [
                landslide_distance: 0,
                details: "Away from landslide hazzard zone"
            ],
            earthquake: [
                earthquake_distance: 30,
                details: "Marikina Fault Line"
            ]
        ]
        
        render result as JSON
        
    }
    
    def heartbeats = {
        
        try {
            
            def res = []
            
            def beats = HeartBeat.list()
            
            for (beat in beats) {
                
                def coords = []
                
                for (coord in beat.coordinates) {
                    
                    def info = [
                        date: coord.dateCreated,
                        lat: coord.lat,
                        lng: coord.lng
                    ]
                    
                    coords.add (info)
                }
                
                if (coords.size() > 0) {
                    res.add(coords)
                }
            }
            
            render res as JSON
            
        } catch (Exception e) {
            e.printStackTrace()
            def res = [result: "error"] 
            render res as JSON
        }
        
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
                    ).save(flush: true)
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
    
    def scene = {
     
        try {
            
            def user = User.findById(params.uid)
            if (user) {
                
                new Remark (
                    user: user,
                    message: params.remarks,
                    lat: params.lat ?: "",
                    lng: params.lng ?: ""
                ).save(flush: true)
                
            }
           
            def res = [result: "remarked"] 
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

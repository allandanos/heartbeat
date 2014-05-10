package heartbeat

import grails.converters.*

class ApiController {

    def index = { }
    
    def summary = {
        
        def result = [
            weather: [
                last_update: "May 10, 2014 09:00 PM",
                source: "www.Weather-Manila.com (soon to be WISE Program that will run in an IBM supercomputer)",
                location: "Manila",
                lat: 14.597,
                lng: 120.985,
                data: [
                    [
                        "date": "May 10, 2014",			
                        "rainfall": "0",
                        "real_feel": "30",
                        "temperature": "27",
                        "time": "09:00 PM-12:00AM",
                        "windspeed": "0",
                        "relative_hum": "78",
                        "wind_dir": "NE",
                        "icon": "http://nababaha.appspot.com/static/img/34.png"
                    ],
                    [
                        "date": "May 11, 2014",			
                        "rainfall": "0",
                        "real_feel": "30",
                        "temperature": "27",
                        "time": "09:00 PM-12:00AM",
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
                        "time": "09:00 PM-12:00AM",
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
        
    }
    
    def pulseStart = {
        
    }
    
    def pulseEnd = {
        
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

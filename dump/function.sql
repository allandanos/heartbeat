DELIMITER $$
/*
Takes two latitudes and longitudes in degrees. You could comment out the conversion if you want to pass as radians.
Calculate the distance in miles, change the radius to the earth's radius in km to get km (6371) / miles (3956.6).
*/

DROP FUNCTION IF EXISTS GETDISTANCE$$
CREATE FUNCTION GETDISTANCE 
  (deg_lat1 FLOAT, deg_lng1 FLOAT, deg_lat2 FLOAT, deg_lng2 FLOAT) 
  RETURNS FLOAT 
  DETERMINISTIC 
BEGIN 
  DECLARE distance FLOAT;
  DECLARE delta_lat FLOAT; 
  DECLARE delta_lng FLOAT; 
  DECLARE lat1 FLOAT; 
  DECLARE lat2 FLOAT;
  DECLARE a FLOAT;

  SET distance = 0;

  /*Convert degrees to radians and get the variables I need.*/
  SET delta_lat = radians(deg_lat2 - deg_lat1); 
  SET delta_lng = radians(deg_lng2 - deg_lng1); 
  SET lat1 = radians(deg_lat1); 
  SET lat2 = radians(deg_lat2); 

  /*Formula found here: http://www.movable-type.co.uk/scripts/latlong.html*/
  SET a = sin(delta_lat/2.0) * sin(delta_lat/2.0) + sin(delta_lng/2.0) * sin(delta_lng/2.0) * cos(lat1) * cos(lat2); 
  SET distance = 6371 * 2 * atan2(sqrt(a),  sqrt(1-a)); 

  RETURN distance;
END$$
DELIMITER ;
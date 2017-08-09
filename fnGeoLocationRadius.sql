DELIMITER $$
CREATE FUNCTION `fnGeoLocationRadius`(
	x1 DECIMAL(13,7), 
    y1 DECIMAL(13,7),
	x2 DECIMAL(13,7), 
    y2 DECIMAL(13,7)
) RETURNS decimal(10,2)
BEGIN
	DECLARE c DECIMAL(13, 12);
	DECLARE z DECIMAL(13, 6);
    
	RETURN 
        6371 * 
		ACOS( 
			COS( RADIANS( y2 ) ) * COS( RADIANS( y1 ) ) * 
			COS( RADIANS( x1 ) -  RADIANS( x2 ) ) + 
			SIN( RADIANS( y2 ) ) * SIN( RADIANS( y1) ) 
		);
END$$
DELIMITER ;

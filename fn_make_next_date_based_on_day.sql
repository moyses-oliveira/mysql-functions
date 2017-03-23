DELIMITER $$
CREATE FUNCTION `fn_make_next_date_based_on_day`(
	v_date DATE,
    v_day TINYINT(3)
) RETURNS date
BEGIN
	DECLARE _day TINYINT(3);
    DECLARE _date DATE;
    
    SET _day = v_day;
    SET _date = v_date;
    
	RETURN IF(
		DAY(_date) < _day, 
		STR_TO_DATE(CONCAT(DATE_FORMAT(_date, '%Y-%m-'), _day), '%Y-%m-%e'),
        STR_TO_DATE(CONCAT(DATE_FORMAT(ADDDATE(_date, INTERVAL 1 MONTH) , '%Y-%m-'), _day), '%Y-%m-%e')
	);
END$$
DELIMITER ;

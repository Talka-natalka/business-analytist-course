DROP FUNCTION IF EXISTS sec_to_days;
DELIMITER $$
CREATE FUNCTION sec_to_days(n INT)
RETURNS VARCHAR(150)
READS SQL DATA	
BEGIN
	SET @res := '';
    SET @quant := 0;
    SET @quant = n DIV 86400;    
    SET n = n % 86400;
    SET @res = CONCAT(@quant, ' days ');
    SET @quant = n DIV 3600;
    SET n = n % 3600;
    SET @res = CONCAT(@res, @quant, ' hours ');
    SET @quant = n DIV 60;
    SET n = n % 60;
    SET @res = CONCAT(@res, @quant, ' minutes ', n, ' seconds');
    
    
    RETURN @res;
END $$
DELIMITER ;

SELECT sec_to_days(172383);

DROP FUNCTION IF EXISTS even;
DELIMITER $$
CREATE FUNCTION even(lmt INT)
RETURNS VARCHAR(150)
READS SQL DATA
BEGIN
	SET @i := 2;
    SET @res := '2';
    WHILE @i < lmt DO
		SET @i = @i + 2;
        SET @res = CONCAT(@res, ', ', @i);
	END WHILE;
    
	RETURN @res;
END $$
DELIMITER ;

SELECT even(10);
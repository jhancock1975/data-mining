use assign4;
DROP PROCEDURE IF EXISTS getLastFprResultsFor;
delimiter //
CREATE PROCEDURE getLastFprResultsFor(classifier VARCHAR(255), filter VARCHAR(255)) 
BEGIN
	declare lastExpTime timestamp;
	select max(experimentStartTime) from ClassifierResults into lastExpTime;
	select * from ClassifierResults 
		where experimentStartTime = lastExpTime and 
		classifierClassName=classifier and 
		filterClassName=filter;
END //
delimiter ;


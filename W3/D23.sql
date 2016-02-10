/* ----------------------------------------------------------------------
	Day 2 & 3 - Getting a close look at setup database & SQL
------------------------------------------------------------------------- */

-- Setup sample database------------------------------------------------------

--1
SELECT * FROM `students`;
--2
SELECT * FROM `students` where `name` LIKE 'H%';
--3
SELECT * FROM `students` where `name` LIKE '%a%';
--4
SELECT * FROM `students` ORDER BY `name`;
--5
SELECT * FROM `students` ORDER BY `name` LIMIT 0,2;
--6
SELECT * FROM `students` ORDER BY `name` LIMIT 2,2;

-------------------------------------------------------------------------------

--1
SELECT * FROM `marks` WHERE `annual` IS NULL;
--2
SELECT `student_id`, `subject_id`, `year` FROM `marks` WHERE `annual` IS NULL && `year` = 2005;
--3
SELECT `student_id`, `subject_id`, `year` FROM `marks` WHERE `quarterly` IS NOT NULL || `half_yearly` IS NOT NULL || `annual` IS NOT NULL;
--4
SELECT `student_id`, `subject_id`, `year`, `quarterly`, `half_yearly`, `annual` FROM `marks` WHERE `quarterly` > 90 && `half_yearly` > 90 && `annual` > 90;
--5
SELECT `student_id`, `subject_id`, ((`quarterly`+`half_yearly`+`annual`)/3) AS `average`, `year` FROM `marks`;
--6
SELECT `student_id`, `subject_id`, ((`quarterly`+`half_yearly`+`annual`)/3) AS `average`, `year` FROM `marks` WHERE `year` IN (2003,2004);

-- Joins & SubQueries -----------------------------------------------------------

--1
SELECT * FROM `marks` m JOIN `students` s ON m.student_id = s.id WHERE `annual` IS NULL;
--2
SELECT `name` as `Student Name`, `subject_id`, `year` FROM `marks` m JOIN `students` s ON m.student_id = s.id WHERE `annual` IS NULL && `year` = 2005;
--3
SELECT `name` as `Student Name`, `subject_id`, `year` FROM `marks` m JOIN `students` s ON m.student_id = s.id WHERE `quarterly` IS NOT NULL || `half_yearly` IS NOT NULL || `annual` IS NOT NULL;
--4
SELECT `name` as `Student Name`, `subject_id`, `year`, `quarterly`, `half_yearly`, `annual` FROM `marks` m JOIN `students` s ON m.student_id = s.id WHERE `quarterly` > 90 && `half_yearly` > 90 && `annual` > 90;
--5
SELECT `name` as `Student Name`, `subject_id`, ((`quarterly`+`half_yearly`+`annual`)/3) AS `average`, `year` FROM `marks` m JOIN `students` s ON m.student_id = s.id;
--6
SELECT `name` as `Student Name`, `subject_id`, ((`quarterly`+`half_yearly`+`annual`)/3) AS `average`, `year` FROM `marks` m JOIN `students` s ON m.student_id = s.id WHERE `year` IN (2003,2004);

---------------------------------------------------------------------------------

--1
SELECT `name` FROM `marks` m JOIN `students` s ON m.student_id = s.id WHERE `quarterly` IS NULL AND `half_yearly` IS NULL AND `annual` IS  NULL;
--2
SELECT `name`, IFNULL(SUM(`annual`),0) as `marks`, `year` FROM `marks` m JOIN `students` s ON m.student_id = s.id GROUP BY `student_id`, `year`;
--3
SELECT `name`, IFNULL(SUM(`quarterly`),0) as `total`, `grade` FROM `marks` m JOIN `students` s ON m.student_id = s.id WHERE `year` = 2003  GROUP BY `student_id`,`grade`;
--4
SELECT `name`, `grade`, count(*) `no_of_medals` FROM `medals` me JOIN `students` s ON me.student_id = s.id GROUP BY student_id, grade HAVING grade IN (9,10);
--5
SELECT `name`, `grade`, count(*) `no_of_medals` FROM `medals` me  RIGHT JOIN `students` s ON me.student_id = s.id GROUP BY name, student_id, grade HAVING no_of_medals < 2;
--6
SELECT  s.`name`, mar.`year` FROM `students` s LEFT JOIN `medals` med ON s.id = med.student_id  LEFT JOIN `marks` mar ON mar.student_id =  s.id GROUP BY s.id, med.id, mar.year HAVING sum(if(`annual`>40,0,1)) = 0 AND count(med.id) = 0;
--7
SELECT `name`, `game_id`, `medal_won`, `grade` FROM `medals` me JOIN `students` s ON me.`student_id` = s.`id` WHERE `student_id` in (SELECT `student_id` FROM `medals` GROUP BY `student_id` HAVING count(medal_won) > 3 );
--8
SELECT `name`, IFNULL(`no_medal_won`,0) as `medal_won`, AVG(`quarterly`) as `quarterly_per`, AVG(`half_yearly`) as `half_yearly_per`, AVG(`annual`) as `annual_per`, mar.`year`, mar.`grade` FROM `marks` mar LEFT JOIN `students` s ON mar.student_id = s.id  LEFT JOIN (SELECT `student_id`, count(`medal_won`) `no_medal_won`, `year` FROM `medals` GROUP BY `student_id`, `year`) `med` ON s.id = med.student_id and mar.year = med.year GROUP BY s.id, mar.grade, mar.year ;
--9

DELIMITER //
DROP FUNCTION IF EXISTS grade;
CREATE FUNCTION grade(mark INT) RETURNS CHAR
BEGIN
DECLARE grade CHAR;
IF(mark>=450) THEN
SET grade = 'S';
ELSEIF(mark>=400) THEN
SET grade = 'A';
ELSEIF(mark>=350) THEN
SET grade = 'B';
ELSEIF(mark>=300) THEN
SET grade = 'C';
ELSEIF(mark>=250) THEN
SET grade = 'D';
ELSEIF(mark>=200) THEN
SET grade = 'E';
ELSEIF(mark<200) THEN
SET grade = 'F';
END IF;
RETURN (grade);
END;
//

SELECT `name`,  grade(SUM(IFNULL(`quarterly`,0)))  `quarterly_rating`, grade(SUM(IFNULL(`half_yearly`,0))) `half_yearly_rating`, grade(SUM(IFNULL(`annual`,0))) `annual_rating`, `year`, `grade`
FROM `marks` m
JOIN `students` s 
ON m.student_id = s.id 
GROUP BY m.student_id, m.year, m.grade;

--Rail reservation system queries-----------------------------------------------------------

CREATE DATABASE railway;
USE railway; 

--Train
CREATE TABLE trains(trainNo INT(6) PRIMARY KEY, trainName VARCHAR(30));

# trainNo 	| trainName 
--------------------------
# 100001	| POTHIGAI EXPRESS 
# 100002 	| MYSORE EXPRESS  

--stations
CREATE TABLE stations(stationId INT(6) PRIMARY KEY, stationCode VARCHAR(4));

# stationId | stationCode 
--------------------------
# 200001 	| MS          
# 200002 	| RJPM        
# 200003 	| MYS         
# 200004 	| BAN		   

--Coaches
CREATE TABLE coaches(coachCode VARCHAR(2) PRIMARY KEY, costPerKm Double);

# coachCode | costPerKm 
--------------------------
# 1A        |        10 
# 2A        |       7.5 
# 3A        |       5.5 
# SL        |       3.5 

--User
CREATE TABLE users(userId VARCHAR(15) PRIMARY KEY, loginId VARCHAR(10), password VARCHAR(128));

# userId | loginId | password 
-------------------------------
# 901    | 901     | 901      
# 902    | 902     | 902      
# 903    | 903     | 903      
# 904    | 904     | 904      

--TrainCoaches
CREATE TABLE trainCoaches(trainNo INT(6) REFERENCES trains(trainNo) , coachCode VARCHAR(2) REFERENCES coaches(coachCode), noOfSeats INT);

# trainNo | coachCode | noOfSeats 
-------------------------------------
#  100001 | SL        |       100 
#  100002 | SL        |       100 
#  100002 | 3A        |       100 
#  100001 | 3A        |       100 
#  100001 | 2A        |       100 
#  100002 | 2A        |       100 
#  100001 | 1A        |       200 
#  100002 | 1A        |       200 

--Routes
CREATE TABLE routes(routeId INT(6) PRIMARY KEY, originStationId INT(6) REFERENCES stations(stationId), destinationStationId INT(6) REFERENCES stations(stationId), distanceInKm DOUBLE);

# routeId | originStationId | destinationStationId | distanceInKm |
# --------+-----------------+----------------------+--------------+
#  300001 |          200001 |               200004 |          400 |
#  300002 |          200001 |               200003 |          500 |
#  300003 |          200001 |               200002 |          800 |
#  300004 |          200004 |               200002 |          800 |
#  300005 |          200004 |               200001 |          420 |

--Trains Map
CREATE TABLE trainRouteMaps(routeId INT(6) REFERENCES routes(routeId), trainNo INT(6) REFERENCES trains(trainNo), arrivalTime TIME, departureTime TIME, durationInMins INT, CONSTRAINT pk PRIMARY KEY (routeId, trainNo));

# routeId | trainNo | arrivalTime | departureTime | durationInMins |
# --------+---------+-------------+---------------+----------------+
#  300001 |  100002 | 10:00:00    | 10:35:00      |             35 |
#  300002 |  100002 | 08:00:00    | 08:20:00      |             20 |
#  300003 |  100001 | 20:00:00    | 20:45:00      |             45 |
#  300004 |  100002 | 22:00:00    | 22:10:00      |             10 |
#  300005 |  100002 | 12:00:00    | 12:10:00      |             10 |

--Bookings
CREATE TABLE bookings(bookingRefNo INT(6) PRIMARY KEY, routeId INT(6) REFERENCES trainRouteMaps(routeId), trainNo INT(6) REFERENCES trainRouteMaps(trainNo), coachCode VARCHAR(2) REFERENCES coaches(coachCode), dataOfJourney DATE, dateOfBooking DATE, noOfTickets INT);

# bookingRefNo | routeId | trainNo | coachCode | dataOfJourney | dateOfBooking | noOfTickets |

----------------------------------------------------------------------------------------------

--1
SELECT * FROM `trains`;
--2
SELECT s1.stationCode origin, s2.stationCode destination, distanceInKm FROM `routes` r JOIN `stations` s1 ON r.originStationId = s1.stationId JOIN `stations` s2 ON r.destinationStationId = s2.stationId;
--3
SELECT `trainName`, SUM(noOfSeats) `Total Sheets` FROM `trains` t JOIN `trainCoaches` tc ON t.trainNo = tc.trainNo GROUP BY tc.trainNo;
--4
SELECT s1.stationCode origin, s2.stationCode destination, distanceInKm FROM `routes` r JOIN `stations` s1 ON r.originStationId = s1.stationId JOIN `stations` s2 ON r.destinationStationId = s2.stationId WHERE destinationStationId = 200004;
--5
SELECT s1.stationCode origin, s2.stationCode destination, distanceInKm FROM `routes` r JOIN `stations` s1 ON r.originStationId = s1.stationId JOIN `stations` s2 ON r.destinationStationId = s2.stationId WHERE originStationId IN (200001, 200004);
--6
SELECT t.trainName, coachCode, dataOfJourney, dateOfBooking, noOfTickets FROM `bookings` b JOIN `trains` t ON b.trainNo = t.trainNo  WHERE dateOfBooking BETWEEN '2016-01-01' AND '2016-01-30';
--7
SELECT * FROM `trains` WHERE trainName LIKE 'P%';
--8
SELECT t.trainName, coachCode, dataOfJourney, dateOfBooking, noOfTickets FROM `bookings` b JOIN `trains` t ON b.trainNo = t.trainNo  WHERE dateOfBooking IS NULL;
--9
SELECT t.trainName, coachCode, dataOfJourney, dateOfBooking, noOfTickets FROM `bookings` b JOIN `trains` t ON b.trainNo = t.trainNo  WHERE dateOfBooking LIKE '2016%' AND dataOfJourney LIKE '2016%';
--10
SELECT trainName, count(coachCode) `Total Coaches` FROM `trainCoaches` tc JOIN `trains` t ON t.trainNo = tc.trainNo GROUP BY  tc.trainNo;
--11
SELECT t.trainName, count(*) `Total Booking` FROM `bookings` b JOIN `trains` t ON b.trainNo = t.trainNo WHERE b.trainNo = 100001 GROUP BY b.trainNo;
--12
SELECT t.trainName, sum(noOfTickets) `Total Tickets` FROM `bookings` b JOIN `trains` t ON b.trainNo = t.trainNo WHERE b.trainNo = 100002 GROUP BY b.trainNo;
--13
SELECT  s1.stationcode 'origin', s2.stationcode 'destination',min(distanceInKm) 'min distance' FROM `routes` r JOIN `stations` s1 ON r.originstationid = s1.stationid JOIN `stations` s2 ON s2.stationid = r.destinationstationid GROUP BY r.originstationid,r.destinationstationid;
--14
SELECT t.trainName, sum(noOfTickets) "Total Tickets" FROM `trains` t JOIN `bookings` b ON t.trainNo = b.trainNo GROUP BY b.trainNo; 
--15
SELECT coachCode, (costPerKm * 50) `COST for 50KM` FROM coaches; 
--16
SELECT t.trainName, departureTime FROM `trains` t JOIN `trainRouteMaps` tr ON t.trainNo = tr.trainNo JOIN `routes` r ON r.routeId = tr.routeId WHERE r.originstationid = 200004;
--17
SELECT t.trainName `Total Tickets` FROM `bookings` b JOIN `trains` t ON b.trainNo = t.trainNo GROUP BY b.trainNo HAVING sum(noOfTickets) > 500;
--18
SELECT t.trainName `Total Tickets` FROM `bookings` b JOIN `trains` t ON b.trainNo = t.trainNo GROUP BY b.trainNo HAVING sum(noOfTickets) < 100;
--19
SELECT trainName, s1.stationcode origin, s2.stationcode destination, coachCode FROM `bookings` b JOIN `trains` t ON t.trainNo = b.trainNo JOIN `routes` r ON r.routeId = b.routeId JOIN `stations` s1 ON s1.stationid = r.originstationid JOIN `stations` s2 ON s2.stationid = r.destinationStationId WHERE b.dataOfJourney > '2016-02-10'; 
--20
SELECT trainName FROM `trainRouteMaps` tr JOIN `routes` r ON tr.routeId = r.routeId JOIN `trains` t ON t.trainNo = tr.trainNo WHERE originstationid = 200001 AND destinationStationId = 200004;
--21
SELECT t.trainName FROM `bookings` b JOIN `trains` t ON b.trainNo = t.trainNo GROUP BY b.trainNo;





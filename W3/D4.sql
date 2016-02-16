/* ----------------------------------------------------------------------
	Day 4 - More SQLs
------------------------------------------------------------------------- */

-- Alter Table ------------------------------------------------------

ALTER TABLE `students` ADD COLUMN `created_at` datetime default now();
ALTER TABLE `marks` ADD COLUMN `created_at` datetime default now();
ALTER TABLE `medals` ADD COLUMN `created_at` datetime default now();

ALTER TABLE `students` ADD COLUMN `updated_at` datetime default now() ON UPDATE now(); 
ALTER TABLE `marks` ADD COLUMN `updated_at` datetime default now() ON UPDATE now();
ALTER TABLE `medals` ADD COLUMN `updated_at` datetime default now() ON UPDATE now();

UPDATE `marks` SET `quarterly` = 0 WHERE `quarterly` is null;
UPDATE `marks` SET `half_yearly` = 0 WHERE `half_yearly` is null;
UPDATE `marks` SET `annual` = 0 WHERE `annual` is null;

ALTER TABLE `marks` MODIFY annual int(11) NOT NULL default 0;
ALTER TABLE `marks` MODIFY half_yearly int(11) NOT null default 0;
ALTER TABLE `marks` MODIFY quarterly int(11) NOT null default 0;

-- Exercise ---------------------------------------------------------

CREATE TABLE students_summary(student_id BIGINT(19), student_name VARCHAR(100), year INT(11), percentage DOUBLE, no_of_medals_received INT(11))

INSERT INTO students_summary(student_id,student_name,year,percentage,no_of_medals_received) 
SELECT s.id,s.name,ma.year, (sum(IFNULL(ma.annual,0))/5), IFNULL(me.medal_won,0) 
FROM `marks` ma RIGHT JOIN `students` s ON s.id=ma.student_id 
LEFT JOIN (SELECT student_id, count(medal_won) 'medal_won',year FROM medals GROUP BY student_id,year) me ON me.student_id=ma.student_id AND me.year = ma.year 
GROUP BY s.id,s.name,ma.year,me.medal_won;

-- TRIGGER ---------------------------------------------------------

ALTER TABLE `marks` ADD COLUMN `average` DOUBLE default 0; 

DELIMITER //
CREATE TRIGGER updateAverage
BEFORE UPDATE
ON `marks` 
FOR EACH ROW
BEGIN
SET new.average = (new.annual + new.half_yearly + new.quarterly)/3;
END
//

CREATE TRIGGER insertAverage
BEFORE INSERT
ON `marks` 
FOR EACH ROW
BEGIN
SET new.average = (new.annual + new.half_yearly + new.quarterly)/3;
END
//
DELIMITER ;

---------------------------------------------------------------------------

ALTER TABLE `medals` ADD COLUMN `medal_received` INT default 0;

DELIMITER //
CREATE TRIGGER updateMedal
BEFORE UPDATE
ON `medals` 
FOR EACH ROW
BEGIN
SET new.medal_received = new.medal_won;
END
//

CREATE TRIGGER insertMedal
BEFORE INSERT
ON `medals` 
FOR EACH ROW
BEGIN
SET new.medal_received = new.medal_won;
END
//
DELIMITER ;

ALTER TABLE `medals` DROP COLUMN `medal_won`;

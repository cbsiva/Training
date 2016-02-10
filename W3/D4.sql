/* ----------------------------------------------------------------------
	Day 4 - More SQLs
------------------------------------------------------------------------- */

-- Alter Table ------------------------------------------------------

--1
ALTER TABLE `students` ADD COLUMN `created_at` datetime default now();
ALTER TABLE `marks` ADD COLUMN `created_at` datetime default now();
ALTER TABLE `medals` ADD COLUMN `created_at` datetime default now();

UPDATE `marks` SET `quarterly` = 0 WHERE `quarterly` is null;
UPDATE `marks` SET `half_yearly` = 0 WHERE `half_yearly` is null;
UPDATE `marks` SET `annual` = 0 WHERE `annual` is null;

--2
ALTER TABLE `students` ADD COLUMN `updated_at` datetime default now() ON UPDATE now(); 
ALTER TABLE `marks` ADD COLUMN `updated_at` datetime default now() ON UPDATE now();
ALTER TABLE `medals` ADD COLUMN `updated_at` datetime default now() ON UPDATE now();

ALTER TABLE `marks` MODIFY annual int(11) NOT NULL default 0;
ALTER TABLE `marks` MODIFY half_yearly int(11) NOT null default 0;
ALTER TABLE `marks` MODIFY quarterly int(11) NOT null default 0;



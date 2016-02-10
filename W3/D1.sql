/* ----------------------------------------------------------------------
	Day 1 Fundamentals of database
------------------------------------------------------------------------- */

CREATE DATABASE IF NOT EXISTS `service_station`;

USE `service_station`;

CREATE TABLE `Service_Station` (`id` NUMERIC(5) PRIMARY KEY, `name` VARCHAR(30), `address` VARCHAR(120), `contact` VARCHAR(13));

CREATE TABLE `employees` (`id` NUMERIC(5) PRIMARY KEY, `name` VARCHAR(30), `age` NUMERIC(3),`contact` VARCHAR(13));

CREATE TABLE `customers`(`id` NUMERIC(5) PRIMARY KEY, `name` VARCHAR(30), `age` NUMERIC(3),`contact` VARCHAR(13),`emp_id` NUMERIC(5));

CREATE TABLE `vehicles`(`id` NUMERIC(5) PRIMARY KEY, `type` enum('Car','Bike','Bus'),`brand` VARCHAR(15),`color` VARCHAR(15),`service_charge` DOUBLE);
 
CREATE TABLE `invoices`(`id` NUMERIC(5) PRIMARY KEY, `name_of_owner` VARCHAR(30), `vechile` NUMERIC(5), `amount_total` DOUBLE, `employee_assigned` NUMERIC(5));

DROP TABLE `invoices`;

DROP TABLE `vehicles`;

DROP TABLE `customers`;

DROP TABLE `employees`;

DROP TABLE `Service_Station`;

DROP DATABASE `service_station`;

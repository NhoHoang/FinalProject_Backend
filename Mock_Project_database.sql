-- Drop the database if it already exists
DROP DATABASE IF EXISTS Mock_Project;
-- Create database
CREATE DATABASE IF NOT EXISTS Mock_Project;
USE Mock_Project;

-- Create table user
DROP TABLE IF EXISTS 	`User`;
CREATE TABLE IF NOT EXISTS `User` ( 	
	id 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`username`	 	CHAR(50) NOT NULL UNIQUE CHECK (LENGTH(`username`) >= 6 AND LENGTH(`username`) <= 50),
	`email` 		CHAR(50) NOT NULL UNIQUE CHECK (LENGTH(`email`) >= 6 AND LENGTH(`email`) <= 50),
	`password` 		VARCHAR(800) NOT NULL,
    `address` 		VARCHAR(800) ,
    `fullName` 		VARCHAR(50) NOT NULL,
    `role` 			ENUM('Admin','User') DEFAULT 'User',
	`status`		TINYINT DEFAULT 0, -- 0: Not Active, 1: Active
    `avatarUrl`		VARCHAR(500)
);


-- Create table Donator
DROP TABLE IF EXISTS 	`Donator`;
CREATE TABLE IF NOT EXISTS `Donator` ( 	
	id 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`phone` 		VARCHAR(50) NOT NULL UNIQUE,
    `fullName` 		VARCHAR(50) NOT NULL,
    `email` 		CHAR(50) NOT NULL UNIQUE CHECK (LENGTH(`email`) >= 6 AND LENGTH(`email`) <= 50),
    `address` 		VARCHAR(800) ,
	`donation_amount` 	INT ,
    `message` 		VARCHAR(1000) ,
    `post_id` 		SMALLINT
);

-- Create table Post
DROP TABLE IF EXISTS 	`Post`;
CREATE TABLE IF NOT EXISTS `Post` ( 	
	id 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`title` 		VARCHAR(500) NOT NULL UNIQUE,
    `content_1` 	VARCHAR(1000) NOT NULL,
    `img_1`			VARCHAR(500),
    `content_2` 	VARCHAR(1000) NOT NULL,
	`img_2`			VARCHAR(500),
	`donator_quantity` 	SMALLINT ,
    `money_achieved` 	SMALLINT ,
    `startDate` 	DATETIME NOT NULL,
    `finishDate` 	DATETIME NOT NULL
);


-- Create table Donator_Post
DROP TABLE IF EXISTS 	`Donator_Post`;
CREATE TABLE IF NOT EXISTS `Donator_Post` ( 	
	`id_donator`		SMALLINT ,
	`id_post`			SMALLINT ,
    `total_money` 		SMALLINT 
);

-- Create table Registration_User_Token
DROP TABLE IF EXISTS 	`Registration_User_Token`;
CREATE TABLE IF NOT EXISTS `Registration_User_Token` ( 	
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`token`	 		CHAR(36) NOT NULL UNIQUE,
	`user_id` 		SMALLINT UNSIGNED NOT NULL,
	`expiryDate` 	DATETIME NOT NULL
);

-- Create table Reset_Password_Token
DROP TABLE IF EXISTS 	`Reset_Password_Token`;
CREATE TABLE IF NOT EXISTS `Reset_Password_Token` ( 	
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`token`	 		CHAR(36) NOT NULL UNIQUE,
	`user_id` 		SMALLINT UNSIGNED NOT NULL,
	`expiryDate` 	DATETIME NOT NULL
);



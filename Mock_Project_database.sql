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

-- Create table Post
DROP TABLE IF EXISTS 	`Post`;
CREATE TABLE IF NOT EXISTS `Post` ( 	
	`id`				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`title` 			VARCHAR(500) NOT NULL UNIQUE,
    `content_1` 		VARCHAR(1000) NOT NULL,
    `img_1`				VARCHAR(500),
    `content_2` 		VARCHAR(1000) NOT NULL,
	`img_2`				VARCHAR(500),
	`donator_quantity` 	SMALLINT ,
    `money_achieved` 	SMALLINT ,
    `startDate` 		DATETIME NOT NULL,
    `finishDate` 		DATETIME NOT NULL
);
-- Create table Donator
DROP TABLE IF EXISTS 	`Donator`;
CREATE TABLE IF NOT EXISTS `Donator` ( 	
	`id` 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`phone` 			VARCHAR(50) NOT NULL UNIQUE,
    `fullName` 			VARCHAR(50) NOT NULL,
    `email` 			CHAR(50) NOT NULL UNIQUE CHECK (LENGTH(`email`) >= 6 AND LENGTH(`email`) <= 50),
    `address` 			VARCHAR(800) ,
	-- `donation_amount` 	INT ,
    `message` 			VARCHAR(1000) 
   --  `post_id` 			SMALLINT UNSIGNED,

    --  FOREIGN KEY (post_id) REFERENCES Post(id)
    
);


DROP TABLE IF EXISTS 	`Donator_Post`;
CREATE TABLE IF NOT EXISTS `Donator_Post` ( 	
	`donatorID`			SMALLINT UNSIGNED,
	`postID`			SMALLINT UNSIGNED,
	-- `phone`				VARCHAR(50) NOT NULL ,
    `total_money` 		SMALLINT ,
    
    FOREIGN KEY (donatorID) REFERENCES Donator(id) ON UPDATE CASCADE ,
-- 	FOREIGN KEY (phone) REFERENCES Donator(phone) ON UPDATE CASCADE ,
    FOREIGN KEY (postID) REFERENCES Post(id)
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


-- // insert data:



-- password: 123456
INSERT INTO `User` 	(`username`,			`email`,						`password`,																	`address`,					`fullName`,	 		`status`, 	`role`,  		`avatarUrl`				)
VALUE				('hanh.havan@vti',		'hanhhanoi1999@gmail.com',		'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'Hà Nội',				'Hà Văn Hanh',			0, 		'User' 	,		null				), 
					('thanhhung12@vti',		'hung122112@gmail.com',			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'Hà Nội',	 			'Nguyễn Thanh Hưng',	0, 		'User' 	,		null				), 
					('can.tuananh@vti',		'cananh.tuan12@vti.com',		'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'Hà Nội',				'Cấn Tuấn Anh',			0, 		'User' 	,		null				), 
					('xuanmaivti',			'xuanmai12@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'HHà Nội',				'Nguyễn Xuân Mai',		0, 		'User'	,		null				),
                    ('duynn03',				'duynn03@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'HHà Nội',				'Duy',					1, 		'Admin'	,		'1613362949329.png'	);


-- insert into Post

INSERT INTO `Post` 	(`title`,							`content_1`,							`img_1`, 					
														`content_2`,							`img_2`,				
                                                        `donator_quantity`, 				  `money_achieved` , 			
                                                        `startDate`,						`finishDate` 			)
VALUE				('title1',							'content1',								'img1',		
														'content2',								'img2',			
														null, 									 null 	,		
														'2009-07-09',							'2009-07-09'				), 
					('title2',							'content3',								'img3',		
														'content4',								'img4',			
														null, 									 null 	,		
														'2009-07-09',							'2009-07-09'				), 
					('title3',							'content5',								'img5',		
														'content6',								'img6',			
														null, 									 null 	,		
														'2009-07-09',							'2009-07-09'				), 
					('title4',							'content7',								'img7',		
														'content8',								'img8',			
														null, 									 null 	,		
														'2009-07-09',							'2009-07-09'				);
                                                        
                                                        
UPDATE `mock_project`.`post` SET `donator_quantity` = '1', `money_achieved` = '1010' WHERE (`id` = '1');
UPDATE `mock_project`.`post` SET `donator_quantity` = '1', `money_achieved` = '10' WHERE (`id` = '2');
UPDATE `mock_project`.`post` SET `donator_quantity` = '1', `money_achieved` = '10' WHERE (`id` = '3');
UPDATE `mock_project`.`post` SET `donator_quantity` = '1', `money_achieved` = '10' WHERE (`id` = '4');
   
   
   -- insert data Donator
INSERT INTO `Donator` 	(`phone`,			`email`,						`address`,			`fullName`,	 						`message` 		)
VALUE					('0986565656',		'hanhhanoi1999@gmail.com',		'Ha Nam',			'nguyen Thị Nội',					'xin gui tien2' 						), 
						('0126565656',		'abcsa@gmail.com',				'Ha Nam',			'Hà van a',							'xin gui tien1'		), 
                        ('0975565656',		'hanhasda@gmail.com',			'Ha Nam',			'tran trung B',						'xin gui tien23'			), 
                        ('0365565656',		'ongoasd@gmail.com',			'Ha Nam',			'Hà Thị Phuong',					'xin gui tien4'		);
      
      
INSERT INTO `Donator_Post` 	(`donatorID`,			`postID`,						`total_money`)
VALUE						('1',						'2',							'10'),
							('1',						'1',							'10'),
							('1',						'3',							'100'),
                            ('2',						'2',							'10'),
                            ('2',						'1',							'10'),
                            ('1',						'4',							'10'),
							('3',						'1',							'30');
      
      
 --      
select p.title, dp.donatorid, dp.total_money from 
post as p
join 
donator_post as dp
on p.id = dp.postid
where dp.postid = 2


                     
				
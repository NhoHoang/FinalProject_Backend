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
	`email` 		CHAR(50) NOT NULL UNIQUE  CHECK (LENGTH(`email`) >= 6 AND LENGTH(`email`) <= 50),
	`password` 		VARCHAR(800) NOT NULL,
    `address` 		VARCHAR(800) ,
    `phone` 		VARCHAR(50) NOT NULL UNIQUE,
    `fullName` 		VARCHAR(50) NOT NULL,
    `role` 			ENUM('Admin','User') DEFAULT 'User',
	`status`		TINYINT DEFAULT 0, -- 0: Not Active, 1: Active
    `avatarUrl`		VARCHAR(500)
);

-- Create table Post
DROP TABLE IF EXISTS 	`Post`;
CREATE TABLE IF NOT EXISTS `Post` ( 	
	`id`				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`title` 			VARCHAR(500) NOT NULL ,
    `content_1` 		VARCHAR(6000) NOT NULL,
    `img_1`				VARCHAR(500),
    `content_2` 		VARCHAR(6000) NOT NULL,
	`img_2`				VARCHAR(500),
	`donator_quantity` 	SMALLINT default 0,
    `money_achieved` 	INT default 0,
	`plan_budget` 		INT default 0,
     `rate` 			float ,
    `startDate` 		DATETIME ,
    `finishDate` 		DATETIME 
);
-- Create table Donator
DROP TABLE IF EXISTS 	`Donator`;
CREATE TABLE IF NOT EXISTS `Donator` ( 	
	`id` 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`phone` 			VARCHAR(50) NOT NULL UNIQUE,
    `fullName` 			VARCHAR(50) NOT NULL,
    `email` 			CHAR(50) NOT NULL  CHECK (LENGTH(`email`) >= 6 AND LENGTH(`email`) <= 50),
    `address` 			VARCHAR(800) 
	-- `donation_amount` 	INT ,
   
   --  `post_id` 			SMALLINT UNSIGNED,

    --  FOREIGN KEY (post_id) REFERENCES Post(id)
    
);


DROP TABLE IF EXISTS 	`Donator_Post`;
CREATE TABLE IF NOT EXISTS `Donator_Post` ( 	
	`id`				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`donatorID`			SMALLINT UNSIGNED,
	`postID`			SMALLINT UNSIGNED,
	-- `phone`				VARCHAR(50) NOT NULL ,
    `total_money` 		SMALLINT ,
     `message` 			VARCHAR(1000) ,
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
INSERT INTO `User` 	(`username`,			`email`,						`password`,																	`address`,				`phone`,			`fullName`,	 		`status`, 	`role`,  		`avatarUrl`				)
VALUE				('hanh.havan@vti',		'hanhhanoi1999@gmail.com',		'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'H?? N???i',				'0331646656',		'H?? V??n Hanh',			0, 		'User' 	,		null				), 
					('thanhhung12@vti',		'hung122112@gmail.com',			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'H?? N???i',	 			'0716464656',		'Nguy???n Thanh H??ng',	0, 		'User' 	,		null				), 
					('can.tuananh@vti',		'cananh.tuan12@vti.com',		'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'H?? N???i',				'06316464656',		'C???n Tu???n Anh',			0, 		'User' 	,		null				), 
					('xuanmaivti',			'xuanmai12@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'HH?? N???i',				'07556464656',		'Nguy???n Xu??n Mai',		0, 		'User'	,		null				),
                    ('duynn03',				'duynn03@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',				'HH?? N???i',				'01316464656',		'Duy',					1, 		'Admin'	,		'1613362949329.png'	);


-- insert into Post

INSERT INTO `Post` 	(`title`,							`content_1`,							`img_1`, 					
														`content_2`,							`img_2`,				
                                                        `donator_quantity`, 				  `money_achieved` , 			
                                                        `startDate`,						`finishDate` 			)
VALUE				('title1',							'content1',								'img1',		
														'content2',								'img2',			
														5, 									 5 	,		
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
                                                        
                                                        
UPDATE `mock_project`.`post` SET `donator_quantity` = '1', `money_achieved` = '100' WHERE (`id` = '1');
UPDATE `mock_project`.`post` SET `donator_quantity` = '10', `money_achieved` = '15' WHERE (`id` = '2');
UPDATE `mock_project`.`post` SET `donator_quantity` = '21', `money_achieved` = '20' WHERE (`id` = '3');
UPDATE `mock_project`.`post` SET `donator_quantity` = '15', `money_achieved` = '30' WHERE (`id` = '4');
   
   
   -- insert data Donator
INSERT INTO `Donator` 	(`phone`,			`email`,						`address`,			`fullName`	 							)
VALUE					('0986565656',		'hanhhanoi1999@gmail.com',		'Ha Nam',			'nguyen Th??? N???i'										), 
						('0126565656',		'abcsa@gmail.com',				'Ha Nam',			'H?? van a'								), 
                        ('0975565656',		'hanhasda@gmail.com',			'Ha Nam',			'tran trung B'								), 
                        ('0365565656',		'ongoasd@gmail.com',			'Ha Nam',			'H?? Th??? Phuong'						);
      
      
INSERT INTO `Donator_Post` 	(`donatorID`,			`postID`,						`total_money`, `message`)
VALUE						('1',						'2',							'10', 'xin gui tien2' ),
							('1',						'1',							'10', 'xin gui tien1'	),
							('1',						'3',							'100', 'xin gui tien23'),
                            ('2',						'2',							'10', 'xin gui tien4'	),
                            ('2',						'1',							'10', 'xin gui tien5'),
                            ('1',						'4',							'10', 'xin gui tien6'),
							('3',						'1',							'30', 'xin gui tien7');
      
      
 --      
select p.id,p.title, dp.donatorid, dp.total_money from 
post as p
join 
donator_post as dp
on p.id = dp.postid
where dp.postid = 2;

select d.fullName, dp.postID,dp.total_money, p.title from 
donator as d
join 
donator_post as dp
on d.id = dp.donatorID
join 
post as p
on p.id = dp.postID
where d.fullName like  "%N???i";

UPDATE `mock_project`.`post` SET `title` = 'Chung tay ????ng g??p ????? ho??n thi???n n???i th???t ???Nh?? B???u Tr??ng Khuy???t??? ch??m s??c nh???ng m??? b???u ????n th??n v?? em b?? s?? sinh', `content_1` = 'Trong s??? nh???ng m???nh ?????i b???t h???nh, th?? m??? b???u ????n th??n c?? l??? l?? nh???ng ng?????i c???n ???????c h??? tr??? nhi???u nh???t. Trong su???t qu?? tr??nh mang thai g???p giai ??o???n thai ngh??n, m???t m???i l???i thi???u v???ng s??? quan t??m t??? ph??a ng?????i th??n, ?????c bi???t l?? ch???ng. H??? ph???i th?????ng xuy??n th??m kh??m v?? ki???m tra ?????nh k???, bao lo toan lo l???ng ti??u c???c ???p xu???ng ng?????i m??? g??nh v??ng. Nh???ng th??ng cu???i c???a thai k???, ????? duy tr?? ???????c ngu???n thu nh???p ?????i v???i h??? l?? v?? c??ng kh?? kh??n.', `content_2` = 'Qu?? tr??nh x??y d???ng c?? b???n c???a Nh?? B???u Tr??ng Khuy???t g???n nh?? ho??n thi???n. ????y s??? l?? ng??i nh?? ???m c??ng, an to??n cho nh???ng m??? b???u ????n th??n kh??ng c?? ch???n n????ng t???a. C??ng s??? l?? n??i ch??? che cho m??? ch??? ng??y sinh n??? v?? c??c b?? ???????c b??nh an ch??o ?????i. Tr??ng Khuy???t d??? t??nh r???ng ng??i nh?? s??? ho??n thi???n v?? ???????c ????a v??o s??? d???ng trong qu?? 1 n??m 2022. Tuy nhi??n v???n ????? v??? ng??n s??ch ????? mua s???m n???i th???t, trang thi???t b?????? v???n ??ang c??n l?? b??i to??n nan gi???i ?????i v???i Tr??ng Khuy???t. *Sau khi ho??n t???t chi???n d???ch k??u g???i ????ng g??p, MoMo s??? chuy???n to??n b??? s??? ti???n 100.000.000 ?????ng ???? g??y qu??? g???i ?????n Qu??? T??? Thi???n & BTXH Tr??ng Khuy???t h??? tr??? chi ph?? mua s???m n???i th???t t???i c??c m??i ???m. Ch??ng t??i s??? c???p nh???t th??m th??ng tin v??? ti???n ????? d??? ??n ?????n Qu?? v??? trong th???i gian s???m nh???t. ' WHERE (`id` = '1');
UPDATE `mock_project`.`post` SET `title` = 'C??ng chung tay n??ng c???p ??i???m tr?????ng cho 100 tr??? m???m non d??n t???c Ch??m', `content_1` = 'Ph??n hi???u ???p 4 thu???c Tr?????ng M???m non Xu??n H??ng - huy???n Xu??n L???c - t???nh ?????ng Nai. ??i???m tr?????ng n??y n???m tr??n ?????a b??n c?? h??n 90% ng?????i d??n t???c Ch??m c?? tr?? v???i kho???ng 500 h??? gia ????nh, 2.200 nh??n kh???u n??n nhu c???u tr?????ng h???c cho tr??? l?? r???t l???n. Trong 20 n??m nay, ????y l?? n??i h???c t???p v?? sinh ho???t c???a ph???n l???n tr??? d??n t???c Ch??m, tuy nhi??n tr???i qua h??n 2 th???p k??? x??y d???ng, ng??i tr?????ng c???a c??c em nay ???? xu???ng c???p tr???m tr???ng, khu b???p, khu v??? sinh c??ng tr??? n??n x???p x???, kh??ng ?????m b???o sinh ho???t. ', `content_2` = '??ng Th??n Anh Thi???t - Tr?????ng Ph??ng GD&??T huy???n Xu??n L???c cho bi???t, tr??n ?????a b??n huy???n hi???n nay kh??ng c??n t??nh tr???ng tr?????ng h???c l???p m??i tranh, m??i n???a nh?? tr?????c. Tuy nhi??n, kh??ng ph???i v?? v???y m?? t???t c??? c??c tr?????ng ?????u ?????m b???o ??i???u ki???n c?? s??? v???t ch???t ????? t??? ch???c d???y h???c. V???i ??i???m tr?????ng m???m non Xu??n H??ng, v?? th???i gian x??y d???ng ???? r???t l??u nh??ng kh??ng ???????c s???a ch???a th?????ng xuy??n n??n nhi???u h???ng m???c quan tr???ng ???? xu???ng c???p. Tr???n nh?? c???a to??n b??? ??i???m tr?????ng h???u nh?? ???? b??? th???m d???t, bong tr??c nhi???u m???ng l???n. Tr??? k?? b??nh n?????c sinh ho???t c??ng c?? k???, r??? s??t. ????? ch??i, b???p b??nh, th?? nh??n, v. v. trong s??n tr?????ng h???u nh?? h?? h???ng, kh??ng c??n s??? d???ng ???????c.' WHERE (`id` = '2');
UPDATE `mock_project`.`post` SET `title` = 'Chung tay ph???c h???i m???ng xanh, ph??? xanh ?????t tr???ng ?????i tr???c mi???n Trung, Qu???ng Tr???', `content_1` = 'Khi c??n qu??t qua m???nh ?????t h??nh ch??? S, tr???n ????????i h???ng th???y??? n??m 2020 ???? g??y ra bao tang th????ng v?? ??au ?????n cho b?? con mi???n Trung. M???t th??ng ch???ng ch???i l???i b??o l?? v???i h??? c??n d??i h??n c??? m???t c??n ??c m???ng. D??ng n?????c v?? t??nh ???? cu???n tr??i h??ng ng??n nh?? c???a, ru???ng v?????n, c?? nghi???p c??? ?????i - c??? th??? m???t tr???ng. ??au ?????n h??n c???, l?? h??ng ng??n sinh m???ng v?? t???i c??ng kh??ng tr??nh kh???i c??n cu???ng n??? c???a thi??n nhi??n, c??? th??? ng?? xu???ng. ???y l?? nh???ng n???i ??au m?? m???i m??a m??a l??, l???i ??m ??? r??? m??u trong l??ng m???i ng?????i d??n mi???n Trung. ', `content_2` = 'M???t r???ng ?????u ngu???n t??? nhi??n l?? ???????c cho l?? m???t trong nh???ng nguy??n nh??n ch??nh c???a th???m h???a thi??n nhi??n. Trong h??n 20 n??m qua, Vi???t Nam ???? ph???i h???ng ch???u kh??ng bi???t bao nhi??u c??n b??o l???n v?? tr???n l?? nh???. C??ng trong th???i gian n??y, nhi???u d??? ??n th???y ??i???n ???????c c???p ph??p x??y d???ng d???n ?????n vi???c ch???t ph?? r???ng ?????u ngu???n nh???m ph???c v??? vi???c x??y d???ng c?? s??? h??? t???ng, ????y ???????c coi l?? m???t trong nh???ng nguy??n nh??n ch??nh d???n ?????n di???n t??ch r???ng ?????u ngu???n suy gi???m ????ng k??? . Con ng?????i ??ang v?? t??nh qu??n ??i vi???c b???o v??? nh???ng gi?? tr??? thi??n nhi??n, b???o v??? cu???c s???ng b??nh y??n c???a m??nh thay v??o ???? h??? qu?? ch?? tr???ng v??o nh???ng l???i ??ch kinh t??? tr?????c m???t. Gi?? tr??? c???a r???ng ??ang d???n b??? con ng?????i coi nh???.' WHERE (`id` = '3');
UPDATE `mock_project`.`post` SET `title` = 'D??? ??n Xanh H?? N???i tr???ng 500 c??y xanh ???? th??? v?? m???t H?? N???i kh??ng n??ng b???c', `content_1` = 'H?? N???i l???i b???t ?????u b?????c v??o m???t m??a h?? n???ng nh?? ????? l???a. N???u b???n ????? ??, m???y n??m g???n ????y, d??? b??o th???i ti???t n??m n??o c??ng c???nh b??o v??? m??a h?? n??ng nh???t trong l???ch s??? v???i c??c hi???n t?????ng th???i ti???t c???c ??oan. Ng?????i d??n th??? ???? ph???i ch???u ?????ng c??i n??ng gi???a r???ng b?? t??ng c???a c??c khu chung c?? v?? t??a nh?? ch???c tr???i. Tr??? em l???n l??n trong ph??ng k??n v???i ??i???u ho?? nhi???t ????? v?? m??y l???c kh??ng kh??. ????y c?? ph???i l?? m???t H?? N???i m?? m???i ch??ng ta mong mu???n?', `content_2` = '????y l?? h?????ng ti???p c???n t???i ??u v?? b???n v???ng, ????p ???ng ???????c nhu c???u c??y xanh c???a t???ng ?????a ph????ng v??? s??? l?????ng, ch???ng lo???i v?? k??ch c???. M???i ng?????i d??n n??n tr???ng ??t nh???t m???t c??i c??y mang t??n m??nh. M???i ??ng b??? b?? m??? n??n ????? l???i cho con th???t nhi???u di s???n xanh ch??nh l?? nh???ng b??ng c??y r??m m??t c??? tr???i. ????? m??a h?? H?? N???i kh??ng c??n n??ng b???c ????? m???i ng?????i ?????u ???????c s???ng trong m??i tr?????ng xanh t????i. ' WHERE (`id` = '4');

INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay g??? b??? 19 n??m ??eo t?? cho c?? b?? ngh??o hi???u h???c', 'L.T.T.M sinh n??m 2001, hi???n ??ang h???c l???p 11, em s???ng v???i m??? t???i m???t v??ng qu?? B???n Tre. Cha em b??? ??i l??c em v???a sinh ra, ????? l???i 2 m??? con s???ng n????ng t???a nhau qua ng??y. Th????ng cho ho??n c???nh gia ????nh M., b?? con h??ng x??m xung quanh c??ng nhau chung tay x??y d???ng c??n nh?? t??nh ngh??a cho 2 m??? con c?? n??i tr?? ng???. Th??? nh??ng s??? kh??? c???c ???y v???n ch??a d???ng l???i khi em m???c ph???i c??n b???nh nan y. L??c ???y em m???i ch??? 15 th??ng tu???i, m??? ????a em v??o kh??m t???i b???nh vi???n Nhi ?????ng 1 v?? ???????c ch???n ??o??n b??? b???nh l??? ti???u cao - c???n ph???i ph???u thu???t s???m.', 'img11', '??? tr?????ng, T. M. l?? m???t c?? b?? ham h???c v?? th??n thi???n n??n ???????c c??c b???n qu?? m???n, c???m th??ng, v?? gi??p ????? h???t m??nh. B?????c sang l???p 12 v???i nhi???u nh???ng d??? ?????nh l???n lao, nh??ng b???nh t??nh c???a T. M. l?? tr??? ng???i ng??n c???n em theo ??u???i nh???ng ho??i b??o v?? ?????c m?? c???a m??nh. ?????ng sau g????ng m???t xinh x???n v?? ????ng y??u ???y, l?? nh???ng tr??n tr???, n???i ??au, mu???n phi???n. Th??? nh??ng ch??a m???t l???n em ????? m??nh g???c ng??, em v???n chi???n ?????u v???i c??n b???nh qu??i ??c ???? v???i m???t tinh th???n l???c quan v?? t??ch c???c, v???n lu??n ?????ng h??nh c??ng m??? t???o n??n nh???ng gi??y ph??t tr??n ?????y y??u th????ng, ???m ??p b??n c???nh nhau.', 'img2', '200', '500', '2009-06-09 00:00:00', '2009-012-09 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('C??ng Tu???i Tr??? ????????ng h??nh c??ng ng?????i Th???y???', '???Ngh??? gi??o l?? ngh??? ????ng y??u, t???i chi m?? b??????. ???? l?? t??m s??? c???a c?? ??o??n Th??? L??? Minh, gi??o vi??n Tr?????ng m???u gi??o T??n H??, huy???n H??m T??n, t???nh B??nh Thu???n. Cu???c s???ng c???a c?? Minh r???t c?? c???c. Ban ng??y c?? ??i d???y, t???i v??? v???a so???n gi??o ??n, l??m ????? d??ng d???y h???c, v???a lo b???m rau nu??i heo, n???u r?????u ????? cho ch???ng ??i b??? m???i... Ch??a h???t, bu???i tr??a c?? c??n tranh th??? ch???y qua tr?????ng THPT b??n th??m ??t b??nh tr??i, yaourt, sinh t??? ??? ngay c???ng tr?????ng ????? ki???m th??m ch??t ti???n mua thu???c, mua s???a cho con. D???u c??i kh?? c??? lu??n ??eo b??m, th??? nh??ng su???t nhi???u n??m li???n c?? Minh v???n l?? gi??o vi??n d???y gi???i c???p t???nh.', 'img111', '????? lan t???a ?? ngh??a cao c??? c???a ch????ng tr??nh ????????ng h??nh c??ng ng?????i th???y???, trong th??ng 5 n??y, V?? MoMo k???t h???p c??ng b??o Tu???i Tr??? k??u g???i g??y qu??? 100,000,000 ?????ng nh???m ti???p t???c t???o th??m s??? k???t n???i ?? ngh??a gi???a x?? h???i v?? nh???ng ng?????i gi??? tr???ng tr??ch ???tr???ng ng?????i??? cao qu??, ????? x?? h???i quan t??m h??n, c?? nh???ng chia s??? thi???t th???c h??n ?????i v???i c??c th???y c??, gi??p n???n gi??o d???c Vi???t Nam ti???p t???c ph??t tri???n t???t h??n trong t????ng lai.', 'img22', '12', '20', '2010-07-10 00:00:00', '2010-12-10 00:00:00');

INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('G??y qu??? 4 ca ph???u thu???t k??? ni???m h??nh tr??nh 40 n??m ch???a l??nh n??? c?????i c???a Operation Smile', '???????c th??nh l???p v??o n??m 1982, Operation Smile ???? cung c???p d???ch v??? ??i???u tr??? v?? ph???u thu???t mi???n ph?? gi??p thay ?????i cu???c s???ng cho h??n 326.000 b???nh nh??n tr??n kh???p th??? gi???i, gi??p h??? c?? th??? sinh ho???t v?? t???n h?????ng cu???c s???ng kh???e m???nh h??n. Nh??n k??? ni???m 40 n??m, t??? ch???c Operation Smile ????a ra cam k???t ch??m s??c y t??? cho m???t tri???u tr??? em to??n c???u trong 10 n??m t???i. Song song ????, t??? ch???c s??? ti???p t???c c???ng c??? h??? th???ng y t???, c?? s??? v???t ch???t ????? h?????ng ?????n n??ng cao ch???t l?????ng ch??m s??c b???nh nh??n, v?? r??t ng???n b???t b??nh ?????ng trong c??c h??? th???ng ch??m s??c s???c kh???e. ', 'adas', 'V???i cam k???t ????, t??? ch???c Operation Smile t???i Vi???t Nam r???t mong r???ng trong h??nh tr??nh s???p t???i s??? lu??n nh???n ???????c s??? ???ng h??? v?? ?????ng h??nh c???a c???ng ?????ng ????? mang l???i s??? thay ?????i cho tr??? em Vi???t Nam.??? Vi???t Nam, t??? l??? c???a b???nh n??y l?? 1 tr??n 700 tr??? ra ?????i. D??? t???t n??y kh??ng g??y t??? vong nh??ng c?? th??? l??m tr??? g???p kh?? kh??n trong ??n u???ng, giao ti???p v?? h??a nh???p v???i x?? h???i. T??? nh???ng ?????a tr??? b??? khi???m khuy???t v??? th??? ch???t, m???c c???m v??? ngo???i h??nh, m???t cu???c ph???u thu???t k??o d??i 45 ph??t s??? gi??p c??c em tr??? n??n l??nh l???n, t??? tin trong cu???c s???ng. ', '????', '200', '300', '2010-07-10 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay quy??n g??p c???i t???o ??i???m tr?????ng T???n X?? Ph??n, H?? Giang', 'X?? N???m Ty n???m ??? ph??a nam c???a huy???n Ho??ng Su Ph??, tr??n tr???c ???????ng B???c Quang - X??n M???n Thu???c huy???n Ho??ng Su Ph??, t???nh H?? Giang. To??n x?? c?? 02 d??n t???c sinh s???ng ch??? y???u. ?????a h??nh ?????a l?? c???a x?? t????ng ?????i ph???c t???p c?? nhi???u n??i cao, su???i l???n v?? s??u chia c???t, ???????ng ??i l???i kh?? kh??n. ?????ng th???i d??n c?? ph??n b??? kh??ng t???p trung d???n ?????n vi???c m??? ??i???m tr?????ng, m??? l???p g???p r???t nhi???u tr??? ng???i. ?????c bi???t l?? h???c sinh ti???u h???c c??n nh??? khi m??a m??a l?? ?????n, ??i l???i v?? c??ng nguy hi???m. Hi???n nay x?? c?? 3 c???p h???c bao g???m b???c M???m non, Ti???u h???c v?? Trung h???c C?? s???.', 'qeq', 'Th???u hi???u ho??n c???nh kh?? kh??n c???a th???y v?? tr?? ??ie????m tru??o????ng Ta????n Xa?? Phi??n, MoMo h???p t??c c??ng Trung t??m T??nh nguy???n Qu???c gia, D??? ??n S???c m???nh 2000 v?? D??? ??n Nu??i Em l??n k???- ho???ch s???a ch???a v?? x??y d???ng ph??ng h???c m???i, ????? c??c em c?? ???????ng n??i h???c t???p ki??n c???, ti???n nghi. Trong chi???n d???ch x??y tr?????ng l???n n??y, ch??ng t??i chia th??nh 2 ?????t g??y qu???. ?????t 1 quy??n g??p qua Heo ?????t MoMo s??? ti???n 100 tri???u v?? ?????t 2 g??y qu??? c???ng ?????ng tr??n Tr??i Tim MoMo 220 tri???u ?????ng. Hi???n t???i, ch??ng t??i ??ang ti???n h??nh quy??n g??p ?????t 2 qua Tr??i Tim MoMo. ????? ??i theo k??? ho???ch nh?? d??? t??nh, ch??ng t??i ?????t m???c ti??u quy??n g??p 220 tri???u ?????ng t??? c??c nh?? h???o t??m ????? nhanh ch??ng c?? ????? kinh ph?? x??y d???ng ph??ng h???c m???i khang trang cho c??c em h???c sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay mang T???t ?????n cho 40 tr??? m??? c??i do ?????i d???ch v?? tr??? c?? ho??n c???nh kh?? kh??n', 'X?? N???m Ty n???m ??? ph??a nam c???a huy???n Ho??ng Su Ph??, tr??n tr???c ???????ng B???c Quang - X??n M???n Thu???c huy???n Ho??ng Su Ph??, t???nh H?? Giang. To??n x?? c?? 02 d??n t???c sinh s???ng ch??? y???u. ?????a h??nh ?????a l?? c???a x?? t????ng ?????i ph???c t???p c?? nhi???u n??i cao, su???i l???n v?? s??u chia c???t, ???????ng ??i l???i kh?? kh??n. ?????ng th???i d??n c?? ph??n b??? kh??ng t???p trung d???n ?????n vi???c m??? ??i???m tr?????ng, m??? l???p g???p r???t nhi???u tr??? ng???i. ?????c bi???t l?? h???c sinh ti???u h???c c??n nh??? khi m??a m??a l?? ?????n, ??i l???i v?? c??ng nguy hi???m. Hi???n nay x?? c?? 3 c???p h???c bao g???m b???c M???m non, Ti???u h???c v?? Trung h???c C?? s???.', 'qeq', 'Th???u hi???u ho??n c???nh kh?? kh??n c???a th???y v?? tr?? ??ie????m tru??o????ng Ta????n Xa?? Phi??n, MoMo h???p t??c c??ng Trung t??m T??nh nguy???n Qu???c gia, D??? ??n S???c m???nh 2000 v?? D??? ??n Nu??i Em l??n k???- ho???ch s???a ch???a v?? x??y d???ng ph??ng h???c m???i, ????? c??c em c?? ???????ng n??i h???c t???p ki??n c???, ti???n nghi. Trong chi???n d???ch x??y tr?????ng l???n n??y, ch??ng t??i chia th??nh 2 ?????t g??y qu???. ?????t 1 quy??n g??p qua Heo ?????t MoMo s??? ti???n 100 tri???u v?? ?????t 2 g??y qu??? c???ng ?????ng tr??n Tr??i Tim MoMo 220 tri???u ?????ng. Hi???n t???i, ch??ng t??i ??ang ti???n h??nh quy??n g??p ?????t 2 qua Tr??i Tim MoMo. ????? ??i theo k??? ho???ch nh?? d??? t??nh, ch??ng t??i ?????t m???c ti??u quy??n g??p 220 tri???u ?????ng t??? c??c nh?? h???o t??m ????? nhanh ch??ng c?? ????? kinh ph?? x??y d???ng ph??ng h???c m???i khang trang cho c??c em h???c sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2009-07-09 00:00:00');



INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('G??y qu??? 4 ca ph???u thu???t k??? ni???m h??nh tr??nh 40 n??m ch???a l??nh n??? c?????i c???a Operation Smile', '???????c th??nh l???p v??o n??m 1982, Operation Smile ???? cung c???p d???ch v??? ??i???u tr??? v?? ph???u thu???t mi???n ph?? gi??p thay ?????i cu???c s???ng cho h??n 326.000 b???nh nh??n tr??n kh???p th??? gi???i, gi??p h??? c?? th??? sinh ho???t v?? t???n h?????ng cu???c s???ng kh???e m???nh h??n. Nh??n k??? ni???m 40 n??m, t??? ch???c Operation Smile ????a ra cam k???t ch??m s??c y t??? cho m???t tri???u tr??? em to??n c???u trong 10 n??m t???i. Song song ????, t??? ch???c s??? ti???p t???c c???ng c??? h??? th???ng y t???, c?? s??? v???t ch???t ????? h?????ng ?????n n??ng cao ch???t l?????ng ch??m s??c b???nh nh??n, v?? r??t ng???n b???t b??nh ?????ng trong c??c h??? th???ng ch??m s??c s???c kh???e. ', 'adas', 'V???i cam k???t ????, t??? ch???c Operation Smile t???i Vi???t Nam r???t mong r???ng trong h??nh tr??nh s???p t???i s??? lu??n nh???n ???????c s??? ???ng h??? v?? ?????ng h??nh c???a c???ng ?????ng ????? mang l???i s??? thay ?????i cho tr??? em Vi???t Nam.??? Vi???t Nam, t??? l??? c???a b???nh n??y l?? 1 tr??n 700 tr??? ra ?????i. D??? t???t n??y kh??ng g??y t??? vong nh??ng c?? th??? l??m tr??? g???p kh?? kh??n trong ??n u???ng, giao ti???p v?? h??a nh???p v???i x?? h???i. T??? nh???ng ?????a tr??? b??? khi???m khuy???t v??? th??? ch???t, m???c c???m v??? ngo???i h??nh, m???t cu???c ph???u thu???t k??o d??i 45 ph??t s??? gi??p c??c em tr??? n??n l??nh l???n, t??? tin trong cu???c s???ng. ', '????', '200', '300', '2010-07-10 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay quy??n g??p c???i t???o ??i???m tr?????ng T???n X?? Ph??n, H?? Giang', 'X?? N???m Ty n???m ??? ph??a nam c???a huy???n Ho??ng Su Ph??, tr??n tr???c ???????ng B???c Quang - X??n M???n Thu???c huy???n Ho??ng Su Ph??, t???nh H?? Giang. To??n x?? c?? 02 d??n t???c sinh s???ng ch??? y???u. ?????a h??nh ?????a l?? c???a x?? t????ng ?????i ph???c t???p c?? nhi???u n??i cao, su???i l???n v?? s??u chia c???t, ???????ng ??i l???i kh?? kh??n. ?????ng th???i d??n c?? ph??n b??? kh??ng t???p trung d???n ?????n vi???c m??? ??i???m tr?????ng, m??? l???p g???p r???t nhi???u tr??? ng???i. ?????c bi???t l?? h???c sinh ti???u h???c c??n nh??? khi m??a m??a l?? ?????n, ??i l???i v?? c??ng nguy hi???m. Hi???n nay x?? c?? 3 c???p h???c bao g???m b???c M???m non, Ti???u h???c v?? Trung h???c C?? s???.', 'qeq', 'Th???u hi???u ho??n c???nh kh?? kh??n c???a th???y v?? tr?? ??ie????m tru??o????ng Ta????n Xa?? Phi??n, MoMo h???p t??c c??ng Trung t??m T??nh nguy???n Qu???c gia, D??? ??n S???c m???nh 2000 v?? D??? ??n Nu??i Em l??n k???- ho???ch s???a ch???a v?? x??y d???ng ph??ng h???c m???i, ????? c??c em c?? ???????ng n??i h???c t???p ki??n c???, ti???n nghi. Trong chi???n d???ch x??y tr?????ng l???n n??y, ch??ng t??i chia th??nh 2 ?????t g??y qu???. ?????t 1 quy??n g??p qua Heo ?????t MoMo s??? ti???n 100 tri???u v?? ?????t 2 g??y qu??? c???ng ?????ng tr??n Tr??i Tim MoMo 220 tri???u ?????ng. Hi???n t???i, ch??ng t??i ??ang ti???n h??nh quy??n g??p ?????t 2 qua Tr??i Tim MoMo. ????? ??i theo k??? ho???ch nh?? d??? t??nh, ch??ng t??i ?????t m???c ti??u quy??n g??p 220 tri???u ?????ng t??? c??c nh?? h???o t??m ????? nhanh ch??ng c?? ????? kinh ph?? x??y d???ng ph??ng h???c m???i khang trang cho c??c em h???c sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2010-12-10 00:00:00');

INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('G??y qu??? 4 ca ph???u thu???t k??? ni???m h??nh tr??nh 40 n??m ch???a l??nh n??? c?????i c???a Operation Smile', '???????c th??nh l???p v??o n??m 1982, Operation Smile ???? cung c???p d???ch v??? ??i???u tr??? v?? ph???u thu???t mi???n ph?? gi??p thay ?????i cu???c s???ng cho h??n 326.000 b???nh nh??n tr??n kh???p th??? gi???i, gi??p h??? c?? th??? sinh ho???t v?? t???n h?????ng cu???c s???ng kh???e m???nh h??n. Nh??n k??? ni???m 40 n??m, t??? ch???c Operation Smile ????a ra cam k???t ch??m s??c y t??? cho m???t tri???u tr??? em to??n c???u trong 10 n??m t???i. Song song ????, t??? ch???c s??? ti???p t???c c???ng c??? h??? th???ng y t???, c?? s??? v???t ch???t ????? h?????ng ?????n n??ng cao ch???t l?????ng ch??m s??c b???nh nh??n, v?? r??t ng???n b???t b??nh ?????ng trong c??c h??? th???ng ch??m s??c s???c kh???e. ', 'adas', 'V???i cam k???t ????, t??? ch???c Operation Smile t???i Vi???t Nam r???t mong r???ng trong h??nh tr??nh s???p t???i s??? lu??n nh???n ???????c s??? ???ng h??? v?? ?????ng h??nh c???a c???ng ?????ng ????? mang l???i s??? thay ?????i cho tr??? em Vi???t Nam.??? Vi???t Nam, t??? l??? c???a b???nh n??y l?? 1 tr??n 700 tr??? ra ?????i. D??? t???t n??y kh??ng g??y t??? vong nh??ng c?? th??? l??m tr??? g???p kh?? kh??n trong ??n u???ng, giao ti???p v?? h??a nh???p v???i x?? h???i. T??? nh???ng ?????a tr??? b??? khi???m khuy???t v??? th??? ch???t, m???c c???m v??? ngo???i h??nh, m???t cu???c ph???u thu???t k??o d??i 45 ph??t s??? gi??p c??c em tr??? n??n l??nh l???n, t??? tin trong cu???c s???ng. ', '????', '200', '300', '2010-07-10 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay quy??n g??p c???i t???o ??i???m tr?????ng T???n X?? Ph??n, H?? Giang', 'X?? N???m Ty n???m ??? ph??a nam c???a huy???n Ho??ng Su Ph??, tr??n tr???c ???????ng B???c Quang - X??n M???n Thu???c huy???n Ho??ng Su Ph??, t???nh H?? Giang. To??n x?? c?? 02 d??n t???c sinh s???ng ch??? y???u. ?????a h??nh ?????a l?? c???a x?? t????ng ?????i ph???c t???p c?? nhi???u n??i cao, su???i l???n v?? s??u chia c???t, ???????ng ??i l???i kh?? kh??n. ?????ng th???i d??n c?? ph??n b??? kh??ng t???p trung d???n ?????n vi???c m??? ??i???m tr?????ng, m??? l???p g???p r???t nhi???u tr??? ng???i. ?????c bi???t l?? h???c sinh ti???u h???c c??n nh??? khi m??a m??a l?? ?????n, ??i l???i v?? c??ng nguy hi???m. Hi???n nay x?? c?? 3 c???p h???c bao g???m b???c M???m non, Ti???u h???c v?? Trung h???c C?? s???.', 'qeq', 'Th???u hi???u ho??n c???nh kh?? kh??n c???a th???y v?? tr?? ??ie????m tru??o????ng Ta????n Xa?? Phi??n, MoMo h???p t??c c??ng Trung t??m T??nh nguy???n Qu???c gia, D??? ??n S???c m???nh 2000 v?? D??? ??n Nu??i Em l??n k???- ho???ch s???a ch???a v?? x??y d???ng ph??ng h???c m???i, ????? c??c em c?? ???????ng n??i h???c t???p ki??n c???, ti???n nghi. Trong chi???n d???ch x??y tr?????ng l???n n??y, ch??ng t??i chia th??nh 2 ?????t g??y qu???. ?????t 1 quy??n g??p qua Heo ?????t MoMo s??? ti???n 100 tri???u v?? ?????t 2 g??y qu??? c???ng ?????ng tr??n Tr??i Tim MoMo 220 tri???u ?????ng. Hi???n t???i, ch??ng t??i ??ang ti???n h??nh quy??n g??p ?????t 2 qua Tr??i Tim MoMo. ????? ??i theo k??? ho???ch nh?? d??? t??nh, ch??ng t??i ?????t m???c ti??u quy??n g??p 220 tri???u ?????ng t??? c??c nh?? h???o t??m ????? nhanh ch??ng c?? ????? kinh ph?? x??y d???ng ph??ng h???c m???i khang trang cho c??c em h???c sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay mang T???t ?????n cho 40 tr??? m??? c??i do ?????i d???ch v?? tr??? c?? ho??n c???nh kh?? kh??n', 'X?? N???m Ty n???m ??? ph??a nam c???a huy???n Ho??ng Su Ph??, tr??n tr???c ???????ng B???c Quang - X??n M???n Thu???c huy???n Ho??ng Su Ph??, t???nh H?? Giang. To??n x?? c?? 02 d??n t???c sinh s???ng ch??? y???u. ?????a h??nh ?????a l?? c???a x?? t????ng ?????i ph???c t???p c?? nhi???u n??i cao, su???i l???n v?? s??u chia c???t, ???????ng ??i l???i kh?? kh??n. ?????ng th???i d??n c?? ph??n b??? kh??ng t???p trung d???n ?????n vi???c m??? ??i???m tr?????ng, m??? l???p g???p r???t nhi???u tr??? ng???i. ?????c bi???t l?? h???c sinh ti???u h???c c??n nh??? khi m??a m??a l?? ?????n, ??i l???i v?? c??ng nguy hi???m. Hi???n nay x?? c?? 3 c???p h???c bao g???m b???c M???m non, Ti???u h???c v?? Trung h???c C?? s???.', 'qeq', 'Th???u hi???u ho??n c???nh kh?? kh??n c???a th???y v?? tr?? ??ie????m tru??o????ng Ta????n Xa?? Phi??n, MoMo h???p t??c c??ng Trung t??m T??nh nguy???n Qu???c gia, D??? ??n S???c m???nh 2000 v?? D??? ??n Nu??i Em l??n k???- ho???ch s???a ch???a v?? x??y d???ng ph??ng h???c m???i, ????? c??c em c?? ???????ng n??i h???c t???p ki??n c???, ti???n nghi. Trong chi???n d???ch x??y tr?????ng l???n n??y, ch??ng t??i chia th??nh 2 ?????t g??y qu???. ?????t 1 quy??n g??p qua Heo ?????t MoMo s??? ti???n 100 tri???u v?? ?????t 2 g??y qu??? c???ng ?????ng tr??n Tr??i Tim MoMo 220 tri???u ?????ng. Hi???n t???i, ch??ng t??i ??ang ti???n h??nh quy??n g??p ?????t 2 qua Tr??i Tim MoMo. ????? ??i theo k??? ho???ch nh?? d??? t??nh, ch??ng t??i ?????t m???c ti??u quy??n g??p 220 tri???u ?????ng t??? c??c nh?? h???o t??m ????? nhanh ch??ng c?? ????? kinh ph?? x??y d???ng ph??ng h???c m???i khang trang cho c??c em h???c sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2009-07-09 00:00:00');


UPDATE `mock_project`.`post` SET `img_1` = 'https://vietnamtimes.org.vn/stores/news_dataimages/vietnamfriendshipcomvn/082017/31/13/charity-in-vietnam-help-is-sometimes-hard-to-get-19-.9181.jpg' WHERE (`id` = '1');
UPDATE `mock_project`.`post` SET `img_1` = 'https://culturemagazin.com/wp-content/uploads/2021/06/0615-DSC_0292.jpg' WHERE (`id` = '2');
UPDATE `mock_project`.`post` SET `img_1` = 'https://www.infoans.org/media/k2/items/cache/d02e1963c5cb9bab23e5b5464248be42_XL.jpg' WHERE (`id` = '3');
UPDATE `mock_project`.`post` SET `img_1` = 'https://www.saigonchildren.com/wp-content/uploads/2019/06/5828_tre_em_tu_ky.jpg' WHERE (`id` = '4');
UPDATE `mock_project`.`post` SET `img_1` = 'https://foodbankvietnam.com/wp-content/uploads/2021/10/f1.jpg' WHERE (`id` = '5');
UPDATE `mock_project`.`post` SET `img_1` = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxMNMdXHrRYB_hGF8XX5SdfCZHms_Vf03D0A&usqp=CAU' WHERE (`id` = '6');
UPDATE `mock_project`.`post` SET `img_1` = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiIAnARRkJ_XleVfy8JMIiPI9Z49XFmvRZVw&usqp=CAU' WHERE (`id` = '7');
UPDATE `mock_project`.`post` SET `img_1` = 'https://genk.mediacdn.vn/139269124445442048/2020/8/25/photo-2-15983215596491753953354.jpeg' WHERE (`id` = '8');
UPDATE `mock_project`.`post` SET `img_1` = 'https://photo-cms-vovworld.zadn.vn/w500/uploaded/vovworld/vowklqmx/2021_03_25/ps1_kfxd.jpg' WHERE (`id` = '9');
UPDATE `mock_project`.`post` SET `img_1` = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHylNWX3d-BuUNDP7Aa8SWwgf4MD9w0yijaQ&usqp=CAU' WHERE (`id` = '10');
UPDATE `mock_project`.`post` SET `img_1` = 'https://www.asialifemagazine.com/vietnam/wp-content/uploads/sites/4/2013/04/Urban-gardening-charity.jpg' WHERE (`id` = '11');
UPDATE `mock_project`.`post` SET `img_1` = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjd1TmWLUYxTbtC6bMjkEwNNbNg6mRH4h_QQ&usqp=CAU' WHERE (`id` = '12');
UPDATE `mock_project`.`post` SET `img_2` = 'https://m.baotuyenquang.com.vn/media/images/2020/10/img_20201030103937.jpg' WHERE (`id` = '1');
UPDATE `mock_project`.`post` SET `img_2` = 'https://cdnmedia.thethaovanhoa.vn/2012/10/06/19/06/Quyen-gop.JPG' WHERE (`id` = '2');
UPDATE `mock_project`.`post` SET `img_2` = 'https://file3.qdnd.vn/data/images/0/2021/01/06/vuhuyen/612020huyen7.jpeg' WHERE (`id` = '3');
UPDATE `mock_project`.`post` SET `img_2` = 'https://image.vtc.vn/resize/th/upload/2022/01/23/thuy-tien1-16233403.png' WHERE (`id` = '4');
UPDATE `mock_project`.`post` SET `img_2` = 'https://kenh14cdn.com/thumb_w/660/2020/10/22/tu-thien-1-1603381101396103468573.jpg' WHERE (`id` = '5');
UPDATE `mock_project`.`post` SET `img_2` = 'https://haiha.quangninh.gov.vn/HinhAnhBaiViet/2018/Th%C3%A1ng%2011/C%C3%B4%20thi%20h%C3%A0nh%20%C3%A1n%20th%C3%ADch%20ki%E1%BA%BFm%20ti%E1%BB%81n%20l%C3%A0m%20t%E1%BB%AB%20thi%E1%BB%87n/%E1%BA%A3nh%20t%E1%BB%AB%20thi%E1%BB%87n.jpg' WHERE (`id` = '6');
UPDATE `mock_project`.`post` SET `img_2` = 'https://vnn-imgs-f.vgcloud.vn/2019/11/17/16/nhung-chiec-tu-tu-thien-lam-am-mua-dong-ha-noi-7.jpg' WHERE (`id` = '7');
UPDATE `mock_project`.`post` SET `img_2` = 'https://newsmd1fr.keeng.net/netnews/archive/images/20201016/100502_quyen_gop_ung_ho_2.jpg' WHERE (`id` = '8');
UPDATE `mock_project`.`post` SET `img_2` = 'https://photo-cms-baonghean.zadn.vn/w607/Uploaded/2022/ftgbtgazsnzm/2018_09_04/bnatraoquachocacemhocsinhtieuhocmyly3118704492018_nhfb.jpg' WHERE (`id` = '9');
UPDATE `mock_project`.`post` SET `img_2` = 'https://123sao.sgp1.digitaloceanspaces.com/wp-content/uploads/2021/09/07102722/a13.jpg' WHERE (`id` = '10');
UPDATE `mock_project`.`post` SET `img_2` = 'https://znews-photo.zadn.vn/w660/Uploaded/pgi_ubnatyvau/2021_09_09/lethuya0010_zing_1.jpg' WHERE (`id` = '11');
UPDATE `mock_project`.`post` SET `img_2` = 'https://cdnmedia.thethaovanhoa.vn/Upload/uJjLuL2HhNU2U6UnlwA/files/2020/10/28/tuthien/IMG_20201027_205547_Fotor.jpg' WHERE (`id` = '12');
UPDATE `mock_project`.`post` SET `img_1` = 'https://cdnmedia.thethaovanhoa.vn/Upload/uJjLuL2HhNU2U6UnlwA/files/2020/10/28/tuthien/IMG_20201027_205547_Fotor.jpg', `img_2` = 'https://image.thanhnien.vn/300x210/uploaded/thuyanh/2015_11_11/trongbai_ogoj.jpg' WHERE (`id` = '14');
UPDATE `mock_project`.`post` SET `img_1` = 'https://image.thanhnien.vn/300x210/uploaded/thuyanh/2015_11_11/trongbai_ogoj.jpg', `img_2` = 'https://image.thanhnien.vn/300x210/uploaded/thuyanh/2015_11_11/trongbai_ogoj.jpg' WHERE (`id` = '13');
               
				
                
            --     // -----------------------------------------
            
-- // Add plan_budget and rate:

UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '1');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '2');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '3');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '4');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '5');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '6');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '7');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '8');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '9');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '10');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '11');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '12');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '13');
UPDATE `mock_project`.`post` SET `plan_budget` = '2000' WHERE (`id` = '14');


-- Calculate percentage:

SELECT money_achieved, plan_budget , money_achieved*100/plan_budget AS `RATE`
FROM POST ;

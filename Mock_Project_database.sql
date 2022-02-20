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
VALUE					('0986565656',		'hanhhanoi1999@gmail.com',		'Ha Nam',			'nguyen Thị Nội'										), 
						('0126565656',		'abcsa@gmail.com',				'Ha Nam',			'Hà van a'								), 
                        ('0975565656',		'hanhasda@gmail.com',			'Ha Nam',			'tran trung B'								), 
                        ('0365565656',		'ongoasd@gmail.com',			'Ha Nam',			'Hà Thị Phuong'						);
      
      
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
where d.fullName like  "%Nội";

UPDATE `mock_project`.`post` SET `title` = 'Chung tay đóng góp để hoàn thiện nội thất “Nhà Bầu Trăng Khuyết” chăm sóc những mẹ bầu đơn thân và em bé sơ sinh', `content_1` = 'Trong số những mảnh đời bất hạnh, thì mẹ bầu đơn thân có lẽ là những người cần được hỗ trợ nhiều nhất. Trong suốt quá trình mang thai gặp giai đoạn thai nghén, mệt mỏi lại thiếu vắng sự quan tâm từ phía người thân, đặc biệt là chồng. Họ phải thường xuyên thăm khám và kiểm tra định kỳ, bao lo toan lo lắng tiêu cực ập xuống người mẹ gánh váng. Những tháng cuối của thai kỳ, để duy trì được nguồn thu nhập đối với họ là vô cùng khó khăn.', `content_2` = 'Quá trình xây dựng cơ bản của Nhà Bầu Trăng Khuyết gần như hoàn thiện. Đây sẽ là ngôi nhà ấm cúng, an toàn cho những mẹ bầu đơn thân không có chốn nương tựa. Cũng sẽ là nơi chở che cho mẹ chờ ngày sinh nở và các bé được bình an chào đời. Trăng Khuyết dự tính rằng ngôi nhà sẽ hoàn thiện và được đưa vào sử dụng trong quý 1 năm 2022. Tuy nhiên vấn đề về ngân sách để mua sắm nội thất, trang thiết bị… vẫn đang còn là bài toán nan giải đối với Trăng Khuyết. *Sau khi hoàn tất chiến dịch kêu gọi đóng góp, MoMo sẽ chuyển toàn bộ số tiền 100.000.000 đồng đã gây quỹ gửi đến Quỹ Từ Thiện & BTXH Trăng Khuyết hỗ trợ chi phí mua sắm nội thất tại các mái ấm. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất. ' WHERE (`id` = '1');
UPDATE `mock_project`.`post` SET `title` = 'Cùng chung tay nâng cấp điểm trường cho 100 trẻ mầm non dân tộc Chăm', `content_1` = 'Phân hiệu Ấp 4 thuộc Trường Mầm non Xuân Hưng - huyện Xuân Lộc - tỉnh Đồng Nai. Điểm trường này nằm trên địa bàn có hơn 90% người dân tộc Chăm cư trú với khoảng 500 hộ gia đình, 2.200 nhân khẩu nên nhu cầu trường học cho trẻ là rất lớn. Trong 20 năm nay, đây là nơi học tập và sinh hoạt của phần lớn trẻ dân tộc Chăm, tuy nhiên trải qua hơn 2 thập kỷ xây dựng, ngôi trường của các em nay đã xuống cấp trầm trọng, khu bếp, khu vệ sinh cũng trở nên xập xệ, không đảm bảo sinh hoạt. ', `content_2` = 'Ông Thân Anh Thiết - Trưởng Phòng GD&ĐT huyện Xuân Lộc cho biết, trên địa bàn huyện hiện nay không còn tình trạng trường học lợp mái tranh, mái nứa như trước. Tuy nhiên, không phải vì vậy mà tất cả các trường đều đảm bảo điều kiện cơ sở vật chất để tổ chức dạy học. Với điểm trường mầm non Xuân Hưng, vì thời gian xây dựng đã rất lâu nhưng không được sửa chữa thường xuyên nên nhiều hạng mục quan trọng đã xuống cấp. Trần nhà của toàn bộ điểm trường hầu như đã bị thấm dột, bong tróc nhiều mảng lớn. Trụ kê bình nước sinh hoạt cũng cũ kỹ, rỉ sét. Đồ chơi, bập bênh, thú nhún, v. v. trong sân trường hầu như hư hỏng, không còn sử dụng được.' WHERE (`id` = '2');
UPDATE `mock_project`.`post` SET `title` = 'Chung tay phục hồi mảng xanh, phủ xanh đất trống đồi trọc miền Trung, Quảng Trị', `content_1` = 'Khi càn quét qua mảnh đất hình chữ S, trận “Đại hồng thủy” năm 2020 đã gây ra bao tang thương và đau đớn cho bà con miền Trung. Một tháng chống chọi lại bão lũ với họ còn dài hơn cả một cơn ác mộng. Dòng nước vô tình đã cuốn trôi hàng ngàn nhà cửa, ruộng vườn, cơ nghiệp cả đời - cứ thế mất trắng. Đau đớn hơn cả, là hàng ngàn sinh mạng vô tội cũng không tránh khỏi cơn cuồng nộ của thiên nhiên, cứ thế ngã xuống. Ấy là những nỗi đau mà mỗi mùa mưa lũ, lại âm ỉ rỉ máu trong lòng mỗi người dân miền Trung. ', `content_2` = 'Mất rừng đầu nguồn tự nhiên là được cho là một trong những nguyên nhân chính của thảm họa thiên nhiên. Trong hơn 20 năm qua, Việt Nam đã phải hứng chịu không biết bao nhiêu cơn bão lớn và trận lũ nhỏ. Cũng trong thời gian này, nhiều dự án thủy điện được cấp phép xây dựng dẫn đến việc chặt phá rừng đầu nguồn nhằm phục vụ việc xây dựng cơ sở hạ tầng, đây được coi là một trong những nguyên nhân chính dẫn đến diện tích rừng đầu nguồn suy giảm đáng kể . Con người đang vô tình quên đi việc bảo vệ những giá trị thiên nhiên, bảo vệ cuộc sống bình yên của mình thay vào đó họ quá chú trọng vào những lợi ích kinh tế trước mắt. Giá trị của rừng đang dần bị con người coi nhẹ.' WHERE (`id` = '3');
UPDATE `mock_project`.`post` SET `title` = 'Dự án Xanh Hà Nội trồng 500 cây xanh đô thị vì một Hà Nội không nóng bức', `content_1` = 'Hà Nội lại bắt đầu bước vào một mùa hè nắng như đổ lửa. Nếu bạn để ý, mấy năm gần đây, dự báo thời tiết năm nào cũng cảnh báo về mùa hè nóng nhất trong lịch sử với các hiện tượng thời tiết cực đoan. Người dân thủ đô phải chịu đựng cái nóng giữa rừng bê tông của các khu chung cư và tòa nhà chọc trời. Trẻ em lớn lên trong phòng kín với điều hoà nhiệt độ và máy lọc không khí. Đây có phải là một Hà Nội mà mỗi chúng ta mong muốn?', `content_2` = 'Đây là hướng tiếp cận tối ưu và bền vững, đáp ứng được nhu cầu cây xanh của từng địa phương về số lượng, chủng loại và kích cỡ. Mỗi người dân nên trồng ít nhất một cái cây mang tên mình. Mỗi ông bố bà mẹ nên để lại cho con thật nhiều di sản xanh chính là những bóng cây râm mát cả trời. Để mùa hè Hà Nội không còn nóng bức để mỗi người đều được sống trong môi trường xanh tươi. ' WHERE (`id` = '4');

INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay gỡ bỏ 19 năm đeo tã cho cô bé nghèo hiếu học', 'L.T.T.M sinh năm 2001, hiện đang học lớp 11, em sống với mẹ tại một vùng quê Bến Tre. Cha em bỏ đi lúc em vừa sinh ra, để lại 2 mẹ con sống nương tựa nhau qua ngày. Thương cho hoàn cảnh gia đình M., bà con hàng xóm xung quanh cùng nhau chung tay xây dựng căn nhà tình nghĩa cho 2 mẹ con có nơi trú ngụ. Thế nhưng sự khổ cực ấy vẫn chưa dừng lại khi em mắc phải căn bệnh nan y. Lúc ấy em mới chỉ 15 tháng tuổi, mẹ đưa em vào khám tại bệnh viện Nhi Đồng 1 và được chẩn đoán bị bệnh lỗ tiểu cao - cần phải phẫu thuật sớm.', 'img11', 'Ở trường, T. M. là một cô bé ham học và thân thiện nên được các bạn quý mến, cảm thông, và giúp đỡ hết mình. Bước sang lớp 12 với nhiều những dự định lớn lao, nhưng bệnh tình của T. M. là trở ngại ngăn cản em theo đuổi những hoài bão và ước mơ của mình. Đằng sau gương mặt xinh xắn và đáng yêu ấy, là những trăn trở, nỗi đau, muộn phiền. Thế nhưng chưa một lần em để mình gục ngã, em vẫn chiến đấu với căn bệnh quái ác đó với một tinh thần lạc quan và tích cực, vẫn luôn đồng hành cùng mẹ tạo nên những giây phút tràn đầy yêu thương, ấm áp bên cạnh nhau.', 'img2', '200', '500', '2009-06-09 00:00:00', '2009-012-09 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Cùng Tuổi Trẻ “Đồng hành cùng người Thầy”', '“Nghề giáo là nghề đáng yêu, tội chi mà bỏ”. Đó là tâm sự của cô Đoàn Thị Lệ Minh, giáo viên Trường mẫu giáo Tân Hà, huyện Hàm Tân, tỉnh Bình Thuận. Cuộc sống của cô Minh rất cơ cực. Ban ngày cô đi dạy, tối về vừa soạn giáo án, làm đồ dùng dạy học, vừa lo bằm rau nuôi heo, nấu rượu để cho chồng đi bỏ mối... Chưa hết, buổi trưa cô còn tranh thủ chạy qua trường THPT bán thêm ít bánh trái, yaourt, sinh tố ở ngay cổng trường để kiếm thêm chút tiền mua thuốc, mua sữa cho con. Dẫu cái khó cứ luôn đeo bám, thế nhưng suốt nhiều năm liền cô Minh vẫn là giáo viên dạy giỏi cấp tỉnh.', 'img111', 'Để lan tỏa ý nghĩa cao cả của chương trình “Đồng hành cùng người thầy”, trong tháng 5 này, Ví MoMo kết hợp cùng báo Tuổi Trẻ kêu gọi gây quỹ 100,000,000 đồng nhằm tiếp tục tạo thêm sự kết nối ý nghĩa giữa xã hội và những người giữ trọng trách “trồng người” cao quý, để xã hội quan tâm hơn, có những chia sẻ thiết thực hơn đối với các thầy cô, giúp nền giáo dục Việt Nam tiếp tục phát triển tốt hơn trong tương lai.', 'img22', '12', '20', '2010-07-10 00:00:00', '2010-12-10 00:00:00');

INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Gây quỹ 4 ca phẫu thuật kỷ niệm hành trình 40 năm chữa lành nụ cười của Operation Smile', 'Được thành lập vào năm 1982, Operation Smile đã cung cấp dịch vụ điều trị và phẫu thuật miễn phí giúp thay đổi cuộc sống cho hơn 326.000 bệnh nhân trên khắp thế giới, giúp họ có thể sinh hoạt và tận hưởng cuộc sống khỏe mạnh hơn. Nhân kỷ niệm 40 năm, tổ chức Operation Smile đưa ra cam kết chăm sóc y tế cho một triệu trẻ em toàn cầu trong 10 năm tới. Song song đó, tổ chức sẽ tiếp tục củng cố hệ thống y tế, cơ sở vật chất để hướng đến nâng cao chất lượng chăm sóc bệnh nhân, và rút ngắn bất bình đẳng trong các hệ thống chăm sóc sức khỏe. ', 'adas', 'Với cam kết đó, tổ chức Operation Smile tại Việt Nam rất mong rằng trong hành trình sắp tới sẽ luôn nhận được sự ủng hộ và đồng hành của cộng đồng để mang lại sự thay đổi cho trẻ em Việt Nam.Ở Việt Nam, tỉ lệ của bệnh này là 1 trên 700 trẻ ra đời. Dị tật này không gây tử vong nhưng có thể làm trẻ gặp khó khăn trong ăn uống, giao tiếp và hòa nhập với xã hội. Từ những đứa trẻ bị khiếm khuyết về thể chất, mặc cảm về ngoại hình, một cuộc phẫu thuật kéo dài 45 phút sẽ giúp các em trở nên lành lặn, tự tin trong cuộc sống. ', 'đá', '200', '300', '2010-07-10 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay quyên góp cải tạo điểm trường Tấn Xà Phìn, Hà Giang', 'Xã Nậm Ty nằm ở phía nam của huyện Hoàng Su Phì, trên trục đường Bắc Quang - Xín Mần Thuộc huyện Hoàng Su Phì, tỉnh Hà Giang. Toàn xã có 02 dân tộc sinh sống chủ yếu. Địa hình địa lý của xã tương đối phức tạp có nhiều núi cao, suối lớn và sâu chia cắt, đường đi lại khó khăn. Đồng thời dân cư phân bố không tập trung dẫn đến việc mở điểm trường, mở lớp gặp rất nhiều trở ngại. Đặc biệt là học sinh tiểu học còn nhỏ khi mùa mưa lũ đến, đi lại vô cùng nguy hiểm. Hiện nay xã có 3 cấp học bao gồm bậc Mầm non, Tiểu học và Trung học Cơ sở.', 'qeq', 'Thấu hiểu hoàn cảnh khó khăn của thầy và trò điểm trường Tấn Xà Phìn, MoMo hợp tác cùng Trung tâm Tình nguyện Quốc gia, Dự án Sức mạnh 2000 và Dự án Nuôi Em lên kế- hoạch sửa chữa và xây dựng phòng học mới, để các em có đường nơi học tập kiên cố, tiện nghi. Trong chiến dịch xây trường lần này, chúng tôi chia thành 2 đợt gây quỹ. Đợt 1 quyên góp qua Heo Đất MoMo số tiền 100 triệu và đợt 2 gây quỹ cộng đồng trên Trái Tim MoMo 220 triệu đồng. Hiện tại, chúng tôi đang tiến hành quyên góp đợt 2 qua Trái Tim MoMo. Để đi theo kế hoạch như dự tính, chúng tôi đặt mục tiêu quyên góp 220 triệu đồng từ các nhà hảo tâm để nhanh chóng có đủ kinh phí xây dựng phòng học mới khang trang cho các em học sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay mang Tết đến cho 40 trẻ mồ côi do đại dịch và trẻ có hoàn cảnh khó khăn', 'Xã Nậm Ty nằm ở phía nam của huyện Hoàng Su Phì, trên trục đường Bắc Quang - Xín Mần Thuộc huyện Hoàng Su Phì, tỉnh Hà Giang. Toàn xã có 02 dân tộc sinh sống chủ yếu. Địa hình địa lý của xã tương đối phức tạp có nhiều núi cao, suối lớn và sâu chia cắt, đường đi lại khó khăn. Đồng thời dân cư phân bố không tập trung dẫn đến việc mở điểm trường, mở lớp gặp rất nhiều trở ngại. Đặc biệt là học sinh tiểu học còn nhỏ khi mùa mưa lũ đến, đi lại vô cùng nguy hiểm. Hiện nay xã có 3 cấp học bao gồm bậc Mầm non, Tiểu học và Trung học Cơ sở.', 'qeq', 'Thấu hiểu hoàn cảnh khó khăn của thầy và trò điểm trường Tấn Xà Phìn, MoMo hợp tác cùng Trung tâm Tình nguyện Quốc gia, Dự án Sức mạnh 2000 và Dự án Nuôi Em lên kế- hoạch sửa chữa và xây dựng phòng học mới, để các em có đường nơi học tập kiên cố, tiện nghi. Trong chiến dịch xây trường lần này, chúng tôi chia thành 2 đợt gây quỹ. Đợt 1 quyên góp qua Heo Đất MoMo số tiền 100 triệu và đợt 2 gây quỹ cộng đồng trên Trái Tim MoMo 220 triệu đồng. Hiện tại, chúng tôi đang tiến hành quyên góp đợt 2 qua Trái Tim MoMo. Để đi theo kế hoạch như dự tính, chúng tôi đặt mục tiêu quyên góp 220 triệu đồng từ các nhà hảo tâm để nhanh chóng có đủ kinh phí xây dựng phòng học mới khang trang cho các em học sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2009-07-09 00:00:00');



INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Gây quỹ 4 ca phẫu thuật kỷ niệm hành trình 40 năm chữa lành nụ cười của Operation Smile', 'Được thành lập vào năm 1982, Operation Smile đã cung cấp dịch vụ điều trị và phẫu thuật miễn phí giúp thay đổi cuộc sống cho hơn 326.000 bệnh nhân trên khắp thế giới, giúp họ có thể sinh hoạt và tận hưởng cuộc sống khỏe mạnh hơn. Nhân kỷ niệm 40 năm, tổ chức Operation Smile đưa ra cam kết chăm sóc y tế cho một triệu trẻ em toàn cầu trong 10 năm tới. Song song đó, tổ chức sẽ tiếp tục củng cố hệ thống y tế, cơ sở vật chất để hướng đến nâng cao chất lượng chăm sóc bệnh nhân, và rút ngắn bất bình đẳng trong các hệ thống chăm sóc sức khỏe. ', 'adas', 'Với cam kết đó, tổ chức Operation Smile tại Việt Nam rất mong rằng trong hành trình sắp tới sẽ luôn nhận được sự ủng hộ và đồng hành của cộng đồng để mang lại sự thay đổi cho trẻ em Việt Nam.Ở Việt Nam, tỉ lệ của bệnh này là 1 trên 700 trẻ ra đời. Dị tật này không gây tử vong nhưng có thể làm trẻ gặp khó khăn trong ăn uống, giao tiếp và hòa nhập với xã hội. Từ những đứa trẻ bị khiếm khuyết về thể chất, mặc cảm về ngoại hình, một cuộc phẫu thuật kéo dài 45 phút sẽ giúp các em trở nên lành lặn, tự tin trong cuộc sống. ', 'đá', '200', '300', '2010-07-10 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay quyên góp cải tạo điểm trường Tấn Xà Phìn, Hà Giang', 'Xã Nậm Ty nằm ở phía nam của huyện Hoàng Su Phì, trên trục đường Bắc Quang - Xín Mần Thuộc huyện Hoàng Su Phì, tỉnh Hà Giang. Toàn xã có 02 dân tộc sinh sống chủ yếu. Địa hình địa lý của xã tương đối phức tạp có nhiều núi cao, suối lớn và sâu chia cắt, đường đi lại khó khăn. Đồng thời dân cư phân bố không tập trung dẫn đến việc mở điểm trường, mở lớp gặp rất nhiều trở ngại. Đặc biệt là học sinh tiểu học còn nhỏ khi mùa mưa lũ đến, đi lại vô cùng nguy hiểm. Hiện nay xã có 3 cấp học bao gồm bậc Mầm non, Tiểu học và Trung học Cơ sở.', 'qeq', 'Thấu hiểu hoàn cảnh khó khăn của thầy và trò điểm trường Tấn Xà Phìn, MoMo hợp tác cùng Trung tâm Tình nguyện Quốc gia, Dự án Sức mạnh 2000 và Dự án Nuôi Em lên kế- hoạch sửa chữa và xây dựng phòng học mới, để các em có đường nơi học tập kiên cố, tiện nghi. Trong chiến dịch xây trường lần này, chúng tôi chia thành 2 đợt gây quỹ. Đợt 1 quyên góp qua Heo Đất MoMo số tiền 100 triệu và đợt 2 gây quỹ cộng đồng trên Trái Tim MoMo 220 triệu đồng. Hiện tại, chúng tôi đang tiến hành quyên góp đợt 2 qua Trái Tim MoMo. Để đi theo kế hoạch như dự tính, chúng tôi đặt mục tiêu quyên góp 220 triệu đồng từ các nhà hảo tâm để nhanh chóng có đủ kinh phí xây dựng phòng học mới khang trang cho các em học sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2010-12-10 00:00:00');

INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Gây quỹ 4 ca phẫu thuật kỷ niệm hành trình 40 năm chữa lành nụ cười của Operation Smile', 'Được thành lập vào năm 1982, Operation Smile đã cung cấp dịch vụ điều trị và phẫu thuật miễn phí giúp thay đổi cuộc sống cho hơn 326.000 bệnh nhân trên khắp thế giới, giúp họ có thể sinh hoạt và tận hưởng cuộc sống khỏe mạnh hơn. Nhân kỷ niệm 40 năm, tổ chức Operation Smile đưa ra cam kết chăm sóc y tế cho một triệu trẻ em toàn cầu trong 10 năm tới. Song song đó, tổ chức sẽ tiếp tục củng cố hệ thống y tế, cơ sở vật chất để hướng đến nâng cao chất lượng chăm sóc bệnh nhân, và rút ngắn bất bình đẳng trong các hệ thống chăm sóc sức khỏe. ', 'adas', 'Với cam kết đó, tổ chức Operation Smile tại Việt Nam rất mong rằng trong hành trình sắp tới sẽ luôn nhận được sự ủng hộ và đồng hành của cộng đồng để mang lại sự thay đổi cho trẻ em Việt Nam.Ở Việt Nam, tỉ lệ của bệnh này là 1 trên 700 trẻ ra đời. Dị tật này không gây tử vong nhưng có thể làm trẻ gặp khó khăn trong ăn uống, giao tiếp và hòa nhập với xã hội. Từ những đứa trẻ bị khiếm khuyết về thể chất, mặc cảm về ngoại hình, một cuộc phẫu thuật kéo dài 45 phút sẽ giúp các em trở nên lành lặn, tự tin trong cuộc sống. ', 'đá', '200', '300', '2010-07-10 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay quyên góp cải tạo điểm trường Tấn Xà Phìn, Hà Giang', 'Xã Nậm Ty nằm ở phía nam của huyện Hoàng Su Phì, trên trục đường Bắc Quang - Xín Mần Thuộc huyện Hoàng Su Phì, tỉnh Hà Giang. Toàn xã có 02 dân tộc sinh sống chủ yếu. Địa hình địa lý của xã tương đối phức tạp có nhiều núi cao, suối lớn và sâu chia cắt, đường đi lại khó khăn. Đồng thời dân cư phân bố không tập trung dẫn đến việc mở điểm trường, mở lớp gặp rất nhiều trở ngại. Đặc biệt là học sinh tiểu học còn nhỏ khi mùa mưa lũ đến, đi lại vô cùng nguy hiểm. Hiện nay xã có 3 cấp học bao gồm bậc Mầm non, Tiểu học và Trung học Cơ sở.', 'qeq', 'Thấu hiểu hoàn cảnh khó khăn của thầy và trò điểm trường Tấn Xà Phìn, MoMo hợp tác cùng Trung tâm Tình nguyện Quốc gia, Dự án Sức mạnh 2000 và Dự án Nuôi Em lên kế- hoạch sửa chữa và xây dựng phòng học mới, để các em có đường nơi học tập kiên cố, tiện nghi. Trong chiến dịch xây trường lần này, chúng tôi chia thành 2 đợt gây quỹ. Đợt 1 quyên góp qua Heo Đất MoMo số tiền 100 triệu và đợt 2 gây quỹ cộng đồng trên Trái Tim MoMo 220 triệu đồng. Hiện tại, chúng tôi đang tiến hành quyên góp đợt 2 qua Trái Tim MoMo. Để đi theo kế hoạch như dự tính, chúng tôi đặt mục tiêu quyên góp 220 triệu đồng từ các nhà hảo tâm để nhanh chóng có đủ kinh phí xây dựng phòng học mới khang trang cho các em học sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2010-12-10 00:00:00');
INSERT INTO `mock_project`.`post` (`title`, `content_1`, `img_1`, `content_2`, `img_2`, `donator_quantity`, `money_achieved`, `startDate`, `finishDate`) VALUES ('Chung tay mang Tết đến cho 40 trẻ mồ côi do đại dịch và trẻ có hoàn cảnh khó khăn', 'Xã Nậm Ty nằm ở phía nam của huyện Hoàng Su Phì, trên trục đường Bắc Quang - Xín Mần Thuộc huyện Hoàng Su Phì, tỉnh Hà Giang. Toàn xã có 02 dân tộc sinh sống chủ yếu. Địa hình địa lý của xã tương đối phức tạp có nhiều núi cao, suối lớn và sâu chia cắt, đường đi lại khó khăn. Đồng thời dân cư phân bố không tập trung dẫn đến việc mở điểm trường, mở lớp gặp rất nhiều trở ngại. Đặc biệt là học sinh tiểu học còn nhỏ khi mùa mưa lũ đến, đi lại vô cùng nguy hiểm. Hiện nay xã có 3 cấp học bao gồm bậc Mầm non, Tiểu học và Trung học Cơ sở.', 'qeq', 'Thấu hiểu hoàn cảnh khó khăn của thầy và trò điểm trường Tấn Xà Phìn, MoMo hợp tác cùng Trung tâm Tình nguyện Quốc gia, Dự án Sức mạnh 2000 và Dự án Nuôi Em lên kế- hoạch sửa chữa và xây dựng phòng học mới, để các em có đường nơi học tập kiên cố, tiện nghi. Trong chiến dịch xây trường lần này, chúng tôi chia thành 2 đợt gây quỹ. Đợt 1 quyên góp qua Heo Đất MoMo số tiền 100 triệu và đợt 2 gây quỹ cộng đồng trên Trái Tim MoMo 220 triệu đồng. Hiện tại, chúng tôi đang tiến hành quyên góp đợt 2 qua Trái Tim MoMo. Để đi theo kế hoạch như dự tính, chúng tôi đặt mục tiêu quyên góp 220 triệu đồng từ các nhà hảo tâm để nhanh chóng có đủ kinh phí xây dựng phòng học mới khang trang cho các em học sinh.', 'qeqq', '20', '100', '2009-07-09 00:00:00', '2009-07-09 00:00:00');


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

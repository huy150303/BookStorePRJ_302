
CREATE TABLE Customers (
  cus_id INT IDENTITY(1,1) PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  cus_name NVARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  date_birth DATE NOT NULL,
  	Phone CHAR(10) UNIQUE CHECK(Phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR Phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	isAdmin NVARCHAR(50) NOT NULL
);


CREATE TABLE Orders (
  order_id INT IDENTITY(1,1) PRIMARY KEY,
  cus_id INT NOT NULL,
  [address] NVARCHAR(255) NOT NULL,
  order_date DATE,	
  FOREIGN KEY (cus_id) REFERENCES Customers(cus_id)
);

CREATE TABLE Suppliers (
  supplier_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  supplier_name NVARCHAR(255) NOT NULL,
  [Address] NVARCHAR(255) NOT NULL,
  [Phone] NVARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  [HomePage] ntext NULL,
);
CREATE TABLE Books (
  book_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  title NVARCHAR(255) NOT NULL,
  author NVARCHAR(255) NOT NULL,
  image NVARCHAR(MAX),
  description NTEXT,
  Publishing_company NVARCHAR(255) NOT NULL,
  supplier_id INT,
  quantity int NOT NULL,
  Language NVARCHAR(255),
  Unit_Price DECIMAL(10, 2) NOT NULL,
  discount DECIMAL(10, 2),
  FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);


CREATE TABLE Genres (
  genre_id INT IDENTITY(1,1) PRIMARY KEY,
  genre_name NVARCHAR(255) NOT NULL
);

CREATE TABLE Book_Genres (
  book_id INT,
  genre_id INT,
  PRIMARY KEY (book_id, genre_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id),
  FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Order_Items (
  order_id INT NOT NULL,
  book_id INT  NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id),

);
-- Inserting values into Suppliers table
INSERT INTO Suppliers (supplier_name, Address, Phone, email, HomePage)
VALUES
  (N'AZ Việt Nam', N'Số 50, Đường 5, F361 An Dương, Yên Phụ, Tây Hồ, Hà Nội, Việt Nam', '(84-24)37172838', 'info@azgroup.vn', 'https://azgroup.vn/'),
  (N'Đinh Tị', N'NV22 khu 12 ngõ 13 đường Lĩnh Nam, phường Mai Động, quận Hoàng Mai, Thành Phố Hà Nội, Việt Nam', '0247.309.3388', 'contacts@dinhtibooks.vn', 'https://dinhtibooks.com.vn/'),
  ('Grantham Book Services', N'Distribution Centre, Colchester Rd, Ardleigh, Great Bentley, Colchester CO7 7DW, Vương quốc Anh', '+44 (0)1206 256000', 'tbs@thebookservicetd.com', 'https://www.thebookservice.co.uk/'),
  (N'NXB Trẻ', N'161B Lý Chính Thắng, Phường Võ Thị Sáu, Quận 3 , TP. Hồ Chí Minh, Việt Nam', '(84.028) 38437450', 'hopthubandoc@nxbtre.com.vn', 'https://www.nxbtre.com.vn/'),
  (N'NXB Kim Đồng', N'Số 55 Quang Trung, Nguyễn Du, Hai Bà Trưng, Hà Nội, Việt Nam', '(+84) 1900571595', 'cskh_online@nxbkimdong.com.vn', 'https://nxbkimdong.com.vn/'),
  (N'Nhã Nam', N'Số 59, Đỗ Quang, Trung Hoà, Cầu Giấy, Hà Nội, Việt Nam', '02435146876', 'info@nhanam.vn', 'https://nhanam.vn/'),
  (N'Alpha Books', N'Tầng 3, Dream Home Center, 11a ngõ 282 Nguyễn Huy Tưởng, Thanh Xuân, Hà Nội, Việt Nam', '0932 329 959', 'mkt.alphabooks@gmail.com', 'https://alphabooks.vn/'),
  ('IPM', N'Số 110 Nguyễn Ngọc Nại, Khương Mai, Thanh Xuân, Hà Nội, Việt Nam', '03 2838 3979', 'online.ipmvn@gmail.com', 'https://ipm.vn/'),
  (N'FIRST NEWS', N'11 I-H Nguyễn Thị Minh Khai, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam', '(84. 28) 38227979', 'triviet@firstnews.com.vn', 'https://firstnews.com.vn/'),
  (N'MCBooks', N'Ô số e34 - Khu đấu giá 3ha - Phúc Diễn - Bắc Từ Liêm - Hà Nội, Việt Nam', '02437921466', 'contact@mcbooks.vn', 'https://mcbooks.vn/'),
  (N'Skybooks', N'Số 83 Lý Nam Đế, Phường Cửa Đông, Quận Hoàn Kiếm, Hà Nội, Việt Nam', '02438438220', 'contact.skybooks@gmail.com', 'https://skybooks.vn/lien-he'),
  (N'Cty Bán Lẻ Phương Nam', N'940 Đường Ba Tháng Hai, Phường 15, Quận 11, Thành phố Hồ Chí Minh, Việt Nam', '(08) 38663447- 08 38', 'vanhoaphuongnam@gmail.com', 'https://masothue.com/0312628590-002-cong-ty-tnhh-ban-le-phuong-nam-chi-nhanh-ha-noi'),
  (N'NXB Bản Tri Thức', N'Tầng 1 Tòa nhà Liên hiệp các Hội Khoa học và Kỹ thuật Việt Nam, Lô D20, ngõ 19, phố Duy Tân, phường Dịch Vọng Hậu, quận Cầu Giấy, Hà Nội, Việt Nam', '02466878415', 'lienhe@nxbtrithuc.com.vn', 'https://nxbtrithuc.com.vn/');
  
-- Inserting values into Customers table
INSERT INTO Customers ( username, password, cus_name, email, date_birth,  Phone, isAdmin)
VALUES
( 'Huy172063', 'huy123', 'Pham Hai Huy', 'huy@gmail.com', '2003-03-15',  '0904548667', N'TRUE'),
( 'kevin03', 'ken03', 'Kenvin Klein', 'Kevin03@gmail.com', '2000-12-14',  '0905353257', N'FALSE'),
( 'Hieucute', 'hieu098', 'Pham Minh Hieu', 'hieu2004@gmail.com', '2004-05-18',  '0948048309', N'FALSE'),
( 'Chika', 'Chibi123', 'Nguyen Ha Chi', 'Chika123@gmail.com', '2004-03-15',  '0904548854', N'FALSE'),
( 'Garan12', 'garen0174', 'Pham Duc Hai', 'MaxHai1974@gmail.com', '2004-04-19',  '0904543287', N'FALSE'), 
( 'Keen04', 'keen04', 'Ha Van Dong', 'keen04@gmail.com', '1999-04-30',  '0903722838', N'FALSE'),
( 'Mac007', 'mac007', 'Nguyen Huy Hoang', 'Sunshine007@gmail.com', '1998-03-19',  '0904543246', N'FALSE'), 
('Hanozen', 'kingen10', 'Ha Ba Sa', 'doctorHa@gmail.com', '1975-10-09',  '0932544542', N'FALSE'),
( 'Bond', 'bondw23', 'Vuong Minh An', 'Bond@gmail.com', '1995-02-03', '0932544543', N'FALSE'),
('Nhim', 'haanh23', 'Ha Anh', 'hanganh@gmail.com', '1985-09-20',  '0936543210', N'FALSE');



-- Inserting values into Orders table
INSERT INTO Orders ( cus_id, address, order_date)
VALUES
( 2, N'17t11-Hoàng Đạo Thúy,Hà Nội', '2024-02-08'),
( 3, '456 Elm St, Townsville', '2024-02-15'),
( 4, N'46 Nguyễn Thị Đinh, Hà Nội', '2024-01-30'),
( 5, N'123 Phố Vọng, Hai Bà Trưng, Hà Nội', '2024-01-23'),
( 6, N'789 Phố Hoàng Diệu, Quận Hai Bà Trưng, Hà Nội', '2024-01-07'),
( 7, N'101 Đường Nguyễn Văn Cừ, Quận 5, TP.Hồ Chí Minh', '2024-01-08'),
( 8, N'567 Đường Lê Duẩn, Quận Ba Đình, Hà Nội', '2024-01-15'),
( 9, N'321 Phố Trần Phú, Quận Hải Châu, Đà Nẵng', '2024-02-01'),
( 10, N'789 Đường Lê Lai, Quận 1, TP.Hồ Chí Minh', '2024-02-10');
-- Inserting values into Books table

INSERT INTO Books ( title, author, image, description, Publishing_company,supplier_id,quantity, Language, Unit_Price,discount)
VALUES
( N'Tâm Lý Học Tội Phạm', N'Diệp Hồng Vũ', 'images/tamlytoipham.jpg', N'
Tội phạm, nhất là những vụ án mạng, luôn là một chủ đề thu hút sự quan tâm của công chúng, khơi gợi sự hiếu kỳ của bất cứ ai. Một khi đã bắt đầu theo dõi vụ án, hẳn bạn không thể không quan tâm tới kết cục, đặc biệt là cách thức và động cơ của kẻ sát nhân, từ những vụ án phạm vi hẹp cho đến những vụ án làm rúng động cả thế giới.

Lấy 36 vụ án CÓ THẬT kinh điển nhất trong hồ sơ tội phạm của FBI, “Tâm lý học tội phạm - phác họa chân dung kẻ phạm tội” mang đến cái nhìn toàn cảnh của các chuyên gia về chân dung tâm lý tội phạm. Trả lời cho câu hỏi: Làm thế nào phân tích được tâm lý và hành vi tội phạm, từ đó khôi phục sự thật thông qua các manh mối, từ hiện trường vụ án, thời gian, dấu tích,… để tìm ra kẻ sát nhân thực sự. 

Đằng sau máu và nước mắt là các câu chuyện rợn tóc gáy về tội ác, góc khuất xã hội và những màn đấu trí đầy gay cấn giữa điều tra viên và kẻ phạm tội. Trong số đó có những con quỷ ăn thịt người; những cô gái xinh đẹp nhưng xảo quyệt; và cả cách trả thù đầy man rợ của các nhà khoa học,… Một số đã sa vào lưới pháp luật ngay khi chúng vừa ra tay, nhưng cũng có những kẻ cứ vậy ngủ yên hơn hai mươi năm. 

Bằng giọng văn sắc bén, “Tâm lý học tội phạm - phác họa chân dung kẻ phạm tội” hứa hẹn dẫn dắt người đọc đi qua các cung bậc cảm xúc từ tò mò, ngạc nhiên đến sợ hãi, hoang mang tận cùng. Chúng ta sẽ lần tìm về quá khứ để từng bước gỡ những nút thắt chưa được giải, khiến ta "ngạt thở" đọc tới tận trang cuối cùng. 

Hy vọng cuốn sách sẽ giúp bạn có cái nhìn sâu sắc, rõ ràng hơn về bộ môn tâm lý học tội phạm và có thể rèn luyện thêm sự tư duy, nhạy bén.'
, N'NXB Thanh Niên ', 1,100, 'Vietnamese', 13.00,0),
(N'Đám Trẻ Ở Đại Dương Đen', N'Châu Sa Đáy Mắt', 'images/Duatredaiduong.jpg', N'Đám trẻ ở đại dương đen là lời độc thoại và đối thoại của những đứa trẻ ở đại dương đen, nơi từng lớp sóng của nỗi buồn và tuyệt vọng không ngừng cuộn trào, lúc âm ỉ, khi dữ dội. Những đứa trẻ ấy phải vật lộn trong những góc tối tâm lý, với sự u uất đè nén từ tổn thương khi không được sinh ra trong một gia đình toàn vẹn, ấm êm, khi phải mang trên đôi vai non dại những gánh nặng không tưởng.', N'NXB Thế Giới', 1, 97, 'Vietnamese', 6.00, 0),
(N'Tết Ở Làng Địa Ngục', N'Thảo Trang', 'images/tetolangdianguc.jpg', N'Năm đó, tại một ngôi làng xa xôi trên một ngọn núi hoang vu, người ta đón Tết trong sự kinh hãi tột độ, hoài nghi đau đáu và giận dữ khôn cùng trước sự ập tới của những bi kich tàn khốc.

Ngôi làng ấy vốn dĩ không có tên, nhưng những người nơi đây mặc định chốn này là địa ngục. Dân trong làng không ai dám tự ý băng rừng thoát khỏi làng, càng không biết thế giới bên ngoài rộng lớn như thế nào, bởi lẽ họ sợ người khác sẽ biết rằng bản thân mình vốn là hậu duệ của băng cướp khét tiếng ở truông nhà Hồ dưới thời chúa Nguyễn ở Đàng Trong.

Vào một đêm cuối năm rét buốt, ông Thập – người duy nhất có thể ra khỏi làng – được báo mộng bởi một âm hồn mặc quan phục màu đỏ rực. Làng Địa Ngục sắp gặp họa lớn!

Thành danh bằng những tác phẩm văn học kinh dị đậm chất Việt Nam được phát hành qua mạng, lần này tác giả Thảo Trang tiếp tục mang đến một câu chuyện hấp dẫn, mở ra một thế giới huyền bí với những sinh vật, thế lực siêu linh mà người đọc không bao giờ hết hứng thú, để lại những dư âm không phai khi gấp sách lại.', N'NXB Thanh Niên', 2, 109, 'Vietnamese', 8.00, 0),
('To Kill A Mockingbird', 'Harper Lee', 'images/mockingbird.jpg', 'THE ORIGINAL TEXT Shoot all the Bluejays you want, if you can hit em, but remember it a sin to kill a Mockingbird. Atticus Finch gives this advice to his children as he defends the real mockingbird of this classic novel - a black man charged with attacking a white girl. Through the eyes of Scout and Jem Finch, Lee explores the issues of race and class in the Deep South of the 1930s with compassion and humour. She also creates one of the great heroes of literature in their father, whose lone struggle for justice pricks the conscience of a town steeped in prejudice and hypocrisy.', 'NXB Vintage Books', 3, 98, 'Vietnamese', 10.00, 0),
(N'Harry Potter Và Bảo Bối Tử Thần', 'J.K.Rowling', 'images/harrypotter.jpg', N'Harry Potter đang chuẩn bị rời khỏi nhà Dursley và đường Privet Drive trong thời khắc cuối cùng. Tuy nhiên, tương lai Harry đầy rẫy hiểm nguy, không chỉ cho cậu mà cả những người gần gũi – và Harry đã mất mát quá nhiều. Chỉ bằng cách tiêu hủy những Trường Sinh Linh Giá, Harry Potter mới có thể tự cứu mình và vượt qua những thế lực đen tối của Chúa tể hắc ám.

Ở phần kết đầy kịch tính của loạt truyện Harry Potter này, Harry phải để những người bạn trung thành nhất ở lại tuyến sau để dấn thân vào cuộc hành trình nguy hiểm cuối cùng hòng tìm kiếm sức mạnh và đối mặt với số phận đáng sợ của cậu: một cuộc chiến sinh tử và đơn độc.', 'NXB Trẻ', 4, 114, 'Vietnamese', 12.00, 0),
('Ghi Chép Pháp Y', N'Lưu Bát Bách', 'images/ghichepphapy.jpg', N'“Ghi chép pháp y - Những thi thể không hoàn chỉnh” là phần thứ 3, tiếp nối series đình đám “Ghi chép pháp y” được tác giả Pháp y Tần Minh và Phó giám đốc Hiệp hội pháp y Trung Quốc - Châu Diệc Vũ đặc biệt giới thiệu. Cuốn sách bao gồm 7 vụ án có thật, được viết bởi bác sĩ pháp y Lưu Bát Bách với 18 năm kinh nghiệm giải phẫu cho hơn 800 thi thể. 

Nếu phần 1 đi sâu vào việc phá án bằng nghiệp vụ chuyên môn, phần 2 là sự đồng cảm với những xác chết không thể lên tiếng thì ở phần 3, tác giả sẽ tập trung miêu tả những hiện trường tội ác man rợ, phân tích động cơ gây án cũng như tâm lý biến thái ẩn sau bộ mặt bình thản của hung thủ. 

Sự độc ác của nhân tính có thể khiến đứa con trai tự tay giết mẹ, ăn trộm tiền cho bạn. Sự độc ác của nhân tính có thể khiến người thầy giáo cởi bỏ lớp ngụy trang mẫu mực, phân xác học sinh dưới sự bao che của nhà trường. Sự độc ác của nhân tính có thể khiến vị bác sĩ thảm sát cả gia đình đồng nghiệp chỉ vì ghen tị.

Bằng kỹ năng toàn diện và sự hỗ trợ của công nghệ siêu việt như: đối chiếu DNA, xác minh dấu giày, giám định mỏm xương thái dương… tác giả đã từng bước tìm ra chứng cứ then chốt, đập tan mọi ảo tưởng về “một tội ác hoàn hảo’ và đưa kẻ thủ ác ra trước ánh sáng pháp luật để chịu sự trừng phạt. 

“Thật ra pháp y chính là nghề như vậy, thân thể ở trong nơi tối, trái tim hướng về phía ánh sáng mặt trời.” - Lưu Bát Bách. 

Hy vọng trong phần 3 của series “Ghi chép pháp y”, bạn đọc sẽ tiếp tục đồng hành cùng tác giả trải nghiệm quá trình phá án, truy tìm hung thủ để đòi quyền cho người sống - lên tiếng cho người chết.'
, 'NXB Thanh Niên', 1, 102, 'Vietnamese', 9.00, 0),

( N'Cha Cõng Con', N'Lương Đình Dũng', 'images/chacongcon.jpg', N'Từ trên cao nhìn xuống những cánh đồng, dòng sông, Bường muốn được về nhà.

Người cha đạp xe không kể ngày đêm, băng qua cánh đồng vàng, băng qua những con dốc trắng… Cậu bé tóc gần như rụng hết, dang cánh tay như cánh chim. Hai cha con đã về đến con sông, bên kia dòng sông là nơi họ sống. Cả hai vượt sông, người cha cõng con trai trên lưng. Rồi người ta thấy dòng sông phẳng lặng, không thấy bóng hai cha con nữa.

Trong những dòng văn mộc mạc và giàu chất điện ảnh của Lương Đình Dũng, phận người côi cút mà không bất hạnh, bởi rực lên giữa câu chữ ánh sáng của niềm tin vào phẩm chất thiện lương, lòng nhân ái, và trên tất cả là tình cảm gia đình - chỗ dựa vững chắc cho tâm hồn mỗi người.

Bộ phim điện ảnh đầu tay của Lương Đình Dũng - Cha Cõng Con - được sản xuất dựa theo truyện ngắn cùng tên anh viết năm 1995. Phim được chiếu giới thiệu tại nhiều quốc gia như Mĩ, Ý, Canada, Ấn Độ, Thụy Điển…, giành hàng chục giải thưởng quốc tế danh giá như Giải phim châu Á hay nhất, Giải Kịch bản phim xuất sắc nhất.', N'NXB Kim Đồng', 5,92, 'Vietnamese', 5.00,0),

( N'Mùa Động Rừng', N'Sương Nguyệt Minh', 'images/muadongrung.jpg', N'Cuộc phiêu lưu bất đắc dĩ của Cún Vàng giữa núi rừng Tam Điệp nguyên sơ mênh mông với những thợ săn, với Gấu Đen, Bìm Bịp Lửa, Trăn Gió, Lợn Độc, Diều Hâu Đen, Sói Trắng, Sói Cụt đuôi, Sói Đỏ… khiến mỗi chương truyện là một bất ngờ, hồi hộp, thú vị và nhiều suy ngẫm về Rừng Xanh...

“Ăn của rừng rưng rưng nước mắt', N'NXB Kim Đồng', 5,87, 'Vietnamese', 8.99,0),
( N'Thú Tội', 'Minato Kanae', 'images/thutoi.jpg', N'Cuộc phiêu lưu Moriguchi là giáo viên cấp hai đồng thời là bà mẹ đơn thân của một cô gái 4 tuổi. Một hôm, xác cô bé được phát hiện trong bể bơi trường học. Cảnh sát nhận định đây là vụ tai nạn nhưng Moriguchi biết ai đã sát hại con gái mình - kẻ ở ngay trong lớp học do mình chủ nhiệm. Moriguchi bắt đầu kế hoạch báo thù của riêng cô...

"Một câu chuyện tâm lý kinh dị, ớn lạnh, thuyết phục, gây bất ngờ không chỉ một lần...Day dứt, tàn nhẫn và choáng váng."', N'Hội Nhà Văn', 6,95, 'Vietnamese', 7.00,0),
( N'Cây Cam Ngọt Của Tôi', N'José Mauro de Vasconcelos', 'images/caycamngotcuatoi.jpeg', N'Hơn nửa thế kỷ trôi qua kể từ lần đầu tiên cậu bé Zezé bước vào văn chương và ở lại đó cùng với cây cam ngọt ngào lẫn đắng chát của mình, độc giả tiếp tục khóc cười với cuốn tiểu thuyết thành công nhất của nhà văn José Mauro de Vasconcelos (1920 - 1984) - Cây cam ngọt của tôi (Nguyễn Bích Lan - Tô Yến Ly dịch, Nhã Nam và Nhà xuất bản Hội Nhà Văn).

Cuốn sách xuất bản lần đầu năm 1968 ở Brazil, khi cơn sốt văn chương châu Mỹ Latin đang lan dần ra toàn thế giới.

Nếu Hảo hán nơi trảng cát của Jorge Amado (1912 - 2002) là cuộc sống của những đứa trẻ mồ côi ở Salvador thì Cây cam ngọt của tôi là cuộc đời của những con người trong khu xóm nghèo ở thủ đô Rio de Janeiro.

Ở đó, những người lớn tất tả trong cuộc mưu sinh bỏ quên chú bé Zezé nghịch ngợm chật vật trong thế giới tuổi thơ của mình. Trước một thế giới ảm đạm buồn chán, Zezé phải bày đủ trò quậy phá đến mức bị đòn roi.

Zezé lấy trí tưởng tượng để làm vũ khí chống lại thế giới người lớn quay cuồng trong tiền bạc nhưng thiếu vắng hạnh phúc và ước mơ. Cậu đặt tên cho cây cam trong vườn là Minguinho và như hai người bạn, chúng trò chuyện với nhau, cùng nhau bước qua một tuổi thơ khốn khó nhưng không tuyệt vọng.

Câu chuyện đơn giản nhuốm màu sắc tự truyện vẫn khiến cuốn sách gặt hái được thành công quốc tế, trở thành một tác phẩm mang tính giáo dục cao, dẫu tác giả không tuyên ngôn dưới bất kỳ hình thức nào.

Tác phẩm được đưa vào chương trình tiểu học, chuyển thể thành phim và cách đây không lâu trở thành nguồn cảm hứng sáng tạo cho một ngôi sao K-pop.

Thời đại bất an mà nhà văn sống là thời đại của những nhà độc tài, những cuộc cách mạng, nội chiến liên miên.



Cho nên tác phẩm không chỉ là hành trình hướng thiện của một đứa trẻ mà còn là cuộc chiến thu nhỏ diễn ra ở chốn tận cùng, nơi con người chống lại sự tàn nhẫn của cuộc đời để bảo vệ sự ngây thơ của thế giới.', 
N'Hội nhà văn', 7,91, 'English', 12.99,0),
( N'Zoo', 'Otsuichi', 'images/zoo1.jpeg', N'Hơi lạnh phà ra từ khắp cuốn sách kinh dị này…
Phà ra từ hầm ngầm, nơi các nạn nhân bị chặt thành từng mảnh nhỏ để trôi vừa qua lưới chắn cống xối,
Phà ra từ bộ ảnh chụp lần lượt từng bước phân hủy xác một cô gái: đổi màu, ứa nước, rữa nát đến khô quắt dòi bọ chán nản bỏ đi,
Phà ra từ người đàn ông tỉnh dậy với máu me đầm đìa và lê lết chấm phẩy chạy mãi mà không hề hay biết chân mình đã gãy…
Cũng như phà ra từ không thiếu một câu chuyện nào bởi sự miêu tả tỉ mỉ và gần như bàng quan của tác giả trước những cảnh chết khác nhau của con người.
Dù thế, bằng cách dõi theo những góc khuất trong tâm lý thủ phạm, bằng cách khai thác những tình huống gặp nạn gần gũi với đời sống, bằng cách gia giảm tương đương giữa phạm tội và luận tội, ZOO đã kín đáo thả theo sau luồng hơi lạnh ấy một chút nhân tính, một chút nhân quả, một chút nhân văn.
Bởi vậy cuốn sách này, tuy lạnh giá…
Nhưng rất ít lạnh lùng.', N'NXB Hồng Đức', 8,89, 'Vietnamese', 10.99,0),

( N'Kinh Thánh - Tân Ước', N'Linh mục Nguyễn Thế Thuấn', 'images/kinhthanh.jpg', N'Kinh Thánh lâu nay đã được xem là một tác phẩm kinh điển nhất mọi thời đại với những kỉ lục mà chưa từng có tác phẩm nào vượt qua được như: cuốn sách bán chạy nhất mọi thời đại (hơn 7 tỉ ấn bản được phát hành (ước tính tới năm 2020)); được dịch ra nhiều thứ tiếng nhất (Kinh Thánh trọn bộ được dịch sang 700 ngôn ngữ, và hơn 1.500 ngôn ngữ có bản dịch Tân Ước); cuốn sách được trích dẫn nhiều nhất, có ảnh hưởng nhất và là nguồn cảm hứng cho rất nhiều tác phẩm nghệ thuật nổi tiếng trên thế giới…',
'	Tôn Giáo',7,104, 'Vietnamese', 10.99,0),
( N'Dune', N'Frank Herbert', 'images/Dune.jpg', N'
Một thời điểm rất xa trong tương lai…

Từ đời này sang đời khác, người Fremen trên hành tinh sa mạc lưu truyền lời tiên tri về một đấng cứu tinh sẽ dẫn dắt họ giành lấy tự do đích thực…

Từ thế hệ này sang thế hệ khác, những nữ phù thủy Bene Gesserit mỏi mòn chờ đợi sự xuất hiện của một B.G. nam giới duy nhất, người có thể vượt qua mọi giới hạn không gian - thời gian…

Là Lisal al-Gaib của người Fremen, là Kwisatz Haderach của học viện Bene Gesserit, chàng công tước trẻ tuổi Paul Atreides đã làm tất cả những gì có thể để thay đổi định mệnh đó. Cha bị giết chết, mẹ bị cho là kẻ phản bội, gia tộc bị tàn sát, bản thân bị săn đuổi đến đường cùng, Paul đơn độc dấn thân vào một cuộc phiêu lưu sinh tử, không hề biết rằng mỗi hành động của mình sẽ góp phần quyết định vận mệnh của cả thiên hà. Sa mạc Arrakis khắc nghiệt tưởng như sẽ là nơi chôn vùi vĩnh viễn vinh quang của gia tộc Atreides, nhưng hóa ra lại thành điểm khởi đầu cho một huyền thoại mới…

Là một trong những cuốn tiểu thuyết khoa học giả tưởng bán chạy nhất mọi thời đại, Xứ Cát không chỉ là lựa chọn đối với những tín đồ của Chúa nhẫn, Chiến tranh giữa các vì sao… mà còn chinh phục độc giả đủ mọi lứa tuổi, mọi tầng lớp và sở thích bởi sự đa dạng và phức tạp của con người và không gian trong truyện, bởi sự tinh tế trong xây dựng tâm lý, bởi sự hấp dẫn, căng thẳng và bất ngờ của cốt truyện, bởi sự độc đáo và thú vị của khối lượng kiến thức khổng lồ cũng như bởi sự hấp dẫn trong những tư tưởng về tôn giáo, về tự do, về tình yêu, về sự sống và cái chết…'
, N'Hội nhà văn', 7,82, 'Vietnamese', 18.00,0),
( N'Hoàng tử bé', N'Antoine de Saint Exupéry', 'images/Hoangtube.jpg', N'
“Hoàng Tử Bé” (tên tiếng Pháp: Le Petit Prince) xuất bản năm 1943 và là tác phẩm nối tiếng nhất trong sự nghiệp của nhà văn phi công Pháp Antoine de Saint-Exupéry. Tác phẩm đã được dịch sang hơn 250 ngôn ngữ và cho đến nay đã bán được hơn 200 triệu bản khắp thế giới.



Cuốn sách đẹp như một bài thơ thanh sáng, một câu chuyện cổ tích về tình yêu thương, lòng nhân ái, ý nghĩa của sự tồn tại, về sự cảm thông giữa người với người... Sự giản dị trong sáng tỏa khắp tác phẩm đã khiến nó trở thành một bài thơ bất hủ mà mãi mãi người ta muốn đem làm quà tặng của tình yêu. Cho đến nay, không biết bao nhiêu người đã đọc đi đọc lại tác phẩm này để rồi lần nào cũng lặng đi trong nước mắt.'
, N'Kim Đồng', 5,95, 'Vietnamese', 7.99,0),
( N'Ba Ngày Hạnh Phúc', N'Miaki Sugaru', 'images/bangayhanhphuc.jpg', N'
Thật vô vọng khi thích một người không còn trên thế gian này.



Xem ra từ nay về sau chẳng có một điều tốt lành nào đến với cuộc đời tôi. Chính vì thế mà mỗi năm sinh mệnh của tôi chỉ đáng giá 10.000 yên. Quá bi quan về tương lai, tôi đã bán đi gần hết sinh mệnh của mình. Dù có cố làm gì để được hạnh phúc trong quãng đời ngắn ngủi còn lại, thì tôi cũng chỉ nhận được kết quả trái ngược. Trong khi tôi đang tiếp tục sống vô định thì “người giám sát” Miyagi vẫn đăm đăm nhìn tôi với ánh mắt điềm tĩnh.



Tôi đã mất thêm hai tháng cuộc đời để nhận ra rằng tôi hạnh phúc nhất khi sống vì cô ấy.



Tập truyện nổi tiếng trên web này, cuối cùng cũng được xuất bản!'
, N'NXB Hồng Đức ', 7,112, 'Vietnamese', 12.99,1.99)
,
( N'Lâu Đài Sói', N'	Hilary Mantel', 'images/laudaisoi.jpg', N'
Nước Anh thế kỷ 16 đang đứng trên bờ vực một thảm họa. Nếu nhà vua chết mà không có người thừa kế nam, đất nước có thể sẽ bị hủy diệt bởi nội chiến. Chưa hết, Henry VIII còn muốn chấm dứt cuộc hôn nhân hai mươi năm với hoàng hậu để lấy Anne Boleyn, một mối tình chống lại cả Giáo hoàng lẫn châu Âu kính Chúa. Giữa bối cảnh ấy xuất hiện Thomas Cromwell, một nhân vật cơ trí và tham vọng, vừa tràn đầy lý tưởng vừa cơ hội chủ nghĩa, kẻ đã giúp nhà vua thực hiện được một việc vô tiền khoáng hậu: ly hôn với hoàng hậu, dần ly khai khỏi giáo hội La Mã, và sẵn sàng cho cái giá phải trả để làm được điều ấy.

Hư cấu dựa trên những sự kiện có thật trong lịch sử, cuốn tiểu thuyết từng giành giải Booker 2009 này có thể khiến người đọc rợn ngợp và chùn bước trước số lượng nhân vật, tước hiệu và sự kiện mà nó đưa ra hay ám chỉ tới. Nhưng cũng vì đồ sộ như thế, nhiều màu sắc như thế, và đậm chất lịch sử như thế, nó có một sức hút khó cưỡng. Với Lâu đài sói, Hilary Mantel đã không chỉ kể một câu chuyện. Bà đã làm sống lại cả một thời đại, một đất nước, một dân tộc, một vị vua, một giai đoạn lịch sử đầy biến động đã khuôn hình cho bộ mặt của nước Anh như nó có ngày nay. Không phải loại tiểu thuyết phù hợp để đọc mỗi lần vài trang giữa những lúc chờ đợi tàu xe, dĩ nhiên, nhưng xứng đáng với những buổi tối dài dành riêng cho nó.'
, N'	NXB Văn Học ',6,78, 'Vietnamese', 13.99,0),
( N'Chất Michelle', N'	Hilary Mantel', 'images/chatMichelle.jpg', N'
Nội dung của cuốn sách Chất Michelle là những câu chuyện phản ánh chân thực và sâu sắc cuộc đời Michelle Obama do chính tác giả tự kể. Qua từng trang sách, Michelle dẫn dắt độc giả bước vào thế giới riêng của bà - những trải nghiệm đã góp phần tạo nên tố chất rất riêng của Michelle, từ tuổi thơ ở Chicago đến những năm tháng giữ vị trí điều hành, bí quyết cân bằng áp lực giữa công việc và gia đình, cho đến 8 năm quyền lực sống tại Nhà Trắng.

Với sự chân thực tuyệt đối và chất hóm hỉnh sống động, Michelle kể lại những thành công và cả những thất bại, cả trong chính trường lẫn cuộc sống riêng, kể lại từng lát cắt toàn bộ câu chuyện cuộc đời chính bà đã sống, đã trải qua – bằng một chất văn riêng rất Michelle cùng góc nhìn rất khác biệt.'
, N'Tổng hợp TP.HCM', 9,69, 'Vietnamese', 9.00,0),
( N'Lịch Sử Thế Giới', N'Nguyễn Hiến Lê, Thiên Giang', 'images/lichsuthegioi.jpg', N'
Lịch sử thế giới hay còn gọi là lịch sử loài người, bắt đầu từ thời đại đồ đá cũ đến nay trong quá trình tiến hóa loài người. Đó là một hành trình lịch sử đem đến vĩ đại của loài người như hiện nay, rất đáng đọc và tìm hiểu. 

Lịch sử thế giới là một tác phẩm biên soạn của hai tác giả Nguyễn Hiến Lê và Thiên Giang Trần Kim Bảng. Cuốn sách gần 600 trang được chắt lọc và trình bày theo một trình tự sắp xếp từ thời thượng cổ - trung cổ - thời cận đại - hiện đại.  Nội dung bao gồm nhiều phần, mỗi phần nhiều chương, sau mỗi chương đều có tóm tắt để người đọc lĩnh hội dễ dàng.

Trái đất đã có được hàng triệu năm rồi loài người mới xuất hiện. Sinh sau các loài khác, sức lại yếu, đời lại ngắn, mà nhờ có hai bàn tay, bộ óc và tiếng nói, tổ tiên ta đã kiên nhẫn chống với đói, lạnh, với bệnh tật, với mãnh thú để tồn tại và tiến tới. Những bước tiến đó mới đầu chậm lắm.

Trong hàng trăm ngàn năm, chỉ mới biết gây và giữ lửa rồi đập đá làm những khí cụ thô sơ; sau mới biết mài đá làm những đồ vật tinh xảo hơn, biết trồng lúa, nuôi súc vật, cất nhà sàn, dệt gai bố, nặn đất sét, chế đồ đồng. Và lại biết dùng cả thì giờ rảnh ghi lại những cảnh đẹp đẽ hoặc hãi hùng bằng những nét vẽ, nét đục tinh xảo. 

Như vậy, tám chín ngàn năm trước tổ tiên ta đã thoát khỏi cái đời cầm thú không chỉ lo ăn, lo uống mà muốn vươn lên một đời cao cả đẹp đẽ hơn. Qua thời sau, thời có sử, loài người tiếp tục tiến tới, nhiều khi bước những bước rất dài, có khi đứng yên hoặc lùi lại, nhưng lùi để rồi lại tiến, tiến hoài tới một chân trời xán lạn.

Bắt đầu từ giai đoạn “Bình minh hiện ở cận đông” loài người có chữ viết và bắt đầu truyền lại cho đời sau nên tiến rất mau mà lịch sử cũng nhiều tài liệu, đáng tin hơn. Cũng bắt đầu từ giai đoạn này Nguyễn Hiến Lê bàn về chi tiết các dấu mốc lịch sử và địa danh, sự ra đời của những nền văn minh làm thay đổi cả nhân loại. Sử không thể bàn trong đôi dòng, xin mời quý độc giả đọc, ngẫm và thu lượm những kiến thức về cho riêng mình. 

Từ khi có sử (khoảng 5.000 năm), loài người đã tiến nhanh biết bao. Tiến mạnh nhất là trong khoảng hai thế kỷ nay, từ hồi khoa học bắt đầu phát triển. Hai trăm năm so với dĩ vãng nửa triệu năm và tương lai hàng chục, hàng trăm triệu năm, thực chẳng đáng kể chi cả.

Nếu chỉ sống được nửa triệu năm nữa thôi, thì loài người sẽ tiến tới đâu, không ai có thể tưởng tượng nổi, Câu hỏi: “Chúng ta từ đâu tới” đã được các nhà bác học đáp một cách gần thỏa mãn. Câu hỏi: “Chúng ta sẽ đi tới đâu?” thì vẫn còn nguyên vẹn.'
, N'Hồng Đức',10 ,83, 'Vietnamese', 11.98,2.99)
,( N'Tự lực chưa đủ, mà phải tự chủ', N'Hàn Xuân Trạch', 'images/tuluctuchu.jpg', N'
“Ngày mai mình sẽ hoàn thành tất cả những việc này, bây giờ nghỉ một tý đã.”

“Mấy bài này đọc qua một chút là thuộc, sau khi đi chơi về mình sẽ học.”

Và bao nhiêu lần bạn thực sự hoàn thành đúng kế hoạch bạn đã đề ra như bạn “tưởng”?

Hiểu rõ điểm yếu chí mạng này, tác giả Hàn Xuân Trạch gửi đến các bạn cuốn sách TỰ LỰC CHƯA ĐỦ, MÀ PHẢI TỰ CHỦ. Là tập hai của cuốn KHÔNG PHẢI CHƯA ĐỦ NĂNG LỰC, MÀ LÀ CHƯA ĐỦ KIÊN ĐỊNH, cuốn sách này hứa hẹn giúp các bạn hiểu rõ hơn về “căn bệnh trì hoãn” và “phương thuốc tự chủ”.

TỰ LỰC CHƯA ĐỦ, MÀ PHẢI TỰ CHỦ - Cuốn sách tâm lý học ứng dụng giúp bạn làm chủ cuộc đời mình.'
, N'NXB Thế Giới', 1,110, 'Vietnamese', 12.00,0),
( N'VẠN DẶM ĐƯỜNG TỪ MỘT BƯỚC CHÂN ', N'Mavis ViVu Ký', 'images/vandamduong.jpeg', N'
VẠN DẶM ĐƯỜNG TỪ MỘT BƯỚC CHÂN - HÀNH TRÌNH 6 NĂM ĐI KHẮP 63 TỈNH THÀNH VIỆT NAM

“Vạn dặm đường từ một bước chân” là hành trình của Mavis Vi Vu Ký khám phá 63 tỉnh thành Việt Nam trong 6 năm. Bạn có thể tìm thấy trong 248 trang sách một  Mavis ngây ngô, háo hức trước những điều mới lạ, nhưng theo dòng thời gian, trải qua nhiều sự kiện cũng như thử thách dần trở nên độc lập và mạnh mẽ hơn.

Từng vùng đất trên đất nước hình chữ S hiện lên rất thực và đời dưới góc nhìn của Mavis Vi Vu Ký. Một Pleiku sống động với hàng thông là biển hồ chè rộng lớn, những luống chè xanh ngát nối đuôi nhau trải dài bất tận cùng đập Tân Sơn, ngắm nhìn mặt nước xanh phẳng lặng, bình yên; Hoàng hôn Tà Xùa cũng rất đẹp, lý tưởng bậc nhất có lẽ là ngắm từ khu vực Đỉnh Gió hay Thái Nguyên với nhiều con thác đẹp như tranh với cảnh sắc yên bình và ngoạn mục. Và vô vàn cảnh sắc tươi đẹp khác của thiên nhiên Việt Nam.

Trong hành trình khám phá thiên nhiên đất nước và thế giới nội tâm của chính mình, Mavis cũng có những chuyện dở khóc dở cười như da từng bị cháy nắng dưới nắng gió khắc nghiệt của miền biển; thủng săm xe giữa rừng ngay ở nơi có bảng “khu vực thường có voi rừng xuất hiện”; lạc vào những con đường vô cùng lạ lẫm; xích mích với bạn đồng hành, mỗi người chọn một hướng đi riêng… để từ đó cô có những đúc kết và trải lòng đầy cảm xúc trong “Vạn dặm đường từ một bước chân”.

Không chỉ là một cuốn "cẩm nang du lịch" bình thường, “Vạn dặm đường từ một bước chân” còn là cuốn sách tiếp thêm động lực, truyền lửa đam mê xê dịch và sống hết mình trong mỗi bạn trẻ. “Thật ra điều người ta chinh phục không phải một cột mốc đá, mà là cả một cuộc hành trình. Trong hành trình đó, họ đã chinh phục được những giới hạn của bản thân, từ đó thấy được giới hạn là vô hạn.”

Mong rằng khi gập lại những trang sách cuối cùng, bạn nhận ra chúng ta đều đang đi trên những chặng hành trình riêng biệt. Đôi khi kết quả không giống như xã hội kỳ vọng hay những gì bạn mong đợi ban đầu. Thế nhưng, hãy cứ thả lỏng và sống tốt mỗi ngày, rồi lộ trình của chúng ta đều sẽ rực rỡ theo cách độc đáo nhất!'
, N'NXB Phụ nữ Việt Nam', 11,111, 'Vietnamese', 9.00,0)
,( N'Easy To Cook: 40 Delicious Vietnamese Dishes', N'Ngọc Trân', 'images/etcvietnam.jpg', N'Cuốn sách tập hợp công thức nấu 40 món ngon nổi bật của Việt Nam, theo danh sách gợi ý của CNN, cùng 7 món ăn phụ. Đây là các công thức đơn giản, dễ thực hiện, dành cho những ai đã và sẽ đặt chân đến Việt Nam, từng dùng thử các món ăn địa phương và muốn tự mình nấu món Việt.'
, N'NXB Thế Giới', 12,123, 'Vietnamese', 18.99,1.99),
( N'Nguồn gốc các loài', N'Charles Darwin', 'images/nguongoccacloai.jpg', N'Nguồn gốc các loài là tên rút gọn của cuốn sách Về nguồn gốc các loài qua con đường chọn lọc tự nhiên, hay sự bảo tồn những chủng ưu thế trong đấu tranh sinh tồn (của Charles Darwin, xuất bản năm 1859). Đây là một cuốn sách khoa học hiếm có khi bán hết 1250 bản in lần đầu trong vòng một ngày và trong một thời gian ngắn đã làm “rung chuyển” cả thế giới. Cuốn sách này là kết quả của những quan sát của Darwin trong chuyến đi gần 5 năm, từ 1831 đến 1836, trên con tàu biển Beagle vòng quanh thế giới, cùng với những suy tư và nghiên cứu của ông trong hai mươi năm sau đó, trong đó ông đặt vấn đề có tính quyết định về biến đổi luận hay sự tiến hóa. Sách của ông đã được xuất bản nhiều lần, sửa đổi, liên tục cập nhật cho đến khi ông mất.

“Chúng ta vẫn còn biết ít về mối quan hệ qua lại của vô số cá thể trên thế giới trong suốt nhiều giai đoạn địa chất đã qua. Mặc dù còn nhiều điều mơ hồ và sẽ còn mơ hồ lâu dài nữa, nhưng tôi vẫn tán thành một cách chắc chắn là, sau khi nghiên cứu thận trọng và phán xét vô tư những việc mà tôi có thể làm được, quan điểm, mà hầu hết các nhà tự nhiên học đều tán thành cũng như tôi trước đây đã tán thành – cho rằng các loài được sáng tạo ra một cách độc lập – là sai lầm. Tôi hoàn toàn tin chắc rằng các loài không phải là bất biến; nhưng những loài thuộc vầ cái được gọi là các chủng giống nhau là những hậu duệ trực hệ của những loài khác đã tuyệt chủng hoàn toàn, cũng tương tự như là những biến chủng đã được công nhận của bất cứ loài nào là hậu duệ của những loài đó. Hơn nữa, tôi tin chắc rằng Chọn lọc Tự nhiên là nguyên nhân chính nhưng không phải là nguyên nhân duy nhất của sự biến đổi.”'
, N'NXB Bản Tri Thức', 13,92, 'Vietnamese', 9.00,1.99),
( N'Thơ Trữ Tình Và Hai Truyện Thơ Kapkaz, Đoàn Người Tsigan', N'Puskin', 'images/thotrutinh.jpg', N'Puskin - đại thi hào Nga, đại thi hào thế giới mới bắt đầu được quen biết ở nước ta.
Trước đây, chúng ta đã giới thiệu được một số truyện nổi tiếng của ông, nhưng thơ ông thì đây là tập dịch đầu tiên được in thành sách.
Trong tập thơ tuyển này chúng tôi đã cố gắng lựa chọn dịch một số ít trong số hơn 800 bài thơ trữ tình tiêu biểu cho từng thời kỳ sáng tác của Puskin và cho đến nay vẫn còn được đông đảo quần chúng yêu thích. Ngoài ra có thêm hai truyện thơ nổi tiếng tiêu biểu cho hai giai đoạn, giai đoạn lãng mạn và giai đoạn quá độ từ lãng mạn bước sang hiện thực, trong quá trình sáng tác của Puskin.'
, N'NXB Bản Tri Thức', 13,91, 'Vietnamese', 6.00,0),
( N'[Manga] OVERLORD - Tập 1', N'Maruyama Kugane, Miyama Hugin, Oshio Satoshi', 'images/overlord-1-_manga.jpg', N'Được chuyển thể từ light novel ăn khách cùng tên, Overlord phiên bản truyện tranh xoay quanh nhân vật Momonga, chủ tướng guild Ainz Ooal Gown hùng mạnh trong game YGGDRASIL. Mặc dù đã từng được săn đón nồng nhiệt, song thời gian trôi qua, YGGDRASIL cũng tới ngày phải đóng cửa. Những đồng đội ngày xưa bỏ đi, chỉ còn một mình Momonga ngồi trong đại lăng mộ Nazarick, căn cứ của guild, chờ đợi giây phút kết thúc.
Thế nhưng, khoảnh khắc đóng cửa trôi qua, Momonga nhận ra mình không còn ở trong game YGGDRASIL nữa mà đã bị dịch chuyển đến thế giới khác.
Sau khi cân nhắc hoàn cảnh của bản thân ở thế giới thật (không người thân, bạn bè, người yêu, cũng chẳng có địa vị trong xã hội), Momonga quyết định ở lại thế giới này, bắt đầu hành trình “xâm lược thế giới”...   '
, N'NXB Hà Nội', 8,70, 'Vietnamese', 7.99,0)
;
-- Inserting values into Genres table
INSERT INTO Genres (genre_name)
VALUES
( 'Horror'),( 'Literary Fiction'),( 'Fantasy'),( 'Mystery'),( 'Thriller'),( 'Romance'),( 'Historical Fiction'),
( 'Biography'),( 'Memoir'),( 'History'),( 'Self-help'),('Travel'),
( 'Cookbooks'),( 'Science'),( 'Philosophy'),('Lyric Poetry'),('Narrative Poetry'),('Religious'),
('Epic Poetry'),('Drama'),('Comics'),
('Classic'),('detective'),('mentality'),('aventures'),('sci-fi');
--(2, 'Tiểu thuyết văn học'),(4, 'Bí ẩn'),(5, 'giat gan'),( 7, 'Tiểu thuyết lịch sử'),(8, 'Tiểu sử'),(9, 'Hồi ký'),(15, 'Triết học'),(16, 'Thơ trữ tình'),(17, 'Thơ tự sự'),(17, 'Tôn giáo'),(18, 'Thơ sử thi')
-- Inserting values into Book_Genres table
INSERT INTO Book_Genres (book_id, genre_id)
VALUES
(1, 24),(1, 23),(2, 2),(3, 2),(3, 1),(3, 4),(3, 5),(4, 2),(5, 3),(5, 4),(5, 25),(6, 23),(6, 1),(7, 9),(8,8),(9,1),(9,5),(9,23),(10,8),(10,2),(11,1),(11,5),
(12, 18),(13,25),(13,26),(14,25),(14,4),(14,3),(14, 2),(15, 2),(15,6),(16, 7),(17, 9),(18, 10),(19, 11),(20,12),(21,13),(22,14),(23,16),(23,17),(24,21),(24,3);


-- Inserting values into Order_Items table
INSERT INTO Order_Items (order_id, book_id, quantity, price)
VALUES
(1, 1, 2, 26.00),(1, 2, 1, 12.00),(2,1, 1, 13.00),(3,5, 2, 24.00),(3, 3, 2, 16.00),
(3, 6, 1,9.00  ),(4,14, 1,7.99 ),(4,21, 1,18.99 ),(5, 6, 3,27.00),(6, 22, 2,14.02),
(7,11, 3, 32.97),(7, 15, 1,11.00  ),(8, 18, 1,8.99 ),(9, 10, 3,38.97),(9, 8, 1,8.99 );

select * from books

--xoa ca cus_id ben order va customers 
ALTER TABLE dbo.Orders
ADD CONSTRAINT FK__Orders
FOREIGN KEY (cus_id)
REFERENCES dbo.Customers(cus_id)
ON DELETE CASCADE; 




ALTER TABLE Book_Genres
ADD CONSTRAINT FK_Book_Genres_Books FOREIGN KEY (book_id)
REFERENCES Books(book_id) ON DELETE CASCADE;
-- Delete associated records from Book_Genres table


-- Then delete the book from the Books table


BEGIN TRANSACTION;
DELETE FROM Book_Genres WHERE book_id = 12;
DELETE FROM Books WHERE book_id = 12;
COMMIT;

CREATE TABLE Genres (
  genre_id INT PRIMARY KEY NOT NULL,
  genre_name NVARCHAR(255) NOT NULL
);

select * from Books
Delete from Customers where cus_id=11
DROP TABLE Order_Items;
DROP TABLE Book_Genres;
DROP TABLE Genres;
DROP TABLE Books;
DROP TABLE Orders;
DROP TABLE Customers;

Select * from books
delete from genres

-- Delete records from the "Books" table where book_id matches the provided parameter
DELETE FROM Books WHERE book_id = 1;
DELETE FROM [dbo].[Customers]
       WHERE cus_id=2
delete from Orders where order_id=2
DELETE FROM [dbo].[Genres] WHERE genre_id=2
ALTER TABLE Books
DROP CONSTRAINT FK__Books__supplier___3A379A64;
ALTER TABLE Orders
DROP CONSTRAINT FK__Orders__cus_id__375B2DB9;
ALTER TABLE Order_Items
DROP CONSTRAINT FK__Order_Ite__order__41D8BC2C;
ALTER TABLE Book_Genres
DROP CONSTRAINT FK__Book_Genr__genre__3FF073BA;




SELECT TOP(1) * FROM dbo.Orders o ORDER BY o.order_id DESC
SELECT b.book_id, b.title, b.author, b.image, b.description, b.Publishing_company, b.Language, s.supplier_name,b.Unit_Price
FROM [dbo].[Books] b 
JOIN Suppliers s ON s.supplier_id = b.supplier_id 
JOIN Book_Genres bg ON bg.book_id=b.book_id
WHERE b.book_id = 1;
SELECT g.genre_name 
FROM [dbo].[Genres] g 
JOIN [dbo].[Book_Genres] bg ON g.genre_id = bg.genre_id
JOIN [dbo].[Books] b ON b.book_id = bg.book_id
WHERE b.book_id = 1;
UPDATE Books
SET 
    title = N'OVERLORD - Tập 1'
	where book_id = 24
	select * from books
	select  * from books order by title 
select * from books b order by b.Unit_Price desc offset 0 row fetch next 6 rows only 
SELECT count(*)
FROM [dbo].[Orders]
WHERE MONTH(order_date) = MONTH(GETDATE())
AND YEAR(order_date) = YEAR(GETDATE());











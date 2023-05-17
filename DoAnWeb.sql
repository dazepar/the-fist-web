use master

create database DoAnWeb
GO
USE DoAnWeb
GO
create table KHACHHANG
(
MaKH int identity(1,1),
HoTenKH nvarchar(30),
DiaChiKH nvarchar(50),
DienThoaiKH varchar(20),
TenDN varchar(30) unique,
MatKhau varchar(30),
NgaySinh smalldatetime,
GioiTinh bit default 1,
Email varchar(50) unique,
DaDuyet bit default 0,
constraint PK_KHACHHANG primary key(MaKH)
)

GO
create table DONDATHANG
(
SoDH int identity(1,1),
MaKH int,
NgayDH smalldatetime,
TriGia money check(TriGia>0),
DaGiao bit default 0,
NgayGiaoHang smalldatetime,
TenNguoiNhan nvarchar(50),
DiaChiNhan nvarchar(50),
DienThoaiNhan varchar(20),
HTThanhToan bit default 0,
HTGiaoHang bit default 0,
constraint PK_DONDATHANG primary key(SoDH)
)
GO
create table CTDONHANG
(
SoDH int,
MaPhim int,
SoLuong int check(SoLuong >0),
DonGia decimal(9,2) check (DonGia >=0),
ThanhTien as SoLuong*DonGia,
Constraint PK_CTDONHANG primary key(SoDH,MaPhim)
)

--drop table CTDONHANG
GO

Create table PHIM
(
MaPhim int identity(1,1),
TenPhim nvarchar(100),
DonGia money check (DonGia>=0),
MoTa ntext,
HinhMinhHoa varchar(50),
MaTL int,
NgayCapNhat smalldatetime,
SoLuongBan int check(SoLuongBan>0),
SoLanXem int default 0,
constraint PK_PHIM primary key(MaPhim)
)
GO
create table DAODIEN
(
MaDD int identity(1,1),
TenDD nvarchar(50),
DiaChiDD nvarchar(50),
DienThoaiDD varchar(20),
constraint PK_DAODIEN primary key(MaDD)
)
GO
create table VIETPHIM
(
MaDD int,
MaPhim int,
VaiTro nvarchar(50),
constraint PK_VIETPHIM primary key (MaDD,MaPhim)
)
GO
create table THELOAI
(
MaTL int identity(1,1),
TenTL nvarchar(50),
constraint PK_THELOAI primary key(MaTL)
)
GO
-- Bang AdminUser
CREATE TABLE [dbo].[AdminUser] (
    [ID]           INT            NOT NULL,
    [NameUser]     NVARCHAR (MAX) NULL,
    [RoleUser]     NVARCHAR (MAX) NULL,
    [PasswordUser] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

alter table PHIM add constraint FK_PHIM_THELOAI foreign key (MaTL)references THELOAI(MaTL)
alter table VIETPHIM add constraint FK_VIETPHIM_DAODIEN foreign key(MaDD)references DAODIEN(MaDD)
alter table VIETPHIM add constraint FK_VIETPHIM_PHIM foreign key(MaPhim) references PHIM(MaPhim)
alter table DONDATHANG add constraint FK_DONDATHANG_KHACHHANG foreign key(MaKH) references KHACHHANG(MaKH)
alter table CTDONHANG add constraint FK_CTDONHANG_DONDATHANG foreign key (SoDH) references DONDATHANG(SoDH)
alter table CTDONHANG add constraint FK_CTDONHANG_PHIM foreign key(SoDH) references PHIM(MaPhim)
GO


SET IDENTITY_INSERT [dbo].[THELOAI] ON
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (1,N'Hành Động')
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (2,N'Viễn Tưởng')
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (3,N'Lãng Mạn')
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (4,N'Kinh Dị')
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (5,N'Võ Thuật')
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (6,N'Hài Hước')
SET IDENTITY_INSERT [dbo].[THELOAI] OFF


SET IDENTITY_INSERT [dbo].[KHACHHANG] ON
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email]) 
VALUES (1, N'Đào Nguyễn Tuấn Anh', N'Đồng Nai', N'0328510990', N'Admin', N'12345', CAST(0x59310000 AS SmallDateTime), 1, N'tuananh95ndc@gmail.com')

SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF


SET IDENTITY_INSERT [dbo].[DAODIEN] ON
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (1, N'Phạm Công Anh', N'197 Trần Hưng Đạo', N'98877668')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (2, N'Nguyễn Thế Giang', N'179 Chánh hưng - F.4 - Q.8 Tp.HCM', N'19001611')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (3, N'Lê Việt Nhân', N'45 Lý Thái Tổ-F2.Q.3 Tp.HCM', N'19001570')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (4, N'Hồng Phúc', N'', N'')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (5, N'Ks.Phạm Quang Huy', N'', N'')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (6, N'Nguyễn Bá Tiến', N'', N'')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (7, N'Phạm Hữu Khang', N'', N'')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (8, N'Nguyễn Minh Đức', NULL, NULL)
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (9, N'Trần Văn Lăng', NULL, NULL)
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (10, N'Quách Tuấn Ngọc', NULL, NULL)
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (11, N'Nguyễn Xuân Huy', NULL, NULL)
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (12, N'Đoàn Khắc Độ', NULL, NULL)
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (13, N'Nguyễn Tấn Tín', N'179 Chánh Hưng F.4 Q.8 Tp.HCM', N'8504122')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (14, N'Phạm Phan Trung', N'124 Bắc Hải P.6 Q.TB', N'0918121188')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (15, N'TS. Nguyễn Phương Liên', N'', N'')
INSERT [dbo].[DAODIEN] ([MaDD], [TenDD], [DiaChiDD], [DienThoaiDD]) VALUES (16, N'BS. Vũ Thị Uyên Thanh', N'', N'')
SET IDENTITY_INSERT [dbo].[DAODIEN] OFF


SET IDENTITY_INSERT [dbo].[PHIM] ON
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (1,'Overlord',26000,N'Phim lấy bối cảnh năm 2138 khi con người không phân biệt được đâu thực, đâu ảo. Yggdrasil - một trò chơi online nổi tiếng đã bị âm thầm đóng cửa trong quá khứ. Tuy nhiên, một top-player mang tên Momonga đã quyết sống chết cùng trò chơi này.',N'overlord.jpg',3,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (2,'Lycoris Recoil',12000,N'Câu chuyện lấy bối cảnh ở "Lyco-Reco" một quán cà phê kiểu Nhật ở khu trung tâm cổ kính của Tokyo. Quán cà phê nhận đặt hàng bất cứ thứ gì, từ cà phê ngon đến đồ ngọt... "Bất kể bạn gọi món gì, chúng tôi sẽ phục vụ tận nơi...!".',N'lycoris.jpg',1,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (3,'Demon Slayer',11500,N'Vào thời xa xưa, có một truyền thuyết về những con quỷ ăn thịt người luôn lảng vảng trong cánh rừng sâu. Vì điều này, người dân trong làng không bao giờ đi ra ngoài vào trời tối. Truyền thuyết cũng kể rằng có một Sát Quỷ Nhân luôn xuất hiện vào ban đêm để tiêu diệt những con quỷ khát máu này. Đối với chàng trai trẻ Tanjiro, câu chuyện dân gian ấy đã trở thành hiện thực cay đắng mà cậu phải hứng chịu...',N'kimetsu.jpg',1,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (4,'One Piece',20000,N'Monkey D. Luffy, 1 cậu bé rất thích Đảo hải tặc có ước mơ tìm được kho báu One Piece và trở thành Vua hải tặc - Pirate King. Lúc nhỏ, Luffy tình cờ ăn phải trái quỉ (Devil Fruit) Gomu Gomu, nó cho cơ thể cậu khả năng co dãn đàn hồi như cao su nhưng đổi lại cậu sẽ không bao giờ biết bơi. Sau đó Luffy lại được Shank cứu thoát tuy nhiên ông ta bị mất 1 cánh tay. Sau đấy Shank chia tay Luffy và để lại cho cậu cái mũ rơm (Straw Hat) và nói rằng: Sau này bao giờ thành cướp biển hãy gặp ta và trả lại nó. Chính lời nói này đã thúc đầy Luffy trở thành 1 cướp biển thật sự.',N'onepiece.jpg',1,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (5,'komi cant communicate',20000,N'Tadano Hitohito, một cậu chàng tầm thường được nhận học vào trường danh tiếng nhất vùng. Cứ tưởng rằng cuộc đời cao trung của mình sẽ yên bình. Trớ trêu thay, cậu lại ngồi cạnh bàn người đẹp Komi-san được coi là hoa khôi của trường ngày từ ngày đầu tiên đi học. Tồi tệ hơn khi cô hoa khôi này lại mắc phải chứng khó giao tiếp...',N'komi.jpg',3,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (6,'Hero Academia',21000,N'Izuku có một ước mở trở thành anh hùng từ khi còn nhỏ - là mục tiêu cao nhất mà ai cũng muốn đạt được - nhưng đó lại là một thách thức đối với một cậu bé không hề có tí năng lực siêu nhiên nào. Đúng thế, ở một cái thế giới mà hơn 80% dân số đều có một loại siêu năng lực "một cách lạ thường", Izuku không may mắn khi sinh lại hoàn toàn bình thường. Nhưng việc đó cũng không thể ngăn cản việc cậu ghi danh vào học viện anh hùng được xem là uy tín hàng đầu thế giới.',N'hero.jpg',1,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (7,'Dragon Ball',18000,N'Mở đầu phim Dragon Ball (7 Viên Ngọc Rồng) một cậu bé có đuôi khỉ tên là Goku được tìm thấy bởi một ông lão sống một mình trong rừng, ông lão xem đứa bé như là cháu của mình. Một ngày nọ Goku tình cờ gặp một cô gái tên là Bulma trên đường đi bắt cá về, Goku và Bulma đã cùng nhau truy tìm bảy viên ngọc rồng. Bảy viên ngọc rồng chứa đựng một bí mật có thể triệu hồi một con rồng và ban điều ước cho ai sở hữu chúng. Trên cuộc hành trình dài đi tìm bảy viên ngọc rồng, họ gặp những người bạn và những đấu sĩ huyền thoại cũng như nhiều ác quỷ. Họ trải qua những khó khăn và học hỏi các chiêu thức võ thuật đặc biệt để tham gia thi đấu trong đại hội võ thuật thế giới được tổ chức hằng năm',N'dragonball.jpg',1,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (8,'Re:Zero',61000,N'Subaru Natsuki là một học sinh cấp 3 bình thường bị lạc sang một thế giới khác. Sau khi được một cô gái tóc bạch kim xinh đẹp cứu, cậu đã ở bên cô ấy để trả ơn, nhưng số phận mà cô phải gánh chịu còn lớn hơn cậu tưởng tượng. Kẻ địch cứ tấn công không ngừng, và cả hai bọn họ đều bị giết. Rồi cậu phát hiện ra mình có năng lực đảo ngược thời gian, quay lại lúc cậu mới đến thế giới này. Tuy nhiên, không ai nhớ được những gì đã xảy ra ngoại trừ cậu.',N'ReZero.jpg',2,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (9,'Konosuba',25000,N'Cuộc sống của chàng trai hikikomori cực kì yêu thích game - Satou Kazuma, đã gặp phải một tai nạn thảm khốc (!... tuy cậu đã nghĩ như vậy nhưng, khi mở mắt ra, một thiếu nữ xinh đẹp đang ở trước mắt cậu và tự xưng là nữ thần. Nè, tôi có một chuyện thú vị muốn bàn với cậu đây. Cậu có muốn đến thế giới khác không. ...Vậy, tôi chọn cô. Thế là cuộc phiêu lưu lên đường tìm diệt ma vương thật ở thế giới khác bắt đầu! Tuy Kazuma muốn được sống bình yên nhưng nhỏ nữ thần này cứ liên tục gây ra một chuỗi rắc rối, rốt cuộc đã khiến đội quân ma vương để mắt đến!?',N'Konosuba.jpg',6,CAST('2022-06-05' AS datetime),100,0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [DonGia], [MoTa], [HinhMinhHoa], [MaTL], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (10,'Spy x Family',85000,N'Siêu điệp viên ngầu lòi mật danh "Twilight" nhận được nhiệm vụ tiếp cận một mục tiêu có ảnh hưởng hết sức nghiêm trọng đến nền hòa bình thế giới. Để làm được điều đó, trước tiên anh phải xây dựng cho mình một vỏ bọc là một gia đình hạnh phúc và đứa con học trong ngôi trường danh giá. Bằng các biện pháp nghiệp vụ, anh lập tức hack ra được một bé gái đáng yêu và sau đó là một cô vợ xinh xắn hiền thục. Và từ đó, một gia đình hạnh phúc kiểu mẫu được hình thành.',N'spyxfamily.jpg',6,CAST('2022-06-05' AS datetime),100,0)
SET IDENTITY_INSERT [dbo].[PHIM] OFF

INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(1, 1, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(2, 1, N'Đồng tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(3, 2, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(4, 2, N'Chủ biên')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(5, 3, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(6, 3, N'Hiệu đính')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(7, 4, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(8, 4, N'Sưu tầm và biên soạn')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(9, 4, N'Chủ biên')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(10, 5, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(11, 5, N'Đồng tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(12, 6, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(13, 7, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(14, 8, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(15, 9, N'Tác giả')
INSERT [dbo].[VIETPHIM] ([MaDD], [MaPhim],[VaiTro]) VALUES(16, 10, N'Tác giả')

--SET IDENTITY_INSERT [dbo].[DONDATHANG] ON
--INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [TriGia],[DaGiao],[NgayGiaoHang]) VALUES (1,1,CAST('2022-06-05' AS datetime), CAST(750000.00 as decimal(9,2)),0,CAST('2022-06-10' as datetime))
--INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [TriGia],[DaGiao],[NgayGiaoHang]) VALUES (2,1,CAST('2022-06-05' as datetime), CAST(65000.00 as decimal(9,2)), 0,CAST('2022-06-10' as datetime))
--SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF

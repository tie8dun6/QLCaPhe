CREATE DATABASE AGILE;

CREATE Table NguoiDung(
TenDangNhap nvarchar(30) not null,
MatKhau nvarchar(30) null,
Constraint pk_NguoiDung primary key(TenDangNhap)
);

CREATE Table KhachHang(
MaKH nvarchar(30)  not null,
TenKH nvarchar(50) null,
GioiTinh nvarchar(20) null,
DiaChi nvarchar(60) null,
SDT varchar(30) null,
Constraint pk_KhachHang primary key(MaKH)
);
if OBJECT_ID('Ban') is not null
drop table Ban
CREATE TABLE Ban(
MaBan nvarchar(30) ,
TenBan nvarchar(30) ,
TrangThai nvarchar(30),
CONSTRAINT PK_Ban PRIMARY KEY(MaBan)
);

Create table NhanVien(
MaNV nvarchar(30) ,
TenNV nvarchar(50),
GioiTinh nvarchar(20),
SDT varchar(30) ,
UsernameNV nvarchar(50),
PassWordNV nvarchar(50),
ChucVu nvarchar(30),
DiaChi nvarchar(30),
CONSTRAINT PK_NhanVien PRIMARY KEY(MaNV)
);

CREATE TABLE SanPham(
MaSanPham nvarchar(30),
TenSanPham nvarchar(50),
DonGia float,
SoLuong int ,
Anh VARBINARY(max),
GioiThieu nvarchar(30),
CONSTRAINT PK_SanPham PRIMARY KEY(MaSanPham)
);

Create table  HoaDon(
MaHoaDon nvarchar(30),
MaKH nvarchar(30),
MaBan nvarchar(30) ,
MaNhanVien nvarchar(30),
NgayBan datetime,
CONSTRAINT PK_HoaDon Primary key (MaHoaDon),
CONSTRAINT FK_HoaDon_KhachHang foreign key(MaKH) references KhachHang(MaKH),
CONSTRAINT FK_HoaDon_Ban foreign key(MaBan) references Ban(MaBan),
CONSTRAINT FK_HoaDon_NhanVien foreign key(MaNhanVien) references NhanVien(MaNV),
);

Create table HoaDonCT(
MaHoaDon nvarchar(30),
MaSanPham nvarchar(30),
SoLuong int,
DonGia float,
CONSTRAINT FK_HoaDonCT_HoaDon foreign key(MaHoaDon) references HoaDon(MaHoaDon),
CONSTRAINT FK_HoaDonCT_SanPham foreign key(MaSanPham) references SanPham(MaSanPham),
);
select * from NguoiDung
insert into NguoiDung Values
('quanlicaphe','12345'),
	('tuanlv123','12345'),
	('nam456','12345'),
	('van123','12345'),
	('le987','12345'),
	('yen567','12345')
INSERT INTO NhanVien(MaNV,TenNV,GioiTinh,SDT,UsernameNV,PassWordNV,ChucVu,DiaChi) VALUES(
	'NV1',N'Tuấn','Nam','0914523296','tuanlv123','12345',N'Pha Chế','Nam Dinh'),
	('NV2',N'Nam','Nam','0914545645','nam456','12345',N'Phục Vụ','Ha Noi'),
	('NV3',N'Vân',N'Nữ','099346346','van123','12345',N'Pha Chế','Thai Binh'),
	('NV4',N'Lê',N'Nam','0914546546','le987','12345',N'Phục Vụ','Hai Phong'),
	('NV5',N'Yến',N'Nam','09135433296','yen567','12345',N'Pha Chế','Nghe An')
select * from NhanVien
SELECT* FROM SanPham
INSERT INTO SanPham VALUES
( 'SP01',N'Cà Phê Phin','30000',5,NULL,N'Sản Phẩm Được Ưa Thích'),
( 'SP02',N'Cà Phê Sữa','35000',10,NULL,N'Vị Ngọt Từ Sữa'),
( 'SP03',N'CaCao Cốt Dừa','40000',9,NULL,N'Thơm Ngậy Vị Dừa'),
( 'SP04',N'Cà Phê Mocha','30000',11,NULL,N'Sản Phẩm Được Ưa Thích'),
( 'SP05',N'MACCHIATO','35000',8,NULL,N'Sản Phẩm Được Ưa Thích')
select * from Ban
INSERT INTO Ban VALUES
('VP1','VIP1',N'Trống'),
('VP2','VIP2',N'Đã có người ngồi'),
('VP3','VIP3',N'Trống'),
('VP4','VIP4',N'Đã có người ngồi'),
('VP5','VIP5',N'Trống'),
('TH1',N'THƯỜNG 1',N'Đã có người ngồi'),
('TH2',N'THƯỜNG 2',N'Trống'),
('TH3',N'THƯỜNG 3',N'Trống'),
('TH4',N'THƯỜNG 4',N'Đã có người ngồi'),
('TH5',N'THƯỜNG 5',N'Đã có người ngồi')
select * from KhachHang
INSERT INTO KhachHang VALUES
('KH01',N'Minh',N'Nam',N'Hà Nội','0914523296'),
('KH02',N'Hiếu',N'Nam',N'Thanh Hóa','09144633296'),
('KH03',N'Thảo',N'Nữ',N'Nam Định','091434634'),
('KH04',N'Phương',N'Nữ',N'Hà Nội','0914253453'),
('KH05',N'Xuân',N'Nữ',N'Hải Dương','0914523455'),
('KH06',N'Minh',N'Nam',N'Thái Bình','09159374325'),
('KH07',N'Huy',N'Nam',N'Hà Nội','0914563536'),
('KH08',N'Vũ',N'Nam',N'Thanh Hóa','0914984635')
select * from HoaDon
INSERT INTO HoaDon VALUES
('HD01','KH01','VP1','NV1','2022/8/4'),
('HD02','KH02','VP2','NV3','2022/8/2'),
('HD03','KH03','VP3','NV5','2022/7/23'),
('HD04','KH04','VP4','NV1','2022/7/2'),
('HD05','KH05','VP5','NV2','2022/6/7'),
('HD06','KH06','TH1','NV2','2022/5/12'),
('HD07','KH07','TH1','NV4','2022/6/18')
select * from HoaDonCT
INSERT INTO HoaDonCT VALUES
('HD01','SP01',5,'30000'),
('HD02','SP02',2,'35000'),
('HD03','SP04',4,'30000'),
('HD04','SP05',3,'35000'),
('HD05','SP02',1,'35000'),
('HD06','SP05',3,'35000'),
('HD07','SP03',4,'40000')
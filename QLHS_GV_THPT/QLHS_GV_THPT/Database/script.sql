USE [master]
GO
/****** Object:  Database [TT_QLHS]    Script Date: 06/29/2021 8:15:38 AM ******/
CREATE DATABASE [TT_QLHS] CONTAINMENT = NONE
go
ALTER DATABASE [TT_QLHS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TT_QLHS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TT_QLHS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TT_QLHS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TT_QLHS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TT_QLHS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TT_QLHS] SET ARITHABORT OFF 
GO
ALTER DATABASE [TT_QLHS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TT_QLHS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TT_QLHS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TT_QLHS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TT_QLHS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TT_QLHS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TT_QLHS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TT_QLHS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TT_QLHS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TT_QLHS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TT_QLHS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TT_QLHS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TT_QLHS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TT_QLHS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TT_QLHS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TT_QLHS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TT_QLHS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TT_QLHS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TT_QLHS] SET  MULTI_USER 
GO
ALTER DATABASE [TT_QLHS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TT_QLHS] SET DB_CHAINING OFF 
GO
USE [TT_QLHS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 06/29/2021 8:15:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Email] [varchar](50) NULL,
	[GioiTinh] [nchar](10) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BangDiem]    Script Date: 06/29/2021 8:15:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangDiem](
	[idBangDiem] [int] IDENTITY(1,1) NOT NULL,
	[diem15phut] [float] NULL,
	[diem45phut] [float] NULL,
	[diemHocKi] [float] NULL,
	[idMonHoc] [int] NULL,
	[idHocSinh] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBangDiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 06/29/2021 8:15:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[idGiaoVien] [int] IDENTITY(1,1) NOT NULL,
	[tenGiaoVien] [nvarchar](50) NOT NULL,
	[gioiTinh] [nvarchar](4) NULL,
	[ngaySinh] [date] NULL,
	[soDienThoai] [nvarchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[idGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 06/29/2021 8:15:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocSinh](
	[idHocSinh] [int] IDENTITY(1,1) NOT NULL,
	[tenHocSinh] [nvarchar](50) NOT NULL,
	[gioiTinh] [nvarchar](4) NULL,
	[ngaySinh] [date] NULL,
	[idLopHoc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 06/29/2021 8:15:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHoc](
	[idLopHoc] [int] IDENTITY(1,1) NOT NULL,
	[tenLopHoc] [nvarchar](50) NOT NULL,
	[tenKhoi] [nvarchar](3) NULL,
	[namHoc] [nvarchar](20) NULL,
	[idGiaoVienChuNhiem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLopHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 06/29/2021 8:15:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[idMonHoc] [int] IDENTITY(1,1) NOT NULL,
	[tenMonHoc] [nvarchar](50) NOT NULL,
	[soTietHoc] [int] NULL,
	[namHoc] [nvarchar](10) NULL,
	[kiHoc] [int] NULL,
	[idGiaoVien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Email], [GioiTinh], [Password]) VALUES (N'thiepdepzai2k@gmail.com', N'Nam       ', N'thiep2000')
INSERT [dbo].[Account] ([Email], [GioiTinh], [Password]) VALUES (N'trantrungthiep13022000@gmail.com', N'Nam       ', N'thiep2000')
INSERT [dbo].[Account] ([Email], [GioiTinh], [Password]) VALUES (N'123', N'Nam       ', N'123')
GO
SET IDENTITY_INSERT [dbo].[BangDiem] ON 

INSERT [dbo].[BangDiem] ([idBangDiem], [diem15phut], [diem45phut], [diemHocKi], [idMonHoc], [idHocSinh]) VALUES (1, 8, 7.5, 7.5, 5, 1)
INSERT [dbo].[BangDiem] ([idBangDiem], [diem15phut], [diem45phut], [diemHocKi], [idMonHoc], [idHocSinh]) VALUES (3, 7.5, 7.5, 7.5, 1, 3)
INSERT [dbo].[BangDiem] ([idBangDiem], [diem15phut], [diem45phut], [diemHocKi], [idMonHoc], [idHocSinh]) VALUES (4, 7.5, 7.5, 7.5, 2, 1)
INSERT [dbo].[BangDiem] ([idBangDiem], [diem15phut], [diem45phut], [diemHocKi], [idMonHoc], [idHocSinh]) VALUES (6, 7.5, 7.5, 7.5, 2, 3)
INSERT [dbo].[BangDiem] ([idBangDiem], [diem15phut], [diem45phut], [diemHocKi], [idMonHoc], [idHocSinh]) VALUES (17, 7.5, 7.5, 7.5, 5, 3)
SET IDENTITY_INSERT [dbo].[BangDiem] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaoVien] ON 

INSERT [dbo].[GiaoVien] ([idGiaoVien], [tenGiaoVien], [gioiTinh], [ngaySinh], [soDienThoai]) VALUES (1, N'Nguyễn Thanh Huyền', N'Nữ', CAST(N'1996-12-01' AS Date), N'0973909306')
INSERT [dbo].[GiaoVien] ([idGiaoVien], [tenGiaoVien], [gioiTinh], [ngaySinh], [soDienThoai]) VALUES (2, N'Hoàng Nguyên Hải', N'Nam', CAST(N'1990-12-01' AS Date), N'0973909306')
INSERT [dbo].[GiaoVien] ([idGiaoVien], [tenGiaoVien], [gioiTinh], [ngaySinh], [soDienThoai]) VALUES (3, N'Nguyễn Đức Thanh', N'Nam', CAST(N'1990-12-01' AS Date), N'0973909306')
INSERT [dbo].[GiaoVien] ([idGiaoVien], [tenGiaoVien], [gioiTinh], [ngaySinh], [soDienThoai]) VALUES (4, N'Nguyễn Minh Ngọc', N'Nữ', CAST(N'1992-12-01' AS Date), N'0973909306')
INSERT [dbo].[GiaoVien] ([idGiaoVien], [tenGiaoVien], [gioiTinh], [ngaySinh], [soDienThoai]) VALUES (5, N'Nguyễn Thanh Tâm', N'Nữ', CAST(N'1994-12-01' AS Date), N'0973909306')
INSERT [dbo].[GiaoVien] ([idGiaoVien], [tenGiaoVien], [gioiTinh], [ngaySinh], [soDienThoai]) VALUES (6, N'Nguyễn Đức Hoàng', N'Nam', CAST(N'1992-12-01' AS Date), N'0973909306')
INSERT [dbo].[GiaoVien] ([idGiaoVien], [tenGiaoVien], [gioiTinh], [ngaySinh], [soDienThoai]) VALUES (7, N'Nguyễn Văn Hùng', N'Nam', CAST(N'1996-12-01' AS Date), N'0973909306')
SET IDENTITY_INSERT [dbo].[GiaoVien] OFF
GO
SET IDENTITY_INSERT [dbo].[HocSinh] ON 

INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (1, N'Nguyễn Văn A 1', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (3, N'Nguyễn Văn A 3', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (4, N'Nguyễn Văn A 4', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (5, N'Nguyễn Văn A 5', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (7, N'Nguyễn Văn A 7', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (8, N'Nguyễn Văn A 8', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (9, N'Nguyễn Văn A 9', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (10, N'Nguyễn Văn A 10', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (11, N'Nguyễn Văn A 11', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (12, N'Nguyễn Văn A 12', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (13, N'Nguyễn Văn A 13', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (14, N'Nguyễn Văn A 14', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (15, N'Nguyễn Văn A 15', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (16, N'Nguyễn Văn A 16', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (17, N'Nguyễn Văn A 1', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (18, N'Nguyễn Văn A 2', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (19, N'Nguyễn Văn A 3', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (20, N'Nguyễn Văn A 4', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (21, N'Nguyễn Văn A 5', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (22, N'Nguyễn Văn A 6', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (23, N'Nguyễn Văn A 7', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (24, N'Nguyễn Văn A 8', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (25, N'Nguyễn Văn A 9', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (26, N'Nguyễn Văn A 10', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (27, N'Nguyễn Văn A 11', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (28, N'Nguyễn Văn A 12', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (29, N'Nguyễn Văn A 13', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (31, N'Nguyễn Văn A 15', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (32, N'Nguyễn Văn A 16', N'Nữ', CAST(N'1998-12-11' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (33, N'Nguyễn Văn A 17', N'Nam', CAST(N'2000-02-13' AS Date), 2)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (34, N'Nguyễn Văn A 2', N'Nữ', CAST(N'1998-12-11' AS Date), 1)
INSERT [dbo].[HocSinh] ([idHocSinh], [tenHocSinh], [gioiTinh], [ngaySinh], [idLopHoc]) VALUES (39, N'Tran trung thiep', N'Nam', CAST(N'2000-02-13' AS Date), 2)
SET IDENTITY_INSERT [dbo].[HocSinh] OFF
GO
SET IDENTITY_INSERT [dbo].[LopHoc] ON 

INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (1, N'10', N'A', N'2018 - 2019', 1)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (2, N'10', N'B', N'2018 - 2019', 2)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (3, N'10', N'C', N'2018 - 2019', 3)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (4, N'11', N'A', N'2018 - 2019', 4)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (5, N'11', N'B', N'2018 - 2019', 5)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (6, N'11', N'C', N'2018 - 2019', 6)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (7, N'12', N'A', N'2018 - 2019', 7)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (8, N'12', N'B', N'2018 - 2019', 3)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (9, N'12', N'C', N'2018 - 2019', 4)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (10, N'10', N'A', N'2018 - 2019', 1)
INSERT [dbo].[LopHoc] ([idLopHoc], [tenLopHoc], [tenKhoi], [namHoc], [idGiaoVienChuNhiem]) VALUES (16, N'11', N'C', N'2018 - 2020', 2)
SET IDENTITY_INSERT [dbo].[LopHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[MonHoc] ON 

INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTietHoc], [namHoc], [kiHoc], [idGiaoVien]) VALUES (1, N'Toán', 45, N'2018-2019', 1, 1)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTietHoc], [namHoc], [kiHoc], [idGiaoVien]) VALUES (2, N'Văn', 45, N'2018-2019', 1, 1)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTietHoc], [namHoc], [kiHoc], [idGiaoVien]) VALUES (3, N'Tiếng Anh', 45, N'2018-2019', 1, 1)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTietHoc], [namHoc], [kiHoc], [idGiaoVien]) VALUES (4, N'Lập trình', 45, N'2018-2019', 1, 1)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTietHoc], [namHoc], [kiHoc], [idGiaoVien]) VALUES (5, N'hóa', 45, N'2018-2019', 2, 5)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTietHoc], [namHoc], [kiHoc], [idGiaoVien]) VALUES (6, N'Lịch sử', 45, N'2018-2019', 1, 1)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTietHoc], [namHoc], [kiHoc], [idGiaoVien]) VALUES (7, N'Giáo dục công dân', 45, N'2018-2019', 1, 1)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTietHoc], [namHoc], [kiHoc], [idGiaoVien]) VALUES (8, N'Thể dục', 45, N'2018-2019', 1, 1)
SET IDENTITY_INSERT [dbo].[MonHoc] OFF
GO
ALTER TABLE [dbo].[GiaoVien] ADD  DEFAULT (N'Nam') FOR [gioiTinh]
GO
ALTER TABLE [dbo].[GiaoVien] ADD  DEFAULT (getdate()) FOR [ngaySinh]
GO
ALTER TABLE [dbo].[BangDiem]  WITH CHECK ADD FOREIGN KEY([idHocSinh])
REFERENCES [dbo].[HocSinh] ([idHocSinh])
GO
ALTER TABLE [dbo].[BangDiem]  WITH CHECK ADD FOREIGN KEY([idMonHoc])
REFERENCES [dbo].[MonHoc] ([idMonHoc])
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD FOREIGN KEY([idLopHoc])
REFERENCES [dbo].[LopHoc] ([idLopHoc])
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD FOREIGN KEY([idGiaoVienChuNhiem])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([idGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
GO
ALTER TABLE [dbo].[GiaoVien]  WITH CHECK ADD CHECK  (([gioiTinh]=N'Nữ' OR [gioiTinh]=N'Nam'))
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD CHECK  (([kiHoc]=(2) OR [kiHoc]=(1)))
GO
/****** Object:  StoredProcedure [dbo].[SP_Account_Insert]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Account_Insert]
  @Email VARCHAR(50),
  @GioiTinh NCHAR(10),
  @Password VARCHAR(50)
AS
BEGIN
  INSERT INTO Account
    (Email, GioiTinh, Password)
  VALUES(@Email, @GioiTinh, @Password)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BangDiem_Delete]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BangDiem_Delete]
  @idBangDiem INT
AS
BEGIN
  DELETE BangDiem
  WHERE idBangDiem = @idBangDiem
END

GO
/****** Object:  StoredProcedure [dbo].[SP_BangDiem_GetAll]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------Bang Diem------------------------
CREATE PROCEDURE [dbo].[SP_BangDiem_GetAll]
AS
BEGIN
  SELECT *
  FROM BangDiem
END

GO
/****** Object:  StoredProcedure [dbo].[SP_BangDiem_GetByIdMonHoc]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BangDiem_GetByIdMonHoc]
	@idMonHoc int
AS
BEGIN
  SELECT *
  FROM BangDiem
  WHERE idMonHoc = @idMonHoc
END

GO
/****** Object:  StoredProcedure [dbo].[SP_BangDiem_Insert]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BangDiem_Insert]
  @diem15phut FLOAT,
  @diem45phut FLOAT,
  @diemHocKi FLOAT,
  @idMonHoc INT,
  @idHocSinh INT
AS
BEGIN
  INSERT INTO BangDiem
    (diem15phut, diem45phut, diemHocKi, idMonHoc, idHocSinh)
  VALUES(@diem15phut, @diem45phut, @diemHocKi, @idMonHoc, @idHocSinh)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_BangDiem_Search]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BangDiem_Search]
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM BangDiem
  WHERE idBangDiem LIKE N'%' + @searchValue + '%'
    OR diem15phut LIKE N'%' + @searchValue + '%'
    OR diem45phut LIKE N'%' + @searchValue + '%'
    OR diemHocKi LIKE N'%' + @searchValue + '%'
    OR idMonHoc LIKE N'%' + @searchValue + '%'
    OR idHocSinh LIKE N'%' + @searchValue + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_BangDiem_Update]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BangDiem_Update]
  @idBangDiem INT,
  @diem15phut FLOAT,
  @diem45phut FLOAT,
  @diemHocKi FLOAT,
  @idMonHoc INT,
  @idHocSinh INT
AS
BEGIN
  UPDATE BangDiem
  SET diem15phut = @diem15phut,
  diem45phut = @diem45phut,
  diemHocKi = @diemHocKi,
  idMonHoc = @idMonHoc,
  idHocSinh = @idHocSinh
  WHERE idBangDiem = @idBangDiem
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GiaoVien_Delete]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GiaoVien_Delete]
  @idGiaoVien INT
AS
BEGIN
  UPDATE LopHoc
  SET idGiaoVienChuNhiem = NULL
  WHERE idGiaoVienChuNhiem = @idGiaoVien

  UPDATE MonHoc
  SET idGiaoVien = NULL
  WHERE idGiaoVien = @idGiaoVien

  DELETE GiaoVien
  WHERE idGiaoVien = @idGiaoVien
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GiaoVien_GetAll]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------Giao Vien------------------------
CREATE PROCEDURE [dbo].[SP_GiaoVien_GetAll]
AS
BEGIN
  SELECT *
  FROM GiaoVien
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GiaoVien_Insert]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GiaoVien_Insert]
  @tenGiaoVien NVARCHAR(50),
  @gioiTinh NVARCHAR(4),
  @ngaySinh DATE,
  @soDienThoai NVARCHAR(12)
AS
BEGIN
  INSERT INTO GiaoVien
    (tenGiaoVien, gioiTinh, ngaySinh, soDienThoai)
  VALUES(@tenGiaoVien, @gioiTinh, @ngaySinh, @soDienThoai)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GiaoVien_Search]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GiaoVien_Search]
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM GiaoVien
  WHERE idGiaoVien LIKE N'%' + @searchValue + '%'
    OR idGiaoVien LIKE N'%' + @searchValue + '%'
    OR tenGiaoVien LIKE N'%' + @searchValue + '%'
    OR gioiTinh LIKE N'%' + @searchValue + '%'
    OR ngaySinh LIKE N'%' + @searchValue + '%'
    OR soDienThoai LIKE N'%' + @searchValue + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GiaoVien_Update]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GiaoVien_Update]
  @idGiaoVien INT,
  @tenGiaoVien NVARCHAR(50),
  @gioiTinh NVARCHAR(4),
  @ngaySinh DATE,
  @soDienThoai NVARCHAR(12)
AS
BEGIN
  UPDATE GiaoVien
  SET tenGiaoVien = @tenGiaoVien,
  gioiTinh = @gioiTinh,
  ngaySinh = @ngaySinh,
  soDienThoai = @soDienThoai
  WHERE idGiaoVien = @idGiaoVien
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HocSinh_Delete]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_HocSinh_Delete]
  @idHocSinh INT
AS
BEGIN
  DELETE BangDiem
  WHERE idHocSinh = @idHocSinh
  DELETE HocSinh
  WHERE idHocSinh = @idHocSinh
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HocSinh_GetAll]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------Hoc Sinh------------------------
CREATE PROCEDURE [dbo].[SP_HocSinh_GetAll]
AS
BEGIN
  SELECT *
  FROM HocSinh
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HocSinh_Insert]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_HocSinh_Insert]
  @tenHocSinh NVARCHAR(50),
  @gioiTinh NVARCHAR(4),
  @ngaySinh DATE,
  @idLopHoc INT
AS
BEGIN
  INSERT INTO HocSinh
    (tenHocSinh, gioiTinh, ngaySinh, idLopHoc)
  VALUES(@tenHocSinh, @gioiTinh, @ngaySinh, @idLopHoc)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HocSinh_Search]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_HocSinh_Search]
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM HocSinh
  WHERE idHocSinh LIKE N'%' + @searchValue + '%'
    OR tenHocSinh LIKE N'%' + @searchValue + '%'
    OR gioiTinh LIKE N'%' + @searchValue + '%'
    OR ngaySinh LIKE N'%' + @searchValue + '%'
    OR idLopHoc LIKE N'%' + @searchValue + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HocSinh_Update]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_HocSinh_Update]
  @idHocSinh INT,
  @tenHocSinh NVARCHAR(50),
  @gioiTinh NVARCHAR(4),
  @ngaySinh DATE,
  @idLopHoc INT
AS
BEGIN
  UPDATE HocSinh
  SET tenHocSinh = @tenHocSinh,
  gioiTinh = @gioiTinh,
  ngaySinh = @ngaySinh,
  idLopHoc = @idLopHoc
  WHERE idHocSinh = @idHocSinh
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LopHoc_Delete]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LopHoc_Delete]
  @idLopHoc INT
AS
BEGIN
  UPDATE HocSinh
  SET idLopHoc = NULL
  WHERE idLopHoc = @idLopHoc
  DELETE LopHoc
  WHERE idLopHoc = @idLopHoc
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LopHoc_GetAll]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------Lop Hoc------------------------
CREATE PROCEDURE [dbo].[SP_LopHoc_GetAll]
AS
BEGIN
  SELECT *
  FROM LopHoc
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LopHoc_Insert]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LopHoc_Insert]
  @tenLopHoc NVARCHAR(50),
  @tenKhoi NVARCHAR(3),
  @namHoc NVARCHAR(10),
  @idGiaoVienChuNhiem INT
AS
BEGIN
  INSERT INTO LopHoc
    (tenLopHoc, tenKhoi, namHoc, idGiaoVienChuNhiem)
  VALUES(@tenLopHoc, @tenKhoi, @namHoc, @idGiaoVienChuNhiem)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LopHoc_Search]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LopHoc_Search]
  @searchValue NVARCHAR(50)
AS
BEGIN
  SELECT *
  FROM LopHoc
  WHERE idLopHoc LIKE N'%' + @searchValue + '%'
    OR tenLopHoc LIKE N'%' + @searchValue + '%'
    OR tenKhoi LIKE N'%' + @searchValue + '%'
    OR namHoc LIKE N'%' + @searchValue + '%'
    OR idGiaoVienChuNhiem LIKE N'%' + @searchValue + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LopHoc_Update]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LopHoc_Update]
  @idLopHoc INT,
  @tenLopHoc NVARCHAR(50),
  @tenKhoi NVARCHAR(3),
  @namHoc NVARCHAR(10),
  @idGiaoVienChuNhiem INT
AS
BEGIN
  UPDATE LopHoc
  SET tenLopHoc = @tenLopHoc,
  tenKhoi = @tenKhoi,
  namHoc = @namHoc,
  idGiaoVienChuNhiem = @idGiaoVienChuNhiem
  WHERE idLopHoc = @idLopHoc
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MonHoc_CheckInsert]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MonHoc_CheckInsert]
  @tenMonHoc NVARCHAR(50),
  @soTietHoc INT,
  @namHoc NVARCHAR(10),
  @kiHoc INT,
  @idGiaoVien int
AS
BEGIN
  SELECT *
  FROM MonHoc
  WHERE tenMonHoc = @tenMonHoc
    and soTietHoc = @soTietHoc
    and namHoc = @namHoc
    and kiHoc = @kiHoc
    and idGiaoVien = @idGiaoVien
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MonHoc_Delete]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MonHoc_Delete]
  @idMonHoc INT
AS
BEGIN
  DELETE BangDiem
  WHERE idMonHoc = @idMonHoc
  DELETE MonHoc
  WHERE idMonHoc = @idMonHoc
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MonHoc_GetAll]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-----------------------Mon Hoc------------------------
CREATE PROCEDURE [dbo].[SP_MonHoc_GetAll]
AS
BEGIN
  SELECT *
  FROM MonHoc
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MonHoc_Insert]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MonHoc_Insert]
  @tenMonHoc NVARCHAR(50),
  @soTietHoc INT,
  @namHoc NVARCHAR(10),
  @kiHoc INT,
  @idGiaoVien int
AS
BEGIN
  INSERT INTO MonHoc
    (tenMonHoc, soTietHoc, namHoc, kiHoc, idGiaoVien)
  VALUES(@tenMonHoc, @soTietHoc, @namHoc, @kiHoc, @idGiaoVien)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MonHoc_Search]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MonHoc_Search]
  @searchValue NVARCHAR(50)
AS
BEGIN
  SELECT *
  FROM MonHoc
  WHERE idMonHoc LIKE N'%' + @searchValue + '%'
    OR tenMonHoc LIKE N'%' + @searchValue + '%'
    OR soTietHoc LIKE N'%' + @searchValue + '%'
    OR namHoc LIKE N'%' + @searchValue + '%'
    OR kiHoc LIKE N'%' + @searchValue + '%'
    OR idGiaoVien LIKE N'%' + @searchValue + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MonHoc_Update]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MonHoc_Update]
  @idMonHoc INT,
  @tenMonHoc NVARCHAR(50),
  @soTietHoc INT,
  @namHoc NVARCHAR(10),
  @kiHoc INT,
  @idGiaoVien INT
AS
BEGIN
  UPDATE MonHoc
  SET tenMonHoc = @tenMonHoc,
      soTietHoc = @soTietHoc,
      namHoc = @namHoc,
      kiHoc = @kiHoc,
      idGiaoVien = @idGiaoVien
  WHERE idMonHoc = @idMonHoc
END

GO
/****** Object:  StoredProcedure [dbo].[TT_QLHS_Login]    Script Date: 06/29/2021 8:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TT_QLHS_Login]
@Email VARCHAR(50),
@Password VARCHAR(50)
AS
BEGIN
	SELECT * FROM Account WHERE Email = @Email AND Password = @Password
END
GO
USE [master]
GO
ALTER DATABASE [TT_QLHS] SET  READ_WRITE 
GO

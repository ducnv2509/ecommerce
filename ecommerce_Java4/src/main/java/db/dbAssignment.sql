USE [ecommerce]
GO
/****** Object:  Table [dbo].[category]    Script Date: 4/13/2022 12:34:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameCategory] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite]    Script Date: 4/13/2022 12:34:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[likeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 4/13/2022 12:34:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[u_id] [int] NULL,
	[o_quantity] [int] NULL,
	[o_date] [varchar](450) NULL,
	[statusState] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderStates]    Script Date: 4/13/2022 12:34:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderStates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameStates] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 4/13/2022 12:34:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameProduct] [nvarchar](255) NULL,
	[category_id] [int] NULL,
	[supplier_id] [int] NULL,
	[price] [int] NULL,
	[imageProduct] [nvarchar](max) NULL,
	[size] [nvarchar](255) NULL,
	[color] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[share]    Script Date: 4/13/2022 12:34:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[email] [nvarchar](255) NULL,
	[shareDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 4/13/2022 12:34:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameSupplier] [nvarchar](255) NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/13/2022 12:34:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[fullName] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
	[gender] [bit] NULL,
	[avatar] [nvarchar](max) NULL,
	[created] [datetime] NULL,
	[isAdmin] [bit] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [nameCategory]) VALUES (1, N'Giày')
INSERT [dbo].[category] ([id], [nameCategory]) VALUES (2, N'Áo')
INSERT [dbo].[category] ([id], [nameCategory]) VALUES (3, N'Mũ')
INSERT [dbo].[category] ([id], [nameCategory]) VALUES (4, N'Trang Sức')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (4, 1, 2, 7, N'2022-04-06', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (5, 1, 2, 4, N'2022-04-06', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (6, 1, 5, 3, N'2022-04-07', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (7, 3, 5, 3, N'2022-04-07', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (8, 4, 6, 3, N'2022-04-07', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (9, 7, 2, 1, N'2022-04-07', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (10, 6, 2, 1, N'2022-04-07', 4)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (11, 3, 2, 4, N'2022-04-07', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (12, 4, 2, 2, N'2022-04-07', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (13, 7, 2, 2, N'2022-04-07', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (14, 9, 2, 3, N'2022-04-07', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (15, 4, 2, 1, N'2022-04-07', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (16, 3, 2, 1, N'2022-04-07', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (17, 1, 2, 1, N'2022-04-08', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (18, 3, 2, 1, N'2022-04-08', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (23, 1, 8, 2, N'2022-04-08', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (24, 3, 8, 3, N'2022-04-08', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (25, 1, 8, 4, N'2022-04-08', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1006, 1, 8, 3, N'2022-04-08', 4)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1007, 3, 8, 3, N'2022-04-08', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1008, 3, 1005, 1, N'2022-04-09', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1009, 4, 1005, 1, N'2022-04-09', 2)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1010, 7, 1005, 1, N'2022-04-09', 4)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1011, 1, 2, 1, N'2022-04-10', 4)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1012, 1, 2, 1, N'2022-04-10', 1)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1013, 1, 2, 500, N'2022-04-10', 1)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1014, 1, 2, 500, N'2022-04-10', 1)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1015, 1, 8, 1, N'2022-04-11', 1)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1016, 3, 8, 1, N'2022-04-11', 4)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1017, 3, 2, 2, N'2022-04-12', 3)
INSERT [dbo].[orders] ([id], [p_id], [u_id], [o_quantity], [o_date], [statusState]) VALUES (1018, 4, 2, 1, N'2022-04-12', 3)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[orderStates] ON 

INSERT [dbo].[orderStates] ([id], [nameStates]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[orderStates] ([id], [nameStates]) VALUES (2, N'Đã xác nhận')
INSERT [dbo].[orderStates] ([id], [nameStates]) VALUES (3, N'Hoàn tất')
INSERT [dbo].[orderStates] ([id], [nameStates]) VALUES (4, N'Huỷ')
SET IDENTITY_INSERT [dbo].[orderStates] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1, N'Áo Khoác', 1, 1, 100, N'http://res.cloudinary.com/ducnv2509/image/upload/v1648627655/whgtfpcg77kop8qdbfai.jpg', N'L', N'Đỏ', N'Áo Đẹp', 12, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (3, N'Áo kaki', 2, 2, 211, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649785508/wxsocvcim8ibbrcgtrgv.jpg', N'12', N'Trắng', N'OK Lắm', 12, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (4, N'Thắt Lưng AB 5', 2, 2, 123, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649264232/zl0rwmtrdm6p5sc3te0l.jpg', N'M', N'Trắng', N'1231', 12, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (5, N'Áo kaki', 1, 2, 100, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649264353/h98qgonefxb690xxdbw2.jpg', N'L', N'Vang', N'1231', 22, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (6, N'Thắt Lưng AB 57', 1, 1, 122, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649264572/jvhbqcfiyjg4bsbdgclx.jpg', N'M', N'Trắng', N'12313', 21, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (7, N'Giày thể thao 1', 2, 2, 100, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649264761/pz4cf358ozhturrdeds7.jpg', N'M', N'Vang', N'', 4, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (8, N'Quần vải', 2, 1, 103, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649265121/otrkrltz6fbrxuahr3fx.jpg', N'XL', N'Đỏ', N'', 4, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (9, N'Giày thể thao ONE', 1, 2, 102, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649265270/rumxdr10b7bwqwnqdoen.jpg', N'XL', N'Vang', N'', 2, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (10, N'Thắt Lưng AB 5', 1, 2, 106, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649265477/oecpsxarxzqxmjuhl9xq.jpg', N'28', N'Vang', N'o', 33, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (11, N'Thắt Lưng AB 5', 1, 1, 102, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649265806/mutiihz3kkcm1xgfiry1.jpg', N'28', N'Vang', N'', 4, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (12, N'Thắt Lưng AB 57', 2, 2, 101, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649266034/noalgiyx8mb0veqdgr9i.jpg', N'28', N'Trắng', N'', 123, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1013, N'Mũ Đức', 3, 2, 102, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649428200/tprmicccrkemjpfdhznh.png', N'XXL', N'Vàng', N'OK', 7, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1014, N'Áo OK', 2, 3, 121, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649518368/fewmujjxczuxunmhb12e.jpg', N'L', N'Đen', N'121', 12, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1015, N'Giày thể thao 1', 3, 3, 101, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649518472/b4xlihabl1p38e2vjhya.jpg', N'XXL', N'121', N'12', 12, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1016, N'Giày thể thao', 2, 1, 102, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649518644/slgbcdiyudqq1jjvlfoa.jpg', N'12', N'Đỏ', N'1', 2, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1017, N'Quần vải', 2, 2, 102, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649519656/vlm2bwtz7vrngqlq3bko.jpg', N'L', N'123', N'1111', 2, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1018, N'Giày thể thao 1', 1, 1, 101, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649519993/ufoi1ydxbfijlq5kcuum.jpg', N'28', N'Vang', N'111', 2, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1020, N'Thắt Lưng AB 5', 1, 1, 101, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649520444/ggaajbh8mdi41o9y3nhg.jpg', N'28', N'123', N'1', 1105, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1021, N'Giày thể thao 1', 1, 1, 100, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649520482/btsew1bqkisen6oixidd.jpg', N'a', N'Đen', N'a', 1, NULL)
INSERT [dbo].[products] ([id], [nameProduct], [category_id], [supplier_id], [price], [imageProduct], [size], [color], [description], [quantity], [created]) VALUES (1022, N'Giày thể thao ONE', 1, 1, 100, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649521361/opgc3f8ea6t2wyawet7h.ico', N'12', N'Đen', N'2', 1, NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[supplier] ON 

INSERT [dbo].[supplier] ([id], [nameSupplier], [phone], [address]) VALUES (1, N'GUCCI', N'0332429178', N'Hà Nội')
INSERT [dbo].[supplier] ([id], [nameSupplier], [phone], [address]) VALUES (2, N'Đức Nguyễn', N'0332429178', N'Hanoi *')
INSERT [dbo].[supplier] ([id], [nameSupplier], [phone], [address]) VALUES (3, N'Thái Thịnh', N'0987654322', N'Đà Nẵng')
INSERT [dbo].[supplier] ([id], [nameSupplier], [phone], [address]) VALUES (1003, N'Vũ ĐÌnh', N'0987654321', N'Bắc Ninh')
INSERT [dbo].[supplier] ([id], [nameSupplier], [phone], [address]) VALUES (1004, N'Vũ MInh', N'0987654321', N'Bắc Ninh')
INSERT [dbo].[supplier] ([id], [nameSupplier], [phone], [address]) VALUES (1005, N'Vũ Bắc', N'0987654321', N'Bắc Ninh')
SET IDENTITY_INSERT [dbo].[supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (2, N'admin', N'$2a$10$qOMo1uZXlm6f4ip7X9aZluk/kxPax5lWqlMfN0GZva/2G7FT6vUXO', N'Nguyễn Văn Đức', N'Hồng Phong', N'ducnvph14435@fpt.edu.vn', N'0332429178', 0, N'http://res.cloudinary.com/ducnv2509/image/upload/v1649303242/bk7twtrm5jkm5bitrpxr.jpg', CAST(N'2022-04-07T10:47:21.780' AS DateTime), 1, 0)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (3, N'ducit2509', N'$2a$10$7YXOfez9ghcF6mdRyJj34elCLbifny/Zfy.PRb5ATc3Jj24i2sIse', N'Đức Nguyễn', NULL, N'ducit2509@gmail.com', N'0332429178', 1, NULL, CAST(N'2022-04-06T23:41:49.387' AS DateTime), 1, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (5, N'ducnv', N'$2a$10$/UJVfXMdFuRDNco5n9Q.B.HapeJJHXVyAFD.INsBxT79FE/7.FMwi', N'Đức Nguyễn', NULL, N'ducit2509@gmail.com', N'0332429178', 1, NULL, NULL, 0, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (6, N'teonv', N'$2a$10$coFdbKaZpcBmtJUWVGeXPemCA0GyupH4yUrJ9uEkdEBkEaYQ6hUim', N'Đức Nguyễn', NULL, N'ducit2509@gmail.com', N'0332429178', 1, NULL, NULL, 0, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (8, N'userdemo', N'$2a$10$ZohL6A4SARA/ZSvU5eA3a.8rANWh7gsnWUzCr2lumP3xbR0r07eA6', N'Nguyễn Long', NULL, N'codedaoit@gmail.com', N'0976903277', 1, NULL, CAST(N'2022-04-08T11:50:25.977' AS DateTime), 0, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (9, N'demoXoa', N'$2a$10$DMYraK1pnOxVsBs7u6kqXebHUZjG1tddNaDnvKXJk811tJAROl/66', N'Đức Nguyễn', NULL, N'ducit2509@gmail.com', N'0332429178', 1, NULL, NULL, 0, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (1005, N'demoXoa2', N'$2a$10$2iKe.ndsHTL6Zd.yw7CBquTupnIlJYTVtkRlJo.bkZSQ4h0ysUxwG', N'Đức Nguyễn', NULL, N'ducit2509@gmail.com', N'0332429178', 1, NULL, NULL, 0, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (1006, N'admin1', N'$2a$10$kHbuzz2876KOzRwPRpsU2.VajPEF014n8G90USOPD99CPqP.J0ige', N'DDawngj VU', NULL, N'ducit2509@gmail.com', N'0332429178', 0, NULL, CAST(N'2022-04-10T21:17:57.670' AS DateTime), 1, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (1007, N'admin2', N'$2a$10$5IWrzo4ULh4GVlFcOUyfZefbaLqmxz9MOipy8.Y7.Vsal1GU.ghHW', N'Đức Nguyễn', NULL, N'ducit2509@gmail.com', N'0332429178', 1, NULL, CAST(N'2022-04-10T22:32:20.530' AS DateTime), 1, 0)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (1008, N'asjdha', N'$2a$10$jQZLA676d0wXloWRXVYA3.6OVfnJKOamfO9sBxPWwwO7sISgnbAYm', N'asda', NULL, N'ducit2509@gmail.com', N'0332429178', 0, NULL, CAST(N'2022-04-11T00:34:05.797' AS DateTime), 0, 0)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (1023, N'admin1212', N'$2a$10$7e3UGktfEybeuoZ7S3itNO/oPskWmjmEyrGqJkszPx8hpF8Y7BzSq', N'Đức Nguyễn', NULL, N'ducit22509@gmail.com', N'0332429174', 0, NULL, CAST(N'2022-04-12T21:57:45.913' AS DateTime), 0, 0)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (1029, N'admin312', N'$2a$10$5DweA4Q8fCSvnKKuAJfD/.0xxqqZvOFQRYShpevVfHvZ3krSZP3D6', N'Đức Nguyễn', NULL, N'ducit2509@gmail.com', N'0332429178', 0, NULL, CAST(N'2022-04-12T22:11:52.860' AS DateTime), 0, 0)
INSERT [dbo].[users] ([id], [username], [password], [fullName], [address], [email], [phone], [gender], [avatar], [created], [isAdmin], [status]) VALUES (1030, N'admined', N'$2a$10$/fvgopzm0RLD7WNXPD3s/OwybZzIGbo.6d/35N90JVkiIAXv6oBnW', N'Đức Nguyễn', NULL, N'ducit250119@gmail.com', N'0332429175', 0, NULL, CAST(N'2022-04-12T22:19:21.270' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([p_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([statusState])
REFERENCES [dbo].[orderStates] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([u_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([supplier_id])
REFERENCES [dbo].[supplier] ([id])
GO
ALTER TABLE [dbo].[share]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[share]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO

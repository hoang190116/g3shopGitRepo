USE [g3shop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 4/22/2022 7:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](150) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[date_of_bird] [date] NULL,
	[phone] [bigint] NULL,
	[email] [varchar](150) NULL,
	[role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[total_to_paid] [int] NOT NULL,
	[pay_type] [varchar](50) NOT NULL,
	[pay_status] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](150) NULL,
	[country] [nvarchar](150) NULL,
	[b_address] [nvarchar](150) NULL,
	[card_number] [bigint] NULL,
	[name_on_card] [nvarchar](150) NULL,
	[postalCode] [nvarchar](8) NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_product]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_product](
	[bill_id] [int] NOT NULL,
	[product_name] [varchar](150) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_account]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_account](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_cart_account] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_detail]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_detail](
	[cart_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[product_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[cmt] [nvarchar](960) NOT NULL,
	[cmtDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[genre_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_genre] PRIMARY KEY CLUSTERED 
(
	[genre_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[fullname] [nvarchar](150) NOT NULL,
	[bank] [nvarchar](150) NULL,
	[card_number] [bigint] NULL,
	[email] [nvarchar](150) NULL,
	[country] [nvarchar](150) NULL,
	[pay_address] [nvarchar](150) NULL,
	[expYY] [int] NULL,
	[expMM] [int] NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[price] [int] NULL,
	[release_date] [date] NULL,
	[detail] [varchar](100) NULL,
	[p_view] [int] NULL,
	[genre] [varchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_img]    Script Date: 4/22/2022 7:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_img](
	[product_id] [int] NOT NULL,
	[img] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([account_id], [fullname], [username], [password], [date_of_bird], [phone], [email], [role]) VALUES (3, N'admin', N'admin', N'Ð3â*ãH®µfÂ
ì5…M©—', CAST(N'2022-07-22' AS Date), 1231234, N'123@1231234', N'admin')
INSERT [dbo].[account] ([account_id], [fullname], [username], [password], [date_of_bird], [phone], [email], [role]) VALUES (10, N'employee2242', N'employee', N'¥z$´ÅÖ­œ“ô"ø¿ÌXŒ', CAST(N'2022-04-22' AS Date), 9912001248, N'employee@123', N'staff')
INSERT [dbo].[account] ([account_id], [fullname], [username], [password], [date_of_bird], [phone], [email], [role]) VALUES (11, N'user12345', N'user12345', N'¥z$´ÅÖ­œ“ô"ø¿ÌXŒ', NULL, NULL, NULL, N'user')
INSERT [dbo].[account] ([account_id], [fullname], [username], [password], [date_of_bird], [phone], [email], [role]) VALUES (12, N'user123456', N'user123456', N'¥z$´ÅÖ­œ“ô"ø¿ÌXŒ', NULL, NULL, NULL, N'user')
INSERT [dbo].[account] ([account_id], [fullname], [username], [password], [date_of_bird], [phone], [email], [role]) VALUES (13, N'user123456', N'user1234567', N'¥z$´ÅÖ­œ“ô"ø¿ÌXŒ', CAST(N'2022-04-30' AS Date), 8901231221, N'user12345@123', N'user')
INSERT [dbo].[account] ([account_id], [fullname], [username], [password], [date_of_bird], [phone], [email], [role]) VALUES (14, N'user123', N'user123', N'¥z$´ÅÖ­œ“ô"ø¿ÌXŒ', CAST(N'2022-04-14' AS Date), 1234412, N'123@123', N'user')
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1, 3, 2997, N'Paypal', N'Paid', N'Finish', CAST(N'2022-04-06T22:04:02.000' AS DateTime), N'Nguyen ABC', N'abc@gmail.com', N'Viet Nam', N'Hanoi Viet Nam', 12345678911111111, N'Nguyen ABC', NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (2, 3, 3996, N'Paypal', N'Paid', N'Delivering', CAST(N'2022-04-06T22:21:26.000' AS DateTime), N'Nguyen ABC123', N'abc@gmail.com123', N'Viet Nam123', N'Hanoi Viet Nam123', 12345678911231, N'Nguyen ABC', NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (4, 3, 3996, N'Paypal', N'Paid', N'In processing', CAST(N'2022-04-06T22:31:54.000' AS DateTime), N'Nguyen ABC', N'abc@gmail.com123', N'Viet Nam123', N'Hanoi Viet Nam123', 123456789112, N'Nguyen ABC', NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (5, 3, 2997, N'Cash payment', N'Paid', N'Finish', CAST(N'2022-04-06T22:57:02.000' AS DateTime), N'Nguyen 2ABC', N'2ABC@gmail.com', N'VIET NAM', N'123 Hanoi', NULL, NULL, NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (6, 3, 999, N'Cash payment', N'Unpaid', N'In processing', CAST(N'2022-04-07T21:39:17.000' AS DateTime), N'admin', N'admin', N'admin', N'admin', NULL, NULL, NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (7, 3, 999, N'Cash payment', N'Unpaid', N'Waiting', CAST(N'2022-04-08T01:53:24.000' AS DateTime), N'Nguyen A2', N'a2@gmail.com', N'Viet Name', N'123 Ha Noi', NULL, NULL, NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (8, 3, 1998, N'Paypal', N'Paid', N'Waiting', CAST(N'2022-04-08T02:02:39.000' AS DateTime), N'Nguyen ADMIN', N'123@123a', N'Viet Name', N'123 Ha Noi', 99123, N'Nguyen ADMIN', NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (9, 3, 999, N'Paypal', N'Paid', N'Waiting', CAST(N'2022-04-08T02:06:05.000' AS DateTime), N'Nguyen ABC', N'abc@gmail.com123', N'Viet Nam123', N'Hanoi Viet Nam123', 123456789112, N'Nguyen ABC', NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1002, 3, 8991, N'Cash payment', N'Unpaid', N'Waiting', CAST(N'2022-04-09T13:18:09.000' AS DateTime), N'admin', N'admin', N'admin', N'admin', NULL, NULL, NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1003, 3, 999, N'Paypal', N'Paid', N'Waiting', CAST(N'2022-04-09T13:20:29.000' AS DateTime), N'Nguyen ADMIN ADMIN', N'123@123a', N'Viet Name', N'123 Ha Noi', 99123, N'Nguyen ADMIN', NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1005, 11, 999, N'Debit card', N'Paid', N'Finish', CAST(N'2022-04-14T13:42:00.000' AS DateTime), N'nguyen van A', N'nguyen@123', N'VietNam', N'123 Hanoi', 1238099081, N'nguyen  van A', NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1006, 12, 999, N'Cash payment', N'Paid', N'Finish', CAST(N'2022-04-14T13:45:17.000' AS DateTime), N'nguyen van A', N'nguyen@123', N'VietNam', N'123 Hanoi', NULL, NULL, NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1007, 13, 999, N'Debit card', N'Paid', N'Finish', CAST(N'2022-04-14T15:40:38.000' AS DateTime), N'nguyen van A', N'a@123', N'VietNam', N'123 Hanoi', 9021309, N'nguyen van A', NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1008, 14, 5844, N'PayPal', N'Paid', N'In processing', CAST(N'2022-04-18T19:01:33.000' AS DateTime), N'Marimo Reiss', N'kenwiths999@gmail.com', N'VN', N'Town 1 Address 1', NULL, NULL, NULL)
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1009, 14, 999, N'Cash payment', N'Unpaid', N'In processing', CAST(N'2022-04-18T21:47:24.000' AS DateTime), N'Nguyen Van A', N'vanA@123', N'Viet Nam', N'123 Hanoi', NULL, NULL, N'300000')
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1010, 14, 3921, N'PayPal', N'Paid', N'In processing', CAST(N'2022-04-18T21:55:55.000' AS DateTime), N'Reiss Marimo', N'kenwiths999@gmail.com', N'VN', N'HÀ NỘI, Town 1, 36 Trinh Van Bo', NULL, NULL, N'300000')
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1011, 14, 999, N'PayPal', N'Paid', N'Waiting', CAST(N'2022-04-18T22:48:06.000' AS DateTime), N'Walck Shalaine', N'kenwiths999@gmail.com', N'VN', N'HA NOI, Town 3, 102 Nguyen Phong Sac', NULL, NULL, N'300000')
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1012, 14, 2997, N'PayPal', N'Paid', N'Waiting', CAST(N'2022-04-20T17:35:28.000' AS DateTime), N'Mai Kilian', N'maila@gmail.com', N'VN', N'HA NOI, Mai Dich, 123 Pham Van Đong', NULL, NULL, N'300000')
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1013, 14, 999, N'Cash payment', N'Unpaid', N'Waiting', CAST(N'2022-04-20T19:43:30.000' AS DateTime), N'Nguyen Van A', N'vanA@123', N'Viet Name', N'123 Hanoi', NULL, NULL, N'130000')
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1014, 14, 924, N'Cash payment', N'Unpaid', N'Waiting', CAST(N'2022-04-20T20:35:28.000' AS DateTime), N'Nguyen Van B', N'123@123', N'Viet Nam', N'123 Main', NULL, NULL, N'11234412')
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1015, 14, 999, N'PayPal', N'Paid', N'Waiting', CAST(N'2022-04-20T20:52:05.000' AS DateTime), N'Mai Killan', N'maila@gmail.com', N'VN', N'HÀ NỘI, 123 Town, 123 Nguyễn Phong Sắc', NULL, NULL, N'300000')
INSERT [dbo].[bill] ([bill_id], [account_id], [total_to_paid], [pay_type], [pay_status], [status], [date], [fullname], [email], [country], [b_address], [card_number], [name_on_card], [postalCode]) VALUES (1016, 14, 999, N'PayPal', N'Paid', N'Waiting', CAST(N'2022-04-20T21:09:02.000' AS DateTime), N'Mai Kilian', N'maila@gmail.com', N'VN', N'HÀ NỘI, 72 Town, 41 Trần Bình', NULL, NULL, N'300000')
SET IDENTITY_INSERT [dbo].[bill] OFF
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1, N'Laptop HU1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (2, N'Laptop', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (5, N'Laptop', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (5, N'Laptop B1', 2, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (6, N'Laptop', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (8, N'Laptop', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (8, N'Laptop XS1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (9, N'Laptop', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1002, N'Laptop SSS1', 9, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1003, N'Laptop', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (4, N'Laptop', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (4, N'Laptop AQ1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (4, N'Laptop HU1', 2, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (7, N'Laptop', 2, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1005, N'Laptop AQ1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1006, N'Laptop AQ1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1008, N'Laptop ADS', 2, 924)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1008, N'Laptop CI1', 2, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1008, N'Laptop A1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1008, N'abc', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1009, N'Laptop L1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1010, N'Laptop SSS1', 3, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1012, N'Laptop AQ1', 3, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1013, N'Laptop L1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1013, N'Laptop A4', 2, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1016, N'Laptop CI1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1007, N'Laptop AQ1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1010, N'Laptop ADS', 1, 924)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1011, N'Laptop L1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1013, N'Laptop AQ1', 1, 999)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1014, N'Laptop ADS', 1, 924)
INSERT [dbo].[bill_product] ([bill_id], [product_name], [quantity], [price]) VALUES (1015, N'Laptop AQ1', 1, 999)
SET IDENTITY_INSERT [dbo].[cart_account] ON 

INSERT [dbo].[cart_account] ([cart_id], [account_id]) VALUES (1016, 14)
SET IDENTITY_INSERT [dbo].[cart_account] OFF
INSERT [dbo].[cart_detail] ([cart_id], [product_id], [quantity]) VALUES (1016, 18, 2)
INSERT [dbo].[cart_detail] ([cart_id], [product_id], [quantity]) VALUES (1016, 25, 9)
INSERT [dbo].[comment] ([product_id], [account_id], [cmt], [cmtDate]) VALUES (18, 12, N'Laptop', CAST(N'2022-04-14T15:36:13.000' AS DateTime))
INSERT [dbo].[genre] ([genre_name]) VALUES (N'Computer - PC')
INSERT [dbo].[genre] ([genre_name]) VALUES (N'Keyboard')
INSERT [dbo].[genre] ([genre_name]) VALUES (N'Laptop')
INSERT [dbo].[genre] ([genre_name]) VALUES (N'Mouse')
SET IDENTITY_INSERT [dbo].[payment] ON 

INSERT [dbo].[payment] ([payment_id], [account_id], [fullname], [bank], [card_number], [email], [country], [pay_address], [expYY], [expMM]) VALUES (2, 3, N'Nguyen ABC', N'Paypal', 12345678911231, N'abc@gmail.com123', N'Viet Nam123', N'Hanoi Viet Nam123', 99, 12)
INSERT [dbo].[payment] ([payment_id], [account_id], [fullname], [bank], [card_number], [email], [country], [pay_address], [expYY], [expMM]) VALUES (3, 3, N'Nguyen ADMIN', N'Paypal', 9912399, N'123@123a', N'Viet Name', N'123 Ha Noi', 99, 12)
INSERT [dbo].[payment] ([payment_id], [account_id], [fullname], [bank], [card_number], [email], [country], [pay_address], [expYY], [expMM]) VALUES (5, 13, N'nguyen van A', N'Debit card', 9021309, N'a@123', N'VietNam', N'123 Hanoi', 99, 12)
SET IDENTITY_INSERT [dbo].[payment] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (2, N'Keyboard HSSZ4', 999, CAST(N'2022-03-09' AS Date), N'Awesome product', 5, N'Keyboard')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (6, N'Laptop A1', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 1, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (7, N'Laptop A2', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 0, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (8, N'Laptop A4', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 1, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (9, N'Laptop B1', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 2, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (10, N'Laptop C6', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 0, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (11, N'Laptop Y2', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 1, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (12, N'Laptop AA1', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 0, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (13, N'Laptop SSS1', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 3, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (14, N'Laptop S-S1', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 1, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (15, N'Laptop L1', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 7, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (17, N'Laptop CI1', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 2, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (18, N'Laptop AQ1', 999, CAST(N'2022-03-09' AS Date), N'pOweR LATOP', 54, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (23, N'Laptop ADS', 924, CAST(N'2022-04-21' AS Date), N'This is new', 3, N'Laptop')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (24, N'Keyboard 8822HH', 824, CAST(N'2022-04-22' AS Date), N'New Product', 0, N'Keyboard')
INSERT [dbo].[product] ([product_id], [name], [price], [release_date], [detail], [p_view], [genre]) VALUES (25, N'Laptop AABHH122 Super MODE Engine 228882', 999, CAST(N'2022-04-23' AS Date), N'Mix Laptop Powerful', 31, N'Laptop')
SET IDENTITY_INSERT [dbo].[product] OFF
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (17, N'20220420214648.nt-png.png')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (18, N'20220413150416.bac_6.jpeg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (18, N'20220413150416.d-3mau.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (23, N'20220414155251.one_h1.png')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (23, N'20220414155102.bac_6.jpeg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (23, N'20220414155102.d-3mau.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (23, N'20220414155102.00x600.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (17, N'20220420214648.ef4e_z.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (17, N'20220420214648.391029.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (15, N'20220420214707.fe31d.jpeg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (15, N'20220420214707.8-49-2.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (15, N'20220420214707._250go.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (14, N'20220420214729.a7es-1.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (14, N'20220420214729.st-d14.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (14, N'20220420214729.review.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (13, N'20220420214744.-hon-3.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (13, N'20220420214744.160dc2.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (13, N'20220420214744.a859ad.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (12, N'20220420214939.160dc2.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (10, N'20220420215037.review.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (10, N'20220420215037._250go.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (10, N'20220420215037.st-d14.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (9, N'20220420215206.-hon-3.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (9, N'20220420215206.160dc2.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (9, N'20220420215206.e2a548.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (8, N'20220420215253._250go.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (8, N'20220420215253.70667a.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (8, N'20220420215253.a859ad.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (7, N'20220420215323.review.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (7, N'20220420215323.fe31d.jpeg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (7, N'20220420215323._250go.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (7, N'20220420215323.-54538.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (12, N'20220420214939.4df085.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (12, N'20220420214939.e2a548.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (11, N'20220420215008.-pc-v1.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (11, N'20220420215008.70667a.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (11, N'20220420215008.-54538.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (6, N'20220420215344.st-d14.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (6, N'20220420215344.00x600.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (6, N'20220420215344.4df085.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (2, N'20220420215421.lipart.png')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (2, N'20220420215421.418797.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (24, N'20220420215530.418797.jpg')
INSERT [dbo].[product_img] ([product_id], [img]) VALUES (25, N'20220421171340.review.jpg')
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_account]    Script Date: 4/22/2022 7:25:16 PM ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [IX_account] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product]    Script Date: 4/22/2022 7:25:16 PM ******/
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [IX_product] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_account]
GO
ALTER TABLE [dbo].[bill_product]  WITH CHECK ADD  CONSTRAINT [FK_bill_product_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bill_product] CHECK CONSTRAINT [FK_bill_product_bill]
GO
ALTER TABLE [dbo].[cart_account]  WITH CHECK ADD  CONSTRAINT [FK_cart_account_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cart_account] CHECK CONSTRAINT [FK_cart_account_account]
GO
ALTER TABLE [dbo].[cart_detail]  WITH CHECK ADD  CONSTRAINT [FK_cart_detail_cart_account] FOREIGN KEY([cart_id])
REFERENCES [dbo].[cart_account] ([cart_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cart_detail] CHECK CONSTRAINT [FK_cart_detail_cart_account]
GO
ALTER TABLE [dbo].[cart_detail]  WITH CHECK ADD  CONSTRAINT [FK_cart_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cart_detail] CHECK CONSTRAINT [FK_cart_detail_product]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_account]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_product]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_account]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_genre] FOREIGN KEY([genre])
REFERENCES [dbo].[genre] ([genre_name])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_genre]
GO
ALTER TABLE [dbo].[product_img]  WITH CHECK ADD  CONSTRAINT [FK_product_img_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product_img] CHECK CONSTRAINT [FK_product_img_product]
GO

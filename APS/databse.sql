USE [APDatadb]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/30/2024 8:44:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[account_type] [varchar](50) NULL,
	[balance] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorizations]    Script Date: 7/30/2024 8:44:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorizations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[pages] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_authorizations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notifications]    Script Date: 7/30/2024 8:44:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notifications](
	[notification_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[message] [text] NULL,
	[is_read] [bit] NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 7/30/2024 8:44:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[created_at] [datetime] NULL,
	[description] [nchar](10) NULL,
	[isAuthorized] [bit] NULL,
 CONSTRAINT [PK__user__B9BE370F252B5F0B] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 
GO
INSERT [dbo].[account] ([account_id], [user_id], [account_type], [balance], [created_at]) VALUES (1, 1, N'admin', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-19T20:17:06.267' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[authorizations] ON 
GO
INSERT [dbo].[authorizations] ([id], [userId], [pages]) VALUES (1, 1, N'home;users')
GO
SET IDENTITY_INSERT [dbo].[authorizations] OFF
GO
SET IDENTITY_INSERT [dbo].[notifications] ON 
GO
INSERT [dbo].[notifications] ([notification_id], [user_id], [message], [is_read], [created_at]) VALUES (1, 1, N'Hello this is a new message', 0, CAST(N'2024-06-19T20:45:44.327' AS DateTime))
GO
INSERT [dbo].[notifications] ([notification_id], [user_id], [message], [is_read], [created_at]) VALUES (2, 1, N'wertty', 0, CAST(N'2024-06-19T20:47:31.857' AS DateTime))
GO
INSERT [dbo].[notifications] ([notification_id], [user_id], [message], [is_read], [created_at]) VALUES (3, 1, N'notification 2', 0, CAST(N'2024-06-19T20:47:38.190' AS DateTime))
GO
INSERT [dbo].[notifications] ([notification_id], [user_id], [message], [is_read], [created_at]) VALUES (4, 1, N'notification 3', 0, CAST(N'2024-06-19T20:47:42.060' AS DateTime))
GO
INSERT [dbo].[notifications] ([notification_id], [user_id], [message], [is_read], [created_at]) VALUES (5, 1, N'notification 4', 0, CAST(N'2024-06-19T20:47:45.760' AS DateTime))
GO
INSERT [dbo].[notifications] ([notification_id], [user_id], [message], [is_read], [created_at]) VALUES (6, 1, N'notification 5', 0, CAST(N'2024-06-19T20:47:50.900' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 
GO
INSERT [dbo].[user] ([user_id], [username], [password], [email], [created_at], [description], [isAuthorized]) VALUES (1, N'amiranda', N'Alajuela', N'amiranda@gmail.com', CAST(N'2024-06-10T23:42:12.260' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[user] ([user_id], [username], [password], [email], [created_at], [description], [isAuthorized]) VALUES (3, N'sebastian', N'sebas', N'sebas@gmail.copm', CAST(N'2024-06-17T20:58:29.710' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[user] ([user_id], [username], [password], [email], [created_at], [description], [isAuthorized]) VALUES (4, N'mariajose', N'mariajose', N'mariajose@gmail.com', CAST(N'2024-06-17T20:58:53.323' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__AB6E6164370A04BB]    Script Date: 7/30/2024 8:44:07 AM ******/
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [UQ__user__AB6E6164370A04BB] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__F3DBC572BFEF5BB5]    Script Date: 7/30/2024 8:44:07 AM ******/
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [UQ__user__F3DBC572BFEF5BB5] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0.00)) FOR [balance]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[notifications] ADD  DEFAULT ((0)) FOR [is_read]
GO
ALTER TABLE [dbo].[notifications] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__created_at__398D8EEE]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK__account__user_id__3E52440B] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK__account__user_id__3E52440B]
GO
ALTER TABLE [dbo].[authorizations]  WITH CHECK ADD  CONSTRAINT [FK_Users_Authorizations] FOREIGN KEY([id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[authorizations] CHECK CONSTRAINT [FK_Users_Authorizations]
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [FK__notificat__user___4316F928] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [FK__notificat__user___4316F928]
GO

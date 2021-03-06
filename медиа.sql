USE [MediaGr]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 04.03.2022 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](12) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 04.03.2022 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NULL,
	[IDUser] [int] NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04.03.2022 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDClient] [int] NOT NULL,
	[IDService] [int] NOT NULL,
	[IDManager] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DurationInSecond] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Order_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 04.03.2022 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04.03.2022 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[Access] [tinyint] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ServiceWithType]    Script Date: 04.03.2022 12:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ServiceWithType]
AS
SELECT        dbo.Service.s_ID AS ID, dbo.Service.s_cost AS Cost, dbo.Type.t_name AS TypeTitle
FROM            dbo.Service INNER JOIN
                         dbo.Type ON dbo.Service.s_type_ID = dbo.Type.t_ID
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [Patronymic], [Surname], [Phone], [Email]) VALUES (2, N'Валентин', N'Михайлович', N'Путин', N'+79523450912', N'dadadadad@yandex.ru')
INSERT [dbo].[Client] ([ID], [FirstName], [Patronymic], [Surname], [Phone], [Email]) VALUES (3, N'Артём', N'Сергеевич', N'Медведев', N'+79875671209', N'artem7@gmail.com')
INSERT [dbo].[Client] ([ID], [FirstName], [Patronymic], [Surname], [Phone], [Email]) VALUES (1003, N'Владимир', N'Владимирович', N'Путин', N'+79871234567', N'volodya228@gmail.com')
INSERT [dbo].[Client] ([ID], [FirstName], [Patronymic], [Surname], [Phone], [Email]) VALUES (2003, N'Володя', N'Владимирович', N'Алах', N'8952464659', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([ID], [Surname], [FirstName], [Patronymic], [IDUser]) VALUES (1, N'Малахов', N'Максим', N'Сергеевич', 1)
INSERT [dbo].[Manager] ([ID], [Surname], [FirstName], [Patronymic], [IDUser]) VALUES (6, N'Буданов', N'Иван', N'Михайлович', 1003)
INSERT [dbo].[Manager] ([ID], [Surname], [FirstName], [Patronymic], [IDUser]) VALUES (1006, N'Смирнов', N'Владимир', N'Андреевич', 2)
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [IDClient], [IDService], [IDManager], [Count], [DurationInSecond], [Price], [Date], [Status]) VALUES (3, 2003, 6, 1, 3, 4, 240, CAST(N'2022-03-03' AS Date), 0)
INSERT [dbo].[Order] ([ID], [IDClient], [IDService], [IDManager], [Count], [DurationInSecond], [Price], [Date], [Status]) VALUES (5, 2, 9, 1, 10, 2, 10000, CAST(N'2022-03-03' AS Date), 1)
INSERT [dbo].[Order] ([ID], [IDClient], [IDService], [IDManager], [Count], [DurationInSecond], [Price], [Date], [Status]) VALUES (6, 3, 8, 1, 15, 5, 15075, CAST(N'2022-03-05' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (6, N'Имеджевые ', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (8, N'Игровые   ', CAST(201.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (9, N'Песенные  ', CAST(500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [login], [password], [Access]) VALUES (1, N'maxim', N'123', 0)
INSERT [dbo].[User] ([ID], [login], [password], [Access]) VALUES (2, N'volodya228', N'123', 0)
INSERT [dbo].[User] ([ID], [login], [password], [Access]) VALUES (3, N'manager', N'pass', 1)
INSERT [dbo].[User] ([ID], [login], [password], [Access]) VALUES (1003, N'user1', N'12', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Access]  DEFAULT ((0)) FOR [Access]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Manager] FOREIGN KEY([IDManager])
REFERENCES [dbo].[Manager] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Manager]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Service] FOREIGN KEY([IDService])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Service]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Service"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 118
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Type"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 101
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ServiceWithType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ServiceWithType'
GO

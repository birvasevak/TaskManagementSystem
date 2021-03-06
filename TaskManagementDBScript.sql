/****** Object:  Database [TaskManagementDB]    Script Date: 11/16/2020 10:19:53 AM ******/
CREATE DATABASE [TaskManagementDB]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [TaskManagementDB] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [TaskManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaskManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaskManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaskManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaskManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaskManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaskManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaskManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaskManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaskManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaskManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaskManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaskManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaskManagementDB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [TaskManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaskManagementDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TaskManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [TaskManagementDB] SET ENCRYPTION ON
GO
ALTER DATABASE [TaskManagementDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TaskManagementDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Quote]    Script Date: 11/16/2020 10:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quote](
	[QuoteId] [int] IDENTITY(1,1) NOT NULL,
	[QuoteType] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[TaskDescription] [nvarchar](300) NULL,
	[DueDate] [datetime] NULL,
	[TaskType] [nvarchar](50) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK__Quote__AF9688C1BCE7E053] PRIMARY KEY CLUSTERED 
(
	[QuoteId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/16/2020 10:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserRole] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Quote] ON 

INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (1, N'DYR', N'Sale Person', N'Get new sales report', CAST(N'2020-10-27T00:00:00.000' AS DateTime), N'New', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (2, N'BR', N'Manager', N'Get updates on the current project', CAST(N'2020-10-27T00:00:00.000' AS DateTime), N'Follow up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (3, N'DYR', N'Sale Person', N'Get new sale quotation', CAST(N'2020-10-27T00:00:00.000' AS DateTime), N'New', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (5, N'BR', N'Manager', N'Report new progress', CAST(N'2020-10-27T00:00:00.000' AS DateTime), N'New', 8)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (6, N'nn', N'Manager', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'New', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (7, N'BR', N'Manager', N'more update task 7', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'Follow Up', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (8, N'BR', N'Sales Person', N'new update task 8', CAST(N'2020-11-17T00:00:00.000' AS DateTime), N'DIY', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (9, N'DIY', N'Junior Developer', N'updating task 9', CAST(N'2020-11-19T00:00:00.000' AS DateTime), N'Follow Up', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (10, N'BR', N'Architech', N'Task 10 is updated', CAST(N'2020-11-25T00:00:00.000' AS DateTime), N'New', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (11, N'BR', N'Designer', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-25T00:00:00.000' AS DateTime), N'Follow Up', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (12, N'BR', N'Manager', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-01T00:00:00.000' AS DateTime), N'New', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (13, N'BR', N'Manager', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-30T00:00:00.000' AS DateTime), N'Follow Up', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (14, N'BR', N'Designer', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-20T00:00:00.000' AS DateTime), N'Follow Up', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (15, N'BR', N'Manager', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-25T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (16, N'DYR', N'Sales Person', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-18T00:00:00.000' AS DateTime), N'New', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (17, N'BR', N'Developer', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-20T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (18, N'DYR', N'Architech', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-25T00:00:00.000' AS DateTime), N'New', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (19, N'BR', N'Designer', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-25T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (20, N'DYR', N'Manager', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-01T00:00:00.000' AS DateTime), N'New', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (21, N'BR', N'Manager', N'updates task 21', CAST(N'2020-12-30T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (22, N'DYR', N'Designer', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-20T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (23, N'BR', N'Manager', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-25T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (24, N'DYR', N'Sales Person', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-18T00:00:00.000' AS DateTime), N'New', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (25, N'BR', N'Developer', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-20T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (26, N'DYR', N'Architech', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-25T00:00:00.000' AS DateTime), N'New', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (27, N'BR', N'Designer', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-25T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (28, N'DYR', N'Manager', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-01T00:00:00.000' AS DateTime), N'New', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (29, N'BR', N'Manager', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-12-30T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (30, N'DYR', N'Designer', N'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Exercitationem, incidunt.', CAST(N'2020-11-20T00:00:00.000' AS DateTime), N'Follow Up', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (33, N'ccc', N'cc', N'ccccccc ccc cc ', CAST(N'2020-11-02T00:00:00.000' AS DateTime), N'cc', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (34, N'new', N'new', N'new', CAST(N'2020-11-14T00:00:00.000' AS DateTime), N'new', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (35, N'task', N'task', N'task', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'task', 2)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (36, N'BR', N'Self', N'it''s a new task', CAST(N'2020-11-27T14:00:00.000' AS DateTime), N'New', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (37, N'BR', N'self', N'new task', CAST(N'2020-11-19T00:00:00.000' AS DateTime), N'new', 13)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (38, N'DYR', N'Manager', N'updated task for the manager', CAST(N'2020-11-26T00:00:00.000' AS DateTime), N'Follow Up', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (39, N'DIY', N'Self', N'task', CAST(N'2020-11-25T00:00:00.000' AS DateTime), N'Follow Up', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (40, N'BR', N'Self', N'Self note', CAST(N'2020-11-20T00:00:00.000' AS DateTime), N'New', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (42, N'sample string 2', N'sample string 3', N'sample string 4', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'sample string 5', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (43, N'self', N'self', N'self note', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'self', 1)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (44, N'BR', N'Self', N'Presentation', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'New', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (45, N'DIY', N'Manager', N'Assignment', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'New', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (46, N'nn', N'nnn', N'ssssssssssssssssss', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'nnn', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (47, N'render', N'hhhh', N'testing rerender', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'sssqs', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (48, N'vvgvg', N'vgvgvg', N'vgvgvgv', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'vgvgv', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (49, N'sss', N'fff', N'ffffff', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'fff', 21)
INSERT [dbo].[Quote] ([QuoteId], [QuoteType], [Contact], [TaskDescription], [DueDate], [TaskType], [UserId]) VALUES (50, N'sssss', N'sss', N'ssss', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'ssss', 21)
SET IDENTITY_INSERT [dbo].[Quote] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (1, N'John@gmail.com', N'John@123', N'John@gmail.com', N'John', N'Doe', N'User')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (2, N'Rose@gmail.com', N'Rose@123', N'Rose@gmail.com', N'Rose', N'Smit', N'User')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (3, N'Jane@gmail.com', N'Jane@123', N'Jane@gmail.com', N'Jane', N'Doe', N'User')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (4, N'Tom@gmail.com', N'Tom@123', N'Tom@gmail.com', N'Tom', N'Smit', N'User')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (8, N'Sara@gmail.com', N'Sara@123', N'Sara@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (9, N'jim@gmail.com', N'Jim@123', N'jim@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (10, N'user@gmail.com', N'User@123', N'user@gmail.com', N'', N'', NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (13, N'ana@gmail.com', N'ana@123', N'ana@gmail.com', NULL, NULL, N'User')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (21, N'birva@gmail.com', N'Birva@123', N'birva@gmail.com', N'', N'', N'User')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [FirstName], [LastName], [UserRole]) VALUES (22, N'hanna@gmail.com', N'Hanna@123', N'hanna@gmail.com', N'', N'', N'User')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Quote]  WITH CHECK ADD  CONSTRAINT [FK__Quote__UserId__5EBF139D] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Quote] CHECK CONSTRAINT [FK__Quote__UserId__5EBF139D]
GO
ALTER DATABASE [TaskManagementDB] SET  READ_WRITE 
GO

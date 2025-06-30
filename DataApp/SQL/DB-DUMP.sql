USE [master]
GO
/****** Object:  Database [FireExamAppDB]    Script Date: 12.06.2025 22:23:00 ******/
CREATE DATABASE [FireExamAppDB]
go

USE [FireExamAppDB]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 12.06.2025 22:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[AnswerText] [nvarchar](max) NOT NULL,
	[IsCorrectAnswer] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 12.06.2025 22:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 12.06.2025 22:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TestDate] [datetime2](7) NOT NULL,
	[UserScore] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12.06.2025 22:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Rolename] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestStatuses]    Script Date: 12.06.2025 22:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestStatuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Statusname] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 12.06.2025 22:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] NOT NULL,
	[FromUserID] [int] NOT NULL,
	[TicketDate] [datetime2](7) NOT NULL,
	[TicketText] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAnswers]    Script Date: 12.06.2025 22:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswers](
	[UserAnswerID] [int] IDENTITY(1,1) NOT NULL,
	[AnswerDate] [datetime2](7) NOT NULL,
	[UserID] [int] NULL,
	[QuestionID] [int] NULL,
	[AnswerID] [int] NULL,
	[IsCorrect] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.06.2025 22:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[RoleID] [int] NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answers] ON 
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (1, 1, N'1 огнетушитель ОП-5', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (2, 1, N'2 огнетушителя ОП-4', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (3, 1, N'1 огнетушитель ОУ-3', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (4, 1, N'2 огнетушителя ОП-2', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (5, 1, N'1 огнетушитель ОП-3 и 1 ОУ-2', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (6, 2, N'10 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (7, 2, N'15 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (8, 2, N'20 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (9, 2, N'25 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (10, 2, N'30 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (11, 3, N' Раз в месяц', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (12, 3, N'Раз в квартал', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (13, 3, N'Раз в полгода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (14, 3, N'Раз в год', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (15, 3, N'Раз в 5 лет', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (16, 4, N'12 В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (17, 4, N'24 В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (18, 4, N'36 В', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (19, 4, N'220 В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (20, 4, N'380 В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (21, 5, N'ФЗ № 123-ФЗ', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (22, 5, N'Приказ МЧС № 645', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (23, 5, N'ППБ 01-03', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (24, 5, N'Приказ № 313', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (25, 5, N'ГОСТ Р 12.0.230-2007', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (26, 6, N' 0,6 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (27, 6, N'0,8 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (28, 6, N'1,0 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (29, 6, N'1,2 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (30, 6, N'1,4 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (31, 7, N'Один', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (32, 7, N'Два', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (33, 7, N'Три', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (34, 7, N'Четыре', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (35, 7, N'Пять', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (36, 8, N'Раз в месяц', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (37, 8, N'Раз в квартал', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (38, 8, N'Раз в полгода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (39, 8, N'Раз в год', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (40, 8, N'Раз в 3 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (41, 9, N'0,5 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (42, 9, N'0,8 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (43, 9, N'1,0 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (44, 9, N'1,2 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (45, 9, N'1,5 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (46, 10, N'Инженер по охране труда', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (47, 10, N'уководитель подразделения', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (48, 10, N'Ответственный за пожарную безопасность', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (49, 10, N'Специалист по кадрам', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (50, 10, N'Сам сотрудник в электронном виде', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (51, 11, N'0,1 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (52, 11, N'0,25 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (53, 11, N'0,5 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (54, 11, N'0,75 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (55, 11, N'1,0 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (56, 12, N'Ежемесячно', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (57, 12, N'Ежеквартально', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (58, 12, N'Раз в полгода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (59, 12, N'Раз в год', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (60, 12, N'Раз в 3 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (61, 13, N'10 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (62, 13, N'15 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (63, 13, N'20 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (64, 13, N'25 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (65, 13, N'30 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (66, 14, N'Красный круг с перечёркнутой сигаретой', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (67, 14, N'Синий круг с белой сигаретой', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (68, 14, N'Жёлтый треугольник с сигаретой', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (69, 14, N'Зелёный квадрат с перечёркнутой сигаретой', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (70, 14, N'Красный квадрат с белым огнетушителем', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (71, 15, N'Один', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (72, 15, N'Два', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (73, 15, N'Три', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (74, 15, N'Четыре', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (75, 15, N'Пять', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (76, 16, N'Углекислотный (ОУ)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (77, 16, N'Порошковый (ОП)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (78, 16, N'Воздушно-пенный (ОВП)', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (79, 16, N'Хладоновый (ОХ)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (80, 16, N'Водный (ОВ)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (81, 17, N'До 5 минут', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (82, 17, N'До 10 минут', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (83, 17, N'До 15 минут', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (84, 17, N'До 20 минут', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (85, 17, N'До 30 минут', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (86, 18, N'Раз в месяц', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (87, 18, N'Раз в 3 месяца', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (88, 18, N'Раз в 6 месяцев', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (89, 18, N'Раз в год', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (90, 18, N'Раз в 3 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (91, 19, N'Тип 1 (звуковая)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (92, 19, N'Тип 2 (звуковая + световая)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (93, 19, N'Тип 3 (звуковая + световая + речевая)', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (94, 19, N'Тип 4 (речевая + световые указатели)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (95, 19, N'Тип 5 (только световые табло)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (96, 20, N'Штраф до 10 000 руб', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (97, 20, N'Штраф до 50 000 руб', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (98, 20, N'Штраф до 200 000 руб', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (99, 20, N'Лишение свободы до 3 лет', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (100, 20, N'Лишение свободы до 7 лет', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (101, 21, N'Ежемесячно', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (102, 21, N'Ежеквартально', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (103, 21, N'Раз в полгода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (104, 21, N'Раз в год', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (105, 21, N'Раз в 3 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (106, 22, N'Журнал учета огнетушителей', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (107, 22, N'План эвакуации', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (108, 22, N'Инструкция по охране труда', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (109, 22, N'Декларация пожарной безопасности', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (110, 22, N'Все перечисленные', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (111, 23, N'10 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (112, 23, N'15 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (113, 23, N'20 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (114, 23, N'25 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (115, 23, N'50 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (116, 24, N'К0', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (117, 24, N'К1', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (118, 24, N'К2', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (119, 24, N'К3', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (120, 24, N'К4', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (121, 25, N'10 человек', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (122, 25, N'20 человек', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (123, 25, N'30 человек', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (124, 25, N'50 человек', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (125, 25, N'100 человек', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (126, 26, N'0,8 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (127, 26, N'1,0 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (128, 26, N'1,2 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (129, 26, N'1,35 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (130, 26, N'1,5 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (131, 27, N'Архивы', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (132, 27, N'Серверные', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (133, 27, N'Подвалы', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (134, 27, N'Чердаки', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (135, 27, N'Все перечисленные', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (136, 28, N'1 год', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (137, 28, N'3 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (138, 28, N'5 лет', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (139, 28, N'7 лет', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (140, 28, N'Бессрочно', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (141, 29, N'1 выход', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (142, 29, N'2 выхода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (143, 29, N'3 выхода', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (144, 29, N'4 выхода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (145, 29, N'5 выходов', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (146, 30, N'50 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (147, 30, N'100 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (148, 30, N'150 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (149, 30, N'200 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (150, 30, N'250 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (151, 31, N'1 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (152, 31, N'2 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (153, 31, N'3 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (154, 31, N'5 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (155, 31, N'10 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (156, 32, N'ОП (порошковый)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (157, 32, N'ОУ (углекислотный)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (158, 32, N'ОХ (хладоновый)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (159, 32, N'ОВ (водный)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (160, 32, N'ОС (специальный)', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (161, 33, N'0,8 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (162, 33, N'1,2 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (163, 33, N'1,5 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (164, 33, N'1,8 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (165, 33, N'2,0 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (166, 34, N'Ежеквартально', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (167, 34, N'Раз в полгода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (168, 34, N'Раз в год', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (169, 34, N'Раз в 3 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (170, 34, N'Раз в 5 лет', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (171, 35, N'1 выход', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (172, 35, N'2 выхода', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (173, 35, N'3 выхода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (174, 35, N'4 выхода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (175, 35, N'Определяется расчетом', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (176, 36, N'5 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (177, 36, N'10 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (178, 36, N'15 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (179, 36, N'20 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (180, 36, N'25 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (181, 37, N'ФЗ-123', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (182, 37, N'ППБ 01-03', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (183, 37, N'СП 2.13130', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (184, 37, N'Приказ МЧС № 645', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (185, 37, N'ГОСТ Р 12.0.230', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (186, 38, N'Ежеквартально', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (187, 38, N'Раз в полгода', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (188, 38, N'Раз в год', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (189, 38, N'Раз в 3 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (190, 38, N'Раз в 5 лет', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (191, 39, N'1 кран', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (192, 39, N'2 крана', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (193, 39, N'3 крана', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (194, 39, N'4 крана', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (195, 39, N'5 кранов', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (196, 40, N'12 В', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (197, 40, N'24 В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (198, 40, N'36 В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (199, 40, N'42 В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (200, 40, N'220 В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (201, 41, N'5 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (202, 41, N'10 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (203, 41, N'15 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (204, 41, N'20 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (205, 41, N'50 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (206, 42, N'А', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (207, 42, N'В', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (208, 42, N'С', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (209, 42, N'D', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (210, 42, N'Е', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (211, 43, N'Раз в 1 год', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (212, 43, N'Раз в 2 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (213, 43, N'Раз в 3 года', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (214, 43, N'Раз в 5 лет', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (215, 43, N'Не требуется', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (216, 44, N'50 мм', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (217, 44, N'75 мм', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (218, 44, N'100 мм', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (219, 44, N'150 мм', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (220, 44, N'200 мм', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (221, 45, N'15 мин', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (222, 45, N'30 мин', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (223, 45, N'45 мин', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (224, 45, N'60 мин', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (225, 45, N'90 мин', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (226, 46, N'Акт', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (227, 46, N'Протокол', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (228, 46, N'Декларация', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (229, 46, N'Предписание', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (230, 46, N'Журнал', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (231, 47, N'5 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (232, 47, N'10 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (233, 47, N'15 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (234, 47, N'20 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (235, 47, N'25 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (236, 48, N'0,8 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (237, 48, N'1,0 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (238, 48, N'1,2 м', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (239, 48, N'1,4 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (240, 48, N'1,5 м', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (241, 49, N'1 этаж', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (242, 49, N'2 этажа', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (243, 49, N'3 этажа', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (244, 49, N'4 этажа', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (245, 49, N'5 этажей', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (246, 50, N'Красный', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (247, 50, N'Желтый', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (248, 50, N'Белый с красной окантовкой', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (249, 50, N'Зеленый', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (250, 50, N'Синий', 0)
GO
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (1, N'Какой минимальный состав должен быть у первичных средств пожаротушения в офисных помещениях (на каждые 100 м²)?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (2, N'	Какое максимальное расстояние должно быть от возможного очага пожара до места размещения огнетушителя в общественных зданиях?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (3, N'Как часто должны проверяться огнетушители на работоспособность?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (4, N'Какое напряжение должно быть у аварийного освещения в зонах эвакуации?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (5, N'Какой документ регламентирует порядок проведения противопожарных инструктажей?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (6, N'Какой должна быть минимальная ширина эвакуационного выхода?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (7, N'Какое минимальное количество эвакуационных выходов должно быть из помещений, где одновременно находятся более 50 человек?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (8, N'Как часто должны проводиться практические тренировки по эвакуации при пожаре?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (9, N'Какое расстояние должно быть между штабелями материалов в складских помещениях для обеспечения свободного прохода?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (10, N'Кто обязан проводить вводный противопожарный инструктаж для новых сотрудников?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (11, N'Какое минимальное расстояние должно быть между обогревательными приборами и горючими материалами?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (12, N'Как часто необходимо проводить проверку внутренних пожарных кранов?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (13, N'Какая максимальная длина рукава у внутреннего пожарного крана?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (14, N'Какой знак безопасности обозначает "Запрещается курить"?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (15, N'Какое минимальное количество пожарных щитов должно быть на территории организации площадью 5 000 м²?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (16, N'Какой тип огнетушителя запрещено использовать для тушения электроустановок под напряжением?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (17, N'Какое время должно быть обеспечено для эвакуации людей из здания при пожаре?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (18, N'Как часто проводится повторный противопожарный инструктаж?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (19, N'Какая система оповещения должна быть в зданиях высотой более 28 м?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (20, N'Какое наказание предусмотрено за нарушение требований пожарной безопасности, повлекшее возникновение пожара?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (21, N'Какая периодичность проверки сопротивления изоляции электропроводки установлена правилами пожарной безопасности?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (22, N'Какой документ обязательно должен быть на каждом объекте защиты?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (23, N'Какое минимальное расстояние от зданий до открытых складов лесоматериалов?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (24, N'Какой класс пожарной опасности присваивается помещениям с постоянным наличием горючих газов?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (25, N'Какое максимальное количество человек может находиться в помещении с одним эвакуационным выходом?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (26, N'Какой должна быть минимальная ширина лестничных маршей в зданиях учреждений?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (27, N'Какие помещения обязательно оборудуются автоматической пожарной сигнализацией?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (28, N'Какой срок действия у декларации пожарной безопасности?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (29, N'Какое минимальное количество эвакуационных выходов должно быть из зрительного зала на 300 мест?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (30, N'Какое максимальное расстояние между пожарными гидрантами в городской застройке?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (31, N'Какое минимальное расстояние должно быть между штабелями пиломатериалов на открытой площадке?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (32, N'Какой тип огнетушителя следует использовать для тушения щелочных металлов?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (33, N'Какая высота установки ручных пожарных извещателей в помещениях?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (34, N'Как часто проводятся испытания наружных пожарных лестниц?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (35, N'Какое минимальное количество эвакуационных выходов должно быть с этажа здания высотой 15 м?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (36, N'Какое максимальное расстояние между световыми указателями "Выход" в коридорах?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (37, N'Какой документ определяет порядок разработки специальных технических условий для объектов защиты?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (38, N'Какая периодичность проверки работоспособности систем противодымной защиты?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (39, N'Какое минимальное количество пожарных кранов должно быть на этаже здания площадью 800 м²?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (40, N'Какое напряжение допускается для переносных светильников в помещениях с повышенной опасностью?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (41, N'Какое минимальное расстояние от костра до зданий допускается при проведении огневых работ?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (42, N'Какой класс пожара обозначает возгорание электроустановок под напряжением?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (43, N'Какая периодичность перезарядки порошковых огнетушителей?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (44, N'Какой минимальный диаметр должен иметь пожарный гидрант в водопроводной сети?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (45, N'Какое максимальное время работы системы оповещения 3 типа при отключении электроэнергии?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (46, N'Какой документ оформляется по результатам проверки состояния огнезащитной обработки?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (47, N'Какое минимальное расстояние от газопровода до места проведения сварочных работ?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (48, N'Какой должна быть минимальная ширина дверей эвакуационных выходов из помещений с массовым пребыванием людей?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (49, N'Какое максимальное количество этажей допускается в зданиях V степени огнестойкости?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (50, N'Какой цвет должны иметь пожарные щиты?')
GO
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Results] ON 
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (14, 57, CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 7, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (15, 49, CAST(N'2025-06-04T00:00:00.0000000' AS DateTime2), 9, 1)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (16, 75, CAST(N'2025-06-05T00:00:00.0000000' AS DateTime2), 3, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (17, 61, CAST(N'2025-06-06T00:00:00.0000000' AS DateTime2), 9, 1)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (18, 37, CAST(N'2025-06-07T00:00:00.0000000' AS DateTime2), 6, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (19, 7, CAST(N'2025-06-08T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (20, 45, CAST(N'2025-06-09T00:00:00.0000000' AS DateTime2), 6, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (21, 8, CAST(N'2025-06-10T00:00:00.0000000' AS DateTime2), 7, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (22, 79, CAST(N'2025-06-11T00:00:00.0000000' AS DateTime2), 5, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (23, 11, CAST(N'2025-06-12T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (24, 64, CAST(N'2025-06-13T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (25, 78, CAST(N'2025-06-14T00:00:00.0000000' AS DateTime2), 8, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (26, 36, CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (27, 23, CAST(N'2025-06-16T00:00:00.0000000' AS DateTime2), 7, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (28, 70, CAST(N'2025-06-17T00:00:00.0000000' AS DateTime2), 6, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (29, 60, CAST(N'2025-06-18T00:00:00.0000000' AS DateTime2), 5, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (30, 59, CAST(N'2025-06-19T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (31, 73, CAST(N'2025-06-20T00:00:00.0000000' AS DateTime2), 4, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (32, 35, CAST(N'2025-06-21T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (33, 30, CAST(N'2025-06-22T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (34, 40, CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), 8, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (35, 34, CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (36, 18, CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), 9, 1)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (37, 68, CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), 5, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (38, 76, CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (39, 13, CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), 6, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (40, 56, CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 10, 1)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (41, 74, CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), 7, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (42, 58, CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), 4, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (43, 77, CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), 6, 2)
GO
INSERT [dbo].[Results] ([ResultID], [UserID], [TestDate], [UserScore], [StatusID]) VALUES (44, 53, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 3, 2)
GO
SET IDENTITY_INSERT [dbo].[Results] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleID], [Rolename]) VALUES (1, N'инструктор')
GO
INSERT [dbo].[Roles] ([RoleID], [Rolename]) VALUES (2, N'ревизор')
GO
INSERT [dbo].[Roles] ([RoleID], [Rolename]) VALUES (3, N'пользователь')
GO
INSERT [dbo].[Roles] ([RoleID], [Rolename]) VALUES (4, N'администратор')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[TestStatuses] ON 
GO
INSERT [dbo].[TestStatuses] ([StatusID], [Statusname]) VALUES (1, N'пройден')
GO
INSERT [dbo].[TestStatuses] ([StatusID], [Statusname]) VALUES (2, N'не пройден')
GO
SET IDENTITY_INSERT [dbo].[TestStatuses] OFF
GO
INSERT [dbo].[Tickets] ([TicketID], [FromUserID], [TicketDate], [TicketText]) VALUES (0, 7, CAST(N'2025-05-26T21:21:57.2872863' AS DateTime2), N'тестовое сообщение / test message')
GO
SET IDENTITY_INSERT [dbo].[UserAnswers] ON 
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 21, 102, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 20, 98, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 6, 27, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 14, 66, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 12, 59, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 8, 38, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 40, 198, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 48, 238, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (9, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 15, 73, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 28, 138, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (11, CAST(N'2025-05-26T21:47:11.8396824' AS DateTime2), 7, 9, 43, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (12, CAST(N'2025-05-26T21:47:12.7253095' AS DateTime2), 7, 21, 105, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (13, CAST(N'2025-05-26T21:47:13.3964663' AS DateTime2), 7, 27, 135, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (14, CAST(N'2025-05-26T21:47:14.0412448' AS DateTime2), 7, 3, 15, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (15, CAST(N'2025-05-26T21:47:14.7063137' AS DateTime2), 7, 14, 70, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (16, CAST(N'2025-05-26T21:47:15.4604722' AS DateTime2), 7, 12, 60, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (17, CAST(N'2025-05-26T21:47:16.3881573' AS DateTime2), 7, 8, 40, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (18, CAST(N'2025-05-26T21:47:20.0864481' AS DateTime2), 7, 41, 205, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (19, CAST(N'2025-05-26T21:47:21.1825935' AS DateTime2), 7, 30, 150, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (20, CAST(N'2025-05-26T21:47:22.0382174' AS DateTime2), 7, 2, 10, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (21, CAST(N'2025-05-29T14:16:33.1890442' AS DateTime2), 7, 12, 58, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (22, CAST(N'2025-05-29T14:16:34.4448544' AS DateTime2), 7, 44, 218, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (23, CAST(N'2025-05-29T14:16:35.1659062' AS DateTime2), 7, 49, 245, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (24, CAST(N'2025-05-29T14:16:35.9303552' AS DateTime2), 7, 16, 80, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (25, CAST(N'2025-05-29T14:16:36.7653591' AS DateTime2), 7, 37, 185, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (26, CAST(N'2025-05-29T14:16:38.4078652' AS DateTime2), 7, 28, 140, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (27, CAST(N'2025-05-29T14:16:39.7806930' AS DateTime2), 7, 31, 155, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (28, CAST(N'2025-05-29T14:16:40.9098934' AS DateTime2), 7, 24, 118, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (29, CAST(N'2025-05-29T14:16:41.7429539' AS DateTime2), 7, 14, 68, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (30, CAST(N'2025-05-29T14:16:42.6489032' AS DateTime2), 7, 15, 72, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (31, CAST(N'2025-05-29T14:30:41.3895936' AS DateTime2), 8, 27, 135, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (32, CAST(N'2025-05-29T14:30:42.5729435' AS DateTime2), 8, 14, 70, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (33, CAST(N'2025-05-29T14:30:43.3324122' AS DateTime2), 8, 23, 115, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (34, CAST(N'2025-05-29T14:30:43.9703443' AS DateTime2), 8, 28, 140, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (35, CAST(N'2025-05-29T14:30:44.5863496' AS DateTime2), 8, 12, 60, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (36, CAST(N'2025-05-29T14:30:45.1396329' AS DateTime2), 8, 35, 175, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (37, CAST(N'2025-05-29T14:30:45.6855117' AS DateTime2), 8, 3, 15, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (38, CAST(N'2025-05-29T14:30:46.2626450' AS DateTime2), 8, 15, 75, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (39, CAST(N'2025-05-29T14:30:46.9166160' AS DateTime2), 8, 13, 65, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (40, CAST(N'2025-05-29T14:30:47.5864504' AS DateTime2), 8, 49, 245, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (41, CAST(N'2025-05-29T15:02:19.1488821' AS DateTime2), 7, 15, 74, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (42, CAST(N'2025-05-29T15:02:19.9826409' AS DateTime2), 7, 23, 114, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (43, CAST(N'2025-05-29T15:02:20.6797862' AS DateTime2), 7, 45, 224, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (44, CAST(N'2025-05-29T15:02:40.4084072' AS DateTime2), 7, 48, 239, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (45, CAST(N'2025-05-29T15:02:41.2600768' AS DateTime2), 7, 46, 230, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (46, CAST(N'2025-05-29T15:02:41.9298459' AS DateTime2), 7, 39, 195, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (47, CAST(N'2025-05-29T15:02:42.6515940' AS DateTime2), 7, 3, 15, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (48, CAST(N'2025-05-29T15:02:43.3503243' AS DateTime2), 7, 44, 220, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (49, CAST(N'2025-05-29T15:02:44.0830818' AS DateTime2), 7, 42, 210, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (50, CAST(N'2025-05-29T15:02:44.8240189' AS DateTime2), 7, 20, 100, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (51, CAST(N'2025-05-29T15:02:45.5364755' AS DateTime2), 7, 35, 175, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (52, CAST(N'2025-05-29T15:02:46.2342948' AS DateTime2), 7, 10, 50, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (53, CAST(N'2025-05-29T15:02:46.9153858' AS DateTime2), 7, 25, 125, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (54, CAST(N'2025-05-31T17:52:27.9895970' AS DateTime2), 7, 34, 169, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (55, CAST(N'2025-05-31T17:52:28.8957091' AS DateTime2), 7, 28, 137, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (56, CAST(N'2025-05-31T17:52:29.6586345' AS DateTime2), 7, 41, 204, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (57, CAST(N'2025-05-31T17:52:30.9882600' AS DateTime2), 7, 19, 93, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (58, CAST(N'2025-05-31T17:52:51.2173794' AS DateTime2), 7, 34, 168, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (59, CAST(N'2025-05-31T17:52:51.9998299' AS DateTime2), 7, 12, 57, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (60, CAST(N'2025-05-31T17:52:53.0852783' AS DateTime2), 7, 17, 84, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (61, CAST(N'2025-05-31T17:52:53.8923531' AS DateTime2), 7, 4, 18, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (62, CAST(N'2025-05-31T17:52:54.5700828' AS DateTime2), 7, 9, 43, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (63, CAST(N'2025-05-31T17:52:55.3659140' AS DateTime2), 7, 16, 80, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (64, CAST(N'2025-05-31T17:52:56.5126934' AS DateTime2), 7, 48, 239, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (65, CAST(N'2025-05-31T17:52:57.2606605' AS DateTime2), 7, 44, 218, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (66, CAST(N'2025-05-31T17:52:58.1549794' AS DateTime2), 7, 19, 94, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (67, CAST(N'2025-05-31T17:52:59.6321204' AS DateTime2), 7, 27, 135, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (68, CAST(N'2025-06-03T10:26:54.8989635' AS DateTime2), 7, 36, 177, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (69, CAST(N'2025-06-03T10:26:58.2005917' AS DateTime2), 7, 36, 179, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (70, CAST(N'2025-06-03T10:29:32.2100683' AS DateTime2), 7, 17, 83, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (71, CAST(N'2025-06-03T10:29:35.4892265' AS DateTime2), 7, 26, 127, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (72, CAST(N'2025-06-03T10:30:14.5589036' AS DateTime2), 7, 27, 132, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (73, CAST(N'2025-06-03T10:30:17.4529970' AS DateTime2), 7, 21, 101, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (74, CAST(N'2025-06-03T10:30:35.8031235' AS DateTime2), 7, 14, 68, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (75, CAST(N'2025-06-03T10:30:38.9904221' AS DateTime2), 7, 14, 67, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (76, CAST(N'2025-06-03T10:30:41.6671731' AS DateTime2), 7, 40, 198, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (77, CAST(N'2025-06-03T10:30:43.3182893' AS DateTime2), 7, 18, 87, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (78, CAST(N'2025-06-03T10:30:44.5438514' AS DateTime2), 7, 19, 91, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (79, CAST(N'2025-06-03T10:30:47.5893439' AS DateTime2), 7, 29, 143, 1)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (80, CAST(N'2025-06-03T10:30:52.7716365' AS DateTime2), 7, 20, 96, 0)
GO
INSERT [dbo].[UserAnswers] ([UserAnswerID], [AnswerDate], [UserID], [QuestionID], [AnswerID], [IsCorrect]) VALUES (81, CAST(N'2025-06-03T10:30:55.9067972' AS DateTime2), 7, 39, 193, 0)
GO
SET IDENTITY_INSERT [dbo].[UserAnswers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (1, N'Иван', N'Иванов', N'Иванович', 1, N'123', N'123')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (2, N'Петр', N'Петров', N'Петрович', 2, N'rev', N'rev')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (3, N'Сергей', N'Сергеев', N'Сергеевич', 1, N'sergievss', N'password3  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (4, N'Алексей', N'Алексеев', N'Алексеевич', 2, N'alekseevaa', N'password4  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (5, N'Дмитрий', N'Дмитриев', N'Дмитриевич', 4, N'ad1', N'ad1')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (6, N'Андрей', N'Андреев', N'Андреевич', 2, N'andreev', N'revsr')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (7, N'Михаил', N'Михайлов', N'Михайлович', 3, N'1234', N'123')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (8, N'Александр', N'Александров', N'Александрович', 3, N'alexandrov', N'password8  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (9, N'Евгений', N'Евгеньев', N'Евгеньевич', 3, N'evgeneevee', N'password9  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (10, N'Николай', N'Николаев', N'Николаевич', 2, N'nikolaevnn', N'password10  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (11, N'Артем', N'Артемов', N'Артемович', 2, N'artemovaa', N'password11')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (12, N'Владимир', N'Владимиров', N'Владимирович', 2, N'vladimirov', N'password12  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (13, N'Олег', N'Олегов', N'Олегович', 2, N'olegovoo', N'password13  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (14, N'Павел', N'Павлов', N'Павлович', 1, N'pavlovpp', N'password14  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (15, N'Константин', N'Константинов', N'Константинович', 2, N'konstantin', N'password15')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (16, N'Станислав', N'Станиславов', N'Станиславович', 3, N'stanislavs', N'password16')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (17, N'Григорий', N'Григорьев', N'Григорьевич', 1, N'grigorevgg', N'password17  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (18, N'Федор', N'Федоров', N'Федорович', 2, N'fedorovff', N'password18  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (19, N'Юрий', N'Юрьев', N'Юрьевич', 1, N'yurevyy', N'password19  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (20, N'Василий', N'Васильев', N'Васильевич', 3, N'vasilevvv', N'password20  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (21, N'Борис', N'Борисов', N'Борисович', 1, N'borisovbb', N'password21  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (22, N'Максим', N'Максимов', N'Максимович', 2, N'maximovmm', N'password22  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (23, N'Роман', N'Романов', N'Романович', 1, N'romanovrr', N'password23  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (24, N'Виталий', N'Витальев', N'Витальевич', 3, N'vitalyevvv', N'password24  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (25, N'Георгий', N'Георгиев', N'Георгиевич', 2, N'georgievgg', N'password25')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (26, N'Даниил', N'Даниилов', N'Даниилович', 3, N'daniilovdd', N'password26  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (27, N'Кирилл', N'Кириллов', N'Кириллович', 3, N'kirillovkk', N'password27  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (28, N'Леонид', N'Леонидов', N'Леонидович', 2, N'leonidovll', N'password28  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (29, N'Тимофей', N'Тимофеев', N'Тимофеевич', 1, N'timofeevtt', N'password29  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (30, N'Валерий', N'Валериев', N'Валериевич', 3, N'valeryevvv', N'password30  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (31, N'Виктор', N'Викторов', N'Викторович', 3, N'victorovvv', N'password31  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (32, N'Игорь', N'Игорев', N'Игоревич', 2, N'igorevii', N'password32  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (33, N'Семен', N'Семенов', N'Семенович', 1, N'semenovss', N'password33  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (34, N'Арсений', N'Арсеньев', N'Арсеньевич', 1, N'arsenyevaa', N'password34  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (35, N'Денис', N'Денисов', N'Денисович', 2, N'denisovdd', N'password35  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (36, N'Егор', N'Егоров', N'Егорович', 1, N'egorovee', N'password36  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (37, N'Захар', N'Захаров', N'Захарович', 1, N'zakharovzz', N'password37  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (38, N'Лев', N'Львов', N'Львович', 2, N'lvovll', N'password38  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (39, N'Матвей', N'Матвеев', N'Матвеевич', 1, N'matveyevmm', N'password39  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (40, N'Назар', N'Назаров', N'Назарович', 2, N'nazarovnn', N'password40  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (41, N'Олег', N'Олегов', N'Олегович', 1, N'olegovoo2', N'password41  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (42, N'Платон', N'Платонов', N'Платонович', 1, N'platonovpp', N'password42  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (43, N'Родион', N'Родионов', N'Родионович', 3, N'rodionovrr', N'password43  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (44, N'Степан', N'Степанов', N'Степанович', 3, N'stepanovss', N'password44  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (45, N'Тарас', N'Тарасов', N'Тарасович', 1, N'tarasovtt', N'password45  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (46, N'Ульяна', N'Ульянова', N'Ульяновна', 1, N'ulyanovauu', N'password46  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (47, N'Филипп', N'Филиппов', N'Филиппович', 3, N'filippovff', N'password47  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (48, N'Эдуард', N'Эдуардов', N'Эдуардович', 2, N'eduarovee', N'password48  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (49, N'Ярослав', N'Ярославов', N'Ярославович', 3, N'yaroslavyy', N'password49  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (50, N'Антон', N'Антонов', N'Антонович', 2, N'antonovaa', N'password50  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (51, N'Богдан', N'Богданов', N'Богданович', 2, N'bogdanovbb', N'password51  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (52, N'Вячеслав', N'Вячеславов', N'Вячеславович', 1, N'vyacheslav', N'password52  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (53, N'Глеб', N'Глебов', N'Глебович', 2, N'glebovgg', N'password53  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (54, N'Демьян', N'Демьянов', N'Демьянович', 3, N'demjanovdd', N'password54')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (55, N'Елисей', N'Елисеев', N'Елисеевич', 1, N'eliseyevvv', N'password55  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (56, N'Жан', N'Жанов', N'Жанович', 2, N'zhanovzz', N'password56  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (57, N'Зураб', N'Зурабов', N'Зурабович', 2, N'zurabovzz', N'password57  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (58, N'Илья', N'Ильин', N'Ильич', 1, N'ilyinii', N'password58  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (59, N'Клим', N'Климов', N'Климович', 2, N'klimovkk', N'password59  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (60, N'Лука', N'Лукин', N'Лукич', 1, N'lukinll', N'password60  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (61, N'Мирон', N'Миронов', N'Миронович', 1, N'mironovmm', N'password61  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (62, N'Нестор', N'Несторов', N'Несторович', 1, N'nestorovnn', N'password62  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (63, N'Оскар', N'Оскаров', N'Оскарович', 2, N'oskarovoo', N'password63  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (64, N'Прохор', N'Прохоров', N'Прохорович', 2, N'prokhorovpp', N'password64  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (65, N'Радислав', N'Радиславов', N'Радиславович', 3, N'radislavrr', N'password65  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (66, N'Савва', N'Саввин', N'Саввич', 3, N'savvinss', N'password66  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (67, N'Тимур', N'Тимуров', N'Тимурович', 2, N'timurovtt', N'password67  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (68, N'Устин', N'Устинов', N'Устинович', 1, N'ustinovuu', N'password68  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (69, N'Фома', N'Фомин', N'Фомич', 3, N'fominff', N'password69  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (70, N'Харитон', N'Харитонов', N'Харитонович', 1, N'kharitonhh', N'password70  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (71, N'Цезарь', N'Цезарев', N'Цезаревич', 2, N'cezarevcc', N'password71  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (72, N'Чеслав', N'Чеславов', N'Чеславович', 2, N'cheslavch', N'password72  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (73, N'Шамиль', N'Шамилев', N'Шамильевич', 2, N'shamilevsh', N'password73  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (74, N'Эрик', N'Эриков', N'Эрикович', 3, N'erikovvv', N'password74  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (75, N'Юлиан', N'Юлианов', N'Юлианович', 2, N'yulianovyy', N'password75  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (76, N'Ян', N'Янов', N'Янович', 3, N'yanovyy', N'password76  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (77, N'Артур', N'Артуров', N'Артурович', 3, N'arturovaa', N'password77  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (78, N'Бронислав', N'Брониславов', N'Брониславович', 1, N'bronislav', N'password78  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (79, N'Владлен', N'Владленов', N'Владленович', 2, N'vladlenvv', N'password79  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (80, N'Геннадий', N'Геннадиев', N'Геннадиевич', 3, N'gennadyevgg', N'password80  ')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__7F8E8D5E5089521A]    Script Date: 12.06.2025 22:23:00 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Results] ADD  DEFAULT (getdate()) FOR [TestDate]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[TestStatuses] ([StatusID])
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([FromUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAnswers]  WITH CHECK ADD FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answers] ([AnswerID])
GO
ALTER TABLE [dbo].[UserAnswers]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[UserAnswers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [FireExamAppDB] SET  READ_WRITE 
GO

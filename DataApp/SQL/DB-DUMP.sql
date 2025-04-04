USE [master]
GO
/****** Object:  Database [FireSafetyDB]    Script Date: 04.04.2025 17:28:43 ******/
CREATE DATABASE FireSafetyDB
GO
USE FireSafetyDB
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 04.04.2025 17:28:44 ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 04.04.2025 17:28:44 ******/
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
/****** Object:  Table [dbo].[Results]    Script Date: 04.04.2025 17:28:44 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 04.04.2025 17:28:44 ******/
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
/****** Object:  Table [dbo].[TestStatuses]    Script Date: 04.04.2025 17:28:44 ******/
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
/****** Object:  Table [dbo].[UserAnswers]    Script Date: 04.04.2025 17:28:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswers](
	[UserAnswerID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Users]    Script Date: 04.04.2025 17:28:44 ******/
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
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (1, 1, N'Открытый огонь', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (2, 1, N'Высокая температура', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (3, 1, N'Токсичные продукты горения', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (4, 1, N'Обрушение конструкций', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (5, 1, N'Дефицит кислорода', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (6, 2, N'Положить ладонь на дверь', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (7, 2, N'Потрогать ручку двери', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (8, 2, N'Открыть дверь на несколько секунд', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (9, 2, N'Посмотреть на цвет дыма', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (10, 2, N'Использовать пирометр', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (11, 3, N'Полностью выпрямившись', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (12, 3, N'На четвереньках или ползком', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (13, 3, N'Задержав дыхание', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (14, 3, N'Быстро пробежав', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (15, 3, N'С закрытыми глазами', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (16, 4, N'Отключить подачу газа и электричества', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (17, 4, N'Обеспечить защиту органов дыхания пострадавшего', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (18, 4, N'Открыть окна для проветривания', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (19, 4, N'Облить водой место пожара', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (20, 4, N'Проверить, есть ли животные в помещении', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (21, 5, N'Закрыть лицо мокрой тканью', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (22, 5, N'Открыть дверь и сразу войти', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (23, 5, N'Войти быстро, чтобы уменьшить воздействие дыма', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (24, 5, N'Применить водяной распылитель перед входом', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (25, 5, N'Подождать, пока дым рассеется', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (26, 6, N'Пластик', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (27, 6, N'Древесина', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (28, 6, N'Синтетические ткани', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (29, 6, N'Бумага', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (30, 6, N'Каменная вата', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (31, 7, N'Отложить его и искать другой', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (32, 7, N'Перевернуть его и попробовать снова', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (33, 7, N'Проверить запорный механизм и встряхнуть', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (34, 7, N'Вылить его содержимое на огонь', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (35, 7, N'Выбросить и убежать', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (36, 8, N'Силой выбить дверь ногой', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (37, 8, N'Вскрывать от петель к замку', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (38, 8, N'Использовать лом, начиная с середины двери', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (39, 8, N'Сначала выбить стекло в двери', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (40, 8, N'Дождаться обрушения двери от высокой температуры', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (41, 9, N'Вода моментально гасит огонь', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (42, 9, N'Возникает эффект парового взрыва', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (43, 9, N'Вода замедляет горение, но не тушит полностью', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (44, 9, N'Вода усиливает процесс горения масла', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (45, 9, N'Вода делает масло негорючим', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (46, 10, N'Противогаз ГП-7', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (47, 10, N'Самоспасатель', 1)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (48, 10, N'Респиратор класса FFP2', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (49, 10, N'Медицинская маска', 0)
GO
INSERT [dbo].[Answers] ([AnswerID], [QuestionID], [AnswerText], [IsCorrectAnswer]) VALUES (50, 10, N'Мокрый носовой платок', 0)
GO
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (1, N'Какой из перечисленных факторов наиболее опасен при пожаре в закрытом помещении?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (2, N'Каким способом можно определить температуру за дверью горящего помещения?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (3, N'Как правильно входить в задымленное помещение во время эвакуации людей?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (4, N'Какая первоочередная задача при спасении человека в горящей квартире?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (5, N'Что необходимо сделать перед входом в задымлённый подвал?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (6, N'Какие материалы считаются наиболее опасными при горении в замкнутом пространстве?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (7, N'Что делать, если во время тушения пожара огнетушитель перестал работать?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (8, N'Какой способ вскрытия дверей при пожаре является наиболее безопасным?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (9, N'Почему опасно проливать горящее масло водой?')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionText]) VALUES (10, N'Какие средства защиты дыхания применяются при спасении людей в условиях сильного задымления?')
GO
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleID], [Rolename]) VALUES (1, N'инструктор')
GO
INSERT [dbo].[Roles] ([RoleID], [Rolename]) VALUES (2, N'ревизор')
GO
INSERT [dbo].[Roles] ([RoleID], [Rolename]) VALUES (3, N'пользователь')
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
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (1, N'Иван', N'Иванов', N'Иванович', 2, N'123', N'123')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (2, N'Петр', N'Петров', N'Петрович', 2, N'petrovpp', N'password2  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (3, N'Сергей', N'Сергеев', N'Сергеевич', 1, N'sergievss', N'password3  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (4, N'Алексей', N'Алексеев', N'Алексеевич', 2, N'alekseevaa', N'password4  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (5, N'Дмитрий', N'Дмитриев', N'Дмитриевич', 1, N'admin', N'admin')
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
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (11, N'Артем', N'Артемов', N'Артемович', 2, N'artemovaa', N'password11  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (12, N'Владимир', N'Владимиров', N'Владимирович', 2, N'vladimirov', N'password12  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (13, N'Олег', N'Олегов', N'Олегович', 2, N'olegovoo', N'password13  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (14, N'Павел', N'Павлов', N'Павлович', 1, N'pavlovpp', N'password14  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (15, N'Константин', N'Константинов', N'Константинович', 2, N'konstantin', N'password15  ')
GO
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (16, N'Станислав', N'Станиславов', N'Станиславович', 3, N'stanislavs', N'password16  ')
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
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (25, N'Георгий', N'Георгиев', N'Георгиевич', 2, N'georgievgg', N'password25  ')
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
INSERT [dbo].[Users] ([UserID], [Firstname], [Lastname], [Surname], [RoleID], [UserLogin], [UserPassword]) VALUES (54, N'Демьян', N'Демьянов', N'Демьянович', 3, N'demjanovdd', N'password54  ')
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
/****** Object:  Index [UQ__Users__7F8E8D5E0B20C308]    Script Date: 04.04.2025 17:28:44 ******/
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
ALTER DATABASE [FireSafetyDB] SET  READ_WRITE 
GO

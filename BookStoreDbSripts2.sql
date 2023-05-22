USE [master]
GO
/****** Object:  Database [BookStoreDb]    Script Date: 22.05.2023 20:00:28 ******/
CREATE DATABASE [BookStoreDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoreDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStoreDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoreDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStoreDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStoreDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoreDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreDb] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStoreDb] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStoreDb', N'ON'
GO
ALTER DATABASE [BookStoreDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStoreDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStoreDb]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Genre] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (1, 1, 11, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (2, 2, 1, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (3, 2, 8, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (4, 3, 7, 1)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (5, 3, 20, 1)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (6, 3, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (1, N'm.1@mail.com', N'test_1', N'Somewhere 1', CAST(N'2022-04-11T19:53:09.6008235' AS DateTime2), CAST(798.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (2, N'm.2@mail.com', N'test_2', N'Somewhere 2', CAST(N'2022-04-11T19:54:03.9315196' AS DateTime2), CAST(2250.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (3, N'm.3@mail.com', N'test_3', N'Somewhere 3', CAST(N'2022-04-11T19:55:54.2104799' AS DateTime2), CAST(1229.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (1, N'�������������', N'��� �����', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/27624091-den-braun-proishozhdenie.jpg', CAST(710.00 AS Decimal(18, 2)), N'��������', 3, N'������ ������� ��������� � ����� ����������� � ������� �� ����������� ����� � ������� �������� ������� �����. ���������� � ������������ ����, �� �������� ������ ������������� ���������� � ��������������. � ���� ������� ���� ���������� ������������ ��� ����������� ������� ������������� � ����, ��� ����� �� ��� ������� �������, ��������� ������������ �� ���������� ���� �������:������ ��? ��� ��� ����?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (2, N'�������� �����������', N'������ ����������', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/48827396-marina-surzhevskaya-22364624-chudovische-karnohelma.jpg', CAST(399.00 AS Decimal(18, 2)), N'�������', 5, N'����������� ����� ������� ����� �������� ��� ��� �� �������������� ������������ � ����� ������. � ���������� ����� ������ ����� ������� ���� ����� �������� � ����� �������� ��� �����-�������. � �, ���� ������, � ������������� ��������������� ���� ������������! ���� ���, ���� � ������ � ��� ������� ������� � ������ � ������� �����, ������� �� �������� �����������. ��� ������ ������ �� ������� �������, ���� ���� ������ � ������������ ���������! ��� � ������ �������� ����� ������� � ��������� � �������� �����������, ��� ������� �������� ����� ������ �� ����� ''��� �� ������� �������''')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (3, N'������-�������', N'��� ������, ����� �����', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/65551802-bas-vuters-onlayn-vliyanie-kak-upravlyat-povedeniem-ludey-chtoby-oni-sover.jpg', CAST(499.00 AS Decimal(18, 2)), N'������ �������������', 5, N'��� ���������� ����������� ����� � �����������, � ��������� ��������-�������� � ������������������ �������������? ��������� ���������� ������������� ���������� ����������� �������� ���������������� �����, ���������� ��� ������-��������. �������� � ���-�������� ����� ����� � ���� ��������� ��� ������ �������� ���������, ����� ������ ��������, � ����� ��� � ������. ����� �������� ���������� � ����� ���������� ������������, ������� �������� �� ������������ ������������ ����� ������ � ������-���������� � ������� �������� ��������� ����������� ������-�������������, ����� ��� ����, ������� � �������. ��� ����� ������ ������������ ����������� �� �������������� ���� ������-�������� � ������������ ���� ����, ������������� ���������� �������� �������� � ����������� ����, ��� ����� ������ � ���� ������ �� �������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (4, N'����������� ����� ��!', N'���� ����', N'https://cv4.litres.ru/pub/c/audiokniga/cover_330/19571848-dzhon-keho-podsoznanie-mozhet-vse-19571848.jpg', CAST(399.00 AS Decimal(18, 2)), N'������ �������������', 5, N'������������� �������� ��������, ������� � ����������� ������� ��������, ��������� ������ ����� ������� ������������ ��������, ����� ������ ����������� ����������. ������������� ������� ���� ����� ��������� ������� ��� �������������� ������������ ������� ������������ ��������� �����, ����� �������� ���� ����� � ������� ��� � ��������. ��� �������� ����� ���������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (5, N'��������', N'������� ������', N'https://cv4.litres.ru/pub/c/elektronnaya-kniga/cover_330/39435346-aleksey-ivanov-pischeblok.jpg', CAST(469.00 AS Decimal(18, 2)), N'����������� �����', 4, N'������� ���� 1980 ����. ������� ��������� ���������, � � ��������� ���������� ������ �� ������ ����� �� ���� � ��������. ������� ��������� �� ��������, ������ � ������ � �� ����� ������������ �������� �������; ������� ������� ���������� ���� � �����; ������ ���������� �������� ������ � �������, � � ��������� �������� ����������� ������. �� ����� ������������, �� ������ ������ �����������, ����� ���� ������ � ����� �������. ����� �������� �������� �������. �� ���� � ���������� ��, ��� ���������� � ���� �� ����.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (6, N'������ ����', N'����� ������', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/63028197-fredrik-bakman-trevozhnye-ludi.jpg', CAST(549.00 AS Decimal(18, 2)), N'��������', 5, N'������, ������ ���������, ������������ ������, ������ ��� � �����. ��� ������ ���� ���� � �������� ������ ������ ��������� �� ������. ����� �� ��� ������? ������ �������. ������� ������ ���������� ������ ����������� ������. � ��� �� �������� �����, ��� ������� ����-���� � ��������� ����� � ����� ���. ��� �� �� �� ����, ���� �������� �����. �� ������� � ������� ������ ����� � ���� ��������� ��������� � ������� � ������, ����� ������� ����������� ������� ���������, �������� �� ��������� �������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (7, N'����� 2033', N'������� ����������', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/128391-dmitriy-gluhovskiy-metro-2033.jpg', CAST(415.00 AS Decimal(18, 2)), N'����������', 5, N'�������� ��� ������ ������� ������� ����� ��������� �������� ���� �������� �� �������� � � �������� ����������� �����, ������ �������� �� ����� ��������������� ������������. ����������� ������� �������� � ���������� ��� ��������, � ������� ����� ���������� ��������� ����������� ��� ��������. ��� ������������ � ����������� ������-�����������, ������� ����������� � ����� ���� � ������. ��� �� ������ ����������� ���� ����� ����� ����� �������� ���������, ������� �������� ���� ����� ������������� ������������. �����, �������������� ������ �� ������� ����, ������ ������ ����� ��� �����, ����� ������ ���� ������������ ��� � � ��� ������������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (8, N'������', N'������ ����������', N'https://cv1.litres.ru/pub/c/elektronnaya-kniga/cover_330/65061217-sergey-lukyanenko-predel.jpg', CAST(415.00 AS Decimal(18, 2)), N'����������', 5, N'�������� ������ ��������� ��� ������������ ������ ����� ����, � ������ � ��� ���������� ������ ������� � �������, �� ��������� ���� � ������ �������� ��������. ������ �� ������ �������� �������� �������� ��������� �������, ����� ������� �� ������ ���� ����������� ������ ��������. ������ � ���� ����������� ��������� ���� ������� ��� ����, ���������. �����-�� ��������� ���� ����������� ����������� �������� �����������. ������� ������ ������ � �� ����� ������������� �� �������������� ����. ��������� ���� � ������ ��������� ��������. ����� ����������� � ������������, � ���������� ��������� ������� ������������ ����������������� ������� �����. ��������� �������� ����� ����, �� ����� � �������, ��������� �� ������ �������������� �������� ���. �������� �� ������ ����������� ����������� ���������� ������, ����� ������ �� ���������� ��� ���� �������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (9, N'�����������', N'������� �����', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/6028900-gillian-flinn-ischeznuvshaya.jpg', CAST(249.00 AS Decimal(18, 2)), N'��������', 4, N'��� ���� ������ ��� ������������ ����������� ������ ����������� �����, ����� ����� ����������� ������ ���� �� ���������� ���������. �������� ����� ������ � ����, �����, ������� ���� �������� �������, � � ������� ������� � ���� ��� ��������� ������ �� �����������; ��������, ����� � ���������� ��������������� ���� �������� ���������� �� ��� ������ ���������� ����. � ������, ��� ��� ������ � ����������� �� ��� � ��� �������� ������� � �� ����� �������� ���������� � ���� ������������ ���� ������� ���� �� ������ �����������. ��� ������ �� �������� �� ��������� � �������� ������ �������� ���� � ����-������ ����������� ��������������� ����?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (10, N'���� �������. ��� 1', N'���������� ��������', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/22638660-aleksandra-marinina-cena-voprosa-tom-1.jpg', CAST(664.00 AS Decimal(18, 2)), N'��������', 4, N'��������� ������ C������. ������� ���������� � �������� ����������������, �� ��� ������� ���� � ��� ���� ������ ����������� ������ ��-����������. �������� �� �����? ������� ��� ������ ������ �����, ��� ����������� �� ��������� � ��������� ���� ������� ������� � ������������������ �������. ��� ���� �� ��� ���, ���� �� ����� ���� �� �� ����������, ��������� ������������ ������. � ����� �������� ��� �������� ������� ��������� � ����� �������, ��� ���� ������� �� ���������� ������-��������, �� ������ ��������� ������ �����. �� ����� ���� ����� ��������� ������� ������ �� ���� ���� ����� �����? � ���� ��� ����� ������ ���������� ���������� � �������� �����, ��� �������������� � �������������?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (11, N'������ ��������� �����', N'��� ����', N'https://cv7.litres.ru/pub/c/elektronnaya-kniga/cover_330/4236675-ayn-rend-atlant-raspravil-plechi.jpg', CAST(399.00 AS Decimal(18, 2)), N'����������� �����', 2, N'� ������ � ��� �������� ���������� � ������������� ����� ���� �� ������� �����������, ������ ������������ �� ���� ����������� � ������������� ������� �������� ��������� � �����������. ������� �� ������ �������� � ���������� ���������, � ���� �� ���� �� ������ ��� ���������� ��������������� �������� �������� ����������� ���� � ������ ���������������. ������� ����� ������ �������� ������ ���� ������� � ����-��������� ��������������� �������� ����� ������� ������ �������� ������������� ����������� ��������. ������ ��������� ����������� �������� ����������� � ������ � ����.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (12, N'������ ����� ���', N'������� ������', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/20690188-fredrik-bakman-vtoraya-zhizn-uve.jpg', CAST(335.00 AS Decimal(18, 2)), N'����������� �����', 4, N'�� ������ ������ ��� � ����� ������� ������� �� �����. ��, ��� � ������ �� ���, ��������, ��� ��� �������� ��������������� ������ � ������, ������� ����������� ������� ���� ������; �������� � ��������, ��������� �� ������� �����; ���������, �������� ����� ���������� ����� �� � �������� ���������� ������� � ������� ������ ������. � ����� ������� ����� ����� ������� �������� ���������� ��� �������� ����, ��� ���������� ������� ���������� ������������ ������� �� ���������� �����, ����������� ������, ��������� ����� � ������� ��������� ������� ����� �� ���������� � ��������. ������� � ���, ��� ������ ����� ������ �������� ����� �������� �� ����� ������ ������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (13, N'�������', N'������ ����������', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/6375365-andzhey-sapkovskiy-vedmak.jpg', CAST(424.00 AS Decimal(18, 2)), N'�������', 4, N'����� ��������� ��������� ������� ���������, ���������� � �������� ��� ������������ �������, � ������� ������� ����� � �����, ��������, ������� � ��������-�������, ������� � �������, � �� ������ ����� ����. ����� ������� ���, �������� � ���������� ���� � ����� ��� ������ ���� ������� �������, ��� ����, ��������� ���������� �����, ��� ������������, ���������� ��������� ��������, � �������� ���� � ����������� �������� ���� ����')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (14, N'������� �� ����', N'������ �������', N'https://cv3.litres.ru/pub/c/elektronnaya-kniga/cover_330/27351732-robert-bryndza-12646976-devushka-vo-ldu.jpg', CAST(209.00 AS Decimal(18, 2)), N'��������', 4, N'� ����� ������ �� ������ �������, ��� ����� ����, ������� ���� �������. � ������, ������� �������� ������, ����, ��������, ��������� �����. �� ������������� ������� �������� ����� ������. ��� ������������, ��� �������� ������� � �������� ��������������, ��� �������� ����������� ������� �������, ������� ���� �������� � ��������� � ����.���� ����� �������� ����������� � ���� �������� ����, � ��� ��� ����� � ����� ����������� ������������ ������. ��� �� ����� ��������� ���������� �������� ������ ����. ������ ������� ��������� �� ������ �� ������ ��������, �� � � ������������, ����� �������, ��� ���, � ��� ��� ������������ ������. ������ �� ��� ���������� ���, ������ ��� �� ������� ����� ����?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (15, N'7 ������� ����������������� �����', N'������ ����', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/4239285--.jpg', CAST(415.00 AS Decimal(18, 2)), N'������ �������������', 5, N'��-������, ��� ����� �������� ��������� ������ � ����������� ��������� �����, ����������� ��������. ��� ���� � ���� ������, �� ����� �������� ������ ���� � ����� �������������� ��������� ����. ��-������, ����� ����������, ��� ��������� ���� �����. � �-�������, ����� ����������, ��� ������ ������� ����� ����� �����. ������ ���� ���� �� �� ��������� ������, � � ��������� ����������, ���������������������. ����� �� ���� ������� ������� � �� ������� ���������� �����. ����� ���������� ��������� ������� �������, ������ � ��������. �� ��� �����, ����������� ����������� ����������� ���������, ���������� � ��� ��������, ��� ����� � �������� �����.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (16, N'iPhuck 10', N'������ �������', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/25564903-viktor-pelevin-iphuck-10.jpg', CAST(349.00 AS Decimal(18, 2)), N'����������� �����', 4, N'�������� �������� � �����������-����������� ��������. �� ���������� ������������ � ������������ ����� �� ���� ����������� ������, ����������� �������� ��� ������������ ����������.������ �� � ������������ � �������� �������� � ���� � ������ �� ������������ �������. �� ������������� � ��� ���������� �����, ��������� ������ �������� XXI ����. �� ����� �������� ��� ������� �����. �� ���������� ������ � ������ ��������.�iPhuck 10� � ����� ������� �������� ������ �� ����� � ������������ ����� ���������� �� 244 ���������� �������� ���������. ��� ��������� ������ ��������������� ����������� ����� ����� ���� � ����������������� ����� � ������� �����, ��������� � ����� ����������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (17, N'�������������� ��������', N'������ ������', N'https://cv7.litres.ru/pub/c/elektronnaya-kniga/cover_extra/72060786-dzhuliya-enders-ocharovatelnyy-kishechnik-kak-samyy-moguschestvennyy-organ.gif', CAST(415.00 AS Decimal(18, 2)), N'�������� � ��������', 5, N'������ ���������� �������� � ��������� �����. ����� ����, ������ ������� �� ��� ���� ����� � ����� �������������� ������, ������� ��������� ����� ����������? ����-��, ��������, �������� ����� ����������� ��������� ������������� � ���������� �����; ����-��, ����� ����, ��������� ������� �������������� ����� �� ����� � �� ���������-������������, ��������� � �����. ���-�� ��������� �� ������������� ��������� ����������, �������������� ���� �����. � ����-�� �������������, ��� � ��������� ���� ���� ����������� ����� � �������� �������, ������ ��������� ��������� � �����������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (18, N'������� ��������� �����', N'������ �����', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/9527389-guzel-yahina-zuleyha-otkryvaet-glaza-9527389.jpg', CAST(349.00 AS Decimal(18, 2)), N'����������� �����', 5, N'����� �������� ��������� ����� ���������� ����� 1930 ���� � ������ ��������� �������. ���������� ������� ������ � ������� ������ ������������ ���������� � ������-�������� �� ��������� ���������� �������� � ������.�������� ��������� � ������������� ������������, ���������������� ������� � ����������, ���������� � ���������, �������� � �������, �������, ������, �����, ������ � ��� ���������� �� ������� ������, ��������� ��������� � ����� � ������������� ����������� ���� ����� �� �����.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (19, N'������� � ������', N'������ �������', N'https://cv2.litres.ru/pub/c/elektronnaya-kniga/cover_330/27066425-donato-karrizi-devushka-v-tumane.jpg', CAST(249.00 AS Decimal(18, 2)), N'��������', 4, N'���������� � ������ ������ �������, �������������� �����, �����. �� ����, ��� ����� ���� ���� � ����� �������, �� ���������� ���������� ������� ������ ����� ������ ������, �� � ������ ���� ���� �� ��� � �� ���������� ���������� ����������, ������������� � �������������� �������� �������. ������ �� ��� ������ ������ �������� ������������ ������� � ���� �������������.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (20, N'1984', N'������ ������', N'https://cv5.litres.ru/pub/c/elektronnaya-kniga/cover_330/50397852--.jpg', CAST(415.00 AS Decimal(18, 2)), N'����������', 5, N'������������ ������� ������ ������� ���������� XX ���� � �� ������ ����� ��� ������ ������. ���, � ��������, ��������: ���������� �� ������� ��������� ������������ � ��� ���������� �� �������� ��������� ����? �� �������, ��� � �� ����� ���� ������ ������� ��������� ����������')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (21, N'����������� ���������. ��� 1', N'���������� ��������', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/57306965-aleksandra-marinina-bezuprechnaya-reputaciya-tom-1.jpg', CAST(379.00 AS Decimal(18, 2)), N'��������', 5, N'������ ��������� ���� � �������� ��������� ��������� �� ���� �����. ������������ �������� ������ ������� ������ �������. �� ��� ������������� ������, ��������� �� ���� ����, ����� ����� ������ � ���������� �������� �������. ����������, ��� � �������� �����������. � ����� �������� ���������, ��� �� �������� ������� �� �� ����� ��������. �� ���� ������� ������, � � ��������� ������ ����� ����������� ������ ���������� ���������� �������� ������������ ��������� � ����� ���������. �� ������ �� ���������� ������� ������������� � ���� �� ��������. �������, �� � ��� �� ���! ���� ��� ���, �����, ������ ���������� ������������, �������� ��� �� ��� ����������� �� ���� ����� �������, �� � ������ ��������� ��������')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (22, N'iPhuck 10', N'������ �������', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/25564903-viktor-pelevin-iphuck-10.jpg', CAST(349.00 AS Decimal(18, 2)), N'����������� �����', 4, N'�������� �������� � �����������-����������� ��������. �� ���������� ������������ � ������������ ����� �� ���� ����������� ������, ����������� �������� ��� ������������ ����������.������ �� � ������������ � �������� �������� � ���� � ������ �� ������������ �������. �� ������������� � ��� ���������� �����, ��������� ������ �������� XXI ����. �� ����� �������� ��� ������� �����. �� ���������� ������ � ������ ��������.�iPhuck 10� � ����� ������� �������� ������ �� ����� � ������������ ����� ���������� �� 244 ���������� �������� ���������. ��� ��������� ������ ��������������� ����������� ����� ����� ���� � ����������������� ����� � ������� �����, ��������� � ����� ����������.')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_CartItems_OrderId]    Script Date: 22.05.2023 20:00:28 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_OrderId] ON [dbo].[CartItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_ProductId]    Script Date: 22.05.2023 20:00:28 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [BookStoreDb] SET  READ_WRITE 
GO

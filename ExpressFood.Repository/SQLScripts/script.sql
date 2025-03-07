USE [master]
GO
/****** Object:  Database [ExpFoodDBv1]    Script Date: 30/12/2024 18:22:02 ******/
CREATE DATABASE [ExpFoodDBv1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpFoodDBv1', FILENAME = N'C:\Users\krist\ExpFoodDBv1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExpFoodDBv1_log', FILENAME = N'C:\Users\krist\ExpFoodDBv1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ExpFoodDBv1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpFoodDBv1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExpFoodDBv1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ExpFoodDBv1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExpFoodDBv1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExpFoodDBv1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExpFoodDBv1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExpFoodDBv1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ExpFoodDBv1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExpFoodDBv1] SET  MULTI_USER 
GO
ALTER DATABASE [ExpFoodDBv1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExpFoodDBv1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExpFoodDBv1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExpFoodDBv1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExpFoodDBv1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExpFoodDBv1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExpFoodDBv1] SET QUERY_STORE = OFF
GO
USE [ExpFoodDBv1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryOrders]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryOrders](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[CustomerId] [nvarchar](450) NULL,
 CONSTRAINT [PK_DeliveryOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodItemInOrders]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItemInOrders](
	[Id] [uniqueidentifier] NOT NULL,
	[DeliveryOrderId] [uniqueidentifier] NULL,
	[FoodItemId] [uniqueidentifier] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_FoodItemInOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodItems]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItems](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[RestaurantId] [uniqueidentifier] NULL,
	[FoodItemImage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FoodItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 30/12/2024 18:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[ContactNumber] [nvarchar](max) NOT NULL,
	[OpeningHours] [nvarchar](max) NOT NULL,
	[Rating] [real] NULL,
	[RestaurantImage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Restaurants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241127163117_initial', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241127170044_addedVirtual', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241207142853_image', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241207142954_image2', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241207152256_virtual', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241208145903_virt', N'8.0.11')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'customer', N'CUSTOMER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'19f56b64-ed26-46b8-8a89-7e7b13bc97de', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4864dee7-4eb0-4ff0-abbf-a229653f13ff', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c0b31b1f-a6da-443d-ae48-279e15d2ee4f', N'2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0ebc23f4-a2b3-4f39-9827-a0478a63874f', N'Kristina Kiselinova-2', N'cd', N'csa', N'nn@gm.com', N'nn@gm.com', N'NN@GM.COM', NULL, 1, N'AQAAAAIAAYagAAAAEIdR+IHA0vwOkcVnJdi0Qd7QtTq3qcF7sTPtdmnccvxc0UGHpL1+sXtTj2jSM0RjNg==', N'36GPTBP2COQD2PVHIDJIS2F4OG33X2PN', N'8da4f91d-3f19-414f-8122-95418536382e', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1497d7cd-b1dd-4c88-be21-03b52c83818f', N'Marija Jankovska', N'Tetovo', N'072721212', N'test@test.com', N'test@test.com', N'TEST@TEST.COM', NULL, 1, N'AQAAAAIAAYagAAAAENGtIwOww565wEsShjbI4WecGs3dNT9z+YW+RlO0qfLXYvdro/20j+mZtzLk1oUfDQ==', N'INSNXH3USELEZH6WD7K5NGANUQMAL53L', N'6e6b54ce-1829-405d-b889-9b3adc62a527', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'19f56b64-ed26-46b8-8a89-7e7b13bc97de', N'Admin', N'ul.Admin admin', N'077777777', N'admin@admin.com', N'admin@admin.com', N'ADMIN@ADMIN.COM', NULL, 1, N'AQAAAAIAAYagAAAAEJo4/ZdCigzGLdNtGzhR5L4iaPYP9G4SJuGd9aJHHRXV5sPOsvaTjvpmqcPkyBbxOw==', N'PINXR6EL62GRPIYHO37DLV32CFMU7VGI', N'eefad902-1ecf-4632-8e6b-fb6c8856c8f8', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'21b709d5-50c2-4273-a805-a4e3acab9b70', N'Marija Jankovska', N'Predrag Jancevskki 22', N'072721212', N'marija@gmail.com', N'marija@gmail.com', N'MARIJA@GMAIL.COM', NULL, 1, N'AQAAAAIAAYagAAAAEGoIOp0Qn8iXq/UK/pbNoQgcHT+TL/o0HmiAAyiqej1tNVXpGP9tW6PT/8CuXzfkYA==', N'T6PLQ4KWORCW6GKPRLFQEG27SV7FKFYR', N'67332ba0-4ea2-427f-8c0e-a986518316ba', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4864dee7-4eb0-4ff0-abbf-a229653f13ff', N'Kristina Andreeva', N'Kiro Krstevski 30', N'074589666', N'kristina@gmail.com', N'kristina@gmail.com', N'KRISTINA@GMAIL.COM', NULL, 1, N'AQAAAAIAAYagAAAAEETTpBArzRXtbXxH0ttXN/M2m2PYGF697s/ALH5nT8MvV9dMYP93yEvdnjm8DSdaew==', N'U5U6DLQF3QYHR46LSE2IYZPNOGXQ3IXV', N'7993bf80-55e6-4cb2-97ce-dcc1866aaaf0', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'62feb6b0-797d-464e-b1b6-0364bb9a0aaa', N'Kristina Kiselinova', N'sdress', N'1314134234234', N'kristinakiselinova1@gmail.comxx', N'kristinakiselinova1@gmail.comxx', N'KRISTINAKISELINOVA1@GMAIL.COMXX', NULL, 1, N'AQAAAAIAAYagAAAAEEr9YQjgq1FcG+bKkDihJT2PenKDSnw1Tfzi/VyFYEJSJkjBcshqsOj59OvDYBZUdQ==', N'DHPFVC52KBWLWGNQXUMVHNVHOZMXW7EW', N'1be67015-149b-4bda-85bb-4c4b4065fa0e', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6a901bf8-077a-4c41-8de4-3207bc9c715e', N'Kristina Kiselinova-123', N'cd', N'csa', N'nn1@gm.com', N'nn1@gm.com', N'NN1@GM.COM', NULL, 1, N'AQAAAAIAAYagAAAAEPjZV2PNjiH/CenEZ23L+iZrb+MijxJTGBJajXysZB69sT2OrYR94IXpJimr6bqwnA==', N'3UKU34WOQS3HP2FNUIXDSYNVG6XD5RUC', N'd15df8d1-906f-404e-b02d-223c8ca9f98a', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8127c6b5-e994-425e-b91f-748b4eb1488b', N'Kristina Kiselinova', N'sdress', N'1314134234234', N'kkkk@k.com', N'kkkk@k.com', N'KKKK@K.COM', NULL, 1, N'AQAAAAIAAYagAAAAEHfgCSVWqR+RXc1+7Auc+ghpI5gR3h2fxbVHM1ckPhmhqWuKdHIDUPmefBMKcBN+rg==', N'LPWHQH62BYFHKVOTWQBCVQJCPB3REZDL', N'42f07513-a3a0-4457-9841-17bf94a1228c', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b6ad0132-941f-4f69-affb-88a7f6302f2b', N'Kristina Kiselinova-1', N'cds', N'dca', N'nonov@mm.com', N'nonov@mm.com', N'NONOV@MM.COM', NULL, 1, N'AQAAAAIAAYagAAAAEMWiPC+S2ZP/uparQ3rz9SuqU+cVVnimeq+56cbqSboHs5puGMa8ytyRXIZyaFZDeg==', N'6IBIJKMY2C73Z2ZBRUPUSO247E36W5YG', N'4e758011-5897-4f4a-a024-17ab8c4f6f64', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bb499cd2-2247-432d-82c7-601eda3725af', N'Nov', N'ssa', N'21211', N'nov@gmail.com', N'nov@gmail.com', N'NOV@GMAIL.COM', NULL, 1, N'AQAAAAIAAYagAAAAEAjuDIfO2GiKh0h8m2vEnft63NA3icoe0c2pM+QcxFX3IfBmtrMj+3L1RQvNdFPm1Q==', N'XXZAAPSICG4SE5OY2VM7PFOGGW2MFSWA', N'5bd23b50-a4a3-4440-a7ba-a4562d15fe1b', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c0b31b1f-a6da-443d-ae48-279e15d2ee4f', N'User user', N'ul. User user', N'071111111', N'user@user.com', N'user@user.com', N'USER@USER.COM', NULL, 1, N'AQAAAAIAAYagAAAAEM3BpG/YxnZWQVtpcPbhMAFU9F3zPa3ejgEmfim2bxL6H9zzKTlfqNLbNmsKZeKZGw==', N'HETYHWYIKTHRTKNTV5YILRDVZNT5VUH5', N'ea4a1757-03cd-4c1a-a770-4a2d62930a0a', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Address], [PhoneNumber], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dc731703-0568-49cc-9aae-eafd3accc3e6', N'Kristina Kiselinova', N'Vladimir Polezhanovski Rd 23, Skopje', N'1314134234234', N'test1@gmail.com', N'test1@gmail.com', N'TEST1@GMAIL.COM', NULL, 1, N'AQAAAAIAAYagAAAAEOPFg5Wwg1DVhnX8fqnbBL7Kt12l/PkXcgSbGQ/2UEz/alUxtgH1kQp9G2zNZcYSQw==', N'3JPMOYAWZEOPOON5WQEW2SQUGL22INZF', N'5e19db9f-492b-4b92-b5c8-28de26d8717e', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'093037e4-78af-467e-ab92-051e9e7664ab', CAST(N'2024-12-22T18:39:09.5118906' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'c0b31b1f-a6da-443d-ae48-279e15d2ee4f')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'9635a2c0-efd3-4f02-1493-08dd183832a2', CAST(N'2024-12-09T10:59:40.2683004' AS DateTime2), CAST(900.02 AS Decimal(18, 2)), N'Pending', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'ac1dfbe6-7a25-4525-45b8-08dd184bbbf1', CAST(N'2024-12-09T13:19:31.1081671' AS DateTime2), CAST(450.02 AS Decimal(18, 2)), N'Pending', N'21b709d5-50c2-4273-a805-a4e3acab9b70')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'5dbf6b1d-a07c-480e-eb95-08dd22af6b35', CAST(N'2024-12-22T18:38:16.8734616' AS DateTime2), CAST(150.01 AS Decimal(18, 2)), N'Pending', N'c0b31b1f-a6da-443d-ae48-279e15d2ee4f')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'8eab11be-8ce1-4a0c-eb96-08dd22af6b35', CAST(N'2024-12-22T18:38:16.8979702' AS DateTime2), CAST(150.01 AS Decimal(18, 2)), N'Pending', N'c0b31b1f-a6da-443d-ae48-279e15d2ee4f')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'b3b0b5c8-f4e3-4d42-1123-08dd2692d9bb', CAST(N'2024-12-27T17:23:51.6249599' AS DateTime2), CAST(230.00 AS Decimal(18, 2)), N'Pending', N'19f56b64-ed26-46b8-8a89-7e7b13bc97de')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'52cc454d-5223-4528-1124-08dd2692d9bb', CAST(N'2024-12-27T17:32:18.9309295' AS DateTime2), CAST(450.01 AS Decimal(18, 2)), N'Pending', N'4864dee7-4eb0-4ff0-abbf-a229653f13ff')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'70d571de-54e1-45cf-aa61-1a917b279cde', CAST(N'2024-12-18T10:41:36.1268990' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'57bc1cde-0ba2-45ce-beff-1be304fa53de', CAST(N'2024-12-18T10:09:11.0858905' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'1c126387-ad3d-4807-be39-3a0b33fe9d88', CAST(N'2024-12-17T20:46:47.6909726' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'bd4850aa-08a0-4c30-a59d-69292e619179', CAST(N'2024-12-18T09:52:15.0900717' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'393c2150-2b52-43c7-a681-7715b108a974', CAST(N'2024-12-17T20:57:59.2201885' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'23f44cb6-cb7a-42ee-8cf7-7e3f7bd013ce', CAST(N'2024-12-10T16:26:29.5303276' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'7a9a5b48-600b-424e-96e7-a2e23878abf9', CAST(N'2024-12-17T20:51:08.2578158' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'85cc35a9-e02b-4750-ae9c-a650aaee3ac6', CAST(N'2024-12-09T14:48:06.8891054' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'56fd20ec-504b-46d7-ab07-b245dc851551', CAST(N'2024-12-17T20:49:02.9383852' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'97dbb74c-4d27-4a6b-9e53-d6052b49a45d', CAST(N'2024-12-17T20:52:57.1800144' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'98c2d61d-c269-4948-9c2a-d9dfc107a547', CAST(N'2024-12-10T16:29:28.0615505' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'783ad6ce-1cde-49c3-a0c3-e0941c5042c4', CAST(N'2024-12-17T20:55:56.4917605' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'989c7d30-daf5-4174-8631-e8f54cd80c44', CAST(N'2024-12-09T14:49:27.2150835' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'6a901bf8-077a-4c41-8de4-3207bc9c715e')
INSERT [dbo].[DeliveryOrders] ([Id], [OrderDate], [Price], [Status], [CustomerId]) VALUES (N'51f2ad78-5d7a-439d-8be3-eefd46be095b', CAST(N'2024-12-27T17:32:57.6581381' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'Created', N'4864dee7-4eb0-4ff0-abbf-a229653f13ff')
GO
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'2ef2be31-f042-4fec-a6e6-0536aabe3036', N'56fd20ec-504b-46d7-ab07-b245dc851551', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 2, CAST(300.02 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'576880a9-19fe-4d6d-7dd6-08dd183832ac', NULL, N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'f3f68c98-b00a-45d6-dc4e-08dd184bbbf3', N'ac1dfbe6-7a25-4525-45b8-08dd184bbbf1', N'eee8f27e-4305-42e8-21c2-08dd184b2407', 2, CAST(300.02 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'a1143fdf-8b7f-4c69-dc4f-08dd184bbbf3', N'ac1dfbe6-7a25-4525-45b8-08dd184bbbf1', N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'ebfcb728-788e-4a45-cacb-08dd18584102', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'e1474c92-2c25-4bf8-cacc-08dd18584102', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'f0383f19-6b60-46d0-e138-08dd192ee52b', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'0f68e829-4e13-4e12-e139-08dd192ee52b', NULL, N'eee8f27e-4305-42e8-21c2-08dd184b2407', 2, CAST(300.02 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'379c7d64-9944-4309-e13a-08dd192ee52b', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 11, CAST(1650.11 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'65bf166c-64c1-4a80-9018-08dd1ecd08f8', NULL, N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'24004025-fe47-4e24-3736-08dd1ed3cb98', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 2, CAST(300.02 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'21239524-ee05-44ad-d30a-08dd1ed41850', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'b2fcb9f2-8b75-4eba-24be-08dd1ed451ea', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'64e1afc8-b327-4865-0143-08dd1ed4c3a1', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'590a4d9b-ffad-4b61-69f5-08dd1ed50aa3', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'3d3d125d-1b45-4697-f3de-08dd1f4134c9', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'144b2593-b06d-4cb8-ec98-08dd1f4311e2', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 11, CAST(1650.11 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'02c06d20-0d7b-48f5-ec99-08dd1f4311e2', NULL, N'eee8f27e-4305-42e8-21c2-08dd184b2407', 2, CAST(300.02 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'17aa5588-f835-429a-ec9a-08dd1f4311e2', NULL, N'8d63f81b-a199-4da2-855e-436e7e4c9de5', 1, CAST(230.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'974ba95c-ccad-4f94-8438-08dd1f47ed74', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'6a2f06f9-bf67-41d4-8439-08dd1f47ed74', NULL, N'eee8f27e-4305-42e8-21c2-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'898ee5eb-1bea-40b9-843a-08dd1f47ed74', NULL, N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 4, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'cae28178-fecd-4f49-d84b-08dd22af6b45', N'8eab11be-8ce1-4a0c-eb96-08dd22af6b35', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'c43aca33-6df2-45e3-d84c-08dd22af6b45', NULL, N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'728a1c98-5d79-4474-29db-08dd2692d9c1', N'b3b0b5c8-f4e3-4d42-1123-08dd2692d9bb', N'8d63f81b-a199-4da2-855e-436e7e4c9de5', 1, CAST(230.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'eb72d38e-20a5-45ad-29dc-08dd2692d9c1', NULL, N'eee8f27e-4305-42e8-21c2-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'01b3ec4d-415d-4c5f-29dd-08dd2692d9c1', NULL, N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'b5059c97-5bdb-46f8-8d83-10c1e0185419', N'70d571de-54e1-45cf-aa61-1a917b279cde', N'eee8f27e-4305-42e8-21c2-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'd0c8c56b-6652-4b39-8647-2834251e8f3e', N'1c126387-ad3d-4807-be39-3a0b33fe9d88', N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'a264d235-cc7f-406d-a10b-29ae48cd5a53', N'23f44cb6-cb7a-42ee-8cf7-7e3f7bd013ce', N'eee8f27e-4305-42e8-21c2-08dd184b2407', 2, CAST(300.02 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'0faa95d4-80a5-4355-85f6-36072007222c', N'98c2d61d-c269-4948-9c2a-d9dfc107a547', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 11, CAST(1650.11 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'604fa5bb-7115-4dc7-9d32-40b3c2df94bf', N'093037e4-78af-467e-ab92-051e9e7664ab', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'83375548-1d4e-403a-b990-4c7eab82585c', N'97dbb74c-4d27-4a6b-9e53-d6052b49a45d', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'745b8be0-2396-4c69-a603-5702f89213f8', N'7a9a5b48-600b-424e-96e7-a2e23878abf9', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'68034942-bcfe-4912-90e2-69af27d7af2f', N'85cc35a9-e02b-4750-ae9c-a650aaee3ac6', N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'90071c08-d0b6-4810-8175-76aff03be651', N'70d571de-54e1-45cf-aa61-1a917b279cde', N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 4, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'd46a592b-27a7-4a28-95ad-8d5153afcd8d', N'57bc1cde-0ba2-45ce-beff-1be304fa53de', N'eee8f27e-4305-42e8-21c2-08dd184b2407', 2, CAST(300.02 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'ac91a650-5640-4a4b-b855-9bb3de351ed6', N'70d571de-54e1-45cf-aa61-1a917b279cde', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'9903f11c-b39a-4d30-a36d-a7c2a16a7885', N'51f2ad78-5d7a-439d-8be3-eefd46be095b', N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'004db668-1054-4bac-b33b-bb19aa1962e1', N'783ad6ce-1cde-49c3-a0c3-e0941c5042c4', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'6b45e1a7-4e68-42c6-8b5a-e5e0a2d38443', N'393c2150-2b52-43c7-a681-7715b108a974', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'b9e22124-5003-44b3-abfa-eade033e2f93', N'989c7d30-daf5-4174-8631-e8f54cd80c44', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
INSERT [dbo].[FoodItemInOrders] ([Id], [DeliveryOrderId], [FoodItemId], [Quantity], [Price]) VALUES (N'2ba6e865-267f-47f8-b1c3-f51111f05598', N'bd4850aa-08a0-4c30-a59d-69292e619179', N'e9ea698c-77a8-45b0-21c1-08dd184b2407', 1, CAST(150.01 AS Decimal(18, 2)))
GO
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'e9ea698c-77a8-45b0-21c1-08dd184b2407', N'Pollo Verdure', N'Доматен сос, пилешко месо, модар домат, тиквичка, кромид, морков', CAST(150.01 AS Decimal(18, 2)), N'478da490-0f31-48c5-b120-3d9cbebfbb52', N'https://korpa.mk/product_uploads/GCaRugAYycgeEuKJJb7tBjDfvZEQEu8w.png')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'eee8f27e-4305-42e8-21c2-08dd184b2407', N'Chicken Pesto & Broccoli', N'Пилешко месо, бел сос, брокули', CAST(150.01 AS Decimal(18, 2)), N'478da490-0f31-48c5-b120-3d9cbebfbb52', N'https://korpa.mk/product_uploads/0q032R4rZdmFuBziz8NFXyTyaBgDXmOk.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'cc9f5c58-009d-44c3-b698-3a9830c1ec1e', N'Parma Rosa (мала)', N'Сос од домати, бел сос, шелот, босилек', CAST(150.00 AS Decimal(18, 2)), N'478da490-0f31-48c5-b120-3d9cbebfbb52', N'https://korpa.mk/product_uploads/XMBUqAgzQqUeYFlmsjOB25FxReCHUkWx.png')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'3a383c8f-13f9-48db-a70e-3b2b13cd2939', N'Гиро Пита - пилешка', N'Пита, пилешко или свинско месо, помфрит, кромид, домат, кечап, сенф, ѕаѕики', CAST(420.00 AS Decimal(18, 2)), N'4b82c026-1c74-4094-b512-16953be0bc85', N'https://korpa.mk/product_uploads/T094cp3D687x3KJ77Pa1dn9OUGGSsLWw.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'8d63f81b-a199-4da2-855e-436e7e4c9de5', N'Гиро Пита - мала', N'Пита, пилешко или свинско месо, помфрит, кромид, домат, кечап, сенф, ѕаѕики', CAST(230.00 AS Decimal(18, 2)), N'6a718d9e-d0b7-4e08-b945-bbf602347b6e', N'https://korpa.mk/product_uploads/3bYN6pJfzrXoiHSPwyYcqxHErXsG3e7b.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'30a215da-94d5-4688-825e-4e6ae396f524', N'Nuggets Нутела', N'паста од ф''стак, лешник, малина', CAST(180.00 AS Decimal(18, 2)), N'd27e3ac6-bc90-4d52-bda2-8f223489ae3d', N'https://korpa.mk/product_uploads/xWcVJiw4FQe8mLXwrW1HRZ6XNG1jqSPO.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'437f6f40-fa72-4bf4-9a5a-6937ebbe4875', N'Гиро Пита - свинска', N'Пита, пилешко или свинско месо, помфрит, кромид, домат, кечап, сенф, ѕаѕики', CAST(420.00 AS Decimal(18, 2)), N'4b82c026-1c74-4094-b512-16953be0bc85', N'https://korpa.mk/product_uploads/T094cp3D687x3KJ77Pa1dn9OUGGSsLWw.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'b3ab2b61-0a44-4bba-bca1-6b96a27676f0', N'Шарска плескавица  ', N'леб, плескавица, салати', CAST(220.00 AS Decimal(18, 2)), N'3efd1b3a-5ba2-4493-b1d6-e60d5656759a', N'https://korpa.mk/product_uploads/TqQZjRiDqn0Je6PDji8MQeUKEuGL9Efw.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'52c44f22-814e-41ca-9614-9bcb75101fe4', N'Гиро Пита - XXL', N'Пита, пилешко или свинско месо, помфрит, кромид, домат, кечап, сенф, ѕаѕики', CAST(420.00 AS Decimal(18, 2)), N'6a718d9e-d0b7-4e08-b945-bbf602347b6e', N'https://korpa.mk/product_uploads/T094cp3D687x3KJ77Pa1dn9OUGGSsLWw.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'ea2f4a28-1423-459e-9dc6-bb0b149b468f', N' SushiCo пилешко', N'Сервирано со палачинки и ајсберг *луто', CAST(760.00 AS Decimal(18, 2)), N'38d1e779-414e-4125-8afd-222c41a0d59b', N'https://korpa.mk/product_uploads/dPj2ETKlP3s2NO1YrFrQMN7Jn8tREKvM.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'59e2b3c8-09ef-4e8d-ad69-bb7d842a6d72', N'Гиро Пита - XL', N'Пита, пилешко или свинско месо, помфрит, кромид, домат, кечап, сенф, ѕаѕики', CAST(420.00 AS Decimal(18, 2)), N'6a718d9e-d0b7-4e08-b945-bbf602347b6e', N'https://korpa.mk/product_uploads/T094cp3D687x3KJ77Pa1dn9OUGGSsLWw.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'b4d848f7-bc55-4154-b101-bd18c7c1a0c5', N'Пеперони пица', N'доматно пире, кашкавал, кулен, оригано', CAST(390.00 AS Decimal(18, 2)), N'01e9f3ec-f0c1-4dde-8ac3-d8b4be9f6b2d', N'https://th.bing.com/th?id=OSK.01a098e247fa777c17024d8ca83f1d08&w=194&h=194&rs=2&qlt=80&o=6&cdv=1&dpr=1.3&pid=16.1')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'807f3e9c-af4b-4370-93cf-ce00e5fa9e8b', N'ПРЖЕНИ БРОКУЛИ', N'Претходно обарени брокули па малку пржени, декорирани со морков', CAST(320.00 AS Decimal(18, 2)), N'c95ed669-46ab-44cf-bfc8-6b11c9a2598b', N'https://korpa.mk/product_uploads/6yZ5gORhrZEUZ5iJ3uvi15LjV4EV3oYn.jpg')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'39336b21-63c3-47b5-9885-de3fd3116624', N'BBQ Burger', N'бургер лепче, плескавица, кашкавал, bbq сос, грилуван кромид', CAST(240.00 AS Decimal(18, 2)), N'1c8e6bb3-3801-4c71-a7c2-bd549b065b64', N'https://www.bing.com/th?id=OIP.H07SGPpx-swRy0WfmnDIdwHaHa&w=146&h=146&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')
INSERT [dbo].[FoodItems] ([Id], [Name], [Description], [Price], [RestaurantId], [FoodItemImage]) VALUES (N'8f16d2d5-c3b6-4485-b889-dfd7e5135f5f', N'Nuggets Нутела', N'Нутела, бел белгиски крем, плазма, банана', CAST(160.00 AS Decimal(18, 2)), N'd27e3ac6-bc90-4d52-bda2-8f223489ae3d', N'https://korpa.mk/product_uploads/Q5XncahRPtZ11nVwjJKlK45qfz4TsnIk.jpg')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'4b82c026-1c74-4094-b512-16953be0bc85', N'Fat Kitchen Bistro', N'Vladimir Polezhanovski Rd 23, Skopje', N'071888739', N'08:00-22:30', 10, N'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/6a/87/1d/braised-beef-ciabatta.jpg')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'38d1e779-414e-4125-8afd-222c41a0d59b', N'SushiCo Zen', N'Zeleznicka 2, Shkupi 1000, North Macedonia', N'074442233', N'10:00-02:00', 10, N'https://korpa.ba/restaurant_uploads/1da4LvVTiP5VPzBbf8jLjhifUXA8GvCA.jpg')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'478da490-0f31-48c5-b120-3d9cbebfbb52', N'Amanti East Gate', N'Belastisa 1000, Skopje', N'07101710', N'10:00-22:00', 10, N'https://eastgatemall.mk/wp-content/uploads/2023/03/amanti-1.png')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'c95ed669-46ab-44cf-bfc8-6b11c9a2598b', N'Star Ocean - Centar', N'Dimitrie Cupovski 20A, Skopje 1000, North Macedonia', N'072255889', N'10:00-22:00', 10, N'https://korpa.ba/restaurant_uploads/ZXwwDA9tFPj3gaC3pXmMaUFeGhNlFtXq.jpg')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'd27e3ac6-bc90-4d52-bda2-8f223489ae3d', N'Nu House & Friends - East Gate Mall', N' Belasitsa 1000, Skopje 1000, North Macedonia', N'074449556', N'09:00-22:00', 10, N'https://korpa.ba/restaurant_uploads/PCBZcjJp65CIkTSXhNYQq3WUzohqR7fl.jpg')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'6a718d9e-d0b7-4e08-b945-bbf602347b6e', N'Gyro House', N'Boulevard Saint Clement of Ohrid BB, Skopje', N'070666615', N'10:00-02:00', 10, N'https://th.bing.com/th/id/OIP.-5QTBnZX0rAQ4PAondq4WgHaEL?rs=1&pid=ImgDetMain')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'1c8e6bb3-3801-4c71-a7c2-bd549b065b64', N'BAKING BREAD CENTAR', N'Vidoe Smilevski Bato br 3, 1000 Skopje, Skopje, Skopski ', N'074444555', N'08:00-00:00', 10, N'https://th.bing.com/th/id/OIP.jC6F-leqKZSbIVYMpb6qcwAAAA?rs=1&pid=ImgDetMain')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'11c06eb7-2a04-41f8-bf58-bfd578b46ed1', N'СКОПСКИ МЕРАК', N'Македонска 77', N'078888999', N'08:00-20:00', 10, N'https://th.bing.com/th/id/OIP.DeAKLj1jfQvABSYtLVUGTwHaFj?w=215&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'01e9f3ec-f0c1-4dde-8ac3-d8b4be9f6b2d', N'Pizza Jakomo', N'KISELA VODA', N'074444888', N'08:00-19:00', 10, N'https://th.bing.com/th/id/OIP.IqVV1zmKGT4z7xvEdnTYwwHaEK?w=331&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7')
INSERT [dbo].[Restaurants] ([Id], [Name], [Address], [ContactNumber], [OpeningHours], [Rating], [RestaurantImage]) VALUES (N'3efd1b3a-5ba2-4493-b1d6-e60d5656759a', N'Teteks - Centar', N'Ulica MK, Boulevard Phillip the Second of Macedon 5A, Skopje 1000, North Macedonia', N'075558889', N'08:00-22:30', 10, N'data:image/jpeg;base64,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')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 30/12/2024 18:22:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 30/12/2024 18:22:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DeliveryOrders_CustomerId]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryOrders_CustomerId] ON [dbo].[DeliveryOrders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FoodItemInOrders_DeliveryOrderId]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [IX_FoodItemInOrders_DeliveryOrderId] ON [dbo].[FoodItemInOrders]
(
	[DeliveryOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FoodItemInOrders_FoodItemId]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [IX_FoodItemInOrders_FoodItemId] ON [dbo].[FoodItemInOrders]
(
	[FoodItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FoodItems_RestaurantId]    Script Date: 30/12/2024 18:22:02 ******/
CREATE NONCLUSTERED INDEX [IX_FoodItems_RestaurantId] ON [dbo].[FoodItems]
(
	[RestaurantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FoodItems] ADD  DEFAULT (N'') FOR [FoodItemImage]
GO
ALTER TABLE [dbo].[Restaurants] ADD  DEFAULT (N'') FOR [RestaurantImage]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DeliveryOrders]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryOrders_AspNetUsers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DeliveryOrders] CHECK CONSTRAINT [FK_DeliveryOrders_AspNetUsers_CustomerId]
GO
ALTER TABLE [dbo].[FoodItemInOrders]  WITH CHECK ADD  CONSTRAINT [FK_FoodItemInOrders_DeliveryOrders_DeliveryOrderId] FOREIGN KEY([DeliveryOrderId])
REFERENCES [dbo].[DeliveryOrders] ([Id])
GO
ALTER TABLE [dbo].[FoodItemInOrders] CHECK CONSTRAINT [FK_FoodItemInOrders_DeliveryOrders_DeliveryOrderId]
GO
ALTER TABLE [dbo].[FoodItemInOrders]  WITH CHECK ADD  CONSTRAINT [FK_FoodItemInOrders_FoodItems_FoodItemId] FOREIGN KEY([FoodItemId])
REFERENCES [dbo].[FoodItems] ([Id])
GO
ALTER TABLE [dbo].[FoodItemInOrders] CHECK CONSTRAINT [FK_FoodItemInOrders_FoodItems_FoodItemId]
GO
ALTER TABLE [dbo].[FoodItems]  WITH CHECK ADD  CONSTRAINT [FK_FoodItems_Restaurants_RestaurantId] FOREIGN KEY([RestaurantId])
REFERENCES [dbo].[Restaurants] ([Id])
GO
ALTER TABLE [dbo].[FoodItems] CHECK CONSTRAINT [FK_FoodItems_Restaurants_RestaurantId]
GO
USE [master]
GO
ALTER DATABASE [ExpFoodDBv1] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [FeedBackSystem]    Script Date: 9/18/2020 3:19:09 PM ******/
CREATE DATABASE [FeedBackSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FeedBackSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2K19\MSSQL\DATA\FeedBackSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FeedBackSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2K19\MSSQL\DATA\FeedBackSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FeedBackSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FeedBackSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FeedBackSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FeedBackSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FeedBackSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FeedBackSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FeedBackSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [FeedBackSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FeedBackSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FeedBackSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FeedBackSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FeedBackSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FeedBackSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FeedBackSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FeedBackSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FeedBackSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FeedBackSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FeedBackSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FeedBackSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FeedBackSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FeedBackSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FeedBackSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FeedBackSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FeedBackSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FeedBackSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [FeedBackSystem] SET  MULTI_USER 
GO
ALTER DATABASE [FeedBackSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FeedBackSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FeedBackSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FeedBackSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FeedBackSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FeedBackSystem', N'ON'
GO
ALTER DATABASE [FeedBackSystem] SET QUERY_STORE = OFF
GO
USE [FeedBackSystem]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/18/2020 3:19:10 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 9/18/2020 3:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[PostId] [int] NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentVotes]    Script Date: 9/18/2020 3:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentVotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CommentId] [int] NOT NULL,
	[VoteKeyId] [int] NOT NULL,
 CONSTRAINT [PK_CommentVotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 9/18/2020 3:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[PostText] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoteKey]    Script Date: 9/18/2020 3:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoteKey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NULL,
 CONSTRAINT [PK_VoteKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200918055706_InitialCreate', N'3.1.8')
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CreatedAt], [CreatedBy], [PostId], [CommentText]) VALUES (1, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user1', 1, N'Comment 1')
INSERT [dbo].[Comments] ([Id], [CreatedAt], [CreatedBy], [PostId], [CommentText]) VALUES (2, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user2', 1, N'Comment 2')
INSERT [dbo].[Comments] ([Id], [CreatedAt], [CreatedBy], [PostId], [CommentText]) VALUES (3, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user3', 1, N'Comment 3')
INSERT [dbo].[Comments] ([Id], [CreatedAt], [CreatedBy], [PostId], [CommentText]) VALUES (4, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user 1', 2, N'Comment 1')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[CommentVotes] ON 

INSERT [dbo].[CommentVotes] ([Id], [CreatedAt], [CreatedBy], [CommentId], [VoteKeyId]) VALUES (1, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user1', 1, 1)
INSERT [dbo].[CommentVotes] ([Id], [CreatedAt], [CreatedBy], [CommentId], [VoteKeyId]) VALUES (3, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user2', 1, 1)
INSERT [dbo].[CommentVotes] ([Id], [CreatedAt], [CreatedBy], [CommentId], [VoteKeyId]) VALUES (4, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user3', 1, 2)
SET IDENTITY_INSERT [dbo].[CommentVotes] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [CreatedAt], [CreatedBy], [PostText]) VALUES (1, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user1', N'Post 1')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [CreatedBy], [PostText]) VALUES (2, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user2', N'Post 2')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [CreatedBy], [PostText]) VALUES (3, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), N'user3', N'Post 3')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[VoteKey] ON 

INSERT [dbo].[VoteKey] ([Id], [Key]) VALUES (1, N'Like')
INSERT [dbo].[VoteKey] ([Id], [Key]) VALUES (2, N'Dislike')
SET IDENTITY_INSERT [dbo].[VoteKey] OFF
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 9/18/2020 3:19:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CommentVotes_CommentId]    Script Date: 9/18/2020 3:19:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_CommentVotes_CommentId] ON [dbo].[CommentVotes]
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CommentVotes_VoteKeyId]    Script Date: 9/18/2020 3:19:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_CommentVotes_VoteKeyId] ON [dbo].[CommentVotes]
(
	[VoteKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[CommentVotes]  WITH CHECK ADD  CONSTRAINT [FK_CommentVotes_Comments_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CommentVotes] CHECK CONSTRAINT [FK_CommentVotes_Comments_CommentId]
GO
ALTER TABLE [dbo].[CommentVotes]  WITH CHECK ADD  CONSTRAINT [FK_CommentVotes_VoteKey_VoteKeyId] FOREIGN KEY([VoteKeyId])
REFERENCES [dbo].[VoteKey] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CommentVotes] CHECK CONSTRAINT [FK_CommentVotes_VoteKey_VoteKeyId]
GO
USE [master]
GO
ALTER DATABASE [FeedBackSystem] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [DemoNg]    Script Date: 4/3/2021 10:44:07 PM ******/
CREATE DATABASE [DemoNg]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoNg', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoNg.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoNg_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoNg_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoNg] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoNg].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoNg] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoNg] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoNg] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoNg] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoNg] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoNg] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DemoNg] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoNg] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoNg] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoNg] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoNg] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoNg] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoNg] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoNg] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoNg] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DemoNg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoNg] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoNg] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoNg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoNg] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoNg] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoNg] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoNg] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoNg] SET  MULTI_USER 
GO
ALTER DATABASE [DemoNg] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoNg] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoNg] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoNg] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoNg] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoNg] SET QUERY_STORE = OFF
GO
USE [DemoNg]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/3/2021 10:44:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](100) NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (1, N'Nhan', CAST(N'1990-05-05' AS Date), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (2, N'Long', CAST(N'1997-02-02' AS Date), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (3, N'Hoàng', CAST(N'1996-09-19' AS Date), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (4, N'Thuận', CAST(N'1998-08-18' AS Date), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (5, N'Đạt', CAST(N'1995-10-10' AS Date), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (6, N'Phong', CAST(N'1995-10-10' AS Date), 0)
INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (7, N'Hải', CAST(N'1995-05-05' AS Date), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (8, N'Bảo', CAST(N'1995-10-10' AS Date), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [gender]) VALUES (9, N'Tường', CAST(N'1995-09-09' AS Date), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 4/3/2021 10:44:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUser]
@id INT
AS
BEGIN
	SELECT [id]
      ,[fullName]
      ,[dob]
	  ,FORMAT([dob],'dd-MM-yyyy') AS dobStr
	  ,FORMAT([dob],'yyyy-MM-dd') AS dobVal
      ,[gender]
  FROM [dbo].[User] where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 4/3/2021 10:44:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUsers]
AS
BEGIN
	SELECT [id]
      ,[fullName]
      ,[dob]
	  ,FORMAT([dob],'dd-MM-yyyy') AS dobStr
	  ,FORMAT([dob],'yyyy-MM-dd') AS dobVal
      ,[gender]
  FROM [dbo].[User]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUser]    Script Date: 4/3/2021 10:44:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveUser]
@id INT,
@fullName nvarchar(100),
@dob date,
@gender bit
AS
BEGIN
	declare @message nvarchar(100) = N'Lỗi chương trình'
	if(@id > 0 )
	begin
		UPDATE [dbo].[User]
		   SET [fullName] = @fullName
			  ,[dob] = @dob
			  ,[gender] = @gender
		 WHERE id = @id
		 set @message = N'Cập nhật thành công'
	end
	else
	begin
		INSERT INTO [dbo].[User]
           ([fullName]
           ,[dob]
           ,[gender])
     VALUES
           (@fullName
           ,@dob
           ,@gender)
		set @id = SCOPE_IDENTITY()
		set @message = N'Thêm mới thành công'
	end

	select @id as id, @message as message
END
GO
USE [master]
GO
ALTER DATABASE [DemoNg] SET  READ_WRITE 
GO

USE [DemoNg]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletedSubject]    Script Date: 4/7/2021 8:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeletedSubject]
@SubjectId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	IF(EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectId = @SubjectId AND IsDeleted <> 1))
		BEGIN
			DECLARE @SubjectName NVARCHAR(100) = (SELECT TOP(1) SubjectName FROM [dbo].[Subject] WHERE SubjectId = @SubjectId)
			UPDATE [dbo].[Subject]
				   SET [IsDeleted] = 1
				 WHERE SubjectId = @SubjectId
				 SET @Message = N'Xóa Môn học: '+ @SubjectName + N' thành công.'
		END
		ELSE
		BEGIN
			SET @SubjectId = 0
			SET @Message = N'Mã ID Môn học không tồn tại hoặc đã bị xóa.'
		END
	SELECT @SubjectId AS SubjectId, @Message AS [Message]
END



GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubject]    Script Date: 4/7/2021 8:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSubject]
@SubjectId INT
AS
BEGIN
	SELECT [SubjectId]
		  ,[SubjectName]
  FROM [dbo].[Subject] WHERE SubjectId = @SubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjects]    Script Date: 4/7/2021 8:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSubjects]
AS
BEGIN
	SELECT [SubjectId]
		  ,[SubjectName]
	  FROM [dbo].[Subject] WHERE IsDeleted <> 1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SaveSubject]    Script Date: 4/7/2021 8:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveSubject]
@SubjectId INT,
@SubjectName nvarchar(100)
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	IF(@SubjectId > 0)
	BEGIN
		--UPDATE
		IF(EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectId = @SubjectId AND IsDeleted <> 1))
		BEGIN
			IF(NOT EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectName = @SubjectName AND SubjectId <> @SubjectId))
			BEGIN
				UPDATE [dbo].[Subject]
				   SET [SubjectName] = @SubjectName
				 WHERE SubjectId = @SubjectId
				 SET @Message = N'Cập nhật Môn học thành công.'
			END
			ELSE
			BEGIN
				SET @Message = N'Tên Môn học đã tồn tại.'
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Mã ID Môn học không tồn tại hoặc đã bị xóa.'
		END
	END
	ELSE
	BEGIN
		--CREATE
		IF(NOT EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectName = @SubjectName))
		BEGIN
			INSERT INTO [dbo].[Subject]
					   ([SubjectName]
					   ,[IsDeleted])
				 VALUES
					   (@SubjectName
					   ,0)
			SET @SubjectId = SCOPE_IDENTITY()
			SET @Message = N'Thêm mới Môn học: ' + @SubjectName + ' thành công.'
		END
		ELSE
		BEGIN
			SET @Message = N'Tên Môn học đã tồn tại.'
		END
	END
	SELECT @SubjectId AS SubjectId, @Message AS [Message]
END



GO

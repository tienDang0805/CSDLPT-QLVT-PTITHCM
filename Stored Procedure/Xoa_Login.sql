USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[Xoa_Login]    Script Date: 04/09/2023 15:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[Xoa_Login]
@USRNAME VARCHAR(50)
AS
DECLARE @LGNAME VARCHAR(50)
IF EXISTS (SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@USRNAME AS NVARCHAR))
BEGIN
	SET @LGNAME = CAST((SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@USRNAME AS NVARCHAR)) AS VARCHAR(50))
	EXEC SP_DROPUSER @USRNAME
	EXEC SP_DROPLOGIN @LGNAME
END
GO

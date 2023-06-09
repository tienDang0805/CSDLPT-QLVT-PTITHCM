USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoLogin]    Script Date: 04/09/2023 15:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[sp_TaoLogin]
    @LGNAME VARCHAR(50),  @PASS VARCHAR(50),
    @USERNAME VARCHAR(50),  @ROLE VARCHAR(50)     
AS
	DECLARE @RET INT
	EXEC @RET = SP_ADDLOGIN @LGNAME, @PASS, 'QLVT_DATHANG' -- Tạo login name
	IF (@RET = 1)  -- login name bị trùng
	BEGIN
		RAISERROR ('Login name bị trùng!', 16,1)
		RETURN
	END
	EXEC @RET= SP_GRANTDBACCESS @LGNAME, @USERNAME
	IF (@RET = 1)  -- username bị trùng
	BEGIN
		EXEC SP_DROPLOGIN @LGNAME -- Xóa login name vừa tạo ban nãy đi
		RAISERROR ('Nhân viên đã có login name!', 16,2)
		RETURN
	END
	EXEC sp_addrolemember @ROLE, @USERNAME -- gán người dùng với nhóm quyền
	IF @ROLE = 'CONGTY' OR @ROLE= 'CHINHANH'
		EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
GO

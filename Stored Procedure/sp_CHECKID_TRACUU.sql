USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECKID_TRACUU]    Script Date: 04/09/2023 15:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CHECKID_TRACUU]
@Code NVARCHAR(30), @Type NVARCHAR(15)
AS
BEGIN
	-- Nhân viên
	IF(@Type = 'MANV')
	BEGIN
		IF EXISTS(SELECT * FROM LINK2.QLVT_DATHANG.dbo.NhanVien AS NV WHERE NV.MANV = @Code)
			RETURN 1; -- Mã NV tồn tại đã tồn tại
	END

	-- Kho
	IF(@Type = 'MAKHO')
	BEGIN
		IF EXISTS(SELECT * FROM LINK2.QLVT_DATHANG.dbo.Kho AS KHO WHERE KHO.MAKHO = @Code)
			RETURN 1; -- Mã Kho đã tồn tại
	END

	IF(@Type = 'TENKHO')
	BEGIN
		IF EXISTS(SELECT * FROM LINK2.QLVT_DATHANG.dbo.Kho AS KHO WHERE KHO.TENKHO = @Code)
			RETURN 1; -- Tên Kho đã tồn tại
	END

	RETURN 0 -- Không bị trùng
END
GO

USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[SP_Report_DSNV]    Script Date: 04/09/2023 15:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_DSNV]
AS
	SELECT MANV, HO, TEN, DIACHI, NGAYSINH, LUONG
	FROM dbo.NhanVien
	WHERE TrangThaiXoa = 0
	ORDER BY TEN, HO
GO

USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[SP_Report_DDH_Khong_PN]    Script Date: 04/09/2023 15:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_DDH_Khong_PN]
AS
SELECT DH.MasoDDH,Ngay,NhaCC,HOTENNV, TENVT, SOLUONG, DONGIA 
FROM
	(SELECT MasoDDH,Ngay,NhaCC,HOTENNV = (select HOTEN = HO +' ' +Ten from dbo.NhanVien where NhanVien.MANV = DatHang.MANV) FROM dbo.DatHang
	WHERE DatHang.MasoDDH not in (
	SELECT MasoDDH FROM dbo.PhieuNhap)) DH,
	(SELECT MAVT,TENVT FROM dbo.Vattu) VT,
	CTDDH CT
WHERE (VT.MAVT =CT.MAVT) AND (CT.MasoDDH = DH.MasoDDH)
GO

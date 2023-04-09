USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[sp_Tang_SL_VT]    Script Date: 04/09/2023 15:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_Tang_SL_VT]
	@MAVT nvarchar(4),
	@SLTANG int
AS
BEGIN
	--Update SOLUONG
	UPDATE Vattu
		SET SOLUONGTON = SOLUONGTON + @SLTANG
		WHERE MAVT = @MAVT
END
GO

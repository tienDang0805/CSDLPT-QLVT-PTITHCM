USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[sp_Giam_SL_VT]    Script Date: 04/09/2023 15:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Giam_SL_VT]
	@MAVT nvarchar(4),
	@SLGIAM int
AS
BEGIN
	--Update SOLUONG
	IF EXISTS(SELECT 1 FROM Vattu WHERE MAVT = @MAVT AND SOLUONGTON < @SLGIAM)
		RETURN 1;
	ELSE
	UPDATE Vattu
		SET SOLUONGTON = SOLUONGTON - @SLGIAM
		WHERE MAVT = @MAVT
END
GO

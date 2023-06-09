USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[sp_Kiem_Tra_MAPX]    Script Date: 04/09/2023 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Kiem_Tra_MAPX]
	@MAPX nchar(8)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM PhieuXuat PX WHERE PX.MAPX = @MAPX)
		RETURN 1;
	ELSE
	IF EXISTS(SELECT 1 FROM LINK0.QLVT_DATHANG.dbo.PhieuXuat PX WHERE PX.MAPX = @MAPX)
		RETURN 1;
	RETURN 0;
END
GO

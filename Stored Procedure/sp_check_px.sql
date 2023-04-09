USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[sp_check_PX]    Script Date: 04/09/2023 15:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_check_PX]
@MAPX nchar(8),
@MAVT nchar(4)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM CTPX WHERE MAPX = @MAPX AND MAVT = @MAVT)
		RETURN 1;
	ELSE
		RETURN 0;
END
GO

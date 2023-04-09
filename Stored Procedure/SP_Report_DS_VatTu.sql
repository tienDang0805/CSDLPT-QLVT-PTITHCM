USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[SP_Report_DS_VatTu]    Script Date: 04/09/2023 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_DS_VatTu]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
SELECT MAVT, TENVT, DVT, SOLUONGTON 
	FROM dbo.Vattu 
	ORDER BY TENVT
END
GO

USE [QLVT_DATHANG]
GO
/****** Object:  View [dbo].[V_DSPM]    Script Date: 04/09/2023 15:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DSPM]
AS
SELECT TENCN=PUBS.description, TENSERVER=subscriber_server
 FROM sysmergepublications  PUBS, sysmergesubscriptions SUBS
 WHERE PUBS.pubid = SUBS.pubid AND  publisher <> subscriber_server
GO

USE [QLVT_DATHANG]
GO
/****** Object:  View [dbo].[V_DS_PHANMANH]    Script Date: 04/09/2023 15:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DS_PHANMANH] AS SELECT TENCN=PUB.description, TENSERVER= SUBS.subscriber_server FROM dbo.sysmergepublications PUB, dbo.sysmergesubscriptions SUBS WHERE PUB.pubid= SUBS.pubid AND SUBS.subscriber_server <> @@SERVERNAME AND SUBS.subscriber_server <> 'DESKTOP-421RCI7\SERVER3'
GO

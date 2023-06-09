USE [master]
GO
/****** Object:  Database [QLVT_DATHANG]    Script Date: 04/09/2023 14:38:35 ******/
CREATE DATABASE [QLVT_DATHANG] ON  PRIMARY 
( NAME = N'QLVT_DATHANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QLVT_DATHANG.mdf' , SIZE = 24576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLVT_DATHANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QLVT_DATHANG_log.ldf' , SIZE = 32448KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLVT_DATHANG] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLVT_DATHANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET ARITHABORT OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLVT_DATHANG] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLVT_DATHANG] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET  DISABLE_BROKER
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QLVT_DATHANG] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QLVT_DATHANG] SET  READ_WRITE
GO
ALTER DATABASE [QLVT_DATHANG] SET RECOVERY FULL
GO
ALTER DATABASE [QLVT_DATHANG] SET  MULTI_USER
GO
ALTER DATABASE [QLVT_DATHANG] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QLVT_DATHANG] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLVT_DATHANG', N'ON'
GO
USE [QLVT_DATHANG]
GO
/****** Object:  User [HTKN1]    Script Date: 04/09/2023 14:38:35 ******/
CREATE USER [HTKN1] FOR LOGIN [HTKN1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HTKN]    Script Date: 04/09/2023 14:38:35 ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Role [MSmerge_PAL_role]    Script Date: 04/09/2023 14:38:35 ******/
CREATE ROLE [MSmerge_PAL_role] AUTHORIZATION [dbo]
GO
/****** Object:  Role [MSmerge_5474A3CA814C431E944B55021C1E2BE1]    Script Date: 04/09/2023 14:38:35 ******/
CREATE ROLE [MSmerge_5474A3CA814C431E944B55021C1E2BE1] AUTHORIZATION [dbo]
GO
/****** Object:  Role [MSmerge_D9997E408E2E4E049A8D2A7EACE2A057]    Script Date: 04/09/2023 14:38:35 ******/
CREATE ROLE [MSmerge_D9997E408E2E4E049A8D2A7EACE2A057] AUTHORIZATION [dbo]
GO
/****** Object:  Role [MSmerge_FDA6F8984F134B66A0001979EC210AAB]    Script Date: 04/09/2023 14:38:35 ******/
CREATE ROLE [MSmerge_FDA6F8984F134B66A0001979EC210AAB] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 04/09/2023 14:38:35 ******/
CREATE SCHEMA [MSmerge_PAL_role] AUTHORIZATION [MSmerge_PAL_role]
GO
/****** Object:  View [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_98A3D380E6FD45518537D18AE2134296]    Script Date: 04/09/2023 14:38:36 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_98A3D380E6FD45518537D18AE2134296] as select * from [dbo].[CTDDH] where ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(197575742) & 0x1b <> 0)
GO
/****** Object:  Table [dbo].[MSmerge_tombstone]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MSmerge_tombstone](
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[tablenick] [int] NOT NULL,
	[type] [tinyint] NOT NULL,
	[lineage] [varbinary](311) NOT NULL,
	[generation] [bigint] NOT NULL,
	[logical_record_parent_rowguid] [uniqueidentifier] NULL,
	[logical_record_lineage] [varbinary](311) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE CLUSTERED INDEX [uc1MSmerge_tombstone] ON [dbo].[MSmerge_tombstone] 
(
	[tablenick] DESC,
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc2MSmerge_tombstone] ON [dbo].[MSmerge_tombstone] 
(
	[generation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_tsvw_98A3D380E6FD45518537D18AE2134296]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_98A3D380E6FD45518537D18AE2134296] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(621961292) > 0 or
                trigger_nestlevel(637961349) > 0 or
                trigger_nestlevel(653961406) > 0
                with check option
GO
/****** Object:  Table [dbo].[MSmerge_genhistory]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MSmerge_genhistory](
	[guidsrc] [uniqueidentifier] NOT NULL,
	[pubid] [uniqueidentifier] NULL,
	[generation] [bigint] IDENTITY(1,1) NOT NULL,
	[art_nick] [int] NULL,
	[nicknames] [varbinary](1001) NOT NULL,
	[coldate] [datetime] NOT NULL,
	[genstatus] [tinyint] NOT NULL,
	[changecount] [int] NOT NULL,
	[subscriber_number] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [c1MSmerge_genhistory] ON [dbo].[MSmerge_genhistory] 
(
	[generation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc2MSmerge_genhistory] ON [dbo].[MSmerge_genhistory] 
(
	[genstatus] ASC,
	[art_nick] ASC,
	[changecount] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc4MSmerge_genhistory] ON [dbo].[MSmerge_genhistory] 
(
	[coldate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [unc1MSmerge_genhistory] ON [dbo].[MSmerge_genhistory] 
(
	[guidsrc] ASC,
	[pubid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_genvw_98A3D380E6FD45518537D18AE2134296]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_98A3D380E6FD45518537D18AE2134296] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(621961292) > 0 or
                trigger_nestlevel(637961349) > 0 or
                trigger_nestlevel(653961406) > 0
                with check option
GO
/****** Object:  Table [dbo].[MSmerge_current_partition_mappings]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MSmerge_current_partition_mappings](
	[publication_number] [smallint] NOT NULL,
	[tablenick] [int] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[partition_id] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [cMSmerge_current_partition_mappings] ON [dbo].[MSmerge_current_partition_mappings] 
(
	[tablenick] ASC,
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ncMSmerge_current_partition_mappings] ON [dbo].[MSmerge_current_partition_mappings] 
(
	[publication_number] ASC,
	[partition_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_cpmv_98A3D380E6FD45518537D18AE2134296]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_98A3D380E6FD45518537D18AE2134296] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(621961292) > 0 or
                    trigger_nestlevel(637961349) > 0 or
                    trigger_nestlevel(653961406) > 0
                    with check option
GO
/****** Object:  Table [dbo].[MSmerge_contents]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MSmerge_contents](
	[tablenick] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[generation] [bigint] NOT NULL,
	[partchangegen] [bigint] NULL,
	[lineage] [varbinary](311) NOT NULL,
	[colv1] [varbinary](2953) NULL,
	[marker] [uniqueidentifier] NULL,
	[logical_record_parent_rowguid] [uniqueidentifier] NULL,
	[logical_record_lineage] [varbinary](311) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE CLUSTERED INDEX [uc1SycContents] ON [dbo].[MSmerge_contents] 
(
	[tablenick] ASC,
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc2MSmerge_contents] ON [dbo].[MSmerge_contents] 
(
	[generation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc3MSmerge_contents] ON [dbo].[MSmerge_contents] 
(
	[partchangegen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc4MSmerge_contents] ON [dbo].[MSmerge_contents] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [nc5MSmerge_contents] ON [dbo].[MSmerge_contents] 
(
	[tablenick] ASC,
	[marker] ASC,
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_ctsv_98A3D380E6FD45518537D18AE2134296]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_98A3D380E6FD45518537D18AE2134296] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(621961292) > 0 or
                trigger_nestlevel(637961349) > 0 or
                trigger_nestlevel(653961406) > 0
                with check option
GO
/****** Object:  Table [dbo].[MSmerge_past_partition_mappings]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MSmerge_past_partition_mappings](
	[publication_number] [smallint] NOT NULL,
	[tablenick] [int] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[partition_id] [int] NOT NULL,
	[generation] [bigint] NULL,
	[reason] [tinyint] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [cMSmerge_past_partition_mappings] ON [dbo].[MSmerge_past_partition_mappings] 
(
	[tablenick] ASC,
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc1MSmerge_past_partition_mappings] ON [dbo].[MSmerge_past_partition_mappings] 
(
	[publication_number] ASC,
	[partition_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc2MSmerge_past_partition_mappings] ON [dbo].[MSmerge_past_partition_mappings] 
(
	[generation] ASC,
	[tablenick] ASC
)
INCLUDE ( [publication_number],
[partition_id]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_ppmv_98A3D380E6FD45518537D18AE2134296]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_98A3D380E6FD45518537D18AE2134296] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(621961292) > 0 or
                    trigger_nestlevel(637961349) > 0 or
                    trigger_nestlevel(653961406) > 0
                    with check option
GO
/****** Object:  Table [dbo].[CTDDH]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDDH](
	[MasoDDH] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [float] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CTDDH] PRIMARY KEY CLUSTERED 
(
	[MasoDDH] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_197575742] ON [dbo].[CTDDH] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_98A3D380E6FD45518537D18AE2134296]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_98A3D380E6FD45518537D18AE2134296] as select * from [dbo].[CTDDH] where ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(197575742) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_tsvw_F142A52EB252457FA92F58095283EEBB]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_F142A52EB252457FA92F58095283EEBB] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(237959924) > 0 or
                trigger_nestlevel(253959981) > 0 or
                trigger_nestlevel(269960038) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_F142A52EB252457FA92F58095283EEBB]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_F142A52EB252457FA92F58095283EEBB] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(237959924) > 0 or
                trigger_nestlevel(253959981) > 0 or
                trigger_nestlevel(269960038) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_F142A52EB252457FA92F58095283EEBB]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_F142A52EB252457FA92F58095283EEBB] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(237959924) > 0 or
                    trigger_nestlevel(253959981) > 0 or
                    trigger_nestlevel(269960038) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_F142A52EB252457FA92F58095283EEBB]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_F142A52EB252457FA92F58095283EEBB] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(237959924) > 0 or
                trigger_nestlevel(253959981) > 0 or
                trigger_nestlevel(269960038) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_ppmv_F142A52EB252457FA92F58095283EEBB]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_F142A52EB252457FA92F58095283EEBB] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(237959924) > 0 or
                    trigger_nestlevel(253959981) > 0 or
                    trigger_nestlevel(269960038) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_Kho_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_Kho_PARTITION_VIEW] as select [Kho].[MAKHO], [Kho].[MACN], [Kho].[rowguid], [ChiNhanh].partition_id from [dbo].[Kho] [Kho] , [dbo].[MSmerge_QLVT_DATHANG_CN1_ChiNhanh_PARTITION_VIEW] [ChiNhanh] where ( ( [Kho].[MACN] = [ChiNhanh].[MACN]) ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(85575343) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_DatHang_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_DatHang_PARTITION_VIEW] as select [DatHang].[MasoDDH], [DatHang].[MAKHO], [DatHang].[rowguid], [Kho].partition_id from [dbo].[DatHang] [DatHang] , [dbo].[MSmerge_QLVT_DATHANG_CN1_Kho_PARTITION_VIEW] [Kho] where ( ( [DatHang].[MAKHO] = [Kho].[MAKHO]) ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(133575514) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_CTDDH_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_CTDDH_PARTITION_VIEW] as select [CTDDH].[MasoDDH], [CTDDH].[rowguid], [DatHang].partition_id from [dbo].[CTDDH] [CTDDH] , [dbo].[MSmerge_QLVT_DATHANG_CN1_DatHang_PARTITION_VIEW] [DatHang] where ( ( [CTDDH].[MasoDDH] = [DatHang].[MasoDDH]) ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(197575742) & 0x1b <> 0)
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[MasoDDH] [nchar](8) NOT NULL,
	[NGAY] [date] NOT NULL,
	[NhaCC] [nvarchar](100) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[MasoDDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_133575514] ON [dbo].[DatHang] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_tsvw_EE9FA3BB38E2453B91522DBE3E412EA0]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_EE9FA3BB38E2453B91522DBE3E412EA0] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(659533433) > 0 or
                trigger_nestlevel(675533490) > 0 or
                trigger_nestlevel(691533547) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_EE9FA3BB38E2453B91522DBE3E412EA0]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_EE9FA3BB38E2453B91522DBE3E412EA0] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(659533433) > 0 or
                trigger_nestlevel(675533490) > 0 or
                trigger_nestlevel(691533547) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_EE9FA3BB38E2453B91522DBE3E412EA0]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_EE9FA3BB38E2453B91522DBE3E412EA0] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(659533433) > 0 or
                    trigger_nestlevel(675533490) > 0 or
                    trigger_nestlevel(691533547) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_EE9FA3BB38E2453B91522DBE3E412EA0]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_EE9FA3BB38E2453B91522DBE3E412EA0] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(659533433) > 0 or
                trigger_nestlevel(675533490) > 0 or
                trigger_nestlevel(691533547) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_ppmv_EE9FA3BB38E2453B91522DBE3E412EA0]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_EE9FA3BB38E2453B91522DBE3E412EA0] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(659533433) > 0 or
                    trigger_nestlevel(675533490) > 0 or
                    trigger_nestlevel(691533547) > 0
                    with check option
GO
/****** Object:  Table [dbo].[sysmergearticles]    Script Date: 04/09/2023 14:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[sysmergearticles](
	[name] [sysname] NOT NULL,
	[type] [tinyint] NULL,
	[objid] [int] NOT NULL,
	[sync_objid] [int] NOT NULL,
	[view_type] [tinyint] NULL,
	[artid] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](255) NULL,
	[pre_creation_command] [tinyint] NULL,
	[pubid] [uniqueidentifier] NOT NULL,
	[nickname] [int] NOT NULL,
	[column_tracking] [int] NOT NULL,
	[status] [tinyint] NULL,
	[conflict_table] [sysname] NULL,
	[creation_script] [nvarchar](255) NULL,
	[conflict_script] [nvarchar](255) NULL,
	[article_resolver] [nvarchar](255) NULL,
	[ins_conflict_proc] [sysname] NULL,
	[insert_proc] [sysname] NULL,
	[update_proc] [sysname] NULL,
	[select_proc] [sysname] NULL,
	[metadata_select_proc] [sysname] NULL,
	[delete_proc] [sysname] NULL,
	[schema_option] [binary](8) NULL,
	[destination_object] [sysname] NOT NULL,
	[destination_owner] [sysname] NULL,
	[resolver_clsid] [nvarchar](50) NULL,
	[subset_filterclause] [nvarchar](1000) NULL,
	[missing_col_count] [int] NULL,
	[missing_cols] [varbinary](128) NULL,
	[excluded_cols] [varbinary](128) NULL,
	[excluded_col_count] [int] NOT NULL,
	[columns] [varbinary](128) NULL,
	[deleted_cols] [varbinary](128) NULL,
	[resolver_info] [nvarchar](517) NULL,
	[view_sel_proc] [nvarchar](290) NULL,
	[gen_cur] [bigint] NULL,
	[vertical_partition] [int] NOT NULL,
	[identity_support] [int] NOT NULL,
	[before_image_objid] [int] NULL,
	[before_view_objid] [int] NULL,
	[verify_resolver_signature] [int] NULL,
	[allow_interactive_resolver] [bit] NOT NULL,
	[fast_multicol_updateproc] [bit] NOT NULL,
	[check_permissions] [int] NOT NULL,
	[maxversion_at_cleanup] [int] NOT NULL,
	[processing_order] [int] NOT NULL,
	[upload_options] [tinyint] NOT NULL,
	[published_in_tran_pub] [bit] NOT NULL,
	[lightweight] [bit] NOT NULL,
	[procname_postfix] [nchar](32) NULL,
	[well_partitioned_lightweight] [bit] NULL,
	[before_upd_view_objid] [int] NULL,
	[delete_tracking] [bit] NULL,
	[compensate_for_errors] [bit] NOT NULL,
	[pub_range] [bigint] NULL,
	[range] [bigint] NULL,
	[threshold] [int] NULL,
	[stream_blob_columns] [bit] NOT NULL,
	[preserve_rowguidcol] [bit] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE CLUSTERED INDEX [uc1sysmergearticles] ON [dbo].[sysmergearticles] 
(
	[artid] ASC,
	[pubid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc1sysmergearticles] ON [dbo].[sysmergearticles] 
(
	[nickname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc2sysmergearticles] ON [dbo].[sysmergearticles] 
(
	[processing_order] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [nc3sysmergearticles] ON [dbo].[sysmergearticles] 
(
	[objid] ASC,
	[pubid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MSmerge_expand_sp_27F1AFCDA1B3499699D924E5E583BA19]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MSmerge_expand_sp_27F1AFCDA1B3499699D924E5E583BA19] (@marker uniqueidentifier, @inherit_pastchanges_generation bigint, @parent_being_updated bit = 0, @trigger_type int = 1) as  
    declare @child_marker uniqueidentifier
    declare @child_rowcount int, @child_newgen bigint, @child_oldmaxversion int, @child_metadatarows_updated int, @cv varbinary(1), @replnick binary(6)
    declare @lineage varbinary(311)    
    declare @retcode int
    declare @dt datetime
    declare @nickbin varbinary(8)
    declare @reason bit

    
    select @replnick = 0x814c5474a3ca 

    select @nickbin = @replnick + 0xFF
    
    set @child_marker = newid()

    select @dt = getdate()
         
        select @child_rowcount = count(*) from [dbo].[CTPN] [CTPN]  with (rowlock)
        where [rowguid] in 
        (select [CTPN].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[PhieuNhap] [PhieuNhap] with (rowlock), [dbo].[CTPN] [CTPN] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 40250000 
        and dbo.MSmerge_contents.rowguid = [PhieuNhap].[rowguid] 
        and ([CTPN].[MAPN] = [PhieuNhap].[MAPN])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 60250000

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 60250000 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 60250000, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 60250000 
            and MSmerge_contents1.rowguid in 
                (select [CTPN].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[PhieuNhap] [PhieuNhap] with (rowlock), [dbo].[CTPN] [CTPN] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 40250000 
                and MSmerge_contents2.rowguid = [PhieuNhap].[rowguid] 
                and ([CTPN].[MAPN] = [PhieuNhap].[MAPN]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 60250000, [CTPN].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[CTPN] [CTPN]  with (rowlock)
                where [rowguid] in 
                    (
                        select [CTPN].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[PhieuNhap] [PhieuNhap] with (rowlock), 
                        [dbo].[CTPN] [CTPN] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 40250000 
                        and MSmerge_contents2.rowguid = [PhieuNhap].[rowguid] 
                        and ([CTPN].[MAPN] = [PhieuNhap].[MAPN])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 60250000 
                        and rowguid = [CTPN].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 60250000
                and dbo.MSmerge_current_partition_mappings.tablenick = 60250000
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 3
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_CTPN_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 60250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_CTPN_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 60250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 3 and 
                    tablenick = 60250000 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 3, 60250000, [CTPN].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[PhieuNhap] [PhieuNhap] with (rowlock) , [dbo].[CTPN] [CTPN]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 40250000
                and mc.rowguid = [PhieuNhap].[rowguid]
                and mpcpm.publication_number = 3
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 40250000
                and mc.rowguid = mpcpm.rowguid
                and ([CTPN].[MAPN] = [PhieuNhap].[MAPN])                
            end  
    end     
        select @child_rowcount = count(*) from [dbo].[CTPN] [CTPN]  with (rowlock)
        where [rowguid] in 
        (select [CTPN].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[PhieuNhap] [PhieuNhap] with (rowlock), [dbo].[CTPN] [CTPN] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 40250000 
        and dbo.MSmerge_contents.rowguid = [PhieuNhap].[rowguid] 
        and ([CTPN].[MAPN] = [PhieuNhap].[MAPN])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 60250000

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 60250000 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 60250000, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 60250000 
            and MSmerge_contents1.rowguid in 
                (select [CTPN].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[PhieuNhap] [PhieuNhap] with (rowlock), [dbo].[CTPN] [CTPN] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 40250000 
                and MSmerge_contents2.rowguid = [PhieuNhap].[rowguid] 
                and ([CTPN].[MAPN] = [PhieuNhap].[MAPN]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 60250000, [CTPN].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[CTPN] [CTPN]  with (rowlock)
                where [rowguid] in 
                    (
                        select [CTPN].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[PhieuNhap] [PhieuNhap] with (rowlock), 
                        [dbo].[CTPN] [CTPN] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 40250000 
                        and MSmerge_contents2.rowguid = [PhieuNhap].[rowguid] 
                        and ([CTPN].[MAPN] = [PhieuNhap].[MAPN])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 60250000 
                        and rowguid = [CTPN].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 60250000
                and dbo.MSmerge_current_partition_mappings.tablenick = 60250000
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 1
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_CTPN_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 60250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_CTPN_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 60250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 1 and 
                    tablenick = 60250000 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 1, 60250000, [CTPN].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[PhieuNhap] [PhieuNhap] with (rowlock) , [dbo].[CTPN] [CTPN]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 40250000
                and mc.rowguid = [PhieuNhap].[rowguid]
                and mpcpm.publication_number = 1
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 40250000
                and mc.rowguid = mpcpm.rowguid
                and ([CTPN].[MAPN] = [PhieuNhap].[MAPN])                
            end  
    end
GO
/****** Object:  StoredProcedure [dbo].[MSmerge_expand_sp_F142A52EB252457FA92F58095283EEBB]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MSmerge_expand_sp_F142A52EB252457FA92F58095283EEBB] (@marker uniqueidentifier, @inherit_pastchanges_generation bigint, @parent_being_updated bit = 0, @trigger_type int = 1) as  
    declare @child_marker uniqueidentifier
    declare @child_rowcount int, @child_newgen bigint, @child_oldmaxversion int, @child_metadatarows_updated int, @cv varbinary(1), @replnick binary(6)
    declare @lineage varbinary(311)    
    declare @retcode int
    declare @dt datetime
    declare @nickbin varbinary(8)
    declare @reason bit

    
    select @replnick = 0x814c5474a3ca 

    select @nickbin = @replnick + 0xFF
    
    set @child_marker = newid()

    select @dt = getdate()
         
        select @child_rowcount = count(*) from [dbo].[CTDDH] [CTDDH]  with (rowlock)
        where [rowguid] in 
        (select [CTDDH].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[DatHang] [DatHang] with (rowlock), [dbo].[CTDDH] [CTDDH] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 30250000 
        and dbo.MSmerge_contents.rowguid = [DatHang].[rowguid] 
        and ([CTDDH].[MasoDDH] = [DatHang].[MasoDDH])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 50250000

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 50250000 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 50250000, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 50250000 
            and MSmerge_contents1.rowguid in 
                (select [CTDDH].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[DatHang] [DatHang] with (rowlock), [dbo].[CTDDH] [CTDDH] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 30250000 
                and MSmerge_contents2.rowguid = [DatHang].[rowguid] 
                and ([CTDDH].[MasoDDH] = [DatHang].[MasoDDH]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 50250000, [CTDDH].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[CTDDH] [CTDDH]  with (rowlock)
                where [rowguid] in 
                    (
                        select [CTDDH].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[DatHang] [DatHang] with (rowlock), 
                        [dbo].[CTDDH] [CTDDH] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 30250000 
                        and MSmerge_contents2.rowguid = [DatHang].[rowguid] 
                        and ([CTDDH].[MasoDDH] = [DatHang].[MasoDDH])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 50250000 
                        and rowguid = [CTDDH].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 50250000
                and dbo.MSmerge_current_partition_mappings.tablenick = 50250000
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 3
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_CTDDH_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 50250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_CTDDH_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 50250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 3 and 
                    tablenick = 50250000 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 3, 50250000, [CTDDH].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[DatHang] [DatHang] with (rowlock) , [dbo].[CTDDH] [CTDDH]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 30250000
                and mc.rowguid = [DatHang].[rowguid]
                and mpcpm.publication_number = 3
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 30250000
                and mc.rowguid = mpcpm.rowguid
                and ([CTDDH].[MasoDDH] = [DatHang].[MasoDDH])                
            end  
    end     
        select @child_rowcount = count(*) from [dbo].[CTDDH] [CTDDH]  with (rowlock)
        where [rowguid] in 
        (select [CTDDH].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[DatHang] [DatHang] with (rowlock), [dbo].[CTDDH] [CTDDH] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 30250000 
        and dbo.MSmerge_contents.rowguid = [DatHang].[rowguid] 
        and ([CTDDH].[MasoDDH] = [DatHang].[MasoDDH])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 50250000

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 50250000 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 50250000, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 50250000 
            and MSmerge_contents1.rowguid in 
                (select [CTDDH].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[DatHang] [DatHang] with (rowlock), [dbo].[CTDDH] [CTDDH] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 30250000 
                and MSmerge_contents2.rowguid = [DatHang].[rowguid] 
                and ([CTDDH].[MasoDDH] = [DatHang].[MasoDDH]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 50250000, [CTDDH].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[CTDDH] [CTDDH]  with (rowlock)
                where [rowguid] in 
                    (
                        select [CTDDH].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[DatHang] [DatHang] with (rowlock), 
                        [dbo].[CTDDH] [CTDDH] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 30250000 
                        and MSmerge_contents2.rowguid = [DatHang].[rowguid] 
                        and ([CTDDH].[MasoDDH] = [DatHang].[MasoDDH])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 50250000 
                        and rowguid = [CTDDH].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 50250000
                and dbo.MSmerge_current_partition_mappings.tablenick = 50250000
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 1
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_CTDDH_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 50250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_CTDDH_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 50250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 1 and 
                    tablenick = 50250000 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 1, 50250000, [CTDDH].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[DatHang] [DatHang] with (rowlock) , [dbo].[CTDDH] [CTDDH]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 30250000
                and mc.rowguid = [DatHang].[rowguid]
                and mpcpm.publication_number = 1
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 30250000
                and mc.rowguid = mpcpm.rowguid
                and ([CTDDH].[MasoDDH] = [DatHang].[MasoDDH])                
            end  
    end
GO
/****** Object:  StoredProcedure [dbo].[MSmerge_expand_sp_FA5532B4337244C8886DA7FF8C81A049]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MSmerge_expand_sp_FA5532B4337244C8886DA7FF8C81A049] (@marker uniqueidentifier, @inherit_pastchanges_generation bigint, @parent_being_updated bit = 0, @trigger_type int = 1) as  
    declare @child_marker uniqueidentifier
    declare @child_rowcount int, @child_newgen bigint, @child_oldmaxversion int, @child_metadatarows_updated int, @cv varbinary(1), @replnick binary(6)
    declare @lineage varbinary(311)    
    declare @retcode int
    declare @dt datetime
    declare @nickbin varbinary(8)
    declare @reason bit

    
    select @replnick = 0x814c5474a3ca 

    select @nickbin = @replnick + 0xFF
    
    set @child_marker = newid()

    select @dt = getdate()
         
        select @child_rowcount = count(*) from [dbo].[CTPX] [CTPX]  with (rowlock)
        where [rowguid] in 
        (select [CTPX].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[PhieuXuat] [PhieuXuat] with (rowlock), [dbo].[CTPX] [CTPX] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 30250001 
        and dbo.MSmerge_contents.rowguid = [PhieuXuat].[rowguid] 
        and ([CTPX].[MAPX] = [PhieuXuat].[MAPX])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 50250001

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 50250001 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 50250001, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 50250001 
            and MSmerge_contents1.rowguid in 
                (select [CTPX].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[PhieuXuat] [PhieuXuat] with (rowlock), [dbo].[CTPX] [CTPX] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 30250001 
                and MSmerge_contents2.rowguid = [PhieuXuat].[rowguid] 
                and ([CTPX].[MAPX] = [PhieuXuat].[MAPX]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 50250001, [CTPX].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[CTPX] [CTPX]  with (rowlock)
                where [rowguid] in 
                    (
                        select [CTPX].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[PhieuXuat] [PhieuXuat] with (rowlock), 
                        [dbo].[CTPX] [CTPX] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 30250001 
                        and MSmerge_contents2.rowguid = [PhieuXuat].[rowguid] 
                        and ([CTPX].[MAPX] = [PhieuXuat].[MAPX])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 50250001 
                        and rowguid = [CTPX].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 50250001
                and dbo.MSmerge_current_partition_mappings.tablenick = 50250001
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 3
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_CTPX_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 50250001
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_CTPX_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 50250001
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 3 and 
                    tablenick = 50250001 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 3, 50250001, [CTPX].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[PhieuXuat] [PhieuXuat] with (rowlock) , [dbo].[CTPX] [CTPX]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 30250001
                and mc.rowguid = [PhieuXuat].[rowguid]
                and mpcpm.publication_number = 3
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 30250001
                and mc.rowguid = mpcpm.rowguid
                and ([CTPX].[MAPX] = [PhieuXuat].[MAPX])                
            end  
    end     
        select @child_rowcount = count(*) from [dbo].[CTPX] [CTPX]  with (rowlock)
        where [rowguid] in 
        (select [CTPX].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[PhieuXuat] [PhieuXuat] with (rowlock), [dbo].[CTPX] [CTPX] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 30250001 
        and dbo.MSmerge_contents.rowguid = [PhieuXuat].[rowguid] 
        and ([CTPX].[MAPX] = [PhieuXuat].[MAPX])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 50250001

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 50250001 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 50250001, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 50250001 
            and MSmerge_contents1.rowguid in 
                (select [CTPX].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[PhieuXuat] [PhieuXuat] with (rowlock), [dbo].[CTPX] [CTPX] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 30250001 
                and MSmerge_contents2.rowguid = [PhieuXuat].[rowguid] 
                and ([CTPX].[MAPX] = [PhieuXuat].[MAPX]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 50250001, [CTPX].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[CTPX] [CTPX]  with (rowlock)
                where [rowguid] in 
                    (
                        select [CTPX].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[PhieuXuat] [PhieuXuat] with (rowlock), 
                        [dbo].[CTPX] [CTPX] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 30250001 
                        and MSmerge_contents2.rowguid = [PhieuXuat].[rowguid] 
                        and ([CTPX].[MAPX] = [PhieuXuat].[MAPX])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 50250001 
                        and rowguid = [CTPX].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 50250001
                and dbo.MSmerge_current_partition_mappings.tablenick = 50250001
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 1
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_CTPX_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 50250001
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_CTPX_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 50250001
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 1 and 
                    tablenick = 50250001 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 1, 50250001, [CTPX].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[PhieuXuat] [PhieuXuat] with (rowlock) , [dbo].[CTPX] [CTPX]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 30250001
                and mc.rowguid = [PhieuXuat].[rowguid]
                and mpcpm.publication_number = 1
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 30250001
                and mc.rowguid = mpcpm.rowguid
                and ([CTPX].[MAPX] = [PhieuXuat].[MAPX])                
            end  
    end
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_ChiNhanh_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_ChiNhanh_PARTITION_VIEW] as  select [ChiNhanh].[MACN], [ChiNhanh].[rowguid], partition_id = -1 from [dbo].[ChiNhanh] [ChiNhanh] where ( ([MACN] ='CN2') ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(2105058535) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_F142A52EB252457FA92F58095283EEBB]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_F142A52EB252457FA92F58095283EEBB] as select * from [dbo].[DatHang] where ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(133575514) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_F142A52EB252457FA92F58095283EEBB]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_F142A52EB252457FA92F58095283EEBB] as select * from [dbo].[DatHang] where ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(133575514) & 0x1b <> 0)
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MAKHO] [nchar](4) NOT NULL,
	[TENKHO] [nvarchar](30) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[MACN] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MAKHO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TENKHO] UNIQUE NONCLUSTERED 
(
	[TENKHO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_85575343] ON [dbo].[Kho] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_Kho_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_Kho_PARTITION_VIEW] as select [Kho].[MAKHO], [Kho].[MACN], [Kho].[rowguid], [ChiNhanh].partition_id from [dbo].[Kho] [Kho] , [dbo].[MSmerge_QLVT_DATHANG_CN2_ChiNhanh_PARTITION_VIEW] [ChiNhanh] where ( ( [Kho].[MACN] = [ChiNhanh].[MACN]) ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(85575343) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_DatHang_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_DatHang_PARTITION_VIEW] as select [DatHang].[MasoDDH], [DatHang].[MAKHO], [DatHang].[rowguid], [Kho].partition_id from [dbo].[DatHang] [DatHang] , [dbo].[MSmerge_QLVT_DATHANG_CN2_Kho_PARTITION_VIEW] [Kho] where ( ( [DatHang].[MAKHO] = [Kho].[MAKHO]) ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(133575514) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_CTDDH_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_CTDDH_PARTITION_VIEW] as select [CTDDH].[MasoDDH], [CTDDH].[rowguid], [DatHang].partition_id from [dbo].[CTDDH] [CTDDH] , [dbo].[MSmerge_QLVT_DATHANG_CN2_DatHang_PARTITION_VIEW] [DatHang] where ( ( [CTDDH].[MasoDDH] = [DatHang].[MasoDDH]) ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(197575742) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_tsvw_DEA02C1A8D7A4D6884B77EA9080CF5A8]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_DEA02C1A8D7A4D6884B77EA9080CF5A8] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(877962204) > 0 or
                trigger_nestlevel(893962261) > 0 or
                trigger_nestlevel(909962318) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_DEA02C1A8D7A4D6884B77EA9080CF5A8]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_DEA02C1A8D7A4D6884B77EA9080CF5A8] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(877962204) > 0 or
                trigger_nestlevel(893962261) > 0 or
                trigger_nestlevel(909962318) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_DEA02C1A8D7A4D6884B77EA9080CF5A8]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_DEA02C1A8D7A4D6884B77EA9080CF5A8] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(877962204) > 0 or
                    trigger_nestlevel(893962261) > 0 or
                    trigger_nestlevel(909962318) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_DEA02C1A8D7A4D6884B77EA9080CF5A8]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_DEA02C1A8D7A4D6884B77EA9080CF5A8] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(877962204) > 0 or
                trigger_nestlevel(893962261) > 0 or
                trigger_nestlevel(909962318) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_ppmv_DEA02C1A8D7A4D6884B77EA9080CF5A8]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_DEA02C1A8D7A4D6884B77EA9080CF5A8] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(877962204) > 0 or
                    trigger_nestlevel(893962261) > 0 or
                    trigger_nestlevel(909962318) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_tsvw_27F1AFCDA1B3499699D924E5E583BA19]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_27F1AFCDA1B3499699D924E5E583BA19] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(493960836) > 0 or
                trigger_nestlevel(509960893) > 0 or
                trigger_nestlevel(525960950) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_27F1AFCDA1B3499699D924E5E583BA19]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_27F1AFCDA1B3499699D924E5E583BA19] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(493960836) > 0 or
                trigger_nestlevel(509960893) > 0 or
                trigger_nestlevel(525960950) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_27F1AFCDA1B3499699D924E5E583BA19]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_27F1AFCDA1B3499699D924E5E583BA19] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(493960836) > 0 or
                    trigger_nestlevel(509960893) > 0 or
                    trigger_nestlevel(525960950) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_27F1AFCDA1B3499699D924E5E583BA19]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_27F1AFCDA1B3499699D924E5E583BA19] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(493960836) > 0 or
                trigger_nestlevel(509960893) > 0 or
                trigger_nestlevel(525960950) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_ppmv_27F1AFCDA1B3499699D924E5E583BA19]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_27F1AFCDA1B3499699D924E5E583BA19] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(493960836) > 0 or
                    trigger_nestlevel(509960893) > 0 or
                    trigger_nestlevel(525960950) > 0
                    with check option
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MAPN] [nchar](8) NOT NULL,
	[NGAY] [date] NOT NULL,
	[MasoDDH] [nchar](8) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_MaSoDDH] UNIQUE NONCLUSTERED 
(
	[MasoDDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_229575856] ON [dbo].[PhieuNhap] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_PhieuNhap_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_PhieuNhap_PARTITION_VIEW] as select [PhieuNhap].[MAPN], [PhieuNhap].[MAKHO], [PhieuNhap].[rowguid], [Kho].partition_id from [dbo].[PhieuNhap] [PhieuNhap] , [dbo].[MSmerge_QLVT_DATHANG_CN1_Kho_PARTITION_VIEW] [Kho] where ( ( [PhieuNhap].[MAKHO] = [Kho].[MAKHO]) ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(229575856) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_PhieuNhap_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_PhieuNhap_PARTITION_VIEW] as select [PhieuNhap].[MAPN], [PhieuNhap].[MAKHO], [PhieuNhap].[rowguid], [Kho].partition_id from [dbo].[PhieuNhap] [PhieuNhap] , [dbo].[MSmerge_QLVT_DATHANG_CN2_Kho_PARTITION_VIEW] [Kho] where ( ( [PhieuNhap].[MAKHO] = [Kho].[MAKHO]) ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(229575856) & 0x1b <> 0)
GO
/****** Object:  Table [dbo].[CTPN]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPN](
	[MAPN] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CTPN] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_309576141] ON [dbo].[CTPN] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_DEA02C1A8D7A4D6884B77EA9080CF5A8]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_DEA02C1A8D7A4D6884B77EA9080CF5A8] as select * from [dbo].[CTPN] where ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(309576141) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_DEA02C1A8D7A4D6884B77EA9080CF5A8]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_DEA02C1A8D7A4D6884B77EA9080CF5A8] as select * from [dbo].[CTPN] where ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(309576141) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_CTPN_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_CTPN_PARTITION_VIEW] as select [CTPN].[MAPN], [CTPN].[rowguid], [PhieuNhap].partition_id from [dbo].[CTPN] [CTPN] , [dbo].[MSmerge_QLVT_DATHANG_CN2_PhieuNhap_PARTITION_VIEW] [PhieuNhap] where ( ( [CTPN].[MAPN] = [PhieuNhap].[MAPN]) ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(309576141) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_CTPN_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_CTPN_PARTITION_VIEW] as select [CTPN].[MAPN], [CTPN].[rowguid], [PhieuNhap].partition_id from [dbo].[CTPN] [CTPN] , [dbo].[MSmerge_QLVT_DATHANG_CN1_PhieuNhap_PARTITION_VIEW] [PhieuNhap] where ( ( [CTPN].[MAPN] = [PhieuNhap].[MAPN]) ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(309576141) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_tsvw_09B3D28B1C6148F5AA7345A01F3EBF1C]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_09B3D28B1C6148F5AA7345A01F3EBF1C] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(1873441748) > 0 or
                trigger_nestlevel(1889441805) > 0 or
                trigger_nestlevel(1905441862) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_09B3D28B1C6148F5AA7345A01F3EBF1C]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_09B3D28B1C6148F5AA7345A01F3EBF1C] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(1873441748) > 0 or
                trigger_nestlevel(1889441805) > 0 or
                trigger_nestlevel(1905441862) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_09B3D28B1C6148F5AA7345A01F3EBF1C]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_09B3D28B1C6148F5AA7345A01F3EBF1C] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(1873441748) > 0 or
                    trigger_nestlevel(1889441805) > 0 or
                    trigger_nestlevel(1905441862) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_09B3D28B1C6148F5AA7345A01F3EBF1C]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_09B3D28B1C6148F5AA7345A01F3EBF1C] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(1873441748) > 0 or
                trigger_nestlevel(1889441805) > 0 or
                trigger_nestlevel(1905441862) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_ppmv_09B3D28B1C6148F5AA7345A01F3EBF1C]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_09B3D28B1C6148F5AA7345A01F3EBF1C] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(1873441748) > 0 or
                    trigger_nestlevel(1889441805) > 0 or
                    trigger_nestlevel(1905441862) > 0
                    with check option
GO
/****** Object:  StoredProcedure [dbo].[MSmerge_expand_sp_EE9FA3BB38E2453B91522DBE3E412EA0]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MSmerge_expand_sp_EE9FA3BB38E2453B91522DBE3E412EA0] (@marker uniqueidentifier, @inherit_pastchanges_generation bigint, @parent_being_updated bit = 0, @trigger_type int = 1) as  
    declare @child_marker uniqueidentifier
    declare @child_rowcount int, @child_newgen bigint, @child_oldmaxversion int, @child_metadatarows_updated int, @cv varbinary(1), @replnick binary(6)
    declare @lineage varbinary(311)    
    declare @retcode int
    declare @dt datetime
    declare @nickbin varbinary(8)
    declare @reason bit

    
    select @replnick = 0x814c5474a3ca 

    select @nickbin = @replnick + 0xFF
    
    set @child_marker = newid()

    select @dt = getdate()
         
        select @child_rowcount = count(*) from [dbo].[PhieuNhap] [PhieuNhap]  with (rowlock)
        where [rowguid] in 
        (select [PhieuNhap].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[PhieuNhap] [PhieuNhap] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 10250000 
        and dbo.MSmerge_contents.rowguid = [Kho].[rowguid] 
        and ([PhieuNhap].[MAKHO] = [Kho].[MAKHO])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 40250000

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 40250000 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 40250000, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 40250000 
            and MSmerge_contents1.rowguid in 
                (select [PhieuNhap].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[PhieuNhap] [PhieuNhap] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 10250000 
                and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                and ([PhieuNhap].[MAKHO] = [Kho].[MAKHO]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 40250000, [PhieuNhap].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[PhieuNhap] [PhieuNhap]  with (rowlock)
                where [rowguid] in 
                    (
                        select [PhieuNhap].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[Kho] [Kho] with (rowlock), 
                        [dbo].[PhieuNhap] [PhieuNhap] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 10250000 
                        and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                        and ([PhieuNhap].[MAKHO] = [Kho].[MAKHO])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 40250000 
                        and rowguid = [PhieuNhap].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 40250000
                and dbo.MSmerge_current_partition_mappings.tablenick = 40250000
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 3
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_PhieuNhap_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 40250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_PhieuNhap_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 40250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 3 and 
                    tablenick = 40250000 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 3, 40250000, [PhieuNhap].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[Kho] [Kho] with (rowlock) , [dbo].[PhieuNhap] [PhieuNhap]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 10250000
                and mc.rowguid = [Kho].[rowguid]
                and mpcpm.publication_number = 3
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 10250000
                and mc.rowguid = mpcpm.rowguid
                and ([PhieuNhap].[MAKHO] = [Kho].[MAKHO])                
            end  
        exec dbo.[MSmerge_expand_sp_27F1AFCDA1B3499699D924E5E583BA19] @marker = @child_marker, @inherit_pastchanges_generation = @child_newgen, @parent_being_updated = 1, @trigger_type = @trigger_type  
    end     
        select @child_rowcount = count(*) from [dbo].[PhieuNhap] [PhieuNhap]  with (rowlock)
        where [rowguid] in 
        (select [PhieuNhap].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[PhieuNhap] [PhieuNhap] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 10250000 
        and dbo.MSmerge_contents.rowguid = [Kho].[rowguid] 
        and ([PhieuNhap].[MAKHO] = [Kho].[MAKHO])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 40250000

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 40250000 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 40250000, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 40250000 
            and MSmerge_contents1.rowguid in 
                (select [PhieuNhap].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[PhieuNhap] [PhieuNhap] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 10250000 
                and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                and ([PhieuNhap].[MAKHO] = [Kho].[MAKHO]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 40250000, [PhieuNhap].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[PhieuNhap] [PhieuNhap]  with (rowlock)
                where [rowguid] in 
                    (
                        select [PhieuNhap].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[Kho] [Kho] with (rowlock), 
                        [dbo].[PhieuNhap] [PhieuNhap] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 10250000 
                        and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                        and ([PhieuNhap].[MAKHO] = [Kho].[MAKHO])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 40250000 
                        and rowguid = [PhieuNhap].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 40250000
                and dbo.MSmerge_current_partition_mappings.tablenick = 40250000
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 1
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_PhieuNhap_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 40250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_PhieuNhap_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 40250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 1 and 
                    tablenick = 40250000 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 1, 40250000, [PhieuNhap].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[Kho] [Kho] with (rowlock) , [dbo].[PhieuNhap] [PhieuNhap]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 10250000
                and mc.rowguid = [Kho].[rowguid]
                and mpcpm.publication_number = 1
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 10250000
                and mc.rowguid = mpcpm.rowguid
                and ([PhieuNhap].[MAKHO] = [Kho].[MAKHO])                
            end  
        exec dbo.[MSmerge_expand_sp_27F1AFCDA1B3499699D924E5E583BA19] @marker = @child_marker, @inherit_pastchanges_generation = @child_newgen, @parent_being_updated = 1, @trigger_type = @trigger_type  
    end     
        select @child_rowcount = count(*) from [dbo].[DatHang] [DatHang]  with (rowlock)
        where [rowguid] in 
        (select [DatHang].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[DatHang] [DatHang] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 10250000 
        and dbo.MSmerge_contents.rowguid = [Kho].[rowguid] 
        and ([DatHang].[MAKHO] = [Kho].[MAKHO])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 30250000

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 30250000 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 30250000, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 30250000 
            and MSmerge_contents1.rowguid in 
                (select [DatHang].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[DatHang] [DatHang] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 10250000 
                and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                and ([DatHang].[MAKHO] = [Kho].[MAKHO]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 30250000, [DatHang].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[DatHang] [DatHang]  with (rowlock)
                where [rowguid] in 
                    (
                        select [DatHang].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[Kho] [Kho] with (rowlock), 
                        [dbo].[DatHang] [DatHang] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 10250000 
                        and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                        and ([DatHang].[MAKHO] = [Kho].[MAKHO])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 30250000 
                        and rowguid = [DatHang].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 30250000
                and dbo.MSmerge_current_partition_mappings.tablenick = 30250000
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 3
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_DatHang_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 30250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_DatHang_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 30250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 3 and 
                    tablenick = 30250000 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 3, 30250000, [DatHang].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[Kho] [Kho] with (rowlock) , [dbo].[DatHang] [DatHang]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 10250000
                and mc.rowguid = [Kho].[rowguid]
                and mpcpm.publication_number = 3
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 10250000
                and mc.rowguid = mpcpm.rowguid
                and ([DatHang].[MAKHO] = [Kho].[MAKHO])                
            end  
        exec dbo.[MSmerge_expand_sp_F142A52EB252457FA92F58095283EEBB] @marker = @child_marker, @inherit_pastchanges_generation = @child_newgen, @parent_being_updated = 1, @trigger_type = @trigger_type  
    end     
        select @child_rowcount = count(*) from [dbo].[DatHang] [DatHang]  with (rowlock)
        where [rowguid] in 
        (select [DatHang].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[DatHang] [DatHang] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 10250000 
        and dbo.MSmerge_contents.rowguid = [Kho].[rowguid] 
        and ([DatHang].[MAKHO] = [Kho].[MAKHO])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 30250000

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 30250000 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 30250000, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 30250000 
            and MSmerge_contents1.rowguid in 
                (select [DatHang].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[DatHang] [DatHang] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 10250000 
                and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                and ([DatHang].[MAKHO] = [Kho].[MAKHO]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 30250000, [DatHang].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[DatHang] [DatHang]  with (rowlock)
                where [rowguid] in 
                    (
                        select [DatHang].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[Kho] [Kho] with (rowlock), 
                        [dbo].[DatHang] [DatHang] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 10250000 
                        and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                        and ([DatHang].[MAKHO] = [Kho].[MAKHO])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 30250000 
                        and rowguid = [DatHang].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 30250000
                and dbo.MSmerge_current_partition_mappings.tablenick = 30250000
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 1
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_DatHang_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 30250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_DatHang_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 30250000
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 1 and 
                    tablenick = 30250000 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 1, 30250000, [DatHang].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[Kho] [Kho] with (rowlock) , [dbo].[DatHang] [DatHang]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 10250000
                and mc.rowguid = [Kho].[rowguid]
                and mpcpm.publication_number = 1
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 10250000
                and mc.rowguid = mpcpm.rowguid
                and ([DatHang].[MAKHO] = [Kho].[MAKHO])                
            end  
        exec dbo.[MSmerge_expand_sp_F142A52EB252457FA92F58095283EEBB] @marker = @child_marker, @inherit_pastchanges_generation = @child_newgen, @parent_being_updated = 1, @trigger_type = @trigger_type  
    end     
        select @child_rowcount = count(*) from [dbo].[PhieuXuat] [PhieuXuat]  with (rowlock)
        where [rowguid] in 
        (select [PhieuXuat].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[PhieuXuat] [PhieuXuat] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 10250000 
        and dbo.MSmerge_contents.rowguid = [Kho].[rowguid] 
        and ([PhieuXuat].[MAKHO] = [Kho].[MAKHO])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 30250001

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 30250001 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 30250001, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 30250001 
            and MSmerge_contents1.rowguid in 
                (select [PhieuXuat].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[PhieuXuat] [PhieuXuat] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 10250000 
                and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                and ([PhieuXuat].[MAKHO] = [Kho].[MAKHO]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 30250001, [PhieuXuat].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[PhieuXuat] [PhieuXuat]  with (rowlock)
                where [rowguid] in 
                    (
                        select [PhieuXuat].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[Kho] [Kho] with (rowlock), 
                        [dbo].[PhieuXuat] [PhieuXuat] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 10250000 
                        and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                        and ([PhieuXuat].[MAKHO] = [Kho].[MAKHO])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 30250001 
                        and rowguid = [PhieuXuat].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 30250001
                and dbo.MSmerge_current_partition_mappings.tablenick = 30250001
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 3
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_PhieuXuat_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 30250001
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 3, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN2_PhieuXuat_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 30250001
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 3 and 
                    tablenick = 30250001 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 3, 30250001, [PhieuXuat].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[Kho] [Kho] with (rowlock) , [dbo].[PhieuXuat] [PhieuXuat]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 10250000
                and mc.rowguid = [Kho].[rowguid]
                and mpcpm.publication_number = 3
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 10250000
                and mc.rowguid = mpcpm.rowguid
                and ([PhieuXuat].[MAKHO] = [Kho].[MAKHO])                
            end  
        exec dbo.[MSmerge_expand_sp_FA5532B4337244C8886DA7FF8C81A049] @marker = @child_marker, @inherit_pastchanges_generation = @child_newgen, @parent_being_updated = 1, @trigger_type = @trigger_type  
    end     
        select @child_rowcount = count(*) from [dbo].[PhieuXuat] [PhieuXuat]  with (rowlock)
        where [rowguid] in 
        (select [PhieuXuat].[rowguid] 
        from
        dbo.MSmerge_contents with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[PhieuXuat] [PhieuXuat] with (rowlock) 
        where dbo.MSmerge_contents.marker = @marker
        and dbo.MSmerge_contents.tablenick = 10250000 
        and dbo.MSmerge_contents.rowguid = [Kho].[rowguid] 
        and ([PhieuXuat].[MAKHO] = [Kho].[MAKHO])) 
        if @child_rowcount > 0
        begin
            select @child_oldmaxversion= maxversion_at_cleanup from dbo.sysmergearticles
            where nickname = 30250001

            -- the code below will get an open generation for the child article
            select @child_newgen = NULL
            select top 1 @child_newgen = generation from dbo.MSmerge_genhistory with (rowlock, updlock, readpast) 
                where art_nick = 30250001 
                    and genstatus = 0
                    and changecount <= (1000- isnull(@child_rowcount,0))                    
            if @child_newgen is NULL
            begin
                insert into dbo.MSmerge_genhistory with (rowlock)
                    (guidsrc, genstatus, art_nick, nicknames, coldate, changecount)
                       values (newid(), 0, 30250001, @nickbin, @dt, @child_rowcount)
                select @child_newgen = @@identity    
            end                    
            else
            begin
                -- do the update right away to change the changecount to include the rows that we just put in the generation
                update dbo.MSmerge_genhistory with (rowlock)
                    set changecount = changecount + @child_rowcount
                    where generation = @child_newgen 
            end
 
        if @retcode <> 0
            return @retcode              
            update MSmerge_contents1 with (rowlock) set generation = @child_newgen, partchangegen = @child_newgen, marker = @child_marker,
            lineage = case when @trigger_type = 0 then lineage else { fn UPDATELINEAGE(MSmerge_contents1.lineage, @replnick, @child_oldmaxversion+1) } end
            from dbo.MSmerge_contents MSmerge_contents1  with (rowlock)
            where MSmerge_contents1.tablenick = 30250001 
            and MSmerge_contents1.rowguid in 
                (select [PhieuXuat].[rowguid] 
                from
                dbo.MSmerge_contents MSmerge_contents2 with (rowlock), [dbo].[Kho] [Kho] with (rowlock), [dbo].[PhieuXuat] [PhieuXuat] with (rowlock) 
                where MSmerge_contents2.marker = @marker
                and MSmerge_contents2.tablenick = 10250000 
                and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                and ([PhieuXuat].[MAKHO] = [Kho].[MAKHO]))
                
                select @child_metadatarows_updated = @@rowcount 
            if @child_metadatarows_updated < @child_rowcount  
            begin
                set @lineage = case when @trigger_type = 0 then 0x0 else { fn UPDATELINEAGE(0x0, @replnick, @child_oldmaxversion+1) } end   
                set @cv = NULL 
                insert into dbo.MSmerge_contents  with (rowlock) 
                    (tablenick, rowguid, generation, partchangegen, lineage, colv1, marker) 
             
                select 30250001, [PhieuXuat].[rowguid], @child_newgen, @child_newgen, @lineage, @cv, @child_marker
                from [dbo].[PhieuXuat] [PhieuXuat]  with (rowlock)
                where [rowguid] in 
                    (
                        select [PhieuXuat].[rowguid]
                        from dbo.MSmerge_contents MSmerge_contents2 with (rowlock), 
                        [dbo].[Kho] [Kho] with (rowlock), 
                        [dbo].[PhieuXuat] [PhieuXuat] with (rowlock)
                        where MSmerge_contents2.marker = @marker
                        and MSmerge_contents2.tablenick = 10250000 
                        and MSmerge_contents2.rowguid = [Kho].[rowguid] 
                        and ([PhieuXuat].[MAKHO] = [Kho].[MAKHO])
                    )
                and not exists 
                    (select * from dbo.MSmerge_contents with (rowlock)
                        where tablenick = 30250001 
                        and rowguid = [PhieuXuat].[rowguid]
                    )  
            end     
            if @trigger_type <> 0
            begin
                delete dbo.MSmerge_current_partition_mappings with (rowlock) from 
                dbo.MSmerge_contents mc with (rowlock)
                join dbo.MSmerge_current_partition_mappings with (rowlock)
                on dbo.MSmerge_current_partition_mappings.tablenick = mc.tablenick
                and mc.tablenick = 30250001
                and dbo.MSmerge_current_partition_mappings.tablenick = 30250001
                and dbo.MSmerge_current_partition_mappings.rowguid = mc.rowguid
                and dbo.MSmerge_current_partition_mappings.publication_number = 1
                and mc.marker = @child_marker 
            end  
            if @trigger_type <> 0
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_PhieuXuat_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 30250001
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
            end 
            else
            begin
                insert into dbo.MSmerge_current_partition_mappings with (rowlock) (publication_number, tablenick, rowguid, partition_id)
                select distinct 1, mc.tablenick, mc.rowguid, v.partition_id
                from dbo.MSmerge_contents mc with (rowlock) 
                JOIN dbo.[MSmerge_QLVT_DATHANG_CN1_PhieuXuat_PARTITION_VIEW] v with (rowlock) 
                ON mc.tablenick = 30250001
                and mc.rowguid = v.[rowguid]
                and mc.marker = @child_marker 
                and v.partition_id in (select partition_id from dbo.MSmerge_current_partition_mappings cpm with (rowlock) JOIN
                	dbo.MSmerge_contents mc2 with (rowlock)
                    ON cpm.rowguid = mc2.rowguid
                    and mc2.marker = @marker)
                where not exists (select * from MSmerge_current_partition_mappings with (readcommitted, rowlock, readpast) where 
                    publication_number = 1 and 
                    tablenick = 30250001 and
                    rowguid = v.[rowguid] and
                    partition_id = v.partition_id)
            end  
            if @inherit_pastchanges_generation <> -1
            begin
            	if @parent_being_updated = 1
            		set @reason = 0
            	else
            		set @reason = 1 /* expanding for delete. */
            		
                insert into dbo.MSmerge_past_partition_mappings  with (rowlock) (publication_number, tablenick, rowguid, partition_id, generation,reason)
                select distinct 1, 30250001, [PhieuXuat].[rowguid],  
                        mpcpm.partition_id, @child_newgen, @reason 
                from 
                dbo.MSmerge_contents mc with (rowlock) , 
                dbo.MSmerge_past_partition_mappings mpcpm with (rowlock) , [dbo].[Kho] [Kho] with (rowlock) , [dbo].[PhieuXuat] [PhieuXuat]  with (rowlock) 
                where mc.marker = @marker
                and mc.tablenick = 10250000
                and mc.rowguid = [Kho].[rowguid]
                and mpcpm.publication_number = 1
                and mpcpm.generation = @inherit_pastchanges_generation
                and mc.tablenick = mpcpm.tablenick
                and mpcpm.tablenick = 10250000
                and mc.rowguid = mpcpm.rowguid
                and ([PhieuXuat].[MAKHO] = [Kho].[MAKHO])                
            end  
        exec dbo.[MSmerge_expand_sp_FA5532B4337244C8886DA7FF8C81A049] @marker = @child_marker, @inherit_pastchanges_generation = @child_newgen, @parent_being_updated = 1, @trigger_type = @trigger_type  
    end
GO
/****** Object:  View [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_EE9FA3BB38E2453B91522DBE3E412EA0]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_EE9FA3BB38E2453B91522DBE3E412EA0] as select * from [dbo].[Kho] where ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(85575343) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_EE9FA3BB38E2453B91522DBE3E412EA0]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_EE9FA3BB38E2453B91522DBE3E412EA0] as select * from [dbo].[Kho] where ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(85575343) & 0x1b <> 0)
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MACN] [nchar](10) NOT NULL,
	[ChiNhanh] [nvarchar](100) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[MACN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_ChiNhanh] UNIQUE NONCLUSTERED 
(
	[ChiNhanh] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_2105058535] ON [dbo].[ChiNhanh] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_ChiNhanh_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_ChiNhanh_PARTITION_VIEW] as  select [ChiNhanh].[MACN], [ChiNhanh].[rowguid], partition_id = -1 from [dbo].[ChiNhanh] [ChiNhanh] where ( ([MACN] ='CN1') ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(2105058535) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_tsvw_C1B1645DE1CF477CB115938AF6902C7B]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_C1B1645DE1CF477CB115938AF6902C7B] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(749961748) > 0 or
                trigger_nestlevel(765961805) > 0 or
                trigger_nestlevel(781961862) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_C1B1645DE1CF477CB115938AF6902C7B]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_C1B1645DE1CF477CB115938AF6902C7B] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(749961748) > 0 or
                trigger_nestlevel(765961805) > 0 or
                trigger_nestlevel(781961862) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_C1B1645DE1CF477CB115938AF6902C7B]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_C1B1645DE1CF477CB115938AF6902C7B] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(749961748) > 0 or
                    trigger_nestlevel(765961805) > 0 or
                    trigger_nestlevel(781961862) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_C1B1645DE1CF477CB115938AF6902C7B]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_C1B1645DE1CF477CB115938AF6902C7B] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(749961748) > 0 or
                trigger_nestlevel(765961805) > 0 or
                trigger_nestlevel(781961862) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_ppmv_C1B1645DE1CF477CB115938AF6902C7B]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_C1B1645DE1CF477CB115938AF6902C7B] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(749961748) > 0 or
                    trigger_nestlevel(765961805) > 0 or
                    trigger_nestlevel(781961862) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_tsvw_FA5532B4337244C8886DA7FF8C81A049]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_FA5532B4337244C8886DA7FF8C81A049] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(365960380) > 0 or
                trigger_nestlevel(381960437) > 0 or
                trigger_nestlevel(397960494) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_FA5532B4337244C8886DA7FF8C81A049]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_FA5532B4337244C8886DA7FF8C81A049] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(365960380) > 0 or
                trigger_nestlevel(381960437) > 0 or
                trigger_nestlevel(397960494) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_FA5532B4337244C8886DA7FF8C81A049]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_FA5532B4337244C8886DA7FF8C81A049] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(365960380) > 0 or
                    trigger_nestlevel(381960437) > 0 or
                    trigger_nestlevel(397960494) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_FA5532B4337244C8886DA7FF8C81A049]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_FA5532B4337244C8886DA7FF8C81A049] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(365960380) > 0 or
                trigger_nestlevel(381960437) > 0 or
                trigger_nestlevel(397960494) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_ppmv_FA5532B4337244C8886DA7FF8C81A049]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_FA5532B4337244C8886DA7FF8C81A049] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(365960380) > 0 or
                    trigger_nestlevel(381960437) > 0 or
                    trigger_nestlevel(397960494) > 0
                    with check option
GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MAPX] [nchar](8) NOT NULL,
	[NGAY] [date] NOT NULL,
	[HOTENKH] [nvarchar](100) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_PX] PRIMARY KEY CLUSTERED 
(
	[MAPX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_165575628] ON [dbo].[PhieuXuat] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_PhieuXuat_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_PhieuXuat_PARTITION_VIEW] as select [PhieuXuat].[MAPX], [PhieuXuat].[MAKHO], [PhieuXuat].[rowguid], [Kho].partition_id from [dbo].[PhieuXuat] [PhieuXuat] , [dbo].[MSmerge_QLVT_DATHANG_CN1_Kho_PARTITION_VIEW] [Kho] where ( ( [PhieuXuat].[MAKHO] = [Kho].[MAKHO]) ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(165575628) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_PhieuXuat_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_PhieuXuat_PARTITION_VIEW] as select [PhieuXuat].[MAPX], [PhieuXuat].[MAKHO], [PhieuXuat].[rowguid], [Kho].partition_id from [dbo].[PhieuXuat] [PhieuXuat] , [dbo].[MSmerge_QLVT_DATHANG_CN2_Kho_PARTITION_VIEW] [Kho] where ( ( [PhieuXuat].[MAKHO] = [Kho].[MAKHO]) ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(165575628) & 0x1b <> 0)
GO
/****** Object:  Table [dbo].[CTPX]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPX](
	[MAPX] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CTPX] PRIMARY KEY CLUSTERED 
(
	[MAPX] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_277576027] ON [dbo].[CTPX] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_C1B1645DE1CF477CB115938AF6902C7B]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_C1B1645DE1CF477CB115938AF6902C7B] as select * from [dbo].[CTPX] where ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(277576027) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_C1B1645DE1CF477CB115938AF6902C7B]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_C1B1645DE1CF477CB115938AF6902C7B] as select * from [dbo].[CTPX] where ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(277576027) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_CTPX_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_CTPX_PARTITION_VIEW] as select [CTPX].[MAPX], [CTPX].[rowguid], [PhieuXuat].partition_id from [dbo].[CTPX] [CTPX] , [dbo].[MSmerge_QLVT_DATHANG_CN2_PhieuXuat_PARTITION_VIEW] [PhieuXuat] where ( ( [CTPX].[MAPX] = [PhieuXuat].[MAPX]) ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(277576027) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_CTPX_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_CTPX_PARTITION_VIEW] as select [CTPX].[MAPX], [CTPX].[rowguid], [PhieuXuat].partition_id from [dbo].[CTPX] [CTPX] , [dbo].[MSmerge_QLVT_DATHANG_CN1_PhieuXuat_PARTITION_VIEW] [PhieuXuat] where ( ( [CTPX].[MAPX] = [PhieuXuat].[MAPX]) ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(277576027) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_tsvw_C26B30EE9F534C5BB50714AAF70C3007]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_C26B30EE9F534C5BB50714AAF70C3007] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(787533889) > 0 or
                trigger_nestlevel(803533946) > 0 or
                trigger_nestlevel(819534003) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_C26B30EE9F534C5BB50714AAF70C3007]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_C26B30EE9F534C5BB50714AAF70C3007] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(787533889) > 0 or
                trigger_nestlevel(803533946) > 0 or
                trigger_nestlevel(819534003) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_C26B30EE9F534C5BB50714AAF70C3007]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_C26B30EE9F534C5BB50714AAF70C3007] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(787533889) > 0 or
                    trigger_nestlevel(803533946) > 0 or
                    trigger_nestlevel(819534003) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_C26B30EE9F534C5BB50714AAF70C3007]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_C26B30EE9F534C5BB50714AAF70C3007] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(787533889) > 0 or
                trigger_nestlevel(803533946) > 0 or
                trigger_nestlevel(819534003) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_ppmv_C26B30EE9F534C5BB50714AAF70C3007]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_C26B30EE9F534C5BB50714AAF70C3007] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(787533889) > 0 or
                    trigger_nestlevel(803533946) > 0 or
                    trigger_nestlevel(819534003) > 0
                    with check option
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MANV] [int] NOT NULL,
	[HO] [nvarchar](40) NULL,
	[TEN] [nvarchar](10) NULL,
	[DIACHI] [nvarchar](100) NULL,
	[NGAYSINH] [datetime] NULL,
	[LUONG] [float] NULL,
	[MACN] [nchar](10) NULL,
	[TrangThaiXoa] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_53575229] ON [dbo].[NhanVien] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Report_DSNV]    Script Date: 04/09/2023 14:38:38 ******/
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
/****** Object:  View [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_C26B30EE9F534C5BB50714AAF70C3007]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_C26B30EE9F534C5BB50714AAF70C3007] as select * from [dbo].[NhanVien] where ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(53575229) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_C26B30EE9F534C5BB50714AAF70C3007]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_C26B30EE9F534C5BB50714AAF70C3007] as select * from [dbo].[NhanVien] where ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(53575229) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN2_NhanVien_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN2_NhanVien_PARTITION_VIEW] as select [NhanVien].[MACN], [NhanVien].[rowguid], [ChiNhanh].partition_id from [dbo].[NhanVien] [NhanVien] , [dbo].[MSmerge_QLVT_DATHANG_CN2_ChiNhanh_PARTITION_VIEW] [ChiNhanh] where ( ( [NhanVien].[MACN] = [ChiNhanh].[MACN]) ) and ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(53575229) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_QLVT_DATHANG_CN1_NhanVien_PARTITION_VIEW]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_QLVT_DATHANG_CN1_NhanVien_PARTITION_VIEW] as select [NhanVien].[MACN], [NhanVien].[rowguid], [ChiNhanh].partition_id from [dbo].[NhanVien] [NhanVien] , [dbo].[MSmerge_QLVT_DATHANG_CN1_ChiNhanh_PARTITION_VIEW] [ChiNhanh] where ( ( [NhanVien].[MACN] = [ChiNhanh].[MACN]) ) and ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(53575229) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_FA5532B4337244C8886DA7FF8C81A049]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_FA5532B4337244C8886DA7FF8C81A049] as select * from [dbo].[PhieuXuat] where ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(165575628) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_FA5532B4337244C8886DA7FF8C81A049]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_FA5532B4337244C8886DA7FF8C81A049] as select * from [dbo].[PhieuXuat] where ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(165575628) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_27F1AFCDA1B3499699D924E5E583BA19]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_D9997E408E2E4E049A8D2A7EACE2A057_27F1AFCDA1B3499699D924E5E583BA19] as select * from [dbo].[PhieuNhap] where ({fn ISPALUSER('D9997E40-8E2E-4E04-9A8D-2A7EACE2A057')} = 1 or permissions(229575856) & 0x1b <> 0)
GO
/****** Object:  View [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_27F1AFCDA1B3499699D924E5E583BA19]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[MSmerge_repl_view_5474A3CA814C431E944B55021C1E2BE1_27F1AFCDA1B3499699D924E5E583BA19] as select * from [dbo].[PhieuNhap] where ({fn ISPALUSER('5474A3CA-814C-431E-944B-55021C1E2BE1')} = 1 or permissions(229575856) & 0x1b <> 0)
GO
/****** Object:  StoredProcedure [dbo].[SP_Lay_Thong_Tin_NV_Tu_Login]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Lay_Thong_Tin_NV_Tu_Login]
@TENLOGIN NVARCHAR( 100)
AS
DECLARE @UID INT
DECLARE @MANV NVARCHAR(100)
SELECT @UID= uid , @MANV= NAME FROM sys.sysusers 
  WHERE sid = SUSER_SID(@TENLOGIN)

SELECT MANV= @MANV, 
       HOTEN = (SELECT HO+ ' '+TEN FROM dbo.NHANVIEN WHERE MANV=@MANV ), 
       TENNHOM=NAME
  FROM sys.sysusers
    WHERE UID = (SELECT groupuid FROM sys.sysmembers WHERE memberuid=@uid)
GO
/****** Object:  StoredProcedure [dbo].[sp_Kiem_Tra_CTPX]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Kiem_Tra_CTPX]
	@MasoPX nchar(8),
	@MAVT nchar(4)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM CTPX WHERE MAPX = @MasoPX AND MAVT = @MAVT)
		RETURN 1;
	ELSE
		RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kiem_Tra_CTDDH]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[sp_Kiem_Tra_CTDDH]
@MasoDDH nchar(8),
@MAVT nchar(4)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM CTDDH WHERE MasoDDH = @MasoDDH AND MAVT = @MAVT)
		RETURN 1;
	ELSE
		RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_check_PX]    Script Date: 04/09/2023 14:38:38 ******/
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
/****** Object:  Table [dbo].[sysmergesubscriptions]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[sysmergesubscriptions](
	[subscriber_server] [sysname] NULL,
	[db_name] [sysname] NOT NULL,
	[pubid] [uniqueidentifier] NULL,
	[datasource_type] [int] NOT NULL,
	[subid] [uniqueidentifier] NOT NULL,
	[replnickname] [binary](6) NOT NULL,
	[replicastate] [uniqueidentifier] NOT NULL,
	[status] [tinyint] NOT NULL,
	[subscriber_type] [int] NOT NULL,
	[subscription_type] [int] NOT NULL,
	[sync_type] [tinyint] NOT NULL,
	[description] [nvarchar](255) NULL,
	[priority] [real] NULL,
	[recgen] [bigint] NULL,
	[recguid] [uniqueidentifier] NULL,
	[sentgen] [bigint] NULL,
	[sentguid] [uniqueidentifier] NULL,
	[schemaversion] [int] NULL,
	[schemaguid] [uniqueidentifier] NULL,
	[last_validated] [datetime] NULL,
	[attempted_validate] [datetime] NULL,
	[last_sync_date] [datetime] NULL,
	[last_sync_status] [int] NULL,
	[last_sync_summary] [sysname] NULL,
	[metadatacleanuptime] [datetime] NOT NULL,
	[partition_id] [int] NULL,
	[cleanedup_unsent_changes] [bit] NOT NULL,
	[replica_version] [int] NOT NULL,
	[supportability_mode] [int] NOT NULL,
	[application_name] [sysname] NULL,
	[subscriber_number] [int] IDENTITY(1,1) NOT NULL,
	[last_makegeneration_datetime] [datetime] NULL,
 CONSTRAINT [unique_pubsrvdb] UNIQUE NONCLUSTERED 
(
	[pubid] ASC,
	[subscriber_server] ASC,
	[db_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE CLUSTERED INDEX [uc1sysmergesubscriptions] ON [dbo].[sysmergesubscriptions] 
(
	[subid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc2sysmergesubscriptions] ON [dbo].[sysmergesubscriptions] 
(
	[subscriber_server] ASC,
	[db_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc3sysmergesubscriptions] ON [dbo].[sysmergesubscriptions] 
(
	[replnickname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysmergepublications]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[sysmergepublications](
	[publisher] [sysname] NOT NULL,
	[publisher_db] [sysname] NOT NULL,
	[name] [sysname] NOT NULL,
	[description] [nvarchar](255) NULL,
	[retention] [int] NULL,
	[publication_type] [tinyint] NULL,
	[pubid] [uniqueidentifier] NOT NULL,
	[designmasterid] [uniqueidentifier] NULL,
	[parentid] [uniqueidentifier] NULL,
	[sync_mode] [tinyint] NULL,
	[allow_push] [int] NULL,
	[allow_pull] [int] NULL,
	[allow_anonymous] [int] NULL,
	[centralized_conflicts] [int] NULL,
	[status] [tinyint] NULL,
	[snapshot_ready] [tinyint] NULL,
	[enabled_for_internet] [bit] NOT NULL,
	[dynamic_filters] [bit] NOT NULL,
	[snapshot_in_defaultfolder] [bit] NOT NULL,
	[alt_snapshot_folder] [nvarchar](255) NULL,
	[pre_snapshot_script] [nvarchar](255) NULL,
	[post_snapshot_script] [nvarchar](255) NULL,
	[compress_snapshot] [bit] NOT NULL,
	[ftp_address] [sysname] NULL,
	[ftp_port] [int] NOT NULL,
	[ftp_subdirectory] [nvarchar](255) NULL,
	[ftp_login] [sysname] NULL,
	[ftp_password] [nvarchar](524) NULL,
	[conflict_retention] [int] NULL,
	[keep_before_values] [int] NULL,
	[allow_subscription_copy] [bit] NULL,
	[allow_synctoalternate] [bit] NULL,
	[validate_subscriber_info] [nvarchar](500) NULL,
	[ad_guidname] [sysname] NULL,
	[backward_comp_level] [int] NOT NULL,
	[max_concurrent_merge] [int] NOT NULL,
	[max_concurrent_dynamic_snapshots] [int] NOT NULL,
	[use_partition_groups] [smallint] NULL,
	[dynamic_filters_function_list] [nvarchar](500) NULL,
	[partition_id_eval_proc] [sysname] NULL,
	[publication_number] [smallint] IDENTITY(1,1) NOT NULL,
	[replicate_ddl] [int] NOT NULL,
	[allow_subscriber_initiated_snapshot] [bit] NOT NULL,
	[distributor] [sysname] NULL,
	[snapshot_jobid] [binary](16) NULL,
	[allow_web_synchronization] [bit] NULL,
	[web_synchronization_url] [nvarchar](500) NULL,
	[allow_partition_realignment] [bit] NULL,
	[retention_period_unit] [tinyint] NOT NULL,
	[decentralized_conflicts] [int] NULL,
	[generation_leveling_threshold] [int] NULL,
	[automatic_reinitialization_policy] [bit] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [nc1sysmergepublications] ON [dbo].[sysmergepublications] 
(
	[pubid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [nc2sysmergepublications] ON [dbo].[sysmergepublications] 
(
	[status] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoLogin]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[sp_TaoLogin]
    @LGNAME VARCHAR(50),  @PASS VARCHAR(50),
    @USERNAME VARCHAR(50),  @ROLE VARCHAR(50)     
AS
	DECLARE @RET INT
	EXEC @RET = SP_ADDLOGIN @LGNAME, @PASS, 'QLVT_DATHANG' -- Tạo login name
	IF (@RET = 1)  -- login name bị trùng
	BEGIN
		RAISERROR ('Login name bị trùng!', 16,1)
		RETURN
	END
	EXEC @RET= SP_GRANTDBACCESS @LGNAME, @USERNAME
	IF (@RET = 1)  -- username bị trùng
	BEGIN
		EXEC SP_DROPLOGIN @LGNAME -- Xóa login name vừa tạo ban nãy đi
		RAISERROR ('Nhân viên đã có login name!', 16,2)
		RETURN
	END
	EXEC sp_addrolemember @ROLE, @USERNAME -- gán người dùng với nhóm quyền
	IF @ROLE = 'CONGTY' OR @ROLE= 'CHINHANH'
		EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
GO
/****** Object:  StoredProcedure [dbo].[sp_Kiem_Tra_MAPX]    Script Date: 04/09/2023 14:38:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Xoa_Login]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[Xoa_Login]
@USRNAME VARCHAR(50)
AS
DECLARE @LGNAME VARCHAR(50)
IF EXISTS (SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@USRNAME AS NVARCHAR))
BEGIN
	SET @LGNAME = CAST((SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@USRNAME AS NVARCHAR)) AS VARCHAR(50))
	EXEC SP_DROPUSER @USRNAME
	EXEC SP_DROPLOGIN @LGNAME
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChuyenChiNhanh]    Script Date: 04/09/2023 14:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[sp_ChuyenChiNhanh]
	@MANV INT, 
	@MACN nchar(10)
AS
SET XACT_ABORT ON; -- ON: gặp lỗi thì dừng, OFF: bỏ qua lỗi chạy tiếp
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN
	BEGIN DISTRIBUTED TRAN
		DECLARE @HONV NVARCHAR(40)
		DECLARE @TENNV NVARCHAR(10)
		DECLARE @DIACHINV NVARCHAR(100)
		DECLARE @NGAYSINHNV DATETIME
		DECLARE @LUONGNV FLOAT						
		-- Lưu lại thông tin nhân viên cần chuyển chi nhánh để làm điều kiện kiểm tra
		SELECT @HONV = HO, @TENNV = TEN, @DIACHINV = DIACHI, @NGAYSINHNV = NGAYSINH, @LUONGNV = LUONG FROM NhanVien WHERE MANV = @MANV
		-- Kiểm tra xem bên Site chuyển tới đã có dữ liệu nhân viên đó chưa. Nếu có rồi thì đổi trạng thái, chưa thì thêm vào
		IF EXISTS(select MANV
				from LINK1.QLVT_DATHANG.dbo.NhanVien
				where HO = @HONV and TEN = @TENNV and DIACHI = @DIACHINV
				and NGAYSINH = @NGAYSINHNV and LUONG = @LUONGNV)
		BEGIN
				UPDATE LINK1.QLVT_DATHANG.dbo.NhanVien
				SET TrangThaiXoa = 0
				WHERE MANV = (	select MANV
								from LINK1.QLVT_DATHANG.dbo.NhanVien
								where HO = @HONV and TEN = @TENNV and DIACHI = @DIACHINV
										and NGAYSINH = @NGAYSINHNV and LUONG = @LUONGNV)
		END
		ELSE
		-- nếu chưa tồn tại thì thêm mới hoàn toàn vào chi nhánh mới với MANV sẽ là MANV lớn nhất hiện tại + 1
		BEGIN
			INSERT INTO LINK1.QLVT_DATHANG.dbo.NhanVien (MANV, HO, TEN, DIACHI, NGAYSINH, LUONG, MACN, TRANGTHAIXOA)
			VALUES ((SELECT MAX(MANV) FROM LINK0.QLVT_DATHANG.dbo.NhanVien) + 1, @HONV, @TENNV, @DIACHINV, @NGAYSINHNV, @LUONGNV, @MACN, 0)
		END
		-- Đổi trạng thái xóa đối với tài khoản cũ ở site hiện tại
		UPDATE dbo.NhanVien
		SET TrangThaiXoa = 1
		WHERE MANV = @MANV
	COMMIT TRAN;
		-- sp_droplogin và sp_dropuser không thể được thực thi trong một giao tác do người dùng định nghĩa
		-- Kiểm tra xem Nhân viên đã có login chưa. Có thì xóa
		IF EXISTS(SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@MANV AS NVARCHAR))
		BEGIN
			DECLARE @LGNAME VARCHAR(50)
			DECLARE @USERNAME VARCHAR(50)
			SET @LGNAME = CAST((SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@MANV AS NVARCHAR)) AS VARCHAR(50))
			SET @USERNAME = CAST(@MANV AS VARCHAR(50))
			EXEC SP_DROPUSER @USERNAME;
			EXEC SP_DROPLOGIN @LGNAME;
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECKID_TRACUU]    Script Date: 04/09/2023 14:38:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Kiem_Tra_MasoDDH]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Kiem_Tra_MasoDDH]
@MasoDDH nchar(8)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM DatHang DDH WHERE DDH.MasoDDH = @MasoDDH)
		RETURN 1;
	ELSE
	IF EXISTS(SELECT 1 FROM LINK0.QLVT_DATHANG.dbo.DatHang DDH WHERE DDH.MasoDDH = @MasoDDH)
		RETURN 1;
	RETURN 0;
END
GO
/****** Object:  View [dbo].[V_DSPM]    Script Date: 04/09/2023 14:38:39 ******/
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
/****** Object:  View [dbo].[V_DS_PHANMANH]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DS_PHANMANH] AS SELECT TENCN=PUB.description, TENSERVER= SUBS.subscriber_server FROM dbo.sysmergepublications PUB, dbo.sysmergesubscriptions SUBS WHERE PUB.pubid= SUBS.pubid AND SUBS.subscriber_server <> @@SERVERNAME AND SUBS.subscriber_server <> 'DESKTOP-421RCI7\SERVER3'
GO
/****** Object:  View [dbo].[MSmerge_ppmv_DEFA138063CA44FFB3E99725DB7E81D0]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ppmv_DEFA138063CA44FFB3E99725DB7E81D0] as
                    select * from dbo.MSmerge_past_partition_mappings where
                    trigger_nestlevel(2001442204) > 0 or
                    trigger_nestlevel(2017442261) > 0 or
                    trigger_nestlevel(2033442318) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_ctsv_DEFA138063CA44FFB3E99725DB7E81D0]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_ctsv_DEFA138063CA44FFB3E99725DB7E81D0] as
                select * from dbo.MSmerge_contents where
                trigger_nestlevel(2001442204) > 0 or
                trigger_nestlevel(2017442261) > 0 or
                trigger_nestlevel(2033442318) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_cpmv_DEFA138063CA44FFB3E99725DB7E81D0]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_cpmv_DEFA138063CA44FFB3E99725DB7E81D0] as
                    select * from dbo.MSmerge_current_partition_mappings where
                    trigger_nestlevel(2001442204) > 0 or
                    trigger_nestlevel(2017442261) > 0 or
                    trigger_nestlevel(2033442318) > 0
                    with check option
GO
/****** Object:  View [dbo].[MSmerge_genvw_DEFA138063CA44FFB3E99725DB7E81D0]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_genvw_DEFA138063CA44FFB3E99725DB7E81D0] as
                select * from dbo.MSmerge_genhistory where
                trigger_nestlevel(2001442204) > 0 or
                trigger_nestlevel(2017442261) > 0 or
                trigger_nestlevel(2033442318) > 0
                with check option
GO
/****** Object:  View [dbo].[MSmerge_tsvw_DEFA138063CA44FFB3E99725DB7E81D0]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MSmerge_tsvw_DEFA138063CA44FFB3E99725DB7E81D0] as
                select * from dbo.MSmerge_tombstone where
                trigger_nestlevel(2001442204) > 0 or
                trigger_nestlevel(2017442261) > 0 or
                trigger_nestlevel(2033442318) > 0
                with check option
GO
/****** Object:  Table [dbo].[Vattu]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vattu](
	[MAVT] [nchar](4) NOT NULL,
	[TENVT] [nvarchar](30) NOT NULL,
	[DVT] [nvarchar](15) NOT NULL,
	[SOLUONGTON] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_VatTu] PRIMARY KEY CLUSTERED 
(
	[MAVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TENVT] UNIQUE NONCLUSTERED 
(
	[TENVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_5575058] ON [dbo].[Vattu] 
(
	[rowguid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Report_DDH_Khong_PN]    Script Date: 04/09/2023 14:38:39 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_getCTDDH]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_getCTDDH]
@MADDH nchar(10)
AS
BEGIN
	SELECT ct.MasoDDH,
	ct.MAVT,
	(SELECT Vattu.TENVT from Vattu where Vattu.MAVT = ct.MAVT) as TENVT,
	ct.SOLUONG,
	ct.DONGIA
	FROM CTDDH ct
	WHERE ct.MAVT not in (select chitietPN.MAVT from (select MasoDDH,MAPN from PhieuNhap) PN,
							(select CTPN.MAPN,CTPN.MAVT from CTPN) chitietPN
							where PN.MasoDDH = @MADDH
							and PN.MAPN = chitietPN.MAPN)
	
	and ct.MasoDDH = @MADDH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECK_MAVT]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CHECK_MAVT]
@MAVT nchar(4)
AS
BEGIN
	 IF EXISTS(SELECT 1 
			  FROM (SELECT MAVT FROM Vattu) VT  
			  WHERE VT.MAVT = @MAVT  AND (EXISTS(SELECT 1 FROM CTPN WHERE CTPN.MAVT = VT.MAVT) OR EXISTS(SELECT 1 FROM CTPX WHERE CTPX.MAVT = VT.MAVT) 
					OR EXISTS(SELECT 1 FROM CTDDH WHERE CTDDH.MAVT = VT.MAVT)))
			RETURN 1; -- Mã Vattu đang dùng ở phân mảnh hiện tại
	ELSE IF EXISTS(SELECT 1
				   FROM (SELECT MAVT FROM Vattu) VT  
				   WHERE VT.MAVT = @MAVT AND (EXISTS(SELECT 1 FROM LINK1.QLVT_DATHANG.dbo.CTPN PN WHERE PN.MAVT = VT.MAVT) OR EXISTS(SELECT MAPX FROM LINK1.QLVT_DATHANG.dbo.CTPX PX WHERE PX.MAVT = VT.MAVT) 
						OR EXISTS(SELECT MasoDDH FROM LINK1.QLVT_DATHANG.dbo.CTDDH DH WHERE DH.MAVT = VT.MAVT)))
			RETURN 2; -- Mã Vattu đang dùng ở phân mảnh khác
	RETURN 0; -- Không dùng
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Report_DS_VatTu]    Script Date: 04/09/2023 14:38:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Giam_SL_VT]    Script Date: 04/09/2023 14:38:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Tang_SL_VT]    Script Date: 04/09/2023 14:38:39 ******/
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
/****** Object:  DdlTrigger [MSmerge_tr_alterschemaonly]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [MSmerge_tr_alterschemaonly] on database for ALTER_FUNCTION, ALTER_PROCEDURE as 

							set ANSI_NULLS ON
							set ANSI_PADDING ON
							set ANSI_WARNINGS ON
							set ARITHABORT ON
							set CONCAT_NULL_YIELDS_NULL ON
							set NUMERIC_ROUNDABORT OFF
							set QUOTED_IDENTIFIER ON

							declare @EventData xml
							set @EventData=EventData()    
							exec sys.sp_MSmerge_ddldispatcher @EventData, 3
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
DISABLE TRIGGER [MSmerge_tr_alterschemaonly] ON DATABASE
GO
/****** Object:  DdlTrigger [MSmerge_tr_altertable]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [MSmerge_tr_altertable] on database for ALTER_TABLE as 

							set ANSI_NULLS ON
							set ANSI_PADDING ON
							set ANSI_WARNINGS ON
							set ARITHABORT ON
							set CONCAT_NULL_YIELDS_NULL ON
							set NUMERIC_ROUNDABORT OFF
							set QUOTED_IDENTIFIER ON

							declare @EventData xml
							set @EventData=EventData()    
							exec sys.sp_MSmerge_ddldispatcher @EventData, 1
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
DISABLE TRIGGER [MSmerge_tr_altertable] ON DATABASE
GO
/****** Object:  DdlTrigger [MSmerge_tr_altertrigger]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [MSmerge_tr_altertrigger] on database for ALTER_TRIGGER as 

							set ANSI_NULLS ON
							set ANSI_PADDING ON
							set ANSI_WARNINGS ON
							set ARITHABORT ON
							set CONCAT_NULL_YIELDS_NULL ON
							set NUMERIC_ROUNDABORT OFF
							set QUOTED_IDENTIFIER ON

							declare @EventData xml
							set @EventData=EventData()    
							exec sys.sp_MSmerge_ddldispatcher @EventData, 4
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
DISABLE TRIGGER [MSmerge_tr_altertrigger] ON DATABASE
GO
/****** Object:  DdlTrigger [MSmerge_tr_alterview]    Script Date: 04/09/2023 14:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [MSmerge_tr_alterview] on database for ALTER_VIEW as 

							set ANSI_NULLS ON
							set ANSI_PADDING ON
							set ANSI_WARNINGS ON
							set ARITHABORT ON
							set CONCAT_NULL_YIELDS_NULL ON
							set NUMERIC_ROUNDABORT OFF
							set QUOTED_IDENTIFIER ON

							declare @EventData xml
							set @EventData=EventData()    
							exec sys.sp_MSmerge_ddldispatcher @EventData, 2
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
DISABLE TRIGGER [MSmerge_tr_alterview] ON DATABASE
GO
/****** Object:  Default [DF__MSmerge_g__genst__2F6FF32E]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[MSmerge_genhistory] ADD  DEFAULT ((0)) FOR [genstatus]
GO
/****** Object:  Default [DF__MSmerge_g__chang__30641767]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[MSmerge_genhistory] ADD  DEFAULT ((0)) FOR [changecount]
GO
/****** Object:  Default [DF__MSmerge_g__subsc__31583BA0]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[MSmerge_genhistory] ADD  DEFAULT ((0)) FOR [subscriber_number]
GO
/****** Object:  Default [DF__MSmerge_p__reaso__4DF47A4E]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[MSmerge_past_partition_mappings] ADD  DEFAULT ((0)) FOR [reason]
GO
/****** Object:  Default [MSmerge_df_rowguid_8CACF26881FD468D926AD7B97E5E985F]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[CTDDH] ADD  CONSTRAINT [MSmerge_df_rowguid_8CACF26881FD468D926AD7B97E5E985F]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [DF_DatHang_MasoDDH]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_MasoDDH]  DEFAULT (getdate()) FOR [MasoDDH]
GO
/****** Object:  Default [DF_DatHang_NGAY]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_NGAY]  DEFAULT (getdate()) FOR [NGAY]
GO
/****** Object:  Default [MSmerge_df_rowguid_FF64EAFEB3EC4C27ABFED0886CB86D56]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [MSmerge_df_rowguid_FF64EAFEB3EC4C27ABFED0886CB86D56]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [DF__sysmergea__exclu__7A0806B6]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [excluded_col_count]
GO
/****** Object:  Default [DF__sysmergea__delet__7AFC2AEF]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT (0x00) FOR [deleted_cols]
GO
/****** Object:  Default [DF__sysmergea__verti__7BF04F28]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [vertical_partition]
GO
/****** Object:  Default [DF__sysmergea__ident__7CE47361]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [identity_support]
GO
/****** Object:  Default [DF__sysmergea__verif__7DD8979A]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((1)) FOR [verify_resolver_signature]
GO
/****** Object:  Default [DF__sysmergea__allow__7ECCBBD3]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [allow_interactive_resolver]
GO
/****** Object:  Default [DF__sysmergea__fast___7FC0E00C]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [fast_multicol_updateproc]
GO
/****** Object:  Default [DF__sysmergea__check__00B50445]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [check_permissions]
GO
/****** Object:  Default [DF__sysmergea__maxve__01A9287E]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((1)) FOR [maxversion_at_cleanup]
GO
/****** Object:  Default [DF__sysmergea__proce__029D4CB7]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [processing_order]
GO
/****** Object:  Default [DF__sysmergea__uploa__039170F0]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [upload_options]
GO
/****** Object:  Default [DF__sysmergea__publi__04859529]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [published_in_tran_pub]
GO
/****** Object:  Default [DF__sysmergea__light__0579B962]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [lightweight]
GO
/****** Object:  Default [DF__sysmergea__delet__066DDD9B]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((1)) FOR [delete_tracking]
GO
/****** Object:  Default [DF__sysmergea__compe__076201D4]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [compensate_for_errors]
GO
/****** Object:  Default [DF__sysmergea__strea__0856260D]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((0)) FOR [stream_blob_columns]
GO
/****** Object:  Default [DF__sysmergea__prese__094A4A46]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[sysmergearticles] ADD  DEFAULT ((1)) FOR [preserve_rowguidcol]
GO
/****** Object:  Default [MSmerge_df_rowguid_B7AA10C596964D158281D5E11725D764]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[Kho] ADD  CONSTRAINT [MSmerge_df_rowguid_B7AA10C596964D158281D5E11725D764]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [DF_PhieuNhap_MAPN]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF_PhieuNhap_MAPN]  DEFAULT (getdate()) FOR [MAPN]
GO
/****** Object:  Default [DF_PhieuNhap_NGAY]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF_PhieuNhap_NGAY]  DEFAULT (getdate()) FOR [NGAY]
GO
/****** Object:  Default [MSmerge_df_rowguid_F5C8201FC9DA4C158D64876BA6770DAB]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [MSmerge_df_rowguid_F5C8201FC9DA4C158D64876BA6770DAB]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [MSmerge_df_rowguid_3CF6E6A4A0CE41D2BF7670A382555686]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPN] ADD  CONSTRAINT [MSmerge_df_rowguid_3CF6E6A4A0CE41D2BF7670A382555686]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [MSmerge_df_rowguid_4C9A078EF8764974BEA67876056BECE4]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[ChiNhanh] ADD  CONSTRAINT [MSmerge_df_rowguid_4C9A078EF8764974BEA67876056BECE4]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [DF_PX_NGAY]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuXuat] ADD  CONSTRAINT [DF_PX_NGAY]  DEFAULT (getdate()) FOR [NGAY]
GO
/****** Object:  Default [MSmerge_df_rowguid_004BC5D2A25047A9BDC5D72783194CA4]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuXuat] ADD  CONSTRAINT [MSmerge_df_rowguid_004BC5D2A25047A9BDC5D72783194CA4]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [MSmerge_df_rowguid_271E190634134D4C88F1805E699F4B9A]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPX] ADD  CONSTRAINT [MSmerge_df_rowguid_271E190634134D4C88F1805E699F4B9A]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [DF_NhanVien_TrangThaiXoa]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NhanVien_TrangThaiXoa]  DEFAULT ((0)) FOR [TrangThaiXoa]
GO
/****** Object:  Default [MSmerge_df_rowguid_9360F0BB8F9E466B91747BEBA1AE23AC]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [MSmerge_df_rowguid_9360F0BB8F9E466B91747BEBA1AE23AC]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Default [DF__sysmerges__datas__4870AB22]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergesubscriptions] ADD  DEFAULT ((0)) FOR [datasource_type]
GO
/****** Object:  Default [DF__sysmerges__metad__4964CF5B]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergesubscriptions] ADD  DEFAULT (getdate()) FOR [metadatacleanuptime]
GO
/****** Object:  Default [DF__sysmerges__clean__4A58F394]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergesubscriptions] ADD  DEFAULT ((0)) FOR [cleanedup_unsent_changes]
GO
/****** Object:  Default [DF__sysmerges__repli__4B4D17CD]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergesubscriptions] ADD  DEFAULT ((60)) FOR [replica_version]
GO
/****** Object:  Default [DF__sysmerges__suppo__4C413C06]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergesubscriptions] ADD  DEFAULT ((0)) FOR [supportability_mode]
GO
/****** Object:  Default [DF__sysmergep__publi__0F03239C]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT (publishingservername()) FOR [publisher]
GO
/****** Object:  Default [DF__sysmergep__publi__0FF747D5]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT (db_name()) FOR [publisher_db]
GO
/****** Object:  Default [DF__sysmergep__allow__10EB6C0E]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((1)) FOR [allow_anonymous]
GO
/****** Object:  Default [DF__sysmergep__enabl__11DF9047]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [enabled_for_internet]
GO
/****** Object:  Default [DF__sysmergep__dynam__12D3B480]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [dynamic_filters]
GO
/****** Object:  Default [DF__sysmergep__snaps__13C7D8B9]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((1)) FOR [snapshot_in_defaultfolder]
GO
/****** Object:  Default [DF__sysmergep__compr__14BBFCF2]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [compress_snapshot]
GO
/****** Object:  Default [DF__sysmergep__ftp_p__15B0212B]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((21)) FOR [ftp_port]
GO
/****** Object:  Default [DF__sysmergep__ftp_l__16A44564]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT (N'anonymous') FOR [ftp_login]
GO
/****** Object:  Default [DF__sysmergep__keep___1798699D]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [keep_before_values]
GO
/****** Object:  Default [DF__sysmergep__allow__188C8DD6]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [allow_subscription_copy]
GO
/****** Object:  Default [DF__sysmergep__allow__1980B20F]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [allow_synctoalternate]
GO
/****** Object:  Default [DF__sysmergep__backw__1A74D648]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((10)) FOR [backward_comp_level]
GO
/****** Object:  Default [DF__sysmergep__max_c__1B68FA81]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [max_concurrent_merge]
GO
/****** Object:  Default [DF__sysmergep__max_c__1C5D1EBA]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [max_concurrent_dynamic_snapshots]
GO
/****** Object:  Default [DF__sysmergep__repli__1D5142F3]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [replicate_ddl]
GO
/****** Object:  Default [DF__sysmergep__allow__1E45672C]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [allow_subscriber_initiated_snapshot]
GO
/****** Object:  Default [DF__sysmergep__allow__1F398B65]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [allow_web_synchronization]
GO
/****** Object:  Default [DF__sysmergep__allow__202DAF9E]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((1)) FOR [allow_partition_realignment]
GO
/****** Object:  Default [DF__sysmergep__reten__2121D3D7]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [retention_period_unit]
GO
/****** Object:  Default [DF__sysmergep__gener__2215F810]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((1000)) FOR [generation_leveling_threshold]
GO
/****** Object:  Default [DF__sysmergep__autom__230A1C49]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[sysmergepublications] ADD  DEFAULT ((0)) FOR [automatic_reinitialization_policy]
GO
/****** Object:  Default [MSmerge_df_rowguid_F5A900715DA54C03A0A7A8AFED7FC4DF]    Script Date: 04/09/2023 14:38:39 ******/
ALTER TABLE [dbo].[Vattu] ADD  CONSTRAINT [MSmerge_df_rowguid_F5A900715DA54C03A0A7A8AFED7FC4DF]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
/****** Object:  Check [CK_DONGIA]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIA] CHECK NOT FOR REPLICATION (([DONGIA]>(0)))
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [CK_DONGIA]
GO
/****** Object:  Check [CK_SOLUONG]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONG] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [CK_SOLUONG]
GO
/****** Object:  Check [CK_DONGIACTPN]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIACTPN] CHECK NOT FOR REPLICATION (([DONGIA]>=(0)))
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [CK_DONGIACTPN]
GO
/****** Object:  Check [CK_SOLUONGCTPN]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGCTPN] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [CK_SOLUONGCTPN]
GO
/****** Object:  Check [CK_DONGIACTPX]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIACTPX] CHECK NOT FOR REPLICATION (([DONGIA]>=(0)))
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [CK_DONGIACTPX]
GO
/****** Object:  Check [CK_SOLUONGCTPX]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGCTPX] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [CK_SOLUONGCTPX]
GO
/****** Object:  Check [CK_LUONG]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [CK_LUONG] CHECK NOT FOR REPLICATION (([LUONG]>=(4000000)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_LUONG]
GO
/****** Object:  Check [CK_SOLUONGTON]    Script Date: 04/09/2023 14:38:39 ******/
ALTER TABLE [dbo].[Vattu]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGTON] CHECK NOT FOR REPLICATION (([SOLUONGTON]>=(0)))
GO
ALTER TABLE [dbo].[Vattu] CHECK CONSTRAINT [CK_SOLUONGTON]
GO
/****** Object:  ForeignKey [FK_CTDDH_DatHang]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [FK_CTDDH_DatHang] FOREIGN KEY([MasoDDH])
REFERENCES [dbo].[DatHang] ([MasoDDH])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_DatHang]
GO
/****** Object:  ForeignKey [FK_CTDDH_VatTu]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [FK_CTDDH_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_VatTu]
GO
/****** Object:  ForeignKey [FK_DatHang_Kho]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_Kho]
GO
/****** Object:  ForeignKey [FK_DatHang_NhanVien]    Script Date: 04/09/2023 14:38:37 ******/
ALTER TABLE [dbo].[DatHang]  WITH NOCHECK ADD  CONSTRAINT [FK_DatHang_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_NhanVien]
GO
/****** Object:  ForeignKey [FK_Kho_Kho]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[Kho]  WITH NOCHECK ADD  CONSTRAINT [FK_Kho_Kho] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_Kho]
GO
/****** Object:  ForeignKey [FK_PhieuNhap_DatHang]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_DatHang] FOREIGN KEY([MasoDDH])
REFERENCES [dbo].[DatHang] ([MasoDDH])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_DatHang]
GO
/****** Object:  ForeignKey [FK_PhieuNhap_Kho]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Kho]
GO
/****** Object:  ForeignKey [FK_PhieuNhap_NhanVien]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
/****** Object:  ForeignKey [FK_CTPN_PhieuNhap]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPN_PhieuNhap] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PhieuNhap] ([MAPN])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_PhieuNhap]
GO
/****** Object:  ForeignKey [FK_CTPN_VatTu]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPN_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_VatTu]
GO
/****** Object:  ForeignKey [FK_PX_NhanVien]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuXuat]  WITH NOCHECK ADD  CONSTRAINT [FK_PX_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PX_NhanVien]
GO
/****** Object:  ForeignKey [FK_PhieuXuat_Kho]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_Kho]
GO
/****** Object:  ForeignKey [FK_CTPX_PX]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPX_PX] FOREIGN KEY([MAPX])
REFERENCES [dbo].[PhieuXuat] ([MAPX])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_PX]
GO
/****** Object:  ForeignKey [FK_CTPX_VatTu]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPX_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_VatTu]
GO
/****** Object:  ForeignKey [FK_NhanVien_ChiNhanh]    Script Date: 04/09/2023 14:38:38 ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChiNhanh] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChiNhanh]
GO
/****** Object:  DdlTrigger [MSmerge_tr_alterschemaonly]    Script Date: 04/09/2023 14:38:39 ******/
Enable Trigger [MSmerge_tr_alterschemaonly] ON Database
GO
/****** Object:  DdlTrigger [MSmerge_tr_altertable]    Script Date: 04/09/2023 14:38:39 ******/
Enable Trigger [MSmerge_tr_altertable] ON Database
GO
/****** Object:  DdlTrigger [MSmerge_tr_altertrigger]    Script Date: 04/09/2023 14:38:39 ******/
Enable Trigger [MSmerge_tr_altertrigger] ON Database
GO
/****** Object:  DdlTrigger [MSmerge_tr_alterview]    Script Date: 04/09/2023 14:38:39 ******/
Enable Trigger [MSmerge_tr_alterview] ON Database
GO

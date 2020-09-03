USE [_DBA]
GO

/****** Object:  Table [dbo].[db_rhe_size_audit]    Script Date: 03/09/2020 11:14:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[db_size_audit](
	[Current Database] [nvarchar](128) NULL,
	[TableName] [sysname] NOT NULL,
	[SchemaName] [sysname] NULL,
	[rows] [bigint] NULL,
	[TotalSpaceKB] [bigint] NULL,
	[TotalSpaceMB] [numeric](36, 2) NULL,
	[UsedSpaceKB] [bigint] NULL,
	[UsedSpaceMB] [numeric](36, 2) NULL,
	[UnusedSpaceKB] [bigint] NULL,
	[UnusedSpaceMB] [numeric](36, 2) NULL,
	[checked_time] [datetime] NOT NULL
) ON [PRIMARY]
GO



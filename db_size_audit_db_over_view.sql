USE [_DBA]
GO

/****** Object:  Table [dbo].[db_rhe_size_audit_db_over_view]    Script Date: 03/09/2020 11:15:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[db_size_audit_db_over_view](
	[Current Database] [nvarchar](128) NULL,
	[Space_Used_Since_20200824_gb] [numeric](38, 2) NULL,
	[current_size_gb] [numeric](38, 6) NULL,
	[used_gb_since] [numeric](38, 6) NULL,
	[projected_size_used_gb_in_1_month] [numeric](38, 6) NULL,
	[projected_size_used_gb_in_1_year] [numeric](38, 6) NULL,
	[date_taken] [datetime] NOT NULL
) ON [PRIMARY]
GO



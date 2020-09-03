USE [_DBA]
GO

/****** Object:  Table [dbo].[db_rhe_size_audit_tbl_over_view]    Script Date: 03/09/2020 11:18:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[db_size_audit_tbl_over_view](
	[tbname] [nvarchar](386) NULL,
	[Space_Used_Since_20200824_gb] [numeric](38, 2) NULL,
	[current_size_gb] [numeric](38, 6) NULL,
	[used_gb_since] [numeric](38, 6) NULL,
	[projected_size_used_gb_in_1_month] [numeric](38, 6) NULL,
	[projected_size_used_gb_in_1_year] [numeric](38, 6) NULL,
	[date_taken] [datetime] NOT NULL
) ON [PRIMARY]
GO



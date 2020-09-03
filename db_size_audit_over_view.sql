USE [_DBA]
GO

/****** Object:  Table [dbo].[db_rhe_size_audit_over_view]    Script Date: 03/09/2020 11:13:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[db_size_audit_over_view](
	[Space_Used_Since_20200824] [int] NULL,
	[used_per_day] [int] NULL,
	[total_size_next_Month] [int] NULL,
	[total_size_next_Year] [int] NULL,
	[date_taken] [datetime] NULL
) ON [PRIMARY]
GO



USE [_DBA]
GO

/****** Object:  Table [dbo].[db_rhe_size_audit_over_view_Winty_Only]    Script Date: 03/09/2020 11:18:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[db_size_audit_over_view_Winty_Only](
	[StartingSpace] [numeric](9, 5) NULL,
	[TodaySpace] [numeric](9, 5) NULL,
	[Space_Used_Since_20200824] [numeric](10, 5) NULL,
	[used_per_day] [numeric](25, 16) NULL,
	[total_size_next_Month] [numeric](26, 15) NULL,
	[total_size_next_Year] [numeric](26, 15) NULL,
	[date_taken] [datetime] NULL
) ON [PRIMARY]
GO



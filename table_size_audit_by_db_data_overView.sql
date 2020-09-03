USE [_DBA]
GO

/****** Object:  StoredProcedure [dbo].[table_size_audit_by_db_data_overView]    Script Date: 03/09/2020 11:23:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[table_size_audit_by_db_data_overView] 
as
begin
truncate table db_size_audit_db_over_view
declare
 @startDate datetime ,
 @todaysDate datetime,
 @LiveDiv int,
 @ProjMonthDiv int,
 @ProjYearDiv int,
 @projectedDateMonth datetime,
 @projectedDateYear datetime
 
 select @startDate = min(checked_time) from [_DBA].[dbo].[db_size_audit]
 
 set @projectedDateMonth = getdate() + 31
 set @projectedDateYear = getdate() + 365
 set @todaysDate =  Getdate() 
 set @LiveDiv = datediff(day, @startDate,@todaysDate)
 set @ProjMonthDiv = datediff(day, @startDate, @projectedDateMonth)
 set @ProjYearDiv = datediff(day, @startDate, @projectedDateYear)
begin

insert into db_size_audit_db_over_view 
select 

		a.[Current Database], 
		b.space_used_mb / 1000 Space_Used_Since_20200824_gb, 
		(a.space_used_mb) / 1000 current_size_gb, 
		(a.space_used_mb -b.space_used_mb) /1000  used_gb_since,
		(((a.space_used_mb -b.space_used_mb) * @ProjMonthDiv) + a.space_used_mb)/1000 projected_size_used_gb_in_1_month
		,
		(((a.space_used_mb -b.space_used_mb) * @ProjYearDiv) + a.space_used_mb)/1000  projected_size_used_gb_in_1_year
		, getdate() date_taken
from
(
SELECT a.[Current Database]
      ,sum(a.TotalSpaceMB ) space_used_mb
  FROM [_DBA].[dbo].[db_size_audit] a
where left(convert(varchar,a.checked_time),11) = left(convert(varchar,@todaysDate),11)
group by a.[Current Database]
)a
join (
SELECT a.[Current Database]
      ,sum(a.TotalSpaceMB ) space_used_mb
  FROM [_DBA].[dbo].[db_size_audit] a
where left(convert(varchar,a.checked_time),11) = left(convert(varchar,@startDate),11)
group by a.[Current Database]
)  b
on a.[Current Database] = b.[Current Database]

	end
end
GO



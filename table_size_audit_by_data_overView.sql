USE [_DBA]
GO

/****** Object:  StoredProcedure [dbo].[table_size_audit_by_data_overView]    Script Date: 03/09/2020 11:20:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[table_size_audit_by_data_overView] as
begin
truncate table db_size_audit_over_view
--truncate table db_size_audit_over_view_Winty_Only
declare
 @startDate datetime ,
 @todaysDate datetime,
 @StartingSpace numeric(9,5),
 @TodaySpace numeric(9,5),
 @LiveDiv numeric(9,5),
 @ProjMonthDiv numeric(9,5),
 @ProjYearDiv numeric(9,5),
 @projectedDateMonth datetime,
 @projectedDateYear datetime
 
 select @startDate = min(checked_time) from [_DBA].[dbo].[db_size_audit]
 
 set @projectedDateMonth = getdate() + 31
 set @projectedDateYear = getdate() + 365
 set @todaysDate =  Getdate()  
 set @LiveDiv = datediff(day, @startDate,@todaysDate)
 set @ProjMonthDiv = datediff(day, @startDate, @projectedDateMonth)
 set @ProjYearDiv = datediff(day, @startDate, @projectedDateYear)

select @StartingSpace = sum(a.totalSpaceMB) / 1000 
from [_DBA].[dbo].[db_size_audit] a
where left(convert(varchar,a.checked_time),11) = left(convert(varchar,@startDate),11)

select @TodaySpace = sum(a.totalSpaceMB) / 1000 
from [_DBA].[dbo].[db_size_audit] a
where left(convert(varchar,a.checked_time),11) = left(convert(varchar,@todaysDate),11)
 

begin
 insert  into db_size_audit_over_view
 select 
	   	@TodaySpace - @StartingSpace Space_Used_Since_20200824
	  , @LiveDiv * (@TodaySpace - @StartingSpace) used_per_day
	  , ( @ProjMonthDiv * (@TodaySpace - @StartingSpace)) + @TodaySpace total_size_next_Month
	  , ( @ProjYearDiv * (@TodaySpace - @StartingSpace))  + @TodaySpace  total_size_next_Year
	  , @todaysDate date_taken
 
 insert into db_size_audit_over_view_Winty_Only
 select 
	   @StartingSpace StartingSpace
	  , @TodaySpace TodaySpace
	  ,	@TodaySpace - @StartingSpace 
	  , @LiveDiv * (@TodaySpace - @StartingSpace) used_per_day
	  , (@ProjMonthDiv * (@TodaySpace - @StartingSpace)) + @TodaySpace total_size_next_Month
	  , (@ProjYearDiv * (@TodaySpace - @StartingSpace))  + @TodaySpace  total_size_next_Year
	  , @todaysDate date_taken

	end
end
GO



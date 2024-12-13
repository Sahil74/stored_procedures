-- Create a basic SQL stored procedure to return a list of number 1 music albums.
use Music_01
go

create or alter proc dbo.usp_Rock_and_Roll_Albums as
begin
	select
		al.Title
		,ar.Artist
		,ar.Artist_type
		,sg.Subgenre
		,al.Release_date
		,al.[US_sales_(m)]
		,al.US_Billboard_200_peak
	from
		dbo.Album as al
		join dbo.Artist as ar on ar.Artist_ID = al.Artist_ID
		join dbo.Subgenre as sg on sg.Subgenre_ID = al.Subgenre_ID
	where
		sg.Subgenre = 'Rock and roll'
	order by
		al.Title
end



use Music_01
go

create or alter proc dbo.usp_Number_1_Albums as
begin

	select
		a.Title
		,a.Release_date
		,a.[US_sales_(m)]
	from
		dbo.Album as a
	where
		a.US_Billboard_200_peak = 1
	order by
		a.[US_sales_(m)] desc

end


use Music_01
go

create or alter proc dbo.usp_Tour_Totals as
begin

	select
		a.Artist
		,t.Tour_name
		,sum(s.Tickets_sold) as [Total tickets sold]
		,sum(s.Revenue_$) as [Total revenue]
		,avg(s.Tickets_sold) as [Avg tickets sold]
		,avg(s.Revenue_$) as [Avg revenue]
	from
		dbo.Artist as a
		join dbo.Tour as t on a.Artist_ID = t.Artist_ID
		join dbo.Show as s on t.Tour_ID = s.Tour_ID
	group by
		a.Artist
		,t.Tour_name
	order by
		[Avg revenue] desc

end
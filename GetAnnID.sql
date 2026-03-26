create proc GetAnnID
as
begin

	set nocount on;

	declare @today char(8)= convert(nvarchar,GETDATE(), 112)

	

	declare @lastID nvarchar(12),@newID nvarchar(12)

	select top 1 @lastID = AnnID from [Announcements]
	where convert(nvarchar,CreatedDate, 112) = @today
	order by CreatedDate desc

	if @lastID is null
	    set @newID = 'A' + @today + '001'
	else	
		set @newid = 'A' + cast(cast(substring(@lastid, 2, 11) as bigint) + 1 as nvarchar);

	select @newID
end

create proc GetFineID
as
begin

	set nocount on;

	declare @today char(8)= convert(nvarchar,GETDATE(), 112)

	

	declare @lastID nvarchar(13),@newID nvarchar(13)

	select top 1 @lastID = FineID from [Fines]
	where convert(nvarchar,CreatedDate, 112) = @today
	order by CreatedDate desc

	if @lastID is null
	    set @newID = 'F' + @today + '0001'
	else	
		set @newid = 'F' + cast(cast(substring(@lastid, 2, 12) as bigint) + 1 as nvarchar);

	select @newID
end

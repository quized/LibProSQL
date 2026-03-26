create proc GetResID
as
begin

	set nocount on;

	declare @today char(8)= convert(nvarchar,GETDATE(), 112)

	

	declare @lastID nvarchar(12),@newID nvarchar(12)

	select top 1 @lastID = ResID from [Reserves]
	where convert(nvarchar,ResDate, 112) = @today
	order by ResDate desc

	if @lastID is null
	    set @newID = 'R' + @today + '001'
	else	
		set @newid = 'R' + cast(cast(substring(@lastid, 2, 11) as bigint) + 1 as nvarchar);

	select @newID
end

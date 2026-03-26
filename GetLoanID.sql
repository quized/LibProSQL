create proc getLoanID
as
begin

	set nocount on;

	declare @today char(8)= convert(nvarchar,GETDATE(), 112)

	

	declare @lastID nvarchar(13),@newID nvarchar(13)

	select top 1 @lastID = LoanID from [Loans]
	where convert(nvarchar,LoanDate, 112) = @today
	order by LoanDate desc

	if @lastID is null
	    set @newID = 'L' + @today + '0001'
	else	
		set @newid = 'L' + cast(cast(substring(@lastid, 2, 12) as bigint) + 1 as nvarchar);

	select @newID
end

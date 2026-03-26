 create proc GetStaffID
 as
begin
    set nocount on;
    select 'S' + right('0000000' + cast(isnull(max(cast(substring(StaffID, 2, 7) as int)), 0) + 1 as varchar), 7) as NextStaffID
    from Staffs;
end
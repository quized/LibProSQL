 create proc GetPatronsID
 as
begin
    set nocount on;
    select 'P' + right('0000000' + cast(isnull(max(cast(substring(PatronID, 2, 7) as int)), 0) + 1 as varchar), 7) as NextPatronsID
    from Patrons;
end
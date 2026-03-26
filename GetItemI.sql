create proc GetItemID
as
begin
    set nocount on;

    -- 取得當前年份 (2026)
    declare @year char(4) = cast(year(getdate()) as char(4));

    -- 找出該年度最大的編號，加 1 後補 0，最後回傳
    select @year + right('000000' + cast(isnull(max(cast(right(itemid, 6) as int)), 0) + 1 as varchar), 6) as nextitemid
    from bookitems
    where itemid like @year + '%';
end

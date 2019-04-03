select *
from locker as l natural join (
    select b.buildingid as buildingid
    from building as b
    where b.buildingid = 1
) as lockerbuilding;
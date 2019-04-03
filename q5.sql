select *
from student as s
where not exists (
    select * 
    from room as r
    where (r.buildingid = 1 or r.buildingid = 2 or r.buildingid = 3) 
    and not exists (
        select * 
        from section as sec
        where sec.roomid = r.roomid
        and exists (
            select *
            from attends as a
            where a.sectionid = sec.sectionid
            and a.studentid = s.studentid
        )
    )
);
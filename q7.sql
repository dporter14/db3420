select *
from room as r
where not exists (
    select *
    from course as c
    where not exists (
        select *
        from section as sec
        where sec.courseid = c.courseid
        and sec.roomid = r.roomid
    )
);
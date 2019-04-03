select *
from faculty as f
where not exists (
    select *
    from course as c
    where areaofstudy = 'Study Hall'
    and not exists (
        select *
        from section as sec
        where sec.facemployeeid = f.facultyid
        and sec.courseid = c.courseid
    )
);
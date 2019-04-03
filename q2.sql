select *
from student as stu natural join (
    select a.studentid
    from attends as a natural join (
        select s.sectionid
        from section as s
        where semsteryear = 'S2006'
    ) as secatt
) stuatt;
select *
from student as stu natural join (
    select c.headstudentid as studentid
    from club as c
    except (
        select c1.clubid
        from club as c1, club as c2
        where c1.clubid != c2.clubid and c1.founddate > c2.founddate
    )
) as stuclub;
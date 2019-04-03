select *
from student as stu natural join (
    select j.studentid
    from joins as j
    where start_day >= to_date('2008-09-17', 'yyyy-mm-dd')
    and start_day <= to_date('2008-09-21', 'yyyy-mm-dd')
) as stujoin;
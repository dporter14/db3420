select *
from student natural join attends natural join (
    select s3.sectionid
    from section as s3
    except
    (select s1.sectionid
    from section as s1, section as s2
    where s1.sectionid != s2.sectionid and s1.classsize > s2.classsize)) as s
where sex = 'm' and gradelevel = 11;
select *
from employee as e natural join(
    select d.departmentid as departmentid
    from department as d
    where (
        select max(budget)
        from department as d
    ) = d.budget
) as empdep;
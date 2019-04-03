select *
from room as r natural join (
    select r1.roomid 
    from room as r1
    where roomtype = 'classroom'
    except (
        select sec.roomid 
        from section as sec
        where semsteryear = 'F2019'
    )
) as unuse 
order by unuse.roomid asc;
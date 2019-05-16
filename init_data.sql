SELECT insert_student('David'::text, 'Porter'::text, '1997-05-09'::date, 'M'::char);
SELECT insert_student('Mason'::text, 'Pierce'::text, '1997-07-15'::date, 'M'::char);
SELECT insert_student('Hayden'::text, 'Hess'::text, '1996-09-28'::date, 'M'::char);
SELECT insert_student('Sarah'::text, 'Meramte'::text, '1998-11-30'::date, 'F'::char);
SELECT insert_student('Rachel'::text, 'Khan'::text, '2000-06-13'::date, 'F'::char);





SELECT insert_building('Admin'::text, 'Office'::text, 1, 20);
SELECT insert_building('100'::text, 'Classroom'::text, 1, 10);
SELECT insert_building('200'::text, 'Classroom'::text, 1, 10);
SELECT insert_building('300'::text, 'Classroom'::text, 1, 10);
SELECT insert_building('400'::text, 'Classroom'::text, 1, 10);
SELECT insert_locker(1, 100);
SELECT insert_locker(2, 100);
SELECT insert_locker(3, 100);
SELECT insert_locker(4, 100);

SELECT insert_department('Administration'::text);
SELECT insert_department('Math'::text);
SELECT insert_department('Science'::text);
SELECT insert_department('English'::text);
SELECT insert_department('History/Social Science'::text);
SELECT insert_department('Visual and Performing Arts'::text);
SELECT insert_department('World Languages'::text);
SELECT insert_department('Athletics'::text);


SELECT insert_employee(false::boolean, 'Ariel'::text, 'Flynn'::text, 195072111, '1983-02-14'::date, 'F'::char, 1, '2016-03-15'::date, 28148.15);
SELECT insert_employee(true::boolean, 'Jack'::text, 'Lutz'::text, 169467721, '1999-07-18'::date, 'M'::char, 2, '2009-06-17'::date, 52775.21);
SELECT insert_employee(true::boolean, 'Alyia'::text, 'Bates'::text, 449287732, '1990-10-09'::date, 'F'::char, 3, '2007-11-12'::date, 206694.15);
SELECT insert_employee(true::boolean, 'Jase'::text, 'Riley'::text, 646068982, '1998-09-15'::date, 'F'::char, 4, '2012-06-10'::date, 75752.61);
SELECT insert_employee(true::boolean, 'Rose'::text, 'Engel'::text, 411260479, '1995-07-11'::date, 'F'::char, 5, '2016-12-21'::date, 93314.94);
SELECT insert_employee(true::boolean, 'Jaden'::text, 'York'::text, 560442976, '1996-06-28'::date, 'M'::char, 6, '2007-05-28'::date, 43593.77);
SELECT insert_employee(true::boolean, 'Adam'::text, 'Blair'::text, 429904955, '1990-09-13'::date, 'M'::char, 7, '2011-10-01'::date, 82745.71);
SELECT insert_employee(false::boolean, 'Lilia'::text, 'Ford'::text, 359705658, '1989-05-17'::date, 'F'::char, 8, '2013-06-11'::date, 42487.52);


SELECT insert_club('Pi'::text, '2010-10-15'::date, 2, 1);
SELECT insert_club('Book'::text, '2015-10-15'::date, 4, 2);
SELECT insert_club('Art'::text, '2008-01-28'::date, 6, 3);
SELECT insert_club('WWII'::text, '2011-03-15'::date, 5, 4);
SELECT insert_club('Hobby'::text, '2007-06-19'::date, 7, 5);





SELECT insert_course(1000, 'MATH'::text, 'Algebra I'::text, 2);
SELECT insert_course(2000, 'MATH'::text, 'Geometry'::text, 2);
SELECT insert_course(1000, 'LANG'::text, 'Spanish I'::text, 7);
SELECT insert_course(3000, 'MATH'::text, 'Algebra II'::text, 2);
SELECT insert_course(2000, 'SCI'::text, 'Biology'::text, 3);
SELECT insert_course(3500, 'SCI'::text, 'Physics'::text, 3);
SELECT insert_course(1000, 'VPA'::text, 'Art I'::text, 6);
SELECT insert_course(3000, 'SCI'::text, 'Chemistry'::text, 3);
SELECT insert_course(1000, 'SCI'::text, 'Earth Science'::text, 3);
SELECT insert_course(3500, 'MATH'::text, 'Statistics'::text, 2);
SELECT insert_course(4000, 'MATH'::text, 'Calculus'::text, 2);
SELECT insert_course(4000, 'ENGL'::text, 'World Literature'::text, 4);
SELECT insert_course(2000, 'HIST'::text, 'American History'::text, 5);





































SELECT insert_section(2, 'F2014'::char(5), 2, 1);
SELECT insert_section(2, 'S2015'::char(5), 2, 1);
SELECT insert_section(2, 'F2015'::char(5), 2, 1);
SELECT insert_section(2, 'S2016'::char(5), 2, 1);
SELECT insert_section(2, 'F2016'::char(5), 2, 1);
SELECT insert_section(2, 'S2017'::char(5), 2, 1);
SELECT insert_section(2, 'F2017'::char(5), 2, 1);
SELECT insert_section(2, 'S2018'::char(5), 2, 1);
SELECT insert_section(2, 'F2014'::char(5), 7, 3);
SELECT insert_section(2, 'S2015'::char(5), 7, 3);
SELECT insert_section(2, 'F2015'::char(5), 7, 3);
SELECT insert_section(2, 'S2016'::char(5), 7, 3);
SELECT insert_section(2, 'F2016'::char(5), 7, 3);
SELECT insert_section(2, 'S2017'::char(5), 7, 3);
SELECT insert_section(2, 'F2017'::char(5), 7, 3);
SELECT insert_section(2, 'S2018'::char(5), 7, 3);
SELECT insert_section(2, 'F2014'::char(5), 6, 7);
SELECT insert_section(2, 'S2015'::char(5), 6, 7);
SELECT insert_section(2, 'F2015'::char(5), 6, 7);
SELECT insert_section(2, 'S2016'::char(5), 6, 7);
SELECT insert_section(2, 'F2016'::char(5), 6, 7);
SELECT insert_section(2, 'S2017'::char(5), 6, 7);
SELECT insert_section(2, 'F2017'::char(5), 6, 7);
SELECT insert_section(2, 'S2018'::char(5), 6, 7);
SELECT insert_section(2, 'F2014'::char(5), 3, 9);
SELECT insert_section(2, 'S2015'::char(5), 3, 9);
SELECT insert_section(2, 'F2015'::char(5), 3, 9);
SELECT insert_section(2, 'S2016'::char(5), 3, 9);
SELECT insert_section(2, 'F2016'::char(5), 3, 9);
SELECT insert_section(2, 'S2017'::char(5), 3, 9);
SELECT insert_section(2, 'F2017'::char(5), 3, 9);
SELECT insert_section(2, 'S2018'::char(5), 3, 9);
SELECT insert_section(2, 'F2014'::char(5), 2, 2);
SELECT insert_section(2, 'S2015'::char(5), 2, 2);
SELECT insert_section(2, 'F2015'::char(5), 2, 2);
SELECT insert_section(2, 'S2016'::char(5), 2, 2);
SELECT insert_section(2, 'F2016'::char(5), 2, 2);
SELECT insert_section(2, 'S2017'::char(5), 2, 2);
SELECT insert_section(2, 'F2017'::char(5), 2, 2);
SELECT insert_section(2, 'S2018'::char(5), 2, 2);
SELECT insert_section(2, 'F2014'::char(5), 3, 5);
SELECT insert_section(2, 'S2015'::char(5), 3, 5);
SELECT insert_section(2, 'F2015'::char(5), 3, 5);
SELECT insert_section(2, 'S2016'::char(5), 3, 5);
SELECT insert_section(2, 'F2016'::char(5), 3, 5);
SELECT insert_section(2, 'S2017'::char(5), 3, 5);
SELECT insert_section(2, 'F2017'::char(5), 3, 5);
SELECT insert_section(2, 'S2018'::char(5), 3, 5);
SELECT insert_section(2, 'F2014'::char(5), 5, 13);
SELECT insert_section(2, 'S2015'::char(5), 5, 13);
SELECT insert_section(2, 'F2015'::char(5), 5, 13);
SELECT insert_section(2, 'S2016'::char(5), 5, 13);
SELECT insert_section(2, 'F2016'::char(5), 5, 13);
SELECT insert_section(2, 'S2017'::char(5), 5, 13);
SELECT insert_section(2, 'F2017'::char(5), 5, 13);
SELECT insert_section(2, 'S2018'::char(5), 5, 13);
SELECT insert_section(2, 'F2014'::char(5), 2, 4);
SELECT insert_section(2, 'S2015'::char(5), 2, 4);
SELECT insert_section(2, 'F2015'::char(5), 2, 4);
SELECT insert_section(2, 'S2016'::char(5), 2, 4);
SELECT insert_section(2, 'F2016'::char(5), 2, 4);
SELECT insert_section(2, 'S2017'::char(5), 2, 4);
SELECT insert_section(2, 'F2017'::char(5), 2, 4);
SELECT insert_section(2, 'S2018'::char(5), 2, 4);
SELECT insert_section(2, 'F2014'::char(5), 3, 6);
SELECT insert_section(2, 'S2015'::char(5), 3, 6);
SELECT insert_section(2, 'F2015'::char(5), 3, 6);
SELECT insert_section(2, 'S2016'::char(5), 3, 6);
SELECT insert_section(2, 'F2016'::char(5), 3, 6);
SELECT insert_section(2, 'S2017'::char(5), 3, 6);
SELECT insert_section(2, 'F2017'::char(5), 3, 6);
SELECT insert_section(2, 'S2018'::char(5), 3, 6);
SELECT insert_section(2, 'F2014'::char(5), 3, 8);
SELECT insert_section(2, 'S2015'::char(5), 3, 8);
SELECT insert_section(2, 'F2015'::char(5), 3, 8);
SELECT insert_section(2, 'S2016'::char(5), 3, 8);
SELECT insert_section(2, 'F2016'::char(5), 3, 8);
SELECT insert_section(2, 'S2017'::char(5), 3, 8);
SELECT insert_section(2, 'F2017'::char(5), 3, 8);
SELECT insert_section(2, 'S2018'::char(5), 3, 8);
SELECT insert_section(2, 'F2014'::char(5), 2, 10);
SELECT insert_section(2, 'S2015'::char(5), 2, 10);
SELECT insert_section(2, 'F2015'::char(5), 2, 10);
SELECT insert_section(2, 'S2016'::char(5), 2, 10);
SELECT insert_section(2, 'F2016'::char(5), 2, 10);
SELECT insert_section(2, 'S2017'::char(5), 2, 10);
SELECT insert_section(2, 'F2017'::char(5), 2, 10);
SELECT insert_section(2, 'S2018'::char(5), 2, 10);
SELECT insert_section(2, 'F2014'::char(5), 2, 11);
SELECT insert_section(2, 'S2015'::char(5), 2, 11);
SELECT insert_section(2, 'F2015'::char(5), 2, 11);
SELECT insert_section(2, 'S2016'::char(5), 2, 11);
SELECT insert_section(2, 'F2016'::char(5), 2, 11);
SELECT insert_section(2, 'S2017'::char(5), 2, 11);
SELECT insert_section(2, 'F2017'::char(5), 2, 11);
SELECT insert_section(2, 'S2018'::char(5), 2, 11);
SELECT insert_section(2, 'F2014'::char(5), 4, 12);
SELECT insert_section(2, 'S2015'::char(5), 4, 12);
SELECT insert_section(2, 'F2015'::char(5), 4, 12);
SELECT insert_section(2, 'S2016'::char(5), 4, 12);
SELECT insert_section(2, 'F2016'::char(5), 4, 12);
SELECT insert_section(2, 'S2017'::char(5), 4, 12);
SELECT insert_section(2, 'F2017'::char(5), 4, 12);
SELECT insert_section(2, 'S2018'::char(5), 4, 12);

SELECT register_section(1, 1);
SELECT register_section(1, 17);
SELECT register_section(1, 36);
SELECT register_section(1, 51);
SELECT register_section(1, 69);
SELECT register_section(1, 86);
SELECT register_section(1, 
SELECT register_section(1,
SELECT register_section(1,
SELECT register_section(1,
SELECT register_section(1,
SELECT register_section(1,
SELECT register_section(1,
SELECT register_section(1,

SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,
SELECT register_section(2,

SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,
SELECT register_section(3,

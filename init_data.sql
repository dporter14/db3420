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
SELECT insert_employee(true::boolean, 'Lilia'::text, 'Ford'::text, 359705658, '1989-05-17'::date, 'F'::char, 8, '2013-06-11'::date, 42487.52);


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
SELECT insert_course(1000, 'ATHL'::text, 'Physcial Eduation'::text, 8);






SELECT join_club(1,5, '2014-10-01'::date);
SELECT join_club(2,4, '2015-02-01'::date);
SELECT join_club(3,4, '2015-10-01'::date);
SELECT join_club(4,3, '2016-02-01'::date);
SELECT join_club(5,2, '2016-10-01'::date);
SELECT join_club(4,1, '2016-10-01'::date);
SELECT join_club(3,2, '2017-02-01'::date);
SELECT join_club(2,3, '2017-02-01'::date);
SELECT join_club(1,4, '2017-10-01'::date);

SELECT assign_locker(1, 94);
SELECT assign_locker(2, 29);
SELECT assign_locker(3, 52);
SELECT assign_locker(4, 76);
SELECT assign_locker(5, 42);



















SELECT insert_section(1, '2014F'::char(5), 2, 1);
SELECT insert_section(1, '2015S'::char(5), 2, 1);
SELECT insert_section(1, '2015F'::char(5), 2, 1);
SELECT insert_section(1, '2016S'::char(5), 2, 1);
SELECT insert_section(1, '2016F'::char(5), 2, 1);
SELECT insert_section(1, '2017S'::char(5), 2, 1);
SELECT insert_section(1, '2017F'::char(5), 2, 1);
SELECT insert_section(1, '2018S'::char(5), 2, 1);
SELECT insert_section(1, '2014F'::char(5), 7, 3);
SELECT insert_section(1, '2015S'::char(5), 7, 3);
SELECT insert_section(1, '2015F'::char(5), 7, 3);
SELECT insert_section(1, '2016S'::char(5), 7, 3);
SELECT insert_section(1, '2016F'::char(5), 7, 3);
SELECT insert_section(1, '2017S'::char(5), 7, 3);
SELECT insert_section(1, '2017F'::char(5), 7, 3);
SELECT insert_section(1, '2018S'::char(5), 7, 3);
SELECT insert_section(1, '2014F'::char(5), 6, 7);
SELECT insert_section(1, '2015S'::char(5), 6, 7);
SELECT insert_section(1, '2015F'::char(5), 6, 7);
SELECT insert_section(1, '2016S'::char(5), 6, 7);
SELECT insert_section(1, '2016F'::char(5), 6, 7);
SELECT insert_section(1, '2017S'::char(5), 6, 7);
SELECT insert_section(1, '2017F'::char(5), 6, 7);
SELECT insert_section(1, '2018S'::char(5), 6, 7);
SELECT insert_section(1, '2014F'::char(5), 3, 9);
SELECT insert_section(1, '2015S'::char(5), 3, 9);
SELECT insert_section(1, '2015F'::char(5), 3, 9);
SELECT insert_section(1, '2016S'::char(5), 3, 9);
SELECT insert_section(1, '2016F'::char(5), 3, 9);
SELECT insert_section(1, '2017S'::char(5), 3, 9);
SELECT insert_section(1, '2017F'::char(5), 3, 9);
SELECT insert_section(1, '2018S'::char(5), 3, 9);
SELECT insert_section(1, '2014F'::char(5), 2, 2);
SELECT insert_section(1, '2015S'::char(5), 2, 2);
SELECT insert_section(1, '2015F'::char(5), 2, 2);
SELECT insert_section(1, '2016S'::char(5), 2, 2);
SELECT insert_section(1, '2016F'::char(5), 2, 2);
SELECT insert_section(1, '2017S'::char(5), 2, 2);
SELECT insert_section(1, '2017F'::char(5), 2, 2);
SELECT insert_section(1, '2018S'::char(5), 2, 2);
SELECT insert_section(1, '2014F'::char(5), 3, 5);
SELECT insert_section(1, '2015S'::char(5), 3, 5);
SELECT insert_section(1, '2015F'::char(5), 3, 5);
SELECT insert_section(1, '2016S'::char(5), 3, 5);
SELECT insert_section(1, '2016F'::char(5), 3, 5);
SELECT insert_section(1, '2017S'::char(5), 3, 5);
SELECT insert_section(1, '2017F'::char(5), 3, 5);
SELECT insert_section(1, '2018S'::char(5), 3, 5);
SELECT insert_section(1, '2014F'::char(5), 5, 13);
SELECT insert_section(1, '2015S'::char(5), 5, 13);
SELECT insert_section(1, '2015F'::char(5), 5, 13);
SELECT insert_section(1, '2016S'::char(5), 5, 13);
SELECT insert_section(1, '2016F'::char(5), 5, 13);
SELECT insert_section(1, '2017S'::char(5), 5, 13);
SELECT insert_section(1, '2017F'::char(5), 5, 13);
SELECT insert_section(1, '2018S'::char(5), 5, 13);
SELECT insert_section(1, '2014F'::char(5), 2, 4);
SELECT insert_section(1, '2015S'::char(5), 2, 4);
SELECT insert_section(1, '2015F'::char(5), 2, 4);
SELECT insert_section(1, '2016S'::char(5), 2, 4);
SELECT insert_section(1, '2016F'::char(5), 2, 4);
SELECT insert_section(1, '2017S'::char(5), 2, 4);
SELECT insert_section(1, '2017F'::char(5), 2, 4);
SELECT insert_section(1, '2018S'::char(5), 2, 4);
SELECT insert_section(1, '2014F'::char(5), 3, 6);
SELECT insert_section(1, '2015S'::char(5), 3, 6);
SELECT insert_section(1, '2015F'::char(5), 3, 6);
SELECT insert_section(1, '2016S'::char(5), 3, 6);
SELECT insert_section(1, '2016F'::char(5), 3, 6);
SELECT insert_section(1, '2017S'::char(5), 3, 6);
SELECT insert_section(1, '2017F'::char(5), 3, 6);
SELECT insert_section(1, '2018S'::char(5), 3, 6);
SELECT insert_section(1, '2014F'::char(5), 3, 8);
SELECT insert_section(1, '2015S'::char(5), 3, 8);
SELECT insert_section(1, '2015F'::char(5), 3, 8);
SELECT insert_section(1, '2016S'::char(5), 3, 8);
SELECT insert_section(1, '2016F'::char(5), 3, 8);
SELECT insert_section(1, '2017S'::char(5), 3, 8);
SELECT insert_section(1, '2017F'::char(5), 3, 8);
SELECT insert_section(1, '2018S'::char(5), 3, 8);
SELECT insert_section(1, '2014F'::char(5), 2, 10);
SELECT insert_section(1, '2015S'::char(5), 2, 10);
SELECT insert_section(1, '2015F'::char(5), 2, 10);
SELECT insert_section(1, '2016S'::char(5), 2, 10);
SELECT insert_section(1, '2016F'::char(5), 2, 10);
SELECT insert_section(1, '2017S'::char(5), 2, 10);
SELECT insert_section(1, '2017F'::char(5), 2, 10);
SELECT insert_section(1, '2018S'::char(5), 2, 10);
SELECT insert_section(1, '2014F'::char(5), 2, 11);
SELECT insert_section(1, '2015S'::char(5), 2, 11);
SELECT insert_section(1, '2015F'::char(5), 2, 11);
SELECT insert_section(1, '2016S'::char(5), 2, 11);
SELECT insert_section(1, '2016F'::char(5), 2, 11);
SELECT insert_section(1, '2017S'::char(5), 2, 11);
SELECT insert_section(1, '2017F'::char(5), 2, 11);
SELECT insert_section(1, '2018S'::char(5), 2, 11);
SELECT insert_section(1, '2014F'::char(5), 4, 12);
SELECT insert_section(1, '2015S'::char(5), 4, 12);
SELECT insert_section(1, '2015F'::char(5), 4, 12);
SELECT insert_section(1, '2016S'::char(5), 4, 12);
SELECT insert_section(1, '2016F'::char(5), 4, 12);
SELECT insert_section(1, '2017S'::char(5), 4, 12);
SELECT insert_section(1, '2017F'::char(5), 4, 12);
SELECT insert_section(1, '2018S'::char(5), 4, 12);






SELECT register_section(1, 1);
SELECT register_section(1, 9);
SELECT register_section(1, 18);
SELECT register_section(1, 26);
SELECT register_section(1, 35);
SELECT register_section(1, 43);
SELECT register_section(1, 52);
SELECT register_section(1, 60);
SELECT register_section(1, 69);
SELECT register_section(1, 77);
SELECT register_section(1, 86);
SELECT register_section(1, 94);
SELECT register_section(2, 2);
SELECT register_section(2, 10);
SELECT register_section(2, 19);
SELECT register_section(2, 27);
SELECT register_section(2, 36);
SELECT register_section(2, 44);
SELECT register_section(2, 53);
SELECT register_section(2, 61);
SELECT register_section(2, 70);
SELECT register_section(2, 78);
SELECT register_section(2, 87);
SELECT register_section(2, 95);
SELECT register_section(3, 3);
SELECT register_section(3, 11);
SELECT register_section(3, 20);
SELECT register_section(3, 28);
SELECT register_section(3, 37);
SELECT register_section(3, 45);
SELECT register_section(3, 54);
SELECT register_section(3, 62);
SELECT register_section(3, 71);
SELECT register_section(3, 79);
SELECT register_section(3, 89);
SELECT register_section(3, 97);
SELECT register_section(4, 4);
SELECT register_section(4, 12);
SELECT register_section(4, 21);
SELECT register_section(4, 29);
SELECT register_section(4, 38);
SELECT register_section(4, 46);
SELECT register_section(4, 55);
SELECT register_section(4, 63);
SELECT register_section(4, 73);
SELECT register_section(4, 81);
SELECT register_section(4, 89);
SELECT register_section(4, 97);
SELECT register_section(5, 5);
SELECT register_section(5, 13);
SELECT register_section(5, 22);
SELECT register_section(5, 30);
SELECT register_section(5, 39);
SELECT register_section(5, 47);
SELECT register_section(5, 57);
SELECT register_section(5, 65);
SELECT register_section(5, 73);
SELECT register_section(5, 81);
SELECT register_section(5, 90);
SELECT register_section(5, 98);


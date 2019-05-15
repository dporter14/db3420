
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

/*
    Create all the views for the student web app
*/

CREATE VIEW student_grades AS
    SELECT stu.id AS id,
        stu.fname || ' ' || stu.lname AS name,
        cours.areaofstudy || ' ' || cours.num AS course,
        cours.coursename || '_' || sec.num AS section,
        sec.semesteryear,
        emp.fname || ' ' || emp.lname AS facname,
        att.grade
    FROM attends att 
        JOIN student stu ON att.studentid = stu.id
        JOIN section sec ON att.sectionid = sec.id
        JOIN course cours ON sec.courseid = cours.id 
        JOIN faculty fac ON sec.facemployeeid = fac.id
        JOIN employee emp ON fac.id = emp.id;

CREATE VIEW student_clubs AS
    SELECT stu.id AS id,
        stu.fname || ' ' || stu.lname AS name,
        clu.clubname,
        clubpart.startdate
    FROM clubparticipation clubpart
        INNER JOIN student stu ON clubpart.studentid = stu.id 
        INNER JOIN club clu ON clu.clubid = clubpart.clubid;

CREATE VIEW student_locker AS
    SELECT stu.id AS id,
        stu.fname || ' ' || stu.lname AS name,
        lock.buildingid || '' || lock.id AS lockernum,
        lock.lcombo AS lockcode
    FROM locker lock 
        INNER JOIN student stu ON stu.id = lock.studentid;
CREATE OR REPLACE FUNCTION show_course_history(stuid integer) 
RETURNS TABLE (courseno text, sect text, semyear char(5), fac text, lettergrade varchar) AS $$
--DECLARE ;
BEGIN
    RETURN QUERY SELECT course, section, semesteryear, facname, grade
                 FROM student_grades
                 WHERE stuid = student_grades.id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'No student %.', $1;
    END IF;

    RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION calc_student_gpa(stuid integer)
RETURNS real AS $$
    DECLARE 
        gp real;
        av real;
        res real;
        grades RECORD;
        gr char(2);
    BEGIN
        gp = 0;
        av = 0;
        FOR grades 
        IN SELECT grade
           FROM attends
           WHERE stuid = attends.studentid
        LOOP
            SELECT grade INTO gr
            FROM attends
            WHERE stuid = attends.studentid AND attends.grade = grades;
            av = av + 1;
             CASE gr
                WHEN 'A+' THEN
                    gp = gp + 4.3;
                WHEN 'A' THEN
                    gp = gp + 4.0;
                WHEN 'A-' THEN
                    gp = gp + 3.7;
                WHEN 'B+' THEN
                    gp = gp + 3.3;
                WHEN 'B' THEN
                    gp = gp + 3.0;
                WHEN 'B-' THEN
                    gp = gp + 2.7;
                WHEN 'C+' THEN
                    gp = gp + 2.3;
                WHEN 'C' THEN
                    gp = gp + 2.0;
                WHEN 'C-' THEN
                    gp = gp + 1.7;
                WHEN 'D+' THEN
                    gp = gp + 1.3;
                WHEN 'D' THEN
                    gp = gp + 1.0;
                WHEN 'D-' THEN
                    gp = gp + 0.7;
                ELSE
                    gp = gp + 0;
            END CASE;
/*
            CASE grades::char
                WHEN 'A+' THEN
                    gp = gp + 4.3;
                WHEN 'A' THEN
                    gp = gp + 4.0;
                WHEN 'A-' THEN
                    gp = gp + 3.7;
                WHEN 'B+' THEN
                    gp = gp + 3.3;
                WHEN 'B' THEN
                    gp = gp + 3.0;
                WHEN 'B-' THEN
                    gp = gp + 2.7;
                WHEN 'C+' THEN
                    gp = gp + 2.3;
                WHEN 'C' THEN
                    gp = gp + 2.0;
                WHEN 'C-' THEN
                    gp = gp + 1.7;
                WHEN 'D+' THEN
                    gp = gp + 1.3;
                WHEN 'D' THEN
                    gp = gp + 1.0;
                WHEN 'D-' THEN
                    gp = gp + 0.7;
                ELSE
                    gp = gp + 0;
            END CASE;
*/
        END LOOP;

        IF av = 0 THEN
            RAISE EXCEPTION 'No grades found';
        END IF;
        res = gp/av;
        RETURN res;
    
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_student(firstname text, lastname text, birthdate date, sexid char(1))
RETURNS void AS $$
    BEGIN
        INSERT INTO student (fname, lname, DOB, sex) VALUES (firstname, lastname, birthdate, sexid);
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_building(buildingname text, floors integer, roomsperfloor integer)
RETURNS void AS $$
    DECLARE 
        i integer;
        j integer;
        bid integer;
        cap integer;
    BEGIN
        INSERT INTO building (bname) VALUES (buildingname);
        SELECT id INTO bid FROM building WHERE bname = buildingname;
        i = 1;
        j = 0;
        cap = floors + 1;
        <<OUTERR>>
        WHILE i < cap LOOP
            <<INNER>>
            FOR j in 1..roomsperfloor LOOP
                INSERT INTO room (num, buildingid)
                VALUES (i * 100 + j, bid);
                j = j + 1;
            END LOOP INNER;
            i = i + 1;
        END LOOP OUTERR;

    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_building(buildingname text, rtype text, floors integer, roomsperfloor integer)
RETURNS void AS $$
    DECLARE 
        i integer;
        j integer;
        bid integer;
        cap integer;
    BEGIN
        INSERT INTO building (bname) VALUES (buildingname);
        SELECT id INTO bid FROM building WHERE bname = buildingname;
        i = 1;
        j = 0;
        cap = floors + 1;
        <<OUTERR>>
        WHILE i < cap LOOP
            <<INNER>>
            FOR j in 1..roomsperfloor LOOP
                INSERT INTO room (num, buildingid, roomtype)
                VALUES (i * 100 + j, bid, rtype);
                j = j + 1;
            END LOOP INNER;
            i = i + 1;
        END LOOP OUTERR;

    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_locker(bid integer, lockercount integer)
RETURNS void AS $$
    DECLARE
        i integer;
    BEGIN
        i = 1;
        FOR i IN 1..lockercount LOOP
            INSERT INTO locker (buildingid) VALUES (bid);
        END LOOP;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_department(depname text)
RETURNS void AS $$
    BEGIN
        INSERT INTO department (dname) VALUES (depname);
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_employee(isfaculty boolean, firname text, lastname text, socialsn integer, birthdate date, sexid char(1), depid integer, hireday date, salr numeric(20,2))
RETURNS void AS $$
    DECLARE eid integer;
    BEGIN
        INSERT INTO employee(fname, lname, ssn, DOB, sex, departmentid, hiredate, salary) VALUES (firname, lastname, socialsn, birthdate, sexid, depid, hireday, salr);
        IF isfaculty THEN
            SELECT id
            INTO eid
            FROM employee
            WHERE ssn = socialsn AND DOB = birthdate AND sex = sexid;

            PERFORM insert_faculty(eid);
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_faculty(empid integer)
RETURNS void AS $$
    DECLARE
        subjname text;
    BEGIN
        SELECT dname
        INTO subjname
        FROM department 
            INNER JOIN employee ON department.id = employee.departmentid
        WHERE empid = employee.id;

        INSERT INTO faculty(id, subjects) VALUES (empid, subjname);
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_club(clubn text, founded date, facultyid integer, headstuid integer)
RETURNS void AS $$
    BEGIN
        INSERT INTO club(clubName, founddate, facemployeeid, headstudentid, startdate) VALUES (clubn, founded, facultyid, headstuid, founded);
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_course(cno integer, subj text, cname text, depid integer)
RETURNS void AS $$
    BEGIN
        INSERT INTO course(num, areaofstudy, coursename, departmentid) VALUES (cno, subj, cname, depid);
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_section(num_of_sections integer, semyear char(5), cid integer)
RETURNS void AS $$
    DECLARE
        i integer;
    BEGIN
        i = 1;
        FOR i IN 1..num_of_sections LOOP
            INSERT INTO section(num, semesteryear, courseid) VALUES (i, semyear, cid);
        END LOOP;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_row(tablename text, pk integer)
RETURNS void AS $$
    BEGIN
        EXECUTE format('DELETE FROM %I '
            'WHERE $1 = id', tablename) 
            USING pk;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION register_section(stuid integer, secid integer)
RETURNS void AS $$
    BEGIN
        INSERT INTO attends (studentid, sectionid) VALUES (stuid, secid);
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION join_club(stuid integer, cluid integer, joindate date)
RETURNS void AS $$
    BEGIN
        INSERT INTO clubparticipation(studentid, clubid, startdate) VALUES (stuid, cluid, joindate);
    END;
$$ LANGUAGE plpgsql;
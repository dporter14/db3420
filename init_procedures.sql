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
        grades RECORD;
    BEGIN
        gp = 0;
        av = 0;
        FOR grades 
        IN SELECT grade
           FROM student_grades
           WHERE stuid = student_grades.id
        LOOP
            av = av + 1;
            CASE grade
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
        END LOOP;

        IF av = 0 THEN
            RAISE EXCEPTION 'No grades found';
        END IF;

        RETURN gp/av;
    
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION register_section(stuid integer, secid integer)
RETURNS void AS $$
    BEGIN
        INSERT INTO attends (studentid, sectionid) VALUES (stuid, secid);
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_student(firstname text, lastname text, birthdate date)
RETURNS void AS $$
    BEGIN
        INSERT INTO student (fname, lname, DOB) VALUES (firstname, lastname, birthdate);
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

CREATE OR REPLACE FUNCTION insert_locker(bid integer)
RETURNS void AS $$
    BEGIN
        INSERT INTO locker (buildingid) VALUES (bid);
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_department(depname text)
RETURNS void AS $$
    BEGIN
        INSERT INTO department (dname) VALUES (depname);
    END;
$$ LANGUAGE plpgsql;


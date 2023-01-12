-- First of all we need to drop the tables if they are already created.
drop table if exists mentors;
drop table if exists students;
drop table if exists class_attendance;


-- We are creating tables here.
CREATE TABLE mentors (
	id       SERIAL PRIMARY KEY,
	name     VARCHAR(30) NOT NULL,
	years	 SMALLINT NOT NULL, 
	address  VARCHAR(60),
	language VARCHAR(60)
);

CREATE TABLE students (
	id        SERIAL PRIMARY KEY,
	name      VARCHAR(30) NOT NULL,
	address   VARCHAR(60),
	graduated Boolean
);


CREATE TABLE classes (
	id           SERIAL PRIMARY KEY,
    mentor_id    INT REFERENCES mentors(id),
	topic        VARCHAR(60),
	taught_date  DATE NOT NULL,
	location     VARCHAR(60)
);


create table class_attendance (
	id            SERIAL PRIMARY KEY,
	student_id    INT REFERENCES students(id),
	class_id      INT REFERENCES classes(id)
);



-- Here, we are inserrting data into tables.
INSERT INTO mentors (name, years, address, language) VALUES 
 ('John Smith', 5 ,'11 New Road','Javascript'),
 ('Manpreet', 4 ,'12 New Road','Java'),
 ('Ali', 3 ,'13 New Road','Html'),
 ('David', 2 ,'14 New Road','Python'),
 ('Jordi', 1 ,'15 New Road','Node Js'),
 ('Lucia', 6 ,'Glasgow','Ruby Rails');



INSERT INTO students (name, address, graduated) VALUES ('Nuno', '7 New Road',true);
INSERT INTO students (name, address, graduated) VALUES ('Nimra', '8 New Road',false);
INSERT INTO students (name, address, graduated) VALUES ('Danielle', '9 New Road',true);
INSERT INTO students (name, address, graduated) VALUES ('Yun', '10 New Road',false);
INSERT INTO students (name, address, graduated) VALUES ('Hanna', '11 New Road',true);
INSERT INTO students (name, address, graduated) VALUES ('Mauzzam', '12 New Road',false);
INSERT INTO students (name, address, graduated) VALUES ('Abu', '13 New Road',true);
INSERT INTO students (name, address, graduated) VALUES ('Carlos', '14 New Road',false);
INSERT INTO students (name, address, graduated) VALUES ('Dani', '15 New Road',true);
INSERT INTO students (name, address, graduated) VALUES ('Mann', '16 New Road',false);


-- var = '2022-12-17'); drop table classes; (

insert into classes (mentor_id, taught_date) values (1, var);
insert into classes (mentor_id, taught_date) values (1, '2022-12-17');
insert into classes (mentor_id, taught_date) values (2, '2022-12-17');
insert into classes (mentor_id, taught_date, topic) values (1, '2022-12-16', 'Javascript');



insert into class_attendance (student_id, class_id) values(5, 5);
insert into class_attendance (student_id, class_id) values(4, 5);
insert into class_attendance (student_id, class_id) values(3, 5);
insert into class_attendance (student_id, class_id) values(2, 5);


select * from  mentors;
select * from  students;
select * from classes;
select * from class_attendance;




--------------------  Exerccise  10 ------------------------------
-- select all the students but with limit 5
	select * from students limit 5;
  
-- select all the sstudents where first letter is M
	select * from students where name like 'M%' limit 5;
  
-- select students name from class_attendance table with letter M
	select s.name from class_attendance as ca
	join students as s
	on ca.student_id = s.id 
	where s.name like 'M%' limit 5;

-- students who joined the class of 16 december
	select s.name  from students as s
	join class_attendance as ca
	on s.id = ca.student_id 
	join classes as c
	on c.id = ca.class_id 
	where c.taught_date = '2022-12-17';

-- Retrieve all the mentors who lived more than 5 years in Glasgow
   select * from mentors as m
   where m.years > 5;

-- Retrieve all the mentors whose favourite language is Javascript
   select * from  mentors as m  
   where m."language" = 'Javascript';

-- Retrieve all the students who are CYF graduates
   select * from students as s 
   where s.graduated = 'true';

-- Retrieve all the classes taught before June this year
   select * from classes as c 
   where taught_date = '2022-06-30';

--- Retrieve all the students (retrieving student ids only is fine)
--- who attended the Javascript class (or any other class that you have in the classes table)
    select s.id, s."name"  from students as s
    join classes as c
    on s.id = c.id 
    where c.topic = 'Javascript';  


-- ex1
CREATE TABLE student
(
   student_id int NOT NULL,
   name VARCHAR
(10) NOT NULL,
   year TINYINT NOT NULL DEFAULT 1,
   dept_no int NOT NULL,
   major VARCHAR
(20),
   PRIMARY KEY
(student_id)
);
-- ex2
INSERT INTO student
VALUES
   (20070002, 'Jane Smith', 3, 4, 'Business Administration'),
   (20060001, 'Ashley Jackson', 4, 4, 'Business Administration'),
   (20030001, 'Liam Johnson', 4, 2, 'Electrical Engineering'),
   (20040003, 'Jacob Lee', 3, 2, 'Electrical Engineering'),
   (20060002, 'Noah Kim', 3, 1, 'Computer Science'),
   (20100002, 'Ava Lim', 3, 4, 'Business Administration'),
   (20110001, 'Emma Watson', 2, 1, 'Computer Science'),
   (20080003, 'Lisa Maria', 4, 3, 'Law'),
   (20040002, 'Jacob William', 4, 5, 'Law'),
   (20070001, 'Emily Rose', 4, 4, 'Business Administration'),
   (20100001, 'Ethan Hunt', 3, 4, 'Business Administration'),
   (20110002, 'Jason Mraz', 2, 1, 'Electrical Engineering'),
   (20030002, 'John Smith', 5, 1, 'Computer Science'),
   (20070003, 'Sophia Park', 4, 3, 'Law'),
   (20070007, 'James Michael', 2, 4, 'Business Administration'),
   (20100003, 'James Bond', 3, 1, 'Computer Science'),
   (20070005, 'Olivia Madison', 2, 5, 'English Language and Literature');

-- ex1
CREATE TABLE department
(
   dept_no INT
   AUTO_INCREMENT NOT NULL,
   dept_name varchar
   (20) NOT NULL,
   office varchar
   (20) NOT NULL,
   office_tel varchar
   (13),
   PRIMARY KEY
   (dept_no),
   UNIQUE
   (dept_name)
);
   -- ex2
   INSERT INTO department
      (dept_name, office, office_tel)
   VALUES
      ('Computer Science', 'Science Building 101', '02-3290-0123'),
      ('Electrical Engineering', 'Engineering Building 401', '02-3290-2345'),
      ('Law', 'Law Building 201', '02-3290-7896'),
      ( 'Business Administration', 'Business Building 104', '02-3290-1112'),
      ('English Language and Literature', 'Language Building 303', '02-3290-4412');
   -- ex1
   alter table student modify column major varchar
   (30);
describe students;
   alter table student add column gender varchar
   (10);
   alter table student drop column gender;
   -- ex3
   update department set dept_name = "Electrical and Electronics Engineering" where dept_no = 5;
   insert into department
      (dept_name, office,office_tel)
   values('Special Education', 'Education Building 403', '02-3290-2347');
   update student set major = 'Special Education' where name = 'Emma Watson';
   delete from student where name = 'Jason Mraz';
   delete from student where name = 'John Smith';
   -- ex4
   select name
   from student;
   select student_id, year, major
   from student;
   select name
   from student
   where year = 3;
   select name
   from student
   where year = 1 or year = 2;
   select name
   from student join department on student.dept_no = department.dept_no
   where department.dept_no = 4;
   -- ex5
   select name
   from student
   where student_id LIKE '%2007%';
   select name
   from student
   order by student_id;
   select major
   from student
   group by major
   having avg(year) > 3;
   select name
   from student
   where student_id like '%2007%'
   limit 2;
   --ex6
   select role
   from roles join movies on roles.movie_id = movies.id
   where name = 'Pi';
   select first_name, last_name, roles.role
   from actors join roles on actors.id = roles.actor_id
   where roles.movie_id in (select id
   from movies
   where name = 'Pi');
   SELECT first_name, last_name
   FROM actors a1
      JOIN roles r1 ON a1.id = r1.actor_id
      JOIN movies m1 ON m1.id = r1.movie_id
   WHERE m1.name = 'Kill Bill: Vol. 1'
      AND EXISTS (
  SELECT *
      FROM actors a2
         JOIN roles r2 ON a2.id = r2.actor_id
         JOIN movies m2 ON m2.id = r2.movie_id
      WHERE m2.name = 'Kill Bill: Vol. 2' AND a1.id = a2.id
);
   SELECT first_name, last_name, count(movie_id)
   FROM actors JOIN roles ON id = actor_id
   GROUP BY id
   ORDER BY count(movie_id) DESC LIMIT 7;
SELECT genre
   FROM movies_genres JOIN movies ON movie_id = id GROUP BY genre ORDER BY count
   (genre) DESC LIMIT 3;
   select first_name, last_name
   from directors join movies_directors d on id = director_id join movies_genres g on g.movie_id = d.movie_id
   where genre = 'Thriller'
   group by id
   order by count(id)desc limit 1;
--ex7
select grade
   from grades join courses on course_id = id where name = 'Computer Science 143';
   select s.name, grade
   from students s join grades on s.id = student_id join courses c on c.id = course_id
   where c.name = 'Computer Science 143' and (grade like 'B%' or grade like 'A%');
   select s.name, c.name, grade
   from students s join grades on s.id = student_id join courses c on c.id = course_id
   where grade like 'B%' or grade like 'A%';
   select name
   from courses join grades on id = course_id
   group by name
   having count(student_id)>=2;
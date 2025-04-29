-- 테이블 생성
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE student_course (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

-- 데이터 삽입
INSERT INTO teacher VALUES
(1, 'Taylah', 'Booker'),
(2, 'Sarah-Louise', 'Blake');

INSERT INTO course VALUES
(1, 'Database design', 1),
(2, 'English literature', 2),
(3, 'Python programming', 1);

INSERT INTO student VALUES
(1, 'Shreya', 'Bain'),
(2, 'Rianna', 'Foster'),
(3, 'Yosef', 'Naylor');

INSERT INTO student_course VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1);

-- 최종 조인 SELECT 문
SELECT
    s.first_name AS student_first,
    s.last_name AS student_last,
    c.name AS course_name,
    t.first_name AS teacher_first,
    t.last_name AS teacher_last
FROM student s
JOIN student_course sc ON s.id = sc.student_id
JOIN course c ON sc.course_id = c.id
JOIN teacher t ON c.teacher_id = t.id
ORDER BY s.id, c.id;
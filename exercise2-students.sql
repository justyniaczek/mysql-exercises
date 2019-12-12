CREATE TABLE students(
id INT auto_increment NOT NULL,
first_name VARCHAR(20),

primary key (id)
);

CREATE TABLE papers(
id INT auto_increment NOT NULL,
title VARCHAR(100),
grade INT,
fk_idstudent INT,

PRIMARY KEY (id),
FOREIGN KEY (fk_idstudent) REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');
 
INSERT INTO papers (fk_idstudent , title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT 
	first_name, 
	IFNULL(title, "missing") AS title ,
    IFNULL(grade, 0) AS grade
FROM students
LEFT JOIN papers
	ON students.id = fk_idstudent;
    
SELECT
	first_name,
	IFNULL(AVG(grade), 0) AS average,
CASE 
	WHEN AVG(grade) >= 75 THEN "PASSING"
    ELSE "FAILING"
END AS passing_status
FROM students
LEFT JOIN papers
	ON  students.id= papers.fk_idstudent
GROUP BY students.id
ORDER BY grade DESC;

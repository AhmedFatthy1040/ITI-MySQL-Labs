CREATE DATABASE lab1;
USE lab1;

CREATE TABLE STUDENT (
	ID INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL
);

CREATE TABLE STUDENT_NUMBER (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    PhoneNumber VARCHAR(20) NOT NULL,
    StudentID INT ,
    FOREIGN KEY (StudentID) REFERENCES STUDENT(ID) ON DELETE CASCADE
);

CREATE TABLE SUBJECT (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    MaxScore INT NOT NULL
);

CREATE TABLE STUDENT_SUBJECT (
    StudentID INT,
    SubjectID INT,
    PRIMARY KEY (StudentID, SubjectID),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(ID) ON DELETE CASCADE,
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT(ID) ON DELETE CASCADE
);

CREATE TABLE EXAM (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    ExamDate DATE NOT NULL,
    Score INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES STUDENT(ID) ON DELETE CASCADE,
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT(ID) ON DELETE CASCADE
);

-- -----------Lab 1 Answers (Inserting 5 rows in each table) --------------------------------
INSERT INTO STUDENT (Name, Email, Address)
VALUES ('Ahmed Fatthi', 'ahmedfatthi1040@hotmail.com', 'Cairo, Egypt');

INSERT INTO STUDENT (FirstName, LastName, contact_info, BirthDate, Gender)
VALUES ('Mariam', 'Mazen', 'Cairo, Egypt|Gege@hotmail.com', '2003-09-06', 'female');

INSERT INTO STUDENT (Name, Email, Address)
VALUES ('Muhammed Fatthi', 'Muhammed@hotmail.com', 'Cairo, Egypt');

INSERT INTO STUDENT (Name, Email, Address)
VALUES ('Farghaly', 'Farghaly@gmail.com', 'Cairo, Egypt');

INSERT INTO STUDENT (Name, Email, Address)
VALUES ('Sword Fisher', 'swordfisher@hotmail.com', 'Cairo, Egypt');

INSERT INTO STUDENT (Name, Email, Address)
VALUES ('LoRaX', 'lorax@yahoo.com', 'Cairo, Egypt');

INSERT INTO STUDENT_NUMBER (PhoneNumber, StudentID)
VALUES ('01010799067', 1);

INSERT INTO STUDENT_NUMBER (PhoneNumber, StudentID)
VALUES ('01210799067', 2);

INSERT INTO STUDENT_NUMBER (PhoneNumber, StudentID)
VALUES ('01110799067', 3);

INSERT INTO STUDENT_NUMBER (PhoneNumber, StudentID)
VALUES ('01010729067', 4);

INSERT INTO STUDENT_NUMBER (PhoneNumber, StudentID)
VALUES ('01017799067', 5);

INSERT INTO SUBJECT (Name, Description, MaxScore)
VALUES ('Database Systems', 'Introduction to Database Systems', 100);

INSERT INTO SUBJECT (Name, Description, MaxScore)
VALUES ('HTML', 'Web Development', 85);

INSERT INTO SUBJECT (Name, Description, MaxScore)
VALUES ('C', 'Embedded Systemd', 63);

INSERT INTO SUBJECT (Name, Description, MaxScore)
VALUES ('Machine Learning', 'AI', 96);

INSERT INTO SUBJECT (Name, Description, MaxScore)
VALUES ('PHP', 'Back-End Development', 73);

INSERT INTO STUDENT_SUBJECT (StudentID, SubjectID)
VALUES (1, 1);

INSERT INTO STUDENT_SUBJECT (StudentID, SubjectID)
VALUES (2, 4);

INSERT INTO STUDENT_SUBJECT (StudentID, SubjectID)
VALUES (3, 5);

INSERT INTO STUDENT_SUBJECT (StudentID, SubjectID)
VALUES (4, 2);

INSERT INTO STUDENT_SUBJECT (StudentID, SubjectID)
VALUES (5, 3);


INSERT INTO EXAM (StudentID, SubjectID, ExamDate, Score)
VALUES (2, 4, '2011-02-06', 12);

INSERT INTO EXAM (StudentID, SubjectID, ExamDate, Score)
VALUES (3, 5, '2013-08-05', 98);

INSERT INTO EXAM (StudentID, SubjectID, ExamDate, Score)
VALUES (4, 2, '2012-08-06', 77);

INSERT INTO EXAM (StudentID, SubjectID, ExamDate, Score)
VALUES (5, 3, '2012-09-06', 23);

INSERT INTO EXAM (StudentID, SubjectID, ExamDate, Score)
VALUES (1, 1, '2012-08-06', 100);

-- --------------------------------------Lab 2 Answers ---------------------------------------
-- 1
ALTER TABLE STUDENT
ADD COLUMN Gender VARCHAR(10) NOT NULL;
-- 2
ALTER TABLE STUDENT
ADD COLUMN BirthDate DATE;
-- 3
ALTER TABLE STUDENT
ADD COLUMN FirstName VARCHAR(50) NOT NULL,
ADD COLUMN LastName VARCHAR(50) NOT NULL;

ALTER TABLE STUDENT
DROP COLUMN name;

-- 4
ALTER TABLE STUDENT
ADD COLUMN contact_info VARCHAR(200);

UPDATE STUDENT
SET contact_info = CONCAT(address, '|', email);

-- 5 (I added the foreign keys constraints with on delete cascade in my tables look at create table)

-- 6
UPDATE STUDENT
SET Gender = 'female'
WHERE ID = 3;

UPDATE STUDENT
SET BirthDate = '1995-07-15'
WHERE ID = 2;

UPDATE STUDENT
SET FirstName = 'Hassan',
    LastName = 'Okasha'
WHERE ID = 3;

UPDATE STUDENT
SET contact_info = 'Alex, Cairo|KIKO@gmail.com'
WHERE ID = 4;

-- 7
SELECT * FROM STUDENT;

-- 8
SELECT * FROM STUDENT WHERE Gender = 'male';

-- 9
SELECT * FROM STUDENT WHERE Gender = 'female';

-- 10
SELECT *
FROM STUDENT
WHERE BirthDate < '1992-10-01';

-- 11
SELECT *
FROM STUDENT
WHERE gender = 'male' AND BirthDate < '1991-10-01';

-- 12
SELECT Name, MaxScore
FROM SUBJECT
ORDER BY MaxScore;

-- 13
SELECT Name, MaxScore
FROM SUBJECT
ORDER BY MaxScore DESC
LIMIT 1;

-- 14
SELECT FirstName
FROM STUDENT
WHERE FirstName LIKE 'A%';

-- 15
SELECT COUNT(*)
FROM STUDENT
WHERE FirstName = 'Mohammed';

-- 16
SELECT gender, COUNT(*)
FROM STUDENT
GROUP BY gender;

-- 17
SELECT FirstName, COUNT(*)
FROM STUDENT
GROUP BY FirstName
HAVING COUNT(*) > 2;

-- 18
SELECT STUDENT.FirstName, EXAM.Score, SUBJECT.Name
FROM STUDENT
JOIN EXAM ON STUDENT.ID = EXAM.StudentID
JOIN SUBJECT ON EXAM.SubjectID = SUBJECT.ID;

-- 19
DELETE FROM EXAM
WHERE SubjectID = 1 AND Score < 50;
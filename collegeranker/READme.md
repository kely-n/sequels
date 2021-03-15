Hi, If you solve this problem, I will hire you.

An educational magazine publishes rankings of students and their colleges in a competition in building unmanned aerial vehicles (drones). Students who participated in the competition in different years, their ranking in the competition, and their colleges are contained in the following tables:

TABLE colleges
id INTEGER PRIMARY KEY
name VARCHAR(50) NOT NULL

TABLE students
id INTEGER PRIMARY KEY
name VARCHAR(50) NOT NULL
collegeId INTEGER REFERENCES college(id)

TABLE rankings
studentId INTEGER REFERENCES students(id)
ranking INTEGER NOT NULL
year INTEGER NOT NULL
Write a query that lists all colleges that have at least one student with a ranking between 1 and 3 (both inclusive), for the year 2015. The query should return:

• The college name.
• The rank of their best ranking student for 2015.
• The number of students who had rankings between 1 and 3 (both inclusive) for the year 2015.
Rank 1 is the best rank, rank 2 the second-best, and so on. More than one student can tie for a rank in a year.
-- Write only the SQL statement that solves the problem and nothing else

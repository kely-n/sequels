CREATE DATABASE  IF NOT EXISTS `eduMag`;



DROP TABLE IF EXISTS `colleges`;
CREATE TABLE `colleges` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO `colleges` VALUES (1,'collegeOne'),(2,'collegeTwo'),(3,'collegeThree'),(4,'collegeFour');



DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `colleges_id` int NOT NULL,
  PRIMARY KEY (`id`,`colleges_id`),
  KEY `fk_students_ colleges1_idx` (`colleges_id`),
  CONSTRAINT `fk_students_ colleges` FOREIGN KEY (`colleges_id`) REFERENCES `colleges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `students` VALUES (21,'john Hash',2),(22,'Mike Alex',1),(23,'Justin Mane',4),(24,'Erix Amerix',1),(25,'Major Micheal',3),(26,'Man Beast',2),(27,'Kelvin Everlast',3),(28,'Diana Lynn',4),(29,'John Mdibo',2),(30,'Chunk Miles',1),(31,'Hesbon Rule',2),(32,'Clinton Boss Baby',4),(33,'Weather Jullies',3),(34,'Mud Hons',1),(35,'Just Incase',3),(36,'Holy Seed',4),(37,'Lorry Willy',2),(38,'Cluster Queen',3),(39,'Ruby Lemon',4),(40,'Sweet Candy',1);




DROP TABLE IF EXISTS `rankings`;
CREATE TABLE `rankings` (
  `ranking` int NOT NULL,
  `year` int NOT NULL,
  `students_id` int NOT NULL,
  PRIMARY KEY (`ranking`,`students_id`),
  KEY `fk_rankings_students_idx` (`students_id`),
  CONSTRAINT `fk_rankings_students` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `rankings` VALUES (1,2015,23),(1,2015,30),(1,2013,31),(1,2015,36),(2,2017,22),(2,2015,24),(2,2016,25),(2,2015,29),(2,2015,32),(2,2015,35),(2,2015,37),(3,2015,27),(3,2015,38),(3,2017,40),(4,2015,21),(4,2015,28),(4,2015,33),(4,2015,39),(5,2015,26),(5,2014,34);

select
	g.collegename,
	count(*) as numberofstudents,
    MIN(g.ranking) as bestStudentRank,
    @yeardate as year
from(
SELECT
    r.ranking as ranking,
    s.name as studentname,
    c.name as collegename
FROM rankings r
inner join students s on
s.id = r.students_id
inner join colleges c on
c.id = s.colleges_id
where r.year = @yeardate and (r.ranking = 1 or r.ranking =2 or r.ranking = 3)
) as g  ,  (SELECT @yeardate:=2015) as n
group by g.collegename
;



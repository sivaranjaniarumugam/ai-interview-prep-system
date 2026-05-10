USE interview_db;

-- ── TABLES ──

CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS modules (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    module_name VARCHAR(100) NOT NULL,
    course_id BIGINT,
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE IF NOT EXISTS subtopics (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    subtopic_name VARCHAR(100) NOT NULL,
    module_id BIGINT,
    FOREIGN KEY (module_id) REFERENCES modules(id)
);

CREATE TABLE IF NOT EXISTS questions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    question_text VARCHAR(500) NOT NULL,
    option_a VARCHAR(200),
    option_b VARCHAR(200),
    option_c VARCHAR(200),
    option_d VARCHAR(200),
    correct_answer VARCHAR(5),
    subtopic_id BIGINT,
    FOREIGN KEY (subtopic_id) REFERENCES subtopics(id)
);

CREATE TABLE IF NOT EXISTS results (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    course_id BIGINT,
    subtopic_id BIGINT,
    score INT,
    total_marks INT,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- ── COURSES ──

INSERT INTO courses VALUES (1, 'Java Full Stack');
INSERT INTO courses VALUES (2, 'Python Full Stack');
INSERT INTO courses VALUES (3, 'Data Science');
INSERT INTO courses VALUES (4, 'DevOps');

-- ── MODULES ──

-- Java Full Stack Modules
INSERT INTO modules VALUES (1, 'SQL', 1);
INSERT INTO modules VALUES (2, 'Backend - Java & Spring Boot', 1);
INSERT INTO modules VALUES (3, 'Frontend', 1);

-- Python Full Stack Modules
INSERT INTO modules VALUES (4, 'Python Basics', 2);
INSERT INTO modules VALUES (5, 'Django Backend', 2);
INSERT INTO modules VALUES (6, 'Frontend', 2);

-- Data Science Modules
INSERT INTO modules VALUES (7, 'Python for Data Science', 3);
INSERT INTO modules VALUES (8, 'Machine Learning', 3);
INSERT INTO modules VALUES (9, 'Data Visualization', 3);

-- DevOps Modules
INSERT INTO modules VALUES (10, 'Linux', 4);
INSERT INTO modules VALUES (11, 'Docker', 4);
INSERT INTO modules VALUES (12, 'CI/CD', 4);

-- ── SUBTOPICS ──

-- SQL Subtopics
INSERT INTO subtopics VALUES (1, 'SQL Basics', 1);
INSERT INTO subtopics VALUES (2, 'Joins', 1);
INSERT INTO subtopics VALUES (3, 'Aggregate Functions', 1);

-- Backend Subtopics
INSERT INTO subtopics VALUES (4, 'OOPs', 2);
INSERT INTO subtopics VALUES (5, 'Inheritance', 2);
INSERT INTO subtopics VALUES (6, 'Exception Handling', 2);
INSERT INTO subtopics VALUES (7, 'Spring Boot Basics', 2);
INSERT INTO subtopics VALUES (8, 'REST APIs', 2);

-- Frontend Subtopics
INSERT INTO subtopics VALUES (9, 'HTML', 3);
INSERT INTO subtopics VALUES (10, 'CSS', 3);
INSERT INTO subtopics VALUES (11, 'JavaScript', 3);
INSERT INTO subtopics VALUES (12, 'React', 3);

-- ── QUESTIONS ──

-- SQL Basics (subtopic 1)
INSERT INTO questions VALUES
(1,'What does SQL stand for?','Structured Query Language','Simple Query Language','Strong Query Language','None','A',1),
(2,'Which command retrieves data?','INSERT','UPDATE','SELECT','DELETE','C',1),
(3,'Which command adds new data?','SELECT','INSERT','DROP','ALTER','B',1),
(4,'Which command removes a table?','DELETE','TRUNCATE','DROP','REMOVE','C',1),
(5,'What is a Primary Key?','Duplicate identifier','Unique row identifier','Foreign key','None','B',1),
(6,'What is a Foreign Key?','Links two tables','Primary key','Index','None','A',1),
(7,'What does WHERE clause do?','Groups data','Filters records','Sorts data','None','B',1),
(8,'What does ORDER BY do?','Filters data','Groups data','Sorts results','None','C',1),
(9,'What is NULL in SQL?','Zero value','Empty string','No value/unknown','None','C',1),
(10,'What does DISTINCT do?','Removes duplicates','Adds duplicates','Groups data','None','A',1);

-- Joins (subtopic 2)
INSERT INTO questions VALUES
(11,'What does INNER JOIN return?','All rows from left','Matching rows from both tables','All rows from right','None','B',2),
(12,'What does LEFT JOIN return?','Only right table rows','All left table rows with matching right','Only matching rows','None','B',2),
(13,'What does RIGHT JOIN return?','All right table rows','All left table rows','Only matching rows','None','A',2),
(14,'What does FULL OUTER JOIN return?','Only matching rows','All rows from both tables','None','Left rows only','B',2),
(15,'CROSS JOIN returns?','Matching rows','Cartesian product of both tables','Left rows','None','B',2);

-- OOPs (subtopic 4)
INSERT INTO questions VALUES
(16,'What is OOPs?','Object Oriented Programming','Only Orange Products','Old Oriented','None','A',4),
(17,'What are the 4 pillars of OOPs?','Encapsulation,Inheritance,Polymorphism,Abstraction','Only Inheritance','Encapsulation only','None','A',4),
(18,'What is Encapsulation?','Hiding data inside a class','Inheriting class','Creating objects','None','A',4),
(19,'What is Abstraction?','Showing only essential details','Hiding nothing','Inheriting','None','A',4),
(20,'What is Polymorphism?','One name multiple forms','Only one form','Creating objects','None','A',4),
(21,'What is a Class?','Blueprint for objects','An object','A method','None','A',4),
(22,'What is an Object?','Instance of a class','A method','A variable','None','A',4),
(23,'What is a Constructor?','Method called when object created','Returns value','A variable','None','A',4),
(24,'What is Method Overloading?','Same name different parameters','Same parameters','Inheritance','None','A',4),
(25,'What is Method Overriding?','Child redefines parent method','Same class methods','Constructors','None','A',4);

-- Inheritance (subtopic 5)
INSERT INTO questions VALUES
(26,'What is Inheritance?','Child gets properties of parent','Copying code','Creating objects','None','A',5),
(27,'Which keyword is used for inheritance?','implements','extends','inherits','super','B',5),
(28,'What is Single Inheritance?','One child one parent','Multiple parents','Multiple children','None','A',5),
(29,'What is Multilevel Inheritance?','A→B→C chain','Multiple parents','None','Single only','A',5),
(30,'What is the use of super keyword?','Call parent class method','Call child method','Create object','None','A',5);

-- Exception Handling (subtopic 6)
INSERT INTO questions VALUES
(31,'What is an Exception?','Runtime error','Compile error','Syntax error','None','A',6),
(32,'Which block handles exceptions?','try-catch','if-else','for loop','None','A',6),
(33,'What does finally block do?','Always executes','Only on error','Never executes','None','A',6),
(34,'What is NullPointerException?','Accessing null object reference','Array error','Type error','None','A',6),
(35,'What is ArithmeticException?','Math error like divide by zero','Null error','Array error','None','A',6);

-- Spring Boot Basics (subtopic 7)
INSERT INTO questions VALUES
(36,'What is Spring Boot?','Java framework for REST APIs','Database tool','Frontend framework','None','A',7),
(37,'What annotation marks a Spring Boot class?','@Component','@SpringBootApplication','@Entity','@Controller','B',7),
(38,'What is application.properties used for?','Configure database and server','Write Java code','Create tables','None','A',7),
(39,'Default port of Spring Boot?','8000','3000','8080','5000','C',7),
(40,'What is @RestController?','Marks class as REST API controller','Database class','Service class','None','A',7);

-- REST APIs (subtopic 8)
INSERT INTO questions VALUES
(41,'What is REST?','Representational State Transfer','Random State Transfer','None','Real State','A',8),
(42,'Which HTTP method retrieves data?','POST','PUT','GET','DELETE','C',8),
(43,'Which HTTP method creates data?','GET','POST','PUT','DELETE','B',8),
(44,'Which HTTP method updates data?','GET','POST','PUT','DELETE','C',8),
(45,'Which HTTP method deletes data?','GET','POST','PUT','DELETE','D',8);

-- HTML (subtopic 9)
INSERT INTO questions VALUES
(46,'What does HTML stand for?','HyperText Markup Language','High Text Language','None','Hyper Transfer','A',9),
(47,'Which tag creates a heading?','<p>','<h1>','<div>','<span>','B',9),
(48,'Which tag creates a paragraph?','<h1>','<div>','<p>','<span>','C',9),
(49,'Which tag creates a link?','<img>','<a>','<p>','<div>','B',9),
(50,'Which tag creates an image?','<img>','<a>','<p>','<div>','A',9);

-- CSS (subtopic 10)
INSERT INTO questions VALUES
(51,'What does CSS stand for?','Cascading Style Sheets','Creative Style Sheets','None','Computer Style','A',10),
(52,'Which property changes text color?','background','color','font-size','margin','B',10),
(53,'Which property changes background?','color','background-color','font','padding','B',10),
(54,'What is the box model?','Content+Padding+Border+Margin','Only content','Color model','None','A',10),
(55,'Which property makes flex container?','display:block','display:flex','display:grid','None','B',10);

-- JavaScript (subtopic 11)
INSERT INTO questions VALUES
(56,'What is JavaScript?','Programming language for web','Database language','Backend only','None','A',11),
(57,'Which keyword declares a variable?','int','String','var/let/const','None','C',11),
(58,'What is a function?','Reusable block of code','A variable','A loop','None','A',11),
(59,'What does === mean?','Assignment','Strict equality','Not equal','None','B',11),
(60,'What is an array?','Collection of values','Single value','Object','None','A',11);

-- React (subtopic 12)
INSERT INTO questions VALUES
(61,'What is React?','JavaScript library for UI','Backend framework','Database tool','None','A',12),
(62,'What is a Component?','Reusable UI piece','A variable','A function','None','A',12),
(63,'What is JSX?','JavaScript + XML syntax','Java XML','JSON','None','A',12),
(64,'What is useState?','Hook to manage state','A method','A class','None','A',12),
(65,'What is props?','Data passed to component','State','Hook','None','A',12);

-- ── PYTHON FULL STACK QUESTIONS ──

-- Python Basics (subtopic 13)
INSERT INTO subtopics VALUES (13, 'Python Basics', 4);
INSERT INTO subtopics VALUES (14, 'Python OOPs', 4);
INSERT INTO subtopics VALUES (15, 'Django Basics', 5);
INSERT INTO subtopics VALUES (16, 'Django REST API', 5);
INSERT INTO subtopics VALUES (17, 'HTML & CSS', 6);
INSERT INTO subtopics VALUES (18, 'JavaScript', 6);

-- Python Basics Questions
INSERT INTO questions VALUES
(66,'What is Python?','High level programming language','Database tool','Frontend framework','None','A',13),
(67,'Which symbol is used for comments in Python?','//','/*','#','--','C',13),
(68,'How to print in Python?','console.log()','System.out.println()','print()','echo','C',13),
(69,'What is indentation in Python?','Spaces to define blocks','Comment style','Variable name','None','A',13),
(70,'Which keyword defines a function?','function','def','void','fun','B',13),
(71,'What is a List in Python?','Ordered mutable collection','Fixed collection','Key-value pairs','None','A',13),
(72,'What is a Tuple?','Ordered immutable collection','Mutable list','Dictionary','None','A',13),
(73,'What is a Dictionary?','Key-value pair collection','Ordered list','Tuple','None','A',13),
(74,'What does len() do?','Returns length of object','Prints value','Deletes object','None','A',13),
(75,'What is a Set in Python?','Unordered unique elements','Ordered list','Dictionary','None','A',13);

-- Python OOPs Questions
INSERT INTO questions VALUES
(76,'How to define a class in Python?','def class','class ClassName:','Class ClassName','None','B',14),
(77,'What is self in Python?','Reference to current object','A variable','A method','None','A',14),
(78,'What is __init__?','Constructor method','Destructor','Static method','None','A',14),
(79,'How to inherit in Python?','class Child(Parent):','Child extends Parent','Child inherits Parent','None','A',14),
(80,'What is super() in Python?','Calls parent class method','Calls child method','Creates object','None','A',14),
(81,'What is method overriding?','Child redefines parent method','Same class methods','None','Constructors','A',14),
(82,'What is encapsulation in Python?','Using __ prefix for private','Public methods','None','Inheritance','A',14),
(83,'What is a decorator?','Modifies function behavior','A class','A loop','None','A',14),
(84,'What does @staticmethod do?','Creates static method','Creates object','Inherits class','None','A',14),
(85,'What is polymorphism in Python?','Same method different behavior','One behavior','None','Inheritance','A',14);

-- Django Basics Questions
INSERT INTO questions VALUES
(86,'What is Django?','Python web framework','JavaScript framework','Database tool','None','A',15),
(87,'What is MVT in Django?','Model View Template','Model View Controller','None','Model View Table','A',15),
(88,'What is models.py used for?','Define database tables','Write views','Create URLs','None','A',15),
(89,'What is views.py used for?','Handle HTTP requests','Define models','Create templates','None','A',15),
(90,'What is urls.py used for?','Map URLs to views','Define models','Handle requests','None','A',15),
(91,'Which command creates Django project?','django-admin startproject','django start','python create','None','A',15),
(92,'Which command creates Django app?','python manage.py startapp','django startapp','create app','None','A',15),
(93,'What is migrations in Django?','Sync models to database','Create views','Write URLs','None','A',15),
(94,'Which command runs Django server?','python manage.py runserver','django run','python start','None','A',15),
(95,'What is Django ORM?','Interact with DB using Python','SQL only tool','None','Frontend tool','A',15);

-- Django REST API Questions
INSERT INTO questions VALUES
(96,'What is Django REST Framework?','Build REST APIs with Django','Frontend tool','Database tool','None','A',16),
(97,'What is a Serializer?','Converts model to JSON','Creates models','Handles URLs','None','A',16),
(98,'What is a ViewSet?','Handles CRUD operations','Creates templates','Maps URLs','None','A',16),
(99,'What is authentication in DRF?','Verify user identity','Create models','Handle requests','None','A',16),
(100,'What is pagination in DRF?','Split large data into pages','Delete data','Create URLs','None','A',16);

-- ── DATA SCIENCE QUESTIONS ──

INSERT INTO subtopics VALUES (19, 'Python for Data Science', 7);
INSERT INTO subtopics VALUES (20, 'NumPy & Pandas', 7);
INSERT INTO subtopics VALUES (21, 'Machine Learning Basics', 8);
INSERT INTO subtopics VALUES (22, 'ML Algorithms', 8);
INSERT INTO subtopics VALUES (23, 'Data Visualization', 9);

-- Python for Data Science Questions
INSERT INTO questions VALUES
(101,'What is NumPy used for?','Numerical computations','Web development','Database operations','None','A',19),
(102,'What is Pandas used for?','Data manipulation and analysis','Web scraping','Image processing','None','A',19),
(103,'What is a DataFrame?','2D tabular data structure','1D array','3D matrix','None','A',19),
(104,'What is a Series in Pandas?','1D labeled array','2D table','3D array','None','A',19),
(105,'Which library is used for visualization?','NumPy','Pandas','Matplotlib','SciKit','C',19),
(106,'What is data cleaning?','Fixing missing/incorrect data','Creating models','Visualizing data','None','A',19),
(107,'What is a missing value?','NaN or null in dataset','Zero value','Negative value','None','A',19),
(108,'What does dropna() do?','Removes rows with NaN','Adds rows','Updates values','None','A',19),
(109,'What does fillna() do?','Fills NaN with given value','Drops NaN','Creates columns','None','A',19),
(110,'What is feature engineering?','Creating new features from data','Removing features','Visualizing data','None','A',19);

-- NumPy & Pandas Questions
INSERT INTO questions VALUES
(111,'What is a NumPy array?','Multi-dimensional array','Python list','Dictionary','None','A',20),
(112,'What does shape attribute return?','Dimensions of array','Size of array','Data type','None','A',20),
(113,'What does reshape() do?','Changes array dimensions','Sorts array','Deletes array','None','A',20),
(114,'What is broadcasting in NumPy?','Operations on different shaped arrays','Printing arrays','Copying arrays','None','A',20),
(115,'What does merge() do in Pandas?','Combines two DataFrames','Splits DataFrame','Deletes rows','None','A',20);

-- Machine Learning Basics Questions
INSERT INTO questions VALUES
(116,'What is Machine Learning?','Systems learn from data','Manual programming','Database tool','None','A',21),
(117,'What is supervised learning?','Learning with labeled data','Learning without labels','Reinforcement','None','A',21),
(118,'What is unsupervised learning?','Learning without labeled data','Learning with labels','None','Reinforcement','A',21),
(119,'What is training data?','Data used to train model','Test data','Validation data','None','A',21),
(120,'What is overfitting?','Model memorizes training data','Model generalizes well','None','Underfitting','A',21),
(121,'What is underfitting?','Model too simple to learn','Model too complex','None','Overfitting','A',21),
(122,'What is accuracy?','Correct predictions / total','Wrong predictions','None','Total predictions','A',21),
(123,'What is a feature?','Input variable for model','Output variable','Label','None','A',21),
(124,'What is a label?','Output/target variable','Input variable','Feature','None','A',21),
(125,'What is cross validation?','Technique to evaluate model','Training method','None','Testing method','A',21);

-- ML Algorithms Questions
INSERT INTO questions VALUES
(126,'What is Linear Regression?','Predicts continuous values','Classifies data','Clusters data','None','A',22),
(127,'What is Logistic Regression?','Binary classification algorithm','Regression algorithm','Clustering','None','A',22),
(128,'What is Decision Tree?','Tree-like model for decisions','Linear model','Clustering','None','A',22),
(129,'What is Random Forest?','Ensemble of decision trees','Single tree','Linear model','None','A',22),
(130,'What is K-Means?','Clustering algorithm','Classification','Regression','None','A',22);

-- Data Visualization Questions
INSERT INTO questions VALUES
(131,'What is Matplotlib?','Python plotting library','Database tool','Web framework','None','A',23),
(132,'What is Seaborn?','Statistical visualization library','Web framework','Database','None','A',23),
(133,'What is a histogram?','Shows frequency distribution','Shows relationships','Shows trends','None','A',23),
(134,'What is a scatter plot?','Shows relationship between 2 variables','Frequency chart','Trend line','None','A',23),
(135,'What is a heatmap?','Shows correlation matrix visually','Bar chart','Pie chart','None','A',23);

-- ── DEVOPS QUESTIONS ──

INSERT INTO subtopics VALUES (24, 'Linux Basics', 10);
INSERT INTO subtopics VALUES (25, 'Linux Commands', 10);
INSERT INTO subtopics VALUES (26, 'Docker Basics', 11);
INSERT INTO subtopics VALUES (27, 'Docker Commands', 11);
INSERT INTO subtopics VALUES (28, 'CI/CD Basics', 12);
INSERT INTO subtopics VALUES (29, 'Jenkins', 12);

-- Linux Basics Questions
INSERT INTO questions VALUES
(136,'What is Linux?','Open source operating system','Database','Web framework','None','A',24),
(137,'What is a kernel?','Core of operating system','A file','A folder','None','A',24),
(138,'What is a shell?','Interface to interact with OS','A file','A database','None','A',24),
(139,'What is a process?','Running program instance','A file','A folder','None','A',24),
(140,'What is root user?','Superuser with all permissions','Normal user','Guest user','None','A',24);

-- Linux Commands Questions
INSERT INTO questions VALUES
(141,'What does ls command do?','Lists files and directories','Creates file','Deletes file','None','A',25),
(142,'What does cd command do?','Changes directory','Creates directory','Deletes directory','None','A',25),
(143,'What does mkdir do?','Creates new directory','Deletes directory','Lists files','None','A',25),
(144,'What does rm do?','Removes files or directories','Creates files','Lists files','None','A',25),
(145,'What does chmod do?','Changes file permissions','Creates files','Deletes files','None','A',25),
(146,'What does grep do?','Searches for patterns in files','Creates files','Deletes files','None','A',25),
(147,'What does pwd do?','Shows current directory path','Creates directory','Deletes files','None','A',25),
(148,'What does cp do?','Copies files or directories','Moves files','Deletes files','None','A',25),
(149,'What does mv do?','Moves or renames files','Copies files','Deletes files','None','A',25),
(150,'What does cat do?','Displays file contents','Deletes file','Creates file','None','A',25);

-- Docker Basics Questions
INSERT INTO questions VALUES
(151,'What is Docker?','Containerization platform','Virtual machine','Database tool','None','A',26),
(152,'What is a container?','Lightweight isolated environment','Virtual machine','Database','None','A',26),
(153,'What is a Docker image?','Blueprint for containers','Running container','Database','None','A',26),
(154,'What is Dockerfile?','Script to build Docker image','Container itself','Database file','None','A',26),
(155,'What is Docker Hub?','Registry for Docker images','Container itself','Database','None','A',26),
(156,'What is docker-compose?','Tool to run multiple containers','Single container tool','Database tool','None','A',26),
(157,'What is a volume in Docker?','Persistent data storage','Temporary storage','Network','None','A',26),
(158,'What is a network in Docker?','Communication between containers','Storage','Image','None','A',26),
(159,'What does FROM do in Dockerfile?','Specifies base image','Runs command','Copies files','None','A',26),
(160,'What does RUN do in Dockerfile?','Executes command during build','Copies files','Sets environment','None','A',26);

-- Docker Commands Questions
INSERT INTO questions VALUES
(161,'Which command builds Docker image?','docker run','docker build','docker start','docker pull','B',27),
(162,'Which command runs a container?','docker build','docker run','docker start','docker push','B',27),
(163,'Which command lists containers?','docker images','docker ps','docker run','docker start','B',27),
(164,'Which command stops a container?','docker run','docker kill','docker stop','docker pause','C',27),
(165,'Which command pulls an image?','docker push','docker run','docker pull','docker build','C',27);

-- CI/CD Basics Questions
INSERT INTO questions VALUES
(166,'What is CI/CD?','Continuous Integration and Deployment','Code Integration','None','Container Integration','A',28),
(167,'What is Continuous Integration?','Automatically build and test code','Manual testing','None','Deployment only','A',28),
(168,'What is Continuous Deployment?','Automatically deploy to production','Manual deployment','None','Testing only','A',28),
(169,'What is a pipeline?','Automated sequence of steps','Single step','Manual process','None','A',28),
(170,'What is Git in CI/CD?','Version control for code','Database','Server','None','A',28);

-- Jenkins Questions
INSERT INTO questions VALUES
(171,'What is Jenkins?','Open source CI/CD automation tool','Database','Web framework','None','A',29),
(172,'What is a Jenkins job?','Automated task in Jenkins','Manual task','Database','None','A',29),
(173,'What is a Jenkins pipeline?','Automated workflow in Jenkins','Manual workflow','Database','None','A',29),
(174,'What is a Jenkinsfile?','Script defining pipeline steps','Configuration file','Database file','None','A',29),
(175,'What are Jenkins plugins?','Extend Jenkins functionality','Core features','Database tools','None','A',29);

show tables;
select * from users;
select * from courses;
select * from questions;

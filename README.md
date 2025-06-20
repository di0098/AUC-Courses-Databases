# AUC-Courses-Databases

Scope of this Project

One of the challenges that are faced by AUC students while planning for their course registration is knowing in advance which courses are offered at which semester, getting a comprehensive description of the course and more importantly, its prerequisites. 
Such information is available through the AUC catalog system. However, the information can be extracted for a single course at a time through the course number / name. So, it is usually a cumbersome process to check it course by course. In addition, the students don’t have a systematic way of knowing which courses are available for them given the ones they already took, whether it will be offered next semester or not, and what’s the reviews of other students on the course if it is outside their specialization (like the core courses for example)
In this project, you will be building a database system backend and an application that provide the students with the features discussed above



Milestone I: 
The database system designed is based on the current American Universty in Cairo (AUC) catalog to be found at (http://catalog.aucegypt.edu/content.php?catoid=36&navoid=1738) 
The database design  stores information about each course offered in AUC, including the department offering the course, the course number, name, number of credits, description, any notes associated with it, the semesters it is offered at, and its prerequisite courses. For the prerequisites, it states if they are allowed concurrently or not. Finally, the system also links cross-listed courses. 

The system is able to store basic information about the students, including their AUC ID, name, department, grade, and the courses they have already finished along with their letter grades in these courses. 

The system  stores the student reviews for each course, including the actual term they took it in, their rating of the course (1-5), the actual textual review and whether the review is verified or not (based on cross checking the student’s records / past 

Milestone II: 
A web crawler is written to crawl the pages from the AUC catalog (http://catalog.aucegypt.edu/content.php?catoid=36&navoid=1738) for all courses in all departments, parse the HTML crawled and extract the relevant fields for populating the non-student tables in your schema.
At the end of this milestone, all  non-student tables are populated with the extracted data. For the student tables,it is based on my own course history during university with dummy student ID


Milestone III: Application Layer
Designed a client application that is capable of connecting to the database hosted on MySQL server. The application have the following functionalities:
Add a new student review on a course
View existing reviews on a given course
Add a student’s record
Add a record to the student’s course history
Show the student all the available course in a given semester that s/he can enroll in based on the prerequisites s/he already passed with a grade > D
View a course’s information





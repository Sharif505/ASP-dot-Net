create table Tutors 
(
	TutorId int identity primary key,
	TutorName nvarchar(40) not null,
	TutorEmail nvarchar(40) not null,
	TutorPhone nvarchar(20) not null
)
GO
create table Students
(
	StudentId int identity primary key,
	StudentName nvarchar(40) not null,
	StudentEmail nvarchar(40) not null,
	StudentPhone nvarchar(20) not null,
	Picture nvarchar(150) not null
)
GO
create table Courses 
(
	CourseId int identity primary key,
	CourseName nvarchar(40) not null,
	DurationInWeek int not null,
	Fee money not null,
	Available bit,
	TutorId int not null references tutors (tutorid)
)
go
Create table Tsp
(
	TspId int identity primary key,
	TspName varchar(50) not null,
	TutorId int references tutors(tutorid),
	StudentId int references students(studentid)
	
)
create table Enrollments
(
	StudentId int not null references students(StudentId),
	CourseId int not null references courses(CourseId),
	Enrolldate date not null,
	primary key (StudentId, CourseId)
)
GO
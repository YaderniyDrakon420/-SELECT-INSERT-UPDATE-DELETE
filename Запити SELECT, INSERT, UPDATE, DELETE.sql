--CREATE DATABASE Academy

--USE Academy

CREATE TABLE Groups(
	ID int primary key identity not null,
	Namme nvarchar(10) not null unique CHECK (Len(Namme) > 0),
	Rating int not null CHECK (Rating BETWEEN 0 AND 5),
	Year int not null CHECK (Year BETWEEN 1 AND 5)
	);

CREATE TABLE Departments(
	ID int primary key identity not null,
	Financing money not null DEFAULT 0 CHECK (Len(Financing) >= 0),
	Namme nvarchar(100) not null unique CHECK (Len(Namme) > 0),
	);

CREATE TABLE Faculties(
	ID int primary key identity not null,
	Namme nvarchar(100) not null unique CHECK (Len(Namme) > 0),
	Dean nvarchar(max) not null CHECK (Len(Dean) > 0)
	);

	CREATE TABLE Teachers(
	ID int primary key identity not null,
	EmploymentDate date not null CHECK (EmploymentDate >= '1990-01-01'),
	IsAssistant bit not null DEFAULT 0,
	IsProfessor bit not null  DEFAULT 0,
	Namme nvarchar(max) not null CHECK (Len(Namme) > 0),
	Position nvarchar(max) not null CHECK (Len(Position) > 0),
	Premium money not null DEFAULT 0 CHECK (Premium >= 0),
	Salary money not null CHECK (Salary > 0),
	Surname nvarchar(max) not null CHECK (Len(Surname) > 0)
	);

	SELECT Namme, Financing, ID FROM Departments;
	SELECT Namme AS [Group Name], Rating AS [Group Rating] FROM Groups;
	SELECT 'The dean of faculty ' + Namme + ' is ' + Dean + '.' FROM Faculties;
	SELECT Surname FROM Teachers WHERE IsProfessor = 1 AND Salary > 1050;
	SELECT Namme FROM Departments WHERE Financing < 11000 OR Financing > 25000;
	SELECT Namme FROM Faculties WHERE Namme <> 'Computer Science';
	SELECT Surname, Position FROM Teachers WHERE IsProfessor = 0;
	SELECT Surname, Position, Salary, Premium FROM Teachers WHERE IsAssistant = 1 AND Premium BETWEEN 160 AND 550;
	SELECT Surname, Salary FROM Teachers WHERE IsAssistant = 1;
	SELECT Surname, Position FROM Teachers WHERE EmploymentDate < '01.01.2000';
	SELECT Namme AS [Name of Department] FROM Departments WHERE Namme < 'Software Development';
	SELECT Namme FROM Teachers WHERE IsAssistant = 1 AND (Salary + Premium) <= 1200;
	SELECT Namme FROM Groups WHERE Year = 5 AND Rating BETWEEN 2 AND 4;
	SELECT Surname FROM Teachers WHERE IsAssistant = 1 AND Salary < 550 OR Premium < 200;






create database Course


create table Countries(

[Id] int primary key identity(1,1),
[Name] nvarchar(50),
)


create table Cities(

[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[CountryId] int foreign key references Countries(Id)

)




insert into Countries([Name])

Values('Azerbaijan'),
('Turkey'),
('Georiga')
('Germany'),



insert into Cities([Name],[CountryId])

Values ('Baku',1),
('Sumqayit',1),
('Tovuz',1),
('Ganja',1),
('Instanbul',2),
('Bursa',2),
('Ankara',2),
('Konya',2),
('Batumi',3),
('Tbilisi',3),
('Rustavi',3),
('Kutaisi',3),
('Berlin',4),
('Frankurt',4),
('Hamburg',4),
('Munich',4)




create table Students(

[Id] int primary key identity(1,1),
[Name] nvarchar (50) not null,
[Surname] nvarchar(50),
[Age] int,
[Address] nvarchar(200) default 'XXX',
[CityId] int foreign key references Cities(Id)

)

insert into Students( [Name],[Surname],[Age],[Address],[CityId])

values('Elcan','Qurbanov',27,'Xirdalan',1),
('Anar','Balacayev',22,'Nizami',1),
('Roya','Mehheremova',27,'Ehmedli',1),
('Pervin','Rehimli',25,'Hovsan',1),
('Mirze','Aliyev',27,'Bulbule',1),
('Cavid','Beshirov',29,'Ehmedli',1)




create table WeekDays(
[Id] int primary key identity(1,1),
[Name] nvarchar (50) not null
)


insert into Weekdays([Name])

values('Monday'),
('Tuesday'),
('Wednesday'),
('Thursday'),
('Friday'),
('Saturday'),
('Sunday')



create table Seanses(
[Id] int primary key identity(1,1),
[Name] nvarchar (50) not null
)





 insert into Seanses([Name])
 values('Dawn'),
 ('Afternoon'),
 ('Evening')


create table WeekDaySeans(
[Id] int primary key identity(1,1),
[WeekdayId] int foreign key references WeekDays(Id),
[SeansId] int foreign key references Seanses(Id)
)



insert into WeekDaySeans([WeekdayId],[SeansId])

values (1,1),
(2,1),
(3,1),
(4,1)


select * from WeekDaySeans


create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar (50) not null,
[Capacity] int

)


 insert into Rooms([Name],[Capacity])

 values('Saturn',20),
 ('Neptune',25),
 ('Venus',20),
 ('Uranus',20),
 ('Jupiter',22)


 create table Educations(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Duration] int 
)
    

insert into Educations([Name], [Duration])
values ('Full Stack Developer', 6),
('UI/UX Designer', 6),
('3D Digital Design', 6),
('Digital Marketing', 6),
('Graphic Designer', 6)


create table Teachers(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(50),
[Email] nvarchar(100) unique,
[Address] nvarchar(100),
[Salary] decimal,
[CityId] int foreign key references Cities(Id)
)

insert into Teachers([Name],[Surname],[Email],[Address],[Salary],[CityId])

values('Elcan','Qurbanov','elcan@gmail.com','Hovsan',5000,1),
('Cavid','Beshirov','cavid@gmail.com','Ehmedli',8000,1),
('Aqshin','Hummatov','aqsin@gmail.com','Xirdalan',7000,1),
('Mirze','Beshirzade','mirze@gmail.com','Bulbule',6000,1),
('Cahandar','Velibeyli','cahandar@gmail.com','Hovsan',6000,1)




create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[EducationId] int foreign key references Educations(Id),
[RoomId] int foreign key references Rooms(Id),
[WeekDaySeansId] int foreign key references WeekDaySeans(Id),
)


insert into Groups([Name],[EducationId],[RoomId],[WeekDaySeansId])


values('P135',1,2,1),
('P133',1,2,2),
('W212',1,3,1)



create table GroupTeachers(
[Id] int primary key identity(1,1),
[GroupId] int foreign key references Groups(Id),
[TeacherId] int foreign key references Teachers(Id),
)


insert into GroupTeachers([GroupId],[TeacherId])

values(1,2),
(2,1),
(3,1)


create table GroupStudents(
[Id] int primary key identity(1,1),
[GroupId] int foreign key references Groups(Id),
[StudentId] int foreign key references Students(Id),
)



insert into GroupStudents([GroupId],[StudentId])

values(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7)

create table Roles(

[Id] int primary key identity(1,1),
[Name] nvarchar(255)

)



insert into Roles([Name])

values('Reception'),
('Security'),
('Director'),
('Manager'),
('Accountant'),
('Students coordinator')




create table StaffMebers(

[Id] int primary key identity(1,1),
[Name] nvarchar (100) not null,
[Surname] nvarchar(100),
[Salary] decimal,
[CityId] int foreign key references Cities(Id),

)


insert into StaffMebers([Name],[Surname],[Salary],[CityId])

values('Elsen','Abbasov',2000,1),
('Lale','Hesenova',1000,1),
('Elmar','Namazov',1100,1),
('Xeyal','Ceferov',1500,1),
('Nezrin','Isgenderova',2500,1),
('Ulvi','Hesenov',1100,1),
('Amil','Memmedov',800,1),
('Gulnar','Qurbanova',600,1),
('Fidan','Qasimli',2500,1),
('Aysu','Hesenova',2200,1)


create table RoleMebers (

[Id] int primary key identity(1,1),
[RoleId] int foreign key references Roles(Id),
[MemberId] int foreign key references StaffMebers(Id),

)

insert into RoleMebers([RoleId],[MemberId])

values(6,2),
(6,3),
(5,1),
(2,4),
(1,6),
(3,7),
(4,8)





















select * from Roles


select * from Educations
select * from WeekDaySeans

















 







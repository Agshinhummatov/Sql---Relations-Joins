










create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(100) not null
)




insert into Countries([Name])

Values('Azerbaijan'),
('Turkey'),
('Georiga'),
('Germany')

create table Cities(

[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[CountryId] int foreign key references Countries(Id)

)


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



create table Employees(
[Id] int primary key identity(1,1),
[Name] nvarchar(100) not null,
[Surname] nvarchar(200) ,
[Age] int,
[Salary] decimal,
[Position] nvarchar(100),
[IsDeleted] bit NOT NULL DEFAULT 0,
[CityId] int foreign key references Cities(Id)
)

select * from Employees


insert into Employees([Name],[Surname],[Age],[Salary],[Position],[IsDeleted],[CityId])

values('Cianre','Hasanova',22,1500,'Reseption',1,1),
('Samir','Abbasov',25,1200,'Reseption',1,1),
 ('Cavid','Bashirov',22,3500,'Director',1,1),
('Aqsin','Hummatov',27,3000,'Manager',1,1),
('Elcan','Qurbanov',20,1000,'Secrutery',1,1),
('Roya','Meherremova',27,1000,'Hostes',0,1),
('Konul','Ibrahimova',20,1000,'Hostes',1,1),
('Elnare','Hesenova',24,2300,'Manager',1,1),
('Feride','Mustafazade',26,2800,'Accountant',1,1),
('Elsen','Islamov',26,2800,'Accountant',1,1)









 --Ishcilerin ozlerini, yashadiqi sheherlerini ve olkelerini gosterin.


select em.Name, em.Surname,ct.name, co.Name from Employees em
inner join Cities ct
on em.CityId = ct.Id
inner join Countries co
on co.Id = ct.CountryId


 --Maashi 2000-den yuxari olan ishcilerin adlari ve yashadiqi olkeleri gosterin.


select em.Name, co.Name from Employees em
inner join Cities ct
on em.CityId = ct.Id
inner join Countries co
on co.Id = ct.CountryId
where em.Salary > 2000


--Hansi sheherin hansi olkeye aid olduqunu gosterin


select ct.Name, co.Name from Cities ct
inner join Countries co
on ct.CountryId = co.Id


--Positioni "Reseption" olan ishcilerin table-larin id-leri daxil olmamaq sherti ile daxil olmamaq sherti ile butun melumatlarini gostermek.


select em.Name, em.Surname, em.Age ,em.Salary, em.Position, ct.Name, co.Name, em.IsDeleted from Employees em
inner join Cities ct
on em.CityId = ct.Id
inner join Countries co
on co.Id = ct.CountryId
where em.Position = 'Reseption'


--Ishden cixan ishcilerin yashadiqi sheher ve olkeleri, hemcinin ishcilerin oz ad ve soyadlarini gosteren query yazin.

 select em.Name, em.Surname, ct.Name, co.Name, em.IsDeleted  from Employees em
 inner join Cities ct
 on em.CityId = ct.Id
 inner join Countries co
 on co.Id = ct.CountryId
 where em.IsDeleted = 'True'
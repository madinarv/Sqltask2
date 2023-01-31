Create Database BrandStoreDb

Use BrandStoreDb

Create Table Brands
(
	Id int identity Primary Key,
   BrandName nvarchar(100)Not Null 
)

Create Table Notebooks
(
	Id int identity Primary Key,
	NotebookName nvarchar(50)Not Null,
	Price money 
)
Create Table Phones
(
	Id int identity Primary Key,
	PhoneName nvarchar(50)Not Null,
	Price money 
)
--1) Notebook ve Brand Arasinda Mentiqe Uygun Relation Qurun.
Alter Table Notebooks

Add BrandId int Not Null Foreign Key References Brands(Id)
--2) Phones ve Brand Arasinda Mentiqe Uygun Relation Qurun.
Alter Table Phones
Add BrandId int Not Null Foreign Key References Phones(Id)

Insert Into Brands(BrandName)
Values
('Huawei'),
('Nokia'),
('Sony')
Insert Into Notebooks(NotebookName,Price,BrandId)
Values
('Notebook1',1232,2),
('NoteBook2',2341,1),
('Notebook IPad',1443,2),
('Notebook3',1252,1),
('NoteBook4',2341,2)

Insert Into Phones(PhoneName,Price,BrandId)
Values
('Phone1',532,1),
('Huawei y6',2341,1),
('Nokia 6303',67,2),
('Phone3',1252,1),
('Sony Ericsson k800i',2341,3)

--3) Notebooks Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.
Select Notebooks.NotebookName, Notebooks.Price,Brands.BrandName From Notebooks   Join Brands On Notebooks.Id = Brands.Id
--4) Phones Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.
Select Phones.PhoneName+' - '+ Brands.BrandName as BrandName From Phones  Join Brands On Phones.Id = Brands.Id 

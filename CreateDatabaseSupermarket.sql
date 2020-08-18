CREATE DATABASE Supermarket1
go

use Supermarket1
go

create table Product(
	Code char(3) not null,
	Name nvarchar(50) not null,
	Type char(3),
	Warehouse char(3),

	primary key (Code),
	foreign key (Type) references dbo.ProductType(Code),
)
go

create table ProductType(
	Code char(3),
	Name varchar(20) not null,

	Primary key (Code),
)
go

create table Employee(
	ID int,
	FullName nvarchar(40) not null,
	Male bit,
	Nationality text,
	ManageWarehouse int,
	ManageProductType char(3),
	DirectManager int,

	primary key (ID),
	foreign key (ManageWareHouse) references dbo.WareHouse(Number),
	foreign key (ManageProductType) references dbo.ProductType(Code),
	foreign key (DirectManager) references dbo.Employee(ID),
)
go

create table WareHouse(
	Number int,
	District nvarchar(10),
	City nvarchar(10) not null,

	primary key(Number),
)
go

create table ProductLocation(
	Floor int,
	Stall char(3),
	ContainProduct char(3),

	Primary key (Floor, Stall),
	Foreign key (ContainProduct) references dbo.Product(Code),
)
go

create table Timesheet(
	Employee int,
	WorkOnFloor int,
	WorkAtStall char(3),
	NightShift bit,

	Primary key (Employee, WorkOnFloor, WorkAtStall),
	Foreign key (Employee) references dbo.Employee(ID),
	Foreign key (WorkOnFloor, WorkAtStall) references dbo.ProductLocation (Floor, Stall)

)
go
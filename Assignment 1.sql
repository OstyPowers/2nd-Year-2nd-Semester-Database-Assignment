create database WholeyMoleyFoods;

use WholeyMoleyFoods;

create table Branch (
branchId integer primary key,
branchName varchar(30),
branchStreetAddress varchar(30),
branchSuburb varchar(15),
branchCity varchar(15),
branchRegion varchar(15),
branchPostCode integer,
branchArea varchar(20),
numOfStaff integer,
totalNumOfSales integer
)

create table Items (
itemID integer primary key,
description varchar(100),
size varchar(30),
allergens varchar(50)
)

create table Customer (
customerID integer primary key,
custFirstName varchar(20),
custLastName varchar(20),
custDOB datetime,
customerType varchar(30),
changeOfCredit varchar(20),
custStreetAddress varchar(30),
custSuburb varchar(15),
custCity varchar(15),
custPostCode integer,
custRegion varchar(15),
custPostBox varchar(10)
)

create table Employees (
employeeID integer primary key,
empFirstName varChar(20),
empLastName varChar(20),
empPhoneNum integer,
dateHired datetime, 
jobTitle varChar(20),
currentPay smallmoney,
skillSet varChar(100),
empDOB datetime,
branchID integer foreign key references Branch(branchID), 
empStreetAddress varChar(30),
empSuburb varChar(15),
empCity varChar(15),
empPostCode integer,
region varChar(15),
baseBranch integer
)

create table Orders (
orderNum integer primary key,
orderDate datetime,
orderBranch integer,
pickUpDate datetime, 
creditAuthorisation varchar(30),
customerID integer foreign key references Customer(customerID),
employeeID integer foreign key references Employees(employeeID)
)


create table Account (
accountID integer primary key,
balance smallmoney,
lastPaymentDate datetime,
lastPaymentAmount smallmoney,
typeOfPayment varchar(20),
customerID integer foreign key references Customer(customerID),
cashOrder integer
)

create table EmployeeBranch (
employeeID integer foreign key references Employees(employeeID),
branchID integer foreign key references Branch(branchID)
constraint PK_EmployeeBranch primary key(employeeID,branchID)
)

create table BranchItems (
itemID integer foreign key references Items(itemID),
branchID integer foreign key references Branch(branchID)
constraint PK_BranchItem primary key(itemID,branchID)
)

create table ItemOrder (
orderNum integer foreign key references Orders(orderNum),
itemID integer foreign key references Items(itemID)
constraint PK_ItemOrder primary key(orderNum,itemID)
)



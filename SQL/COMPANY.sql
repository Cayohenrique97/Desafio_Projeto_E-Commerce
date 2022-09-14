create schema if not exists company;

create table employee(
	Fname varchar(15) NOT NULL,
    Minit char,
    Lname varchar(15) NOT NULL,
    Ssn char(9) NOT NULL,
    Bdate DATE,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int NOT NULL,
    constraint pk_employee primary key(Ssn)
);

create table departament(
	Dname varchar(15) NOT NULL,
    Dnumber int NOT NULL,
    Mgr_ssn char(9),
    Mgr_start_Date date,
    constraint pk_departament primary key (Dnumber),
    unique (Dname),
    constraint fk_departament foreign key(Mgr_ssn) references employee(Ssn)
);
alter table departament	
	add Dept_create_date date;


create table dept_locations(
	Dnumber int NOT NULL,
    Dlocaltion varchar(15) NOT NULL,
    constraint pk_dept_locations primary key( Dnumber,Dlocaltion),
    constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
    );
    
alter table dept_locations drop constraint fk_dept_locations;

alter table dept_locations
	add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
    on delete cascade
    on update cascade;
    
create table project(
	Pname varchar(15) NOT NULL unique,
    Pnumber int NOT NULL,
    Plocation varchar(15),
    Dnum int not null,
    constraint pk_project primary key (Pnumber, Plocation),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);

create table works_on (
	Essn char(9) NOT NULL,
	Pno int NOT NULL,
    Hours decimal(3,1) NOT NULL,
    constraint pk_works_on primary key (Essn,Pno),
    constraint fk_works_on foreign key (Essn) references employee(Ssn),
    constraint fk_works_on1 foreign key (Pno) references project(Pnumber)    
);

create table dependent(
	Essn char(9) NOT NULL,
    Dependent_name varchar(15) NOT NULL,
    Sex enum('F','M'), -- F OU M
    Bdate date,
    Relationship varchar(8),
    constraint pk_dependent primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);

show tables;

-- inserção de dados no bd company

show tables;

insert into employee
	values 
		('John','B','Smith',123456789,'1965-01-09','731-fondren Housten TX','M','300000',null,5),
        ('Franklin','F','Wong',123456788,'1965-01-09','731-fondren Housten TX','M','40000',123456789,5),
        ('Alicia','A','Smith',123456799,'1965-01-09','731-fondren Housten TX','F','300000',123456789,4),
        ('Jeniffer','J','Smith',123456999,'1965-01-09','731-fondren Housten TX','M','300000',123456788,5),
        ('Joyce','B','Smith',123459999,'1965-01-09','731-fondren Housten TX','M','300000',123456788,5),
        ('James','B','Smith',223456789,'1965-01-09','731-fondren Housten TX','M','300000',null,1);
        
select * from employee;        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
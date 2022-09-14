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

create table dept_locations(
	Dnumber int NOT NULL,
    Dlocaltion varchar(15) NOT NULL,
    constraint pk_dept_locations primary key( Dnumber,Dlocaltion),
    constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
    );
    
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

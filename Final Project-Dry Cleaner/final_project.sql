create table OPERATIONS
( No  varchar(10),
  Name  varchar(30)  not null,
  primary key (No));

create table PLANS
( No  varchar(10),
  Name  varchar(15)  not null,
  primary key (No));

create table DETERGENT
( No  varchar(10),
  Name  varchar(50)  not null,
  primary key (No));

create table CUSTOMER
( Phone  varchar(10),
  Fname  varchar(15)  not null,
  Minit  varchar(15)  not null,
  Lname  varchar(15)  not null,
  primary key (Phone));

create table MEMBERSHIP_CARD
( No  varchar(10),
  Start_date  date  not null,
  End_date  date  not null,
  Customer_phone  varchar(10)  not null,
  primary key (No),
  foreign key (Customer_phone) references CUSTOMER (Phone)
    on delete cascade);

create table USE
( Operation_no  varchar(10),
  Detergent_no  varchar(10),
  primary key (Operation_no, Detergent_no),
  foreign key (Operation_no) references OPERATIONS (No)
    on delete cascade,
  foreign key (Detergent_no) references DETERGENT (No)
    on delete cascade);

create table CONTAIN
( Plan_no  varchar(10),
  Operation_no  varchar(10)  not null,
  primary key (Plan_no, Operation_no),
  foreign key (Plan_no) references PLANS (No)
    on delete cascade,
  foreign key (Operation_no) references OPERATIONS (No)
    on delete cascade);

create table DRY_CLEANER_BRANCH
( Branch_number  varchar(10),
  Opening_hour  varchar(20)  not null,
  Name  varchar(15)  not null,
  Address  varchar(30)  not null,
  Phone  varchar(10)  not null,
  Manager_ssn  varchar(9)  not null,
  primary key (Branch_number));

create table EMPLOYEE
( Ssn  varchar(9),
  Fname  varchar(15)  not null,
  Minit  varchar(15)  not null,
  Lname  varchar(15)  not null,
  Phone  varchar(10)  not null,
  Address  varchar(30)  not null,
  Sex  varchar(1)  not null,
  Branch_no  varchar(10)  not null,
  primary key (Ssn),
  foreign key (Branch_no) references DRY_CLEANER_BRANCH (Branch_number)
    on delete cascade);

create table DATE_INFO
( Start_date  date,
  Plan_no  varchar(10),
  Finish_date  date  not null,
  primary key (Start_date, Plan_no),
  foreign key (Plan_no) references PLANS (No)
    on delete cascade);

create table ORDERS
( No  varchar(10),
  Price  number  not null,
  Clothes_number  varchar(10)  not null,
  Start_date  date not null,
  Pickup_date  date default null,
  Branch_no  varchar(10)  not null,
  Plan_no  varchar(10) not null,
  Customer_phone  varchar(10)  not null,
  primary key (No),
  foreign key (Start_date, Plan_no) references DATE_INFO (Start_date, Plan_no)
    on delete cascade,
  foreign key (Branch_no) references DRY_CLEANER_BRANCH (Branch_number)
    on delete cascade,
  foreign key (Customer_phone) references CUSTOMER (Phone)
    on delete cascade);

-------------------------------------------------------------------
--After data insertion to existed table, execute this instruction.-
-------------------------------------------------------------------
alter table DRY_CLEANER_BRANCH
  add constraint mgr_ssn_constraint
  foreign key (Manager_ssn) references EMPLOYEE (Ssn)
  on delete cascade;







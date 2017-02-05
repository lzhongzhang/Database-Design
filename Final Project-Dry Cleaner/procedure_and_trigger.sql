---------------------------------------------------------------
---------------------------PROCEDURE 1-------------------------
--Select all orders' No whose finish_date is after sysdate.----
---------------------------------------------------------------
create or replace procedure check_order as
cursor order_information is
select ORDERS.No, DATE_INFO.Finish_date
from ORDERS, DATE_INFO
where ORDERS.Start_date = DATE_INFO.Start_date
  AND ORDERS.Plan_no = DATE_INFO.Plan_no;
order_info  order_information%rowtype;
begin
  open order_information;
  loop
    fetch order_information into order_info;
    exit when order_information%NOTFOUND;
    if (to_date(order_info.Finish_date,'DD-MON-YY') >
      to_date(SYSDATE,'DD-MON-YY')) then
      DBMS_OUTPUT.PUT_LINE ('Order No: ' || order_info.No);
    end if;
  end loop;
  close order_information;
end;
/
---------------------------------------------------------------
---------------------------PROCEDURE 2-------------------------
--Select all names and phones of customers whose---------------
--membership cards would expire next month.--------------------
---------------------------------------------------------------
create or replace procedure check_card as
cursor card_information is
select CUSTOMER.Phone, CUSTOMER.Fname, CUSTOMER.Minit,
  CUSTOMER.Lname, MEMBERSHIP_CARD.End_date
from CUSTOMER, MEMBERSHIP_CARD
where MEMBERSHIP_CARD.Customer_phone = CUSTOMER.Phone;
card_info  card_information%rowtype;
begin
  open card_information;
  loop
    fetch card_information into card_info;
    exit when card_information%NOTFOUND;
    if (to_date(card_info.End_date, 'DD-MON-YY') <
      to_date(SYSDATE,'DD-MON-YY') + 30) then
      DBMS_OUTPUT.PUT_LINE ('Customer Phone: ' || card_info.Phone);
      DBMS_OUTPUT.PUT_LINE ('Customer Fname: ' || card_info.Fname);
      DBMS_OUTPUT.PUT_LINE ('Customer Minit: ' || card_info.Minit);
      DBMS_OUTPUT.PUT_LINE ('Customer Lname: ' || card_info.Lname);
    end if;
  end loop;
  close card_information;
end;
/

--------------------------------------------------------------
-----------------------TRIGGER 1------------------------------
-------------Add a new log when a new order comes.------------
--------------------------------------------------------------
drop table Order_log;
/
create table Order_log
( No  varchar(10),
  Start_date  date,
  Log_date  date,
  primary key (No));
/
create or replace trigger new_log
  after insert on ORDERS
  for each row
begin
  insert into Order_log(No, Start_date, Log_date) values
    (:new.No, :new.Start_date, sysdate);
end;
/
--------------------------------------------------------------
-----------------------TRIGGER 2------------------------------
--Make a new log to record the number of the------------------
--same customer's orders.-------------------------------------
--------------------------------------------------------------
drop table Customer_log;
/
create table Customer_log
( Phone  varchar(10),
  Number_of_orders  number,
  primary key (Phone));
/
create or replace trigger customer_number_log
  after insert on ORDERS
  for each row
begin
  merge into Customer_log using dual on(Phone = :new.Customer_Phone)
  when not matched then
  insert (Phone, Number_of_orders) values (:new.Customer_Phone, 1)
  when matched then
  update set Number_of_orders = Number_of_orders + 1;
end;
/

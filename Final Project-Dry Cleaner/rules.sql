----------------------------------------------------------------------
--This rule is to check if order's pick_up date is before start _date,
--if it is, then output an error: this time is a wrong time.----------
----------------------------------------------------------------------
create or replace trigger rule_1
  after insert or update of Pickup_date
    on ORDERS
  for each row
begin
  if :new.Pickup_date < :new.Start_date then
    DBMS_OUTPUT.PUT_LINE ('Error: ' || :new.Pickup_date || 'is a wrong time.');
  end if;
end;
/

----------------------------------------------------------------------
--This rule is to check if an employee's Ssn's length is 9.-----------
----------------------------------------------------------------------
ALTER TABLE EMPLOYEEE
ADD CONSTRAINT constraint_Ssn_format CHECK (LENGTH(Ssn) = 9);
/

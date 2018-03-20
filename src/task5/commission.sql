/* commission.sql */
/* Date  : 19 February 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

drop table employee;

create table employee (
    empid integer primary key,
    ename varchar2(100) not null,
    job   varchar2(100) not null,
    salry number not null,
    comis number not null
);
insert into employee values (506, 'Ankit Pati',         'Salesman', 143, 435 );
insert into employee values (543, 'Tiashaa Chatterjee', 'Analyst' , 543, 4350);
insert into employee values (435, 'Sahil Pandey',       'Cashier' , 100, 350 );

create or replace trigger calculate_commission
    before update
    of     salry
    on     employee
    for    each row
    when   (old.job in ('Salesman', 'Analyst'))
begin
    :new.comis := :old.comis
        + :new.salry*0.2 + case when :old.comis < 1000 then 1000 else 2000 end;
end;
/

update employee
set    salry = salry * 1.1
where  empid = 506;

select * from employee;
/* end of commission.sql */

/* OUTPUT

EMPID ENAME              JOB      SALRY   COMIS
----- ------------------ -------- ----- -------
  506 Ankit Pati         Salesman 157.3 1466.46
  543 Tiashaa Chatterjee Analyst    543    4350
  435 Sahil Pandey       Cashier    100     350

*/

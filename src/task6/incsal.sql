/* incsal.sql */
/* Date  : 19 February 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

drop table employee;

create table employee (
    empid integer primary key,
    ename varchar2(100) not null,
    salry number not null,
    deptn integer not null
);
insert into employee values (506, 'Ankit Pati'        , 143, 17);
insert into employee values (543, 'Tiashaa Chatterjee', 543, 17);
insert into employee values (435, 'Sahil Pandey'      , 243, 20);

declare
    incr integer := 100;
    cursor emp_cur is
        select *
        from   employee
        where  deptn = 17
        for update;
begin
    for emp_rec in emp_cur loop
        update employee
        set    salry = salry + incr
        where  current of emp_cur;
    end loop;
end;
/

select * from employee;
/* end of incsal.sql */

/* OUTPUT

EMPID ENAME              SALRY DEPTN
----- ------------------ ----- -----
  506 Ankit Pati           243    17
  543 Tiashaa Chatterjee   643    17
  435 Sahil Pandey         243    20

*/

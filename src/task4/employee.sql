/* employee.sql */
/* Date  : 05 February 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

drop table employee;
create table employee (
    empid integer primary key,
    ename varchar2(100) not null,
    salry number
);
insert into employee values (506, 'Ankit Pati', 143);
insert into employee values (543, 'Tiashaa Chatterjee', 543);
insert into employee values (435, 'Sahil Pandey', NULL);

create or replace procedure remove_emp(p_empid in integer)
    is
begin
    delete
    from   employee
    where  empid = p_empid;
end;
/

select * from employee;
exec remove_emp(435);
select * from employee;
/* end of employee.sql */

/* OUTPUT

EMPID ENAME              SALRY
----- ------------------ -----
  506 Ankit Pati         143
  543 Tiashaa Chatterjee 543
  435 Sahil Pandey


PL/SQL procedure successfully completed.


EMPID ENAME              SALRY
----- ------------------ -----
  506 Ankit Pati         143
  543 Tiashaa Chatterjee 543

*/

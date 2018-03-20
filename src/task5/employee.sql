/* employee.sql */
/* Date  : 19 February 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

drop table emp_audit;
drop table employee;
drop sequence emp_audit_seq;

create table employee (
    empid integer primary key,
    ename varchar2(100) not null,
    salry number
);
insert into employee values (506, 'Ankit Pati', 143);
insert into employee values (543, 'Tiashaa Chatterjee', 543);
insert into employee values (435, 'Sahil Pandey', NULL);

create table emp_audit (
    audid integer primary key,
    empid integer not null,
    olsal number  not null,
    nwsal number  not null,
    udate date    not null,
    foreign key (empid) references employee(empid)
);

create sequence emp_audit_seq;

create or replace trigger audit_sal
    after update
    on employee
    for each row
begin
    insert into emp_audit
    values (emp_audit_seq.nextval, :old.empid, :old.salry, :new.salry, sysdate);
end;
/

update employee
set    salry = salry * 1.1
where  empid = 506;

select * from employee;
select * from emp_audit;
/* end of employee.sql */

/* OUTPUT

EMPID ENAME              SALRY
----- ------------------ -----
  506 Ankit Pati         157.3
  543 Tiashaa Chatterjee   543
  435 Sahil Pandey        NULL

AUDID EMPID OLSAL NWSAL UDATE
----- ----- ----- ----- -------------------
    1   506   143 157.3 2016-02-19 12:27:47

*/

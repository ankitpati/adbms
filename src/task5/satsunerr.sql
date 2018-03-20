/* satsunerr.sql */
/* Date  : 19 February 2018
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

create or replace trigger no_updates_outside_work_hours
    before insert or update or delete
    on employee
declare
    v_day varchar2(20) := to_char(sysdate, 'DAY');
    v_hr  integer      := to_number(to_char(sysdate, 'HH24'));
begin
    if     v_hr   <   10
        or v_hr   >   17
        or v_day like '%SATURDAY%'
        or v_day like '%SUNDAY%'
    then
        raise_application_error(-20143, 'No DB changes outside work hours.');
    end if;
end;
/

update employee
set    salry = salry * 1.1
where  empid = 506;

select * from employee;
select * from emp_audit;
/* end of satsunerr.sql */

/* OUTPUT

update employee
set    salry = salry * 1.1
where  empid = 506;
update employee
       *
ERROR at line 1:
ORA-20143: No DB changes outside work hours.
ORA-06512: at "ADBMS.AUDIT_SAL", line 6
ORA-04088: error during execution of trigger 'ADBMS.AUDIT_SAL'

*/

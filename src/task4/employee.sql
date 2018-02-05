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
    pre_count integer;
    pst_count integer;

begin
    select count(*)
    into   pre_count
    from   employee;

    delete
    from   employee
    where  empid = p_empid;

    select count(*)
    into   pst_count
    from   employee;

    dbms_output.put_line('Count before deletion: ' || pre_count);
    dbms_output.put_line('Count after  deletion: ' || pst_count);
end;
/

exec remove_emp(435);
/* end of employee.sql */

/* OUTPUT

Count before deletion: 3
Count after  deletion: 2

*/

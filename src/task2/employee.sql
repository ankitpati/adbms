/* employee.sql */
/* Date  : 23 January 2016
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

begin
    <<incsal>>
    declare
        empid integer := :empid;
        salry number;
    begin
        select salry
        into   salry
        from   employee
        where  empid = incsal.empid;

        if salry is NULL then
            raise_application_error(-20101, 'Salary is missing.');
        end if;

        update employee set salry = salry * 1.1 where empid = incsal.empid;

        dbms_output.put_line('Salary updated successfully.');
    exception
        when no_data_found then
            dbms_output.put_line('No employee with given employee ID.');
    end;
end;
/
/* end of employee.sql */

/* OUTPUT

Condition: salry is not null
Salary updated successfully.

Condition: no data found
No employee with given employee ID.

Condition: salry is null
ORA-20101: Salary is missing.

*/

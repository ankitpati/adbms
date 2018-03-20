/* student.sql */
/* Date  : 23 January 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

drop table student;
create table student (
    prn   integer primary key,
    fname varchar2(100) not null,
    lname varchar2(100) not null,
    marks integer not null
);
insert into student values (506, 'Ankit', 'Pati', 143);
insert into student values (543, 'Tiashaa', 'Chatterjee', 543);

declare
    fname char(100);
    lname char(100);
begin
    select fname, lname
    into   fname, lname
    from   student
    where  marks > 100;

    dbms_output.put_line('Name ' || fname || ' ' || lname);
exception
    when too_many_rows then
        dbms_output.put_line('More than one student got above 100.');
end;
/
/* end of student.sql */

/* OUTPUT

Condition: 1 student
Name Tiashaa Chatterjee

Condition: multiple students
More than one student got above 100.

*/

/* student.sql */
/* Date  : 05 February 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

drop table student;
create table student (
    prn   integer primary key,
    fname varchar2(100) not null,
    lname varchar2(100) not null
);
insert into student values (506, 'Ankit', 'Pati');
insert into student values (543, 'Tiashaa', 'Chatterjee');

create or replace procedure studentname(prnl in integer)
    is
    fname char(100);
    lname char(100);
begin
    select fname, lname
    into   fname, lname
    from   student
    where  prn = prnl;

    dbms_output.put_line('PRN  ' || prnl);
    dbms_output.new_line;
    dbms_output.put_line('Name ' || fname || ' ' || lname);
end;
/

exec studentname(506);
/* end of student.sql */

/* OUTPUT

PRN  506
Name Ankit Pati

*/

/* student.sql */
/* Date  : 19 February 2016
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
insert into student values (506, 'Ankit', 'Pati', 5);
insert into student values (543, 'Tiashaa', 'Chatterjee', 43);

create or replace trigger display_mark_changes
    before update
    on student
    for each row
begin
    dbms_output.put_line('PRN       : ' || :old.prn);
    dbms_output.put_line('Name      : ' || :old.fname || ' ' || :old.lname);
    dbms_output.put_line('Old Marks : ' || :old.marks);
    dbms_output.put_line('New Marks : ' || :new.marks);
    dbms_output.put_line(chr(9));
end;
/

update student
set    marks = marks + 5;
/* end of student.sql */

/* OUTPUT

PRN       : 506
Name      : Ankit Pati
Old Marks : 5
New Marks : 10

PRN       : 543
Name      : Tiashaa Chatterjee
Old Marks : 43
New Marks : 48

*/

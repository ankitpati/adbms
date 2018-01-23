/* student.sql */
/* Date  : 21 January 2016
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

begin
    <<getnames>>
    declare
        prn   integer default 506;
        fname char(100);
        lname char(100);
    begin
        insert into student values (506, 'Ankit', 'Pati');
        insert into student values (543, 'Tiashaa', 'Chatterjee');

        select fname, lname
        into   fname, lname
        from   student
        where  prn = getnames.prn;

        dbms_output.put_line('PRN  ' || prn);
        dbms_output.new_line;
        dbms_output.put_line('Name ' || fname || ' ' || lname);
    end;
end;
/
/* end of student.sql */

/* OUTPUT

PRN  506
Name Ankit Pati

*/

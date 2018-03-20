/* student.sql */
/* Date  : 09 January 2018
 * Author: Ankit Pati
 */

use adbms;

drop table if exists student;
create table student (
    prn   integer primary key,
    fname char(100) not null,
    lname char(100) not null
);

insert into student values
    (506, 'Ankit', 'Pati'),
    (543, 'Tiashaa', 'Chatterjee');

drop procedure if exists student;
delimiter $
create procedure student(in prn integer)
begin
    select fname as 'First Name', lname as 'Last Name'
    from student
    where student.prn = prn;
end $
delimiter ;

call student(506);
/* end of student.sql */

/* OUTPUT

+------------+-----------+
| First Name | Last Name |
+------------+-----------+
| Ankit      | Pati      |
+------------+-----------+

*/

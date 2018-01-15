/* swap.sql */
/* Date  : 09 January 2016
 * Author: Ankit Pati
 */

use adbms;

drop procedure if exists swap;
delimiter $
create procedure swap(inout n1 integer, inout n2 integer)
begin
    declare tmp integer;
    set tmp = n1;
    set n1  = n2;
    set n2  = tmp;
end $
delimiter ;

set @n1 = 43;
set @n2 = 50;

select @n1 as 'n1 before swap', @n2 as 'n2 before swap';
call swap(@n1, @n2);
select @n1 as 'n1 after  swap', @n2 as 'n2 after  swap';
/* end of swap.sql */

/* OUTPUT

+----------------+----------------+
| n1 before swap | n2 before swap |
+----------------+----------------+
|             43 |             50 |
+----------------+----------------+

+----------------+----------------+
| n1 after  swap | n2 after  swap |
+----------------+----------------+
|             50 |             43 |
+----------------+----------------+

*/

/* evenodd.sql */
/* Date  : 09 January 2018
 * Author: Ankit Pati
 */

use adbms;

drop procedure if exists evenodd;
delimiter $
create procedure evenodd(in num integer unsigned)
begin
    if num % 2 = 0 then
        select num as 'Even';
    else
        select num as 'Odd';
    end if;
end $
delimiter ;

call evenodd(43);
call evenodd(50);
/* end of evenodd.sql */

/* OUTPUT

+------+
| Odd  |
+------+
|   43 |
+------+

+------+
| Even |
+------+
|   50 |
+------+

*/

/* dayofweek.sql */
/* Date  : 09 January 2016
 * Author: Ankit Pati
 */

use adbms;

drop procedure if exists dayofweek;
delimiter $
create procedure dayofweek()
begin
    select dayname(now()) as 'Weekday Today';
end $
delimiter ;

call dayofweek;
/* end of dayofweek.sql */

/* OUTPUT

+---------------+
| Weekday Today |
+---------------+
| Tuesday       |
+---------------+

*/

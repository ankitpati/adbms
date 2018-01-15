/* power.sql */
/* Date  : 09 January 2016
 * Author: Ankit Pati
 */

use adbms;

drop procedure if exists power;
delimiter $
create procedure power(in base decimal, in expo decimal)
begin
    select pow(base, expo) as 'base raised to expo';
end $
delimiter ;

call power(43, 2);
/* end of power.sql */

/* OUTPUT

+---------------------+
| base raised to expo |
+---------------------+
|                1849 |
+---------------------+

*/

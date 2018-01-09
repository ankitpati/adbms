/* factorial.sql */
/* Date  : 09 January 2016
 * Author: Ankit Pati
 */

use adbms;

drop procedure if exists factorial;
delimiter $
create procedure factorial(in n integer unsigned)
begin
    declare fac integer unsigned;
    set fac = 1;

    facloop: while n > 1 do
        set fac = fac * n;
        set n = n - 1;
    end while facloop;

    select fac as 'Factorial';
end $
delimiter ;

call factorial(5);
/* end of factorial.sql */

/* OUTPUT

+-----------+
| Factorial |
+-----------+
|       120 |
+-----------+

*/

/* loops.sql */
/* Date  : 09 January 2016
 * Author: Ankit Pati
 */

use adbms;

drop procedure if exists loops;
delimiter $
create procedure loops()
begin
    declare n, l integer;
    set l = 5;

    set n = 10;
    normal_loop: loop
        if n < l then
            leave normal_loop;
        end if;

        select n;
        set n = n - 1;
    end loop normal_loop;

    set n = 10;
    while_loop: while n >= l do
        select n;
        set n = n - 1;
    end while while_loop;
end $
delimiter ;

call loops;
/* end of loops.sql */

/* OUTPUT

+------+
| n    |
+------+
|   10 |
+------+
1 row in set (0.00 sec)

+------+
| n    |
+------+
|    9 |
+------+
1 row in set (0.00 sec)

+------+
| n    |
+------+
|    8 |
+------+
1 row in set (0.00 sec)

+------+
| n    |
+------+
|    7 |
+------+
1 row in set (0.00 sec)

+------+
| n    |
+------+
|    6 |
+------+
1 row in set (0.00 sec)

+------+
| n    |
+------+
|    5 |
+------+
1 row in set (0.00 sec)

+------+
| n    |
+------+
|   10 |
+------+
1 row in set (0.00 sec)

+------+
| n    |
+------+
|    9 |
+------+
1 row in set (0.01 sec)

+------+
| n    |
+------+
|    8 |
+------+
1 row in set (0.01 sec)

+------+
| n    |
+------+
|    7 |
+------+
1 row in set (0.01 sec)

+------+
| n    |
+------+
|    6 |
+------+
1 row in set (0.01 sec)

+------+
| n    |
+------+
|    5 |
+------+
1 row in set (0.01 sec)

*/

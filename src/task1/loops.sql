/* loops.sql */
/* Date  : 23 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

declare
    n integer;
    l integer default 5;
begin
    dbms_output.put_line('Simple Loop');
    n := 10;
    loop
        exit when n < l;

        dbms_output.put_line(n);
        n := n - 1;
    end loop;

    dbms_output.put_line('While Loop');
    n := 10;
    while n >= l loop
        dbms_output.put_line(n);
        n := n - 1;
    end loop;

    dbms_output.put_line('For Loop');
    for n in reverse l..10 loop
        dbms_output.put_line(n);
    end loop;
end;
/
/* end of loops.sql */

/* OUTPUT

Simple Loop
10
9
8
7
6
5
While Loop
10
9
8
7
6
5
For Loop
10
9
8
7
6
5

*/

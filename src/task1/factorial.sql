/* factorial.sql */
/* Date  : 23 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

declare
    fac integer default 1;
    n   integer default 5;
begin
    dbms_output.put(n || '! = ');

    while n > 1 loop
        fac := fac * n;
        n := n - 1;
    end loop;

    dbms_output.put_line(fac);
end;
/
/* end of factorial.sql */

/* OUTPUT

5! = 120

*/

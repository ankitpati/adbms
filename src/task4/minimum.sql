/* minimum.sql */
/* Date  : 05 February 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

create or replace procedure minimum(n1 in integer, n2 in integer)
    is
begin
    if n1 > n2 then
        dbms_output.put_line(n1 || ' is greater than ' || n2);
    elsif n1 < n2 then
        dbms_output.put_line(n1 || ' is smaller than ' || n2);
    else
        dbms_output.put_line(n1 ||   ' is equal to '   || n2);
    end if;
end;
/

exec minimum(43, 5);
/* end of minimum.sql */

/* OUTPUT

43 is greater than 5

*/

/* evenodd.sql */
/* Date  : 23 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

declare
    num integer default 10;
begin
    if mod(num, 2) = 0 then
        dbms_output.put_line(num || ' is Even');
    else
        dbms_output.put_line(num || ' is Odd');
    end if;
end;
/
/* end of evenodd.sql */

/* OUTPUT

10 is Even

*/

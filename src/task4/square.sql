/* square.sql */
/* Date  : 05 February 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

create or replace procedure square(base in integer)
    is
begin
    dbms_output.put_line(base || ' squared equals ' || base*base);
end;
/

exec square(43);
/* end of square.sql */

/* OUTPUT

43 squared equals 1849

*/

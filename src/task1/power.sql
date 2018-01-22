/* power.sql */
/* Date  : 15 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

declare
    base number;
    powr number;
    resl number;

begin
    base := 43;
    powr :=  2;

    resl := power(base, powr);
    dbms_output.put_line('Result = ' || resl);
end;
/
/* end of power.sql */

/* OUTPUT

Result = 1849

*/

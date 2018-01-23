/* length_from_area.sql */
/* Date  : 23 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

declare
    area integer := :area;
    bred integer := :bred;
    leng integer;
begin
    leng := area / bred;
    dbms_output.put_line('Length ' || leng);
exception
    when zero_divide then
        dbms_output.put_line('Breadth cannot be zero.');
end;
/
/* end of length_from_area.sql */

/* OUTPUT

Input: 45, 5
Length 9

Input: 43, 0
Breadth cannot be zero.

*/

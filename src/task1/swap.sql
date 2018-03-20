/* swap.sql */
/* Date  : 15 January 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

declare
    num1 number default 50;
    num2 number default 43;
    tmp0 number;

begin
    dbms_output.put_line('Before Swap: ' || num1 || ' ' || num2);

    tmp0 := num1;
    num1 := num2;
    num2 := tmp0;

    dbms_output.put_line('After  Swap: ' || num1 || ' ' || num2);
end;
/
/* end of swap.sql */

/* OUTPUT

Before Swap: 50 43
After  Swap: 43 50

*/

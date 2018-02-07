/* revnum.sql */
/* Date  : 07 February 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

declare
    num integer := 345;
    rev integer := 0;
begin
    dbms_output.put_line('Original Number: ' || num);
    loop
        exit when num = 0;
        rev := 10*rev + mod(num, 10);
        num := floor(num / 10);
    end loop;
    dbms_output.put_line('Reversed Number: ' || rev);
end;
/
/* end of revnum.sql */

/* OUTPUT

Original Number: 345
Reversed Number: 543

*/

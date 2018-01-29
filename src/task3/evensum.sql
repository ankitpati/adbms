/* evensum.sql */
/* Date  : 29 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

create or replace function evensum(n in integer default 100)
    return integer deterministic is
    esum integer := 0;
begin
    for i in 1..n loop
        esum := esum + 2*i;
    end loop;
    return esum;
end;
/

select evensum from dual;
/* end of evensum.sql */

/* OUTPUT

   EVENSUM
----------
     10100

*/

/* isprime.sql */
/* Date  : 29 January 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

create or replace function isprime(n in integer)
    return boolean deterministic is
begin
    if n < 2 then
        return false;
    end if;

    for i in 2..(n/2) loop
        if mod(n, i) = 0 then
            return false;
        end if;
    end loop;
    return true;
end;
/

declare
    ispr boolean := isprime(43);
begin
    dbms_output.put_line(
        case
            when     ispr then 'Prime'
            when not ispr then 'Composite'
        end
    );
end;
/
/* end of isprime.sql */

/* OUTPUT

Prime

*/

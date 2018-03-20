/* countemp.sql */
/* Date  : 19 February 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

/* relying on Oracle built-in table emp */

declare
    numrows integer := 0;
    exp_rec emp%ROWTYPE;
    cursor exp_cur is
        select *
        from   emp;
begin
    open exp_cur;
    loop
        fetch exp_cur
        into  exp_rec;

        exit when exp_cur%NOTFOUND;

        numrows := numrows + 1;
    end loop;
    close exp_cur;

    dbms_output.put_line('Number of Rows in EMP table: ' || numrows);
end;
/
/* end of countemp.sql */

/* OUTPUT

Number of Rows in EMP table: 14

*/

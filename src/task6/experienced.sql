/* experienced.sql */
/* Date  : 19 February 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

/* relying on Oracle built-in table emp */

declare
    cursor exp_cur is
        select ename, job
        from   emp
        where  extract(year from sysdate) - extract(year from hiredate) > 36;
begin
    for exp_rec in exp_cur loop
        dbms_output.put_line('Name : ' || exp_rec.ename);
        dbms_output.put_line('Job  : ' || exp_rec.job);
        dbms_output.put_line(chr(9));
    end loop;
end;
/
/* end of experienced.sql */

/* OUTPUT

Name : KING
Job  : PRESIDENT

Name : BLAKE
Job  : MANAGER

Name : CLARK
Job  : MANAGER

Name : JONES
Job  : MANAGER

Name : FORD
Job  : ANALYST

Name : SMITH
Job  : CLERK

Name : ALLEN
Job  : SALESMAN

Name : WARD
Job  : SALESMAN

Name : MARTIN
Job  : SALESMAN

Name : TURNER
Job  : SALESMAN

Name : JAMES
Job  : CLERK

*/

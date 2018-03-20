/* employee.sql */
/* Date  : 19 February 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

/* relying on Oracle built-in table emp */

declare
    cursor emp_cur is
        select ename, job, sal
        from   emp
        where  sal > 2000;
begin
    for emp_rec in emp_cur loop
        dbms_output.put_line('Name   : ' || emp_rec.ename);
        dbms_output.put_line('Job    : ' || emp_rec.job);
        dbms_output.put_line('Salary : ' || emp_rec.sal);
        dbms_output.put_line(chr(9));
    end loop;
end;
/
/* end of employee.sql */

/* OUTPUT

Name   : KING
Job    : PRESIDENT
Salary : 5000

Name   : BLAKE
Job    : MANAGER
Salary : 2850

Name   : CLARK
Job    : MANAGER
Salary : 2450

Name   : JONES
Job    : MANAGER
Salary : 2975

Name   : SCOTT
Job    : ANALYST
Salary : 3000

Name   : FORD
Job    : ANALYST
Salary : 3000

*/

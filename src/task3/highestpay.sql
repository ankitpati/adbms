/* highestpay.sql */
/* Date  : 29 January 2018
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

/* relying on Oracle built-in table emp */

drop type ees_table;

create or replace type empno_ename_sal as object (
    empno number(4, 0),
    ename varchar2(10),
    sal   number(7, 2)
);
/

create or replace type ees_table as table of empno_ename_sal;
/

create or replace function highestpay
    return ees_table is
    employee_detail_table ees_table := ees_table();

    employee_detail empno_ename_sal;
    cursor emp_cur is
        select empno_ename_sal(empno, ename, sal)
        from   emp
        where  sal = (select max(sal) from emp);

begin
    open emp_cur;
    loop
        fetch emp_cur into employee_detail;
        exit when emp_cur%NOTFOUND;

        employee_detail_table.extend;
        employee_detail_table(employee_detail_table.count) := employee_detail;
    end loop;
    close emp_cur;

    return employee_detail_table;
end;
/

declare
    highestpaid ees_table;
begin
    dbms_output.put_line('List of highest paid employees follows...');
    dbms_output.put_line('EmpNo' || chr(9) || 'EName' || chr(9) || 'Salary');

    highestpaid := highestpay;
    for i in 1 .. highestpaid.count loop
        dbms_output.put_line(
            highestpaid(i).empno || chr(9) ||
            highestpaid(i).ename || chr(9) ||
            highestpaid(i).sal
        );
    end loop;
end;
/
/* end of highestpay.sql */

/* OUTPUT

List of highest paid employees follows...
EmpNo   EName   Salary
7839    KING    5000

*/

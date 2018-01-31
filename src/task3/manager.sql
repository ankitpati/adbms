/* manager.sql */
/* Date  : 29 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

/* relying on Oracle built-in table emp */

create or replace type emp_record_type as object (
    empno    number(4, 0),
    ename    varchar2(10),
    job      varchar2(9) ,
    mgr      number(4, 0),
    hiredate date        ,
    sal      number(7, 2),
    comm     number(7, 2),
    deptno   number(2, 0)
);
/

create or replace type emp_table_type as table of emp_record_type;
/

create or replace function manager_by_job
    return emp_table_type is
    employee_detail_table emp_table_type := emp_table_type();

    employee_detail emp_record_type;
    cursor emp_cur is
        select emp_record_type(
                            empno, ename, job, mgr, hiredate, sal, comm, deptno)
        from   emp
        where  job = 'MANAGER';

begin
    open emp_cur;
    fetch emp_cur bulk collect into employee_detail_table;
    close emp_cur;

    return employee_detail_table;
end;
/

declare
    managers_by_job emp_table_type;
begin
    dbms_output.put_line('List of managers by job follows...');
    dbms_output.put_line(
        'EmpNo' || chr(9) || 'EName'    || chr(9) || 'Job'    || chr(9) ||
        'Mgr'   || chr(9) || 'HireDate' || chr(9) || 'Salary' || chr(9) ||
        'Comm'  || chr(9) || 'DeptNo'
    );

    managers_by_job := manager_by_job;
    for i in 1 .. managers_by_job.count loop
        dbms_output.put_line(
            managers_by_job(i).empno    || chr(9) ||
            managers_by_job(i).ename    || chr(9) ||
            managers_by_job(i).job      || chr(9) ||
            managers_by_job(i).mgr      || chr(9) ||
            managers_by_job(i).hiredate || chr(9) ||
            managers_by_job(i).sal      || chr(9) ||
            managers_by_job(i).comm     || chr(9) ||
            managers_by_job(i).deptno
        );
    end loop;
end;
/
/* end of manager.sql */

/* OUTPUT

List of managers by job follows...
EmpNo   EName   Job Mgr HireDate    Salary  Comm    DeptNo
7698    BLAKE   MANAGER 7839    01-MAY-81   2850        30
7782    CLARK   MANAGER 7839    09-JUN-81   2450        10
7566    JONES   MANAGER 7839    02-APR-81   2975        20

*/

/* highpay.sql */
/* Date  : 29 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

/* relying on Oracle built-in table emp */

create or replace function highpay
    return integer is
    number_of_emps integer;
begin
    select count(*)
    into   number_of_emps
    from   emp
    where  sal > 2000;
    return number_of_emps;
end;
/

declare
    number_of_emps integer;
begin
    select highpay
    into   number_of_emps
    from   dual;

    dbms_output.put_line(number_of_emps || ' employees got salary above ₹2000');
end;
/
/* end of highpay.sql */

/* OUTPUT

6 employees got salary above ₹2000

*/

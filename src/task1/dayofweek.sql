/* dayofweek.sql */
/* Date  : 09 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

begin
    dbms_output.put('13-Dec-1995 is a ');
    dbms_output.put_line(to_char(to_date('13-Dec-1995', 'dd-Mon-yyyy'), 'DAY'));
end;
/
/* end of dayofweek.sql */

/* OUTPUT

13-Dec-1995 is a WEDNESDAY

*/

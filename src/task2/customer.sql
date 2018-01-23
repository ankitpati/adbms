/* customer.sql */
/* Date  : 23 January 2016
 * Author: Ankit Pati
 */

alter session set current_schema = adbms;
set serveroutput on;

drop table customer;
create table customer (
    cid   integer primary key,
    cname varchar2(100) not null,
    addrs varchar2(100) not null
);
insert into customer values (506, 'Ankit Pati', 'Pune');
insert into customer values (543, 'Tiashaa Chatterjee', 'Cuttack');

begin
    <<getcustomer>>
    declare
        cname char(100);
        addrs char(100);
    begin
        select cname, addrs
        into   cname, addrs
        from   customer
        where  cid = :customer_id;

        dbms_output.put_line('Name ' || cname);
        dbms_output.new_line;
        dbms_output.put_line('Addr ' || addrs);
    exception
        when no_data_found then
            dbms_output.put_line('No such customer.');
    end;
end;
/
/* end of customer.sql */

/* OUTPUT

PRN  506
Name Ankit Pati

*/

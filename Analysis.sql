create database if not exists github;

use github;

select * from cardionex_csv;


create temporary table temp_tablee as
select regions, MR, Brands, Attributes,
'Apr-23' as months , `apr-23` as sales from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'May-23'  , `may-23` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Jun-23'  , `jun-23` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Jul-23'  , `jul-23` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Aug-23'  , `aug-23` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Sep-23'  , `sep-23` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Oct-23'  , `oct-23` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Nov-23'  , `nov-23` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Dec-23'  , `dec-23`from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Jan-24'  , `jan-24` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Feb-24'  , `feb-24` from cardionex_csv
union all
select regions, MR, Brands, Attributes,
'Mar-24'  , `mar-24` from cardionex_csv;

SET sql_safe_updates = 0;

Select * from temp_tablee;



update temp_tablee
set sales = 2.5
where attributes = 'Pri Sales Val' and sales = 0;

update temp_tablee
set sales = 4000
where attributes = 'Pri Sales Units' and sales = 0;

update temp_tablee
set sales = 4.5
where attributes = 'Sec Sales Val' and sales = 0;

update temp_tablee
set sales = 6000
where attributes = 'Sec Sales Units' and sales = 0;

update temp_tablee 
set regions = trim(regions);

update temp_tablee 
set regions = trim(brands);

update temp_tablee 
set regions = trim(attributes);

select * from temp_tablee;

DROP TABLE 
TEMP_TABLEE;

use github;

select * from neurovia_csv;
create temporary table temp_table2 as
select regions, MR, Brands, Attributes,
'Apr-23' as months , `apr-23` as sales from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'May-23'  , `may-23` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Jun-23'  , `jun-23` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Jul-23'  , `jul-23` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Aug-23'  , `aug-23` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Sep-23'  , `sep-23` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Oct-23'  , `oct-23` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Nov-23'  , `nov-23` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Dec-23'  , `dec-23`from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Jan-24'  , `jan-24` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Feb-24'  , `feb-24` from neurovia_csv
union all
select regions, MR, Brands, Attributes,
'Mar-24'  , `mar-24` from neurovia_csv;

select * from temp_table2;

select * from(
select * 
from temp_tablee as a
left join temp_table2 as b 
on a.months = b.months) as left_join_part
union
select * from(
select * 
from temp_tablee as a
right join	temp_table2 as b
on a.months = b.months) as right_join_part;

update temp_table2 
set sales = sales * 3.5;

select * from temp_table2;



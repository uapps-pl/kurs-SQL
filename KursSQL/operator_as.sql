------------------------------------------------
-- author: KM
-- site: uapps.pl
-- email: support@uapps.pl
------------------------------------------------

--drop table countries
create table countries(
	prefix varchar(3) primary key,
	name varchar(50)
)

insert into countries(prefix, name) select 'PL', 'Polska'
insert into countries(prefix, name) select 'DE', 'Niemcy'
insert into countries(prefix, name) select 'LT', 'Litwa'
insert into countries(prefix, name) select 'CZ', 'Czechy'
insert into countries(prefix, name) select 'SK', 'S³owacja'

select prefix, name as text from countries
select prefix, name text from countries
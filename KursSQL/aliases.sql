------------------------------------------------
-- author: KM
-- site: uapps.pl
-- email: support@uapps.pl
------------------------------------------------
Przyk³ad 1

select * from event_groups
select id, descr from event_groups
select event_groups.id, event_groups.descr from event_groups
select eg.id, eg.descr from event_groups eg

select event_groups.id, eg.descr from event_groups eg

------------------------------------------------
Przyk³ad 2

select e.id, e.id_group_event, e.descr, eg.id, eg.descr from events e
join event_groups eg on eg.id = e.id_group_event

select events.id, events.id_group_event, events.descr, event_groups.id, event_groups.descr from events
join event_groups on event_groups.id = events.id_group_event

select * from events
join event_groups on event_groups.id = events.id_group_event

------------------------------------------------
Przyk³ad 3

--drop table countries
create table countries(
	prefix varchar(3) primary key,
	name varchar(50)
)

--drop table test_item_countries
create table test_item_countries(
	id int identity,
	country1 varchar(3) foreign key references countries(prefix) not null,
	country2 varchar(3) foreign key references countries(prefix),
	country3 varchar(3) foreign key references countries(prefix)
)

insert into countries(prefix, name) select 'PL', 'Polska'
insert into countries(prefix, name) select 'DE', 'Niemcy'
insert into countries(prefix, name) select 'LT', 'Litwa'
insert into countries(prefix, name) select 'CZ', 'Czechy'
insert into countries(prefix, name) select 'SK', 'S³owacja'

insert into test_item_countries(country1, country2, country3) select 'PL', null, null
insert into test_item_countries(country1, country2, country3) select 'DE', null, null
insert into test_item_countries(country1, country2, country3) select 'DE', 'PL', null
insert into test_item_countries(country1, country2, country3) select 'DE', 'PL', 'SK'
insert into test_item_countries(country1, country2, country3) select 'PL', 'DE', 'SK'

select * from countries
select * from test_item_countries

select i.country1, i.country2, i.country3, c1.name, c2.name, c3.name
from test_item_countries i
join countries c1 on c1.prefix = i.country1
join countries c2 on c2.prefix = i.country2
join countries c3 on c3.prefix = i.country3
where i.id = 5

------------------------------------------------
--Przyk³ad 4

select i.country1, i.country2, i.country3, name
from test_item_countries i
join countries c1 on c1.prefix = i.country1
join countries c2 on c2.prefix = i.country2
join countries c3 on c3.prefix = i.country3
where i.id = 5

-- Sqlserver
-- find the first longest consecutive years
-- https://stackoverflow.com/questions/56878926/how-to-find-the-first-longest-consecutive-years

create table test1 (year int)

insert into test1 values
(1992), --1
(1993), --2
(1994), --3
(1995), --4
(1995), --4
(1997), --1
(1998), --2
(2000), --1
(2001), --2
(2002), --3
(2003), --4
(2003), --4
(2008)  --1


select top (1) min(year), max(year)
from (select t.*, dense_rank() over (order by year) as seqnum
      from test1 t
     ) t
group by year - seqnum
order by max(year) - min(year) desc, min(year) asc;

-- References https://stackoverflow.com/questions/1241178/mysql-rows-to-columns
-- DEMO http://sqlfiddle.com/#!9/f44a1e/57
-- DEMO http://sqlfiddle.com/#!9/09408/780

-- TABLE STRUCTURE
Drop TABLE IF EXISTS `goods`;
create TABLE `goods`(
	id int,
	good_prop varchar(20),
	good_prop_value varchar(20)
)

insert into goods values
(1,'name','demo'),
(1,'age','15'),
(1,'heigh','180'),
(2,'name','test'),
(2,'home','anhui'),

select * from goods;

set @sql = null;

-- use max 
-- sum has bug ???
select group_concat(
	concat('max(case when good_prop=''',good_prop,''' then good_prop_value end as ',good_prop_value)
) into @sql from goods where condtion;

-- like max(case when good_prop='name' then good_prop_value end) as name,max(case when good_prop='age' then good_prop_value end) as age,max(case when good_prop='weigh' then good_prop_value end) as weigh
select @sql;

-- use sql to query

-- use prepare uncheck
SET @sql = CONCAT('SELECT id, ', @sql, ' from goods where condtion group by id');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


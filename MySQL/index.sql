-- MySQL index

-- no.1 use ranking variable
-- if use select * from table1 etc,mysql will warning SQL syntax
select id ,@rankno:=@rankno+1 from table1 ,(select @rankno:=0) r ;

-- ps:
-- "=":
	-- set和update时，和“:=”一样，都是赋值，其他的都是等于判断
	-- when use update or set,"=" is same as ":=",means give values.
		-- other condition means equal
-- ":=":
	-- always give values
	-- 总是赋值
	
	

-- MYSQL 8.0
SELECT id,rank () OVER (ORDER BY id) indexer FROM node_copy1;
-- see also ,rank () OVER (PARTITION BY a,b ORDER BY b)

--in和exists区别
--区分in和exists主要是造成了驱动顺序的改变（这是性能变化的关键）
--如果是exists，那么以外层表为驱动表，先被访问，如果是IN，那么先执行子查询。
--所以IN适合于外表大而内表小的情况；EXISTS适合于外表小而内表大的情况

--sql 优化，没有验证
--原sql
select colname ... from A表 where a.id not in (select b.id from B表)
--优化后的sql
select colname … from A表 Left join B表 on where a.id = b.id where b.id is null

--分页优化，没有验证
--原sql
select id,name from product limit 866613, 20
--优化sql
select id,name from product where id> 866612 limit 20

--对于null的判断会导致引擎放弃使用索引而进行全表扫描

--LIKE “%name”或者LIKE “%name%”，这种查询会导致索引失效而进行全表扫描
--可以使用LIKE “name%”
--前后匹配可以使用全文索引

--LEFT JOIN A表为驱动表
--INNER JOIN MySQL会自动找出那个数据少的表作用驱动表
--RIGHT JOIN B表为驱动表

-- 使用覆盖索引
-- 延迟关联
-- 高性能mysql 第三版 172页
select * from products where actor='sean' and title like '%app%'
--修改为
select * from products join (select prod_id from products where actor='sean' and title like '%app%') as t1
on t1.prod_id = products.prod_id

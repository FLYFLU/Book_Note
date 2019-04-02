-- MySQL index

-- no.1 use ranking variable
-- if use select * from table1 etc,mysql will warning SQL syntax
select id ,@rankno:=@rankno+1 from table1 (select @rankno:=0) r ;

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

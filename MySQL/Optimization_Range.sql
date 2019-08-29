-- 创建表结构
CREATE TABLE t1 (f1 INT NOT NULL, f2 INT NOT NULL, PRIMARY KEY(f1, f2));
INSERT INTO t1 VALUES
  (1,1), (1,2), (1,3), (1,4), (1,5),
  (2,1), (2,2), (2,3), (2,4), (2,5);
INSERT INTO t1 SELECT f1, f2 + 5 FROM t1;
INSERT INTO t1 SELECT f1, f2 + 10 FROM t1;
INSERT INTO t1 SELECT f1, f2 + 20 FROM t1;
INSERT INTO t1 SELECT f1, f2 + 40 FROM t1;
ANALYZE TABLE t1;

EXPLAIN SELECT f1, f2 FROM t1 WHERE f2 > 40;

-- 官方解释
-- 要执行此查询，
-- MySQL可以选择索引扫描来获取所有行（索引包括要选择的所有列），
-- 然后从WHERE子句应用f2> 40条件以生成最终结果集。
-- 猜想：索引中包含了f2，使用了索引进行全部扫描（内存），而不是直接扫描（磁盘IO），达到优化

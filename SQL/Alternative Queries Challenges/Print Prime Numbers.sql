WITH t AS
        (    SELECT LEVEL n, LEVEL * LEVEL n2
               FROM DUAL
         CONNECT BY LEVEL <= 1000)
    ,tt AS
        (SELECT t1.n
           FROM t t1
          WHERE NOT EXISTS
                   (SELECT 1
                      FROM t t2
                     WHERE t1.n >= t2.n2
                       AND t2.n != 1
                       AND MOD(t1.n, t2.n) = 0))
SELECT LISTAGG(tt.n, '&') WITHIN GROUP (ORDER BY tt.n) AS res
  FROM tt
  where tt.n != 1;
  
/*  
-- for Oracle 10G:
WITH t AS
        (    SELECT LEVEL n, LEVEL * LEVEL n2
               FROM DUAL
         CONNECT BY LEVEL <= 1000)
    ,tt AS
        (SELECT t1.n
           FROM t t1
          WHERE NOT EXISTS
                   (SELECT 1
                      FROM t t2
                     WHERE t1.n >= t2.n2
                       AND t2.n != 1
                       AND MOD(t1.n, t2.n) = 0))
SELECT replace(wm_concat(tt.n), ',', '&')
  FROM tt
  where tt.n != 1;
*/  
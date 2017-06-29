create table Functions (
  X number,
  Y number
);

insert into Functions(X,Y) values (20,20);
insert into Functions(X,Y) values (20,20);
insert into Functions(X,Y) values (20,21);
insert into Functions(X,Y) values (23,22);
insert into Functions(X,Y) values (22,23);
insert into Functions(X,Y) values (21,20);
commit;

SELECT X, Y
  FROM (
        SELECT X, Y
          FROM Functions f1
         WHERE X < Y
           AND EXISTS (SELECT 1 FROM Functions f2 WHERE f2.X = f1.Y AND f2.Y = f1.X)
        UNION
        SELECT X, Y
          FROM Functions
         WHERE X = Y
        GROUP BY X, Y
        HAVING COUNT(*) > 1
       ) t
ORDER BY X;
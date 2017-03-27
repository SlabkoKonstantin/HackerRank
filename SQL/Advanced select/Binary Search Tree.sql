/*
create table rf.BST (
  N integer,
  P integer
)
tablespace quorum_data;

insert into rf.BST(N,P) values (1,2);
insert into rf.BST(N,P) values (3,2);
insert into rf.BST(N,P) values (6,8);
insert into rf.BST(N,P) values (9,8);
insert into rf.BST(N,P) values (2,5);
insert into rf.BST(N,P) values (8,5);
insert into rf.BST(N,P) values (5,null);
commit;
*/

  SELECT t1.n, case when t1.l = t1.max_l then 'Leaf' 
                    when t1.l = t1.min_l then 'Root'
                    else 'Inner' end as node
    FROM (SELECT t.n, t.l, MAX(t.l) OVER () AS max_l, MIN(t.l) OVER () AS min_l
            FROM (    SELECT n, p, LEVEL AS l
                        FROM rf.bst
                  CONNECT BY PRIOR n = p
                  START WITH p IS NULL) t) t1
ORDER BY t1.n
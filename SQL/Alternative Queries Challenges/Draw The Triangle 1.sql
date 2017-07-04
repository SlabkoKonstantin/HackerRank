    SELECT rpad('* ',(max(level) over() - level + 1)*2,'* ') as res
      FROM DUAL
CONNECT BY LEVEL <= 20;
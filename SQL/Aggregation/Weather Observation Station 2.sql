/*
CREATE TABLE STATION
(
  id  INTEGER,
  city         VARCHAR2(21),
  state       VARCHAR2(2),
  lat_n number,
  long_w number
)
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING;
/

INSERT into STATION(id,city,state,lat_n,long_w) values (1,'City1','S1',12.5,13.6);
INSERT into STATION(id,city,state,lat_n,long_w) values (2,'City2','S2',11.3,28.7);
INSERT into STATION(id,city,state,lat_n,long_w) values (3,'City3','S3',6.7,31.3);
commit;
/
*/

select round(sum(lat_n),2), round(sum(long_w),2) from STATION;
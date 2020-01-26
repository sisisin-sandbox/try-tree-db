# connect

```bash
psql -h 127.0.0.1 -U root
```

# init

```sql
-- create
CREATE TABLE orgchart
(emp CHAR(10) NOT NULL PRIMARY KEY,
lft INTEGER NOT NULL,
rgt INTEGER NOT NULL,
  CHECK (lft < rgt));

-- insert
INSERT INTO orgchart (emp,lft,rgt)
VALUES
('Albert',1,12),
('Bert',2,3),
('Chuck',4,11),
('Donna',5,6),
('Eddie',7,8),
('Fred',9,10);
```

```sql
create table assemblies (
  part char(2) not null,
  lft integer not null,
  rgt integer not null
);

insert into assemblies values
('A',1,28),
('B',2,5),
('C',6,19),
('D',20,27),
('E',3,4),
('F',7,16),
('G',17,18),
('H',21,26),
('I',8,9),
('J',10,15),
('K',22,23),
('L',24,25),
('M',11,12),
('N',13,14);
```

```sql
create table frammis(
  part char(2) primary key,
  qty integer not null constraint positive_qty check (qty > 0),
  wgt integer default 0 not null constraint non_negative_wgt check ((wgt=0 and rgt-lft > 1) or (wgt >0 and rgt-lft=1)),
  lft integer not null unique constraint valid_lft check (lft>0),
  rgt integer not null unique constraint valid_rgt check (rgt>1), constraint valid_range_pair check (lft<rgt)
);

insert into frammis values
('A',1,0,1,28),
('B',1,0,2,5),
('C',2,0,6,19),
('D',2,0,20,27),
('E',2,12,3,4),
('F',5,0,7,16),
('G',2,6,17,18),
('H',3,0,21,26),
('I',4,8,8,9),
('J',1,0,10,15),
('K',5,3,22,23),
('L',1,4,24,25),
('M',2,7,11,12),
('N',3,2,13,14);
```

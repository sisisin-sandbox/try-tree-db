-- 部分木を見つける
select mgrs.emp as boss, workers.emp as worker
from orgchart mgrs, orgchart workers
where workers.lft > mgrs.lft
and workers.lft < mgrs.rgt
;

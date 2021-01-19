select
 h.ID,
h.START_TIME,
 h.END_TIME, 
h.GROUP_ID 
FROM (
select 
    id, start_time, end_time,
    case when @id = id and start_time >= @end_time then @reminder + 1 else 1 end as group_id,
    @id:=id as id_set,
    @reminder:= case when @id = id and start_time >= @end_time then @reminder + 1 else 1 end as reminder,
    @end_time:=end_time
from Activity t
order by id, start_time) h;
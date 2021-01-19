select 
ORIGINAL_DATE,
date_format(
date_add(ORIGINAL_DATE, 
 interval 
   if(
    dayofweek(ORIGINAL_DATE)>1, 8-dayofweek(ORIGINAL_DATE),
     0
    ) 
  day
  ), 
 "%Y%m%d"
) as 'END_OF_WEEK', 
last_day(ORIGINAL_DATE) as 'END_OF_MONTH' 
from table1;
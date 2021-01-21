create table Activity( ID int, START_TIME time, END_TIME time );
insert into Activity( ID, START_TIME, END_TIME) VALUES (100, '10:00', '12:00'), (100, '10:15', '12:30'), (100, '12:15', '12:45')
,(100, '13:00', '14:00') ,(200, '10:15', '10:30');
select 
h.ID,
h.START_TIME, 
h.END_TIME,
h.previousEndT,
h.GROUP_ID,
h.id_set,
h.row_n,
h.reminder
FROM (
select      
ID, START_TIME, END_TIME,    
@row_number as row_n, @ENDT as previousEndT, @id_set as id_set,
case 
 when @row_number = 0 then 1
  when @id_set != ID then @reminder + 1 
  when @id_set = ID and START_TIME >= @ENDT then @reminder + 1
  else @reminder 
end as GROUP_ID,
@reminder:= 
case 
 when @row_number = 0 then 1
  when @id_set != ID then @reminder + 1 
  when @id_set = ID and START_TIME >= @ENDT then @reminder + 1
  else @reminder end as reminder, 
@id_set:=ID ,
@ENDT := END_TIME,
@row_number := @row_number + 1
from Activity t, (SELECT @row_number:=0, @reminder := 1, @ENDT := '00:00:00', @id_set:= 0 ) AS n
order by ID, START_TIME) h;

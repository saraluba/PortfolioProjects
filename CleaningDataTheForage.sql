-- DATA CLEANING --

select * 
from reactiontypes r

select *
from "Content" c 

select *
from reactions r 


alter table "Content" 
rename column "Type" to "Content Type"

alter table reactions 
rename column "Type" to "Reaction Type"


--REMOVING ROWS WITH MISSING VALUES--

--checking using Python that only Type and User ID have missing values in Reactions table--
delete
from reactions r 
where r."Type" = '' or r."User ID" =''

--checking using Python that only URL has missing values in Reactions table--
delete
from "Content" c 
where c.url=''

--checking using Python that Reactiontypes table has no missing values--


--CHANGING THE DATA TYPE OF SOME VALUES WITHIN A COLUMN--

alter table reactions
alter column datetime TYPE timestamp
using datetime::timestamp

select datetime
from reactions r 


--REMOVING COLUMNS WHICH ARE NOT REVELANT TO TASK--

alter table "Content" 
drop column URL

alter table "Content" 
drop column "User ID"

alter table reactions 
drop column "User ID"

select count(*)
from reactions r 





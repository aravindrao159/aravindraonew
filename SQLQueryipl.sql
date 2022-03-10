----match1 mi vs rcb 
select * from ipl where match_name like '%2021-04-09'

---- total runs in that match 
select sum(total_runs) from ipl where match_name like '%2021-04-09'

---- total runs in 1st inngings in that match
select  sum(total_runs) from ipl where match_name like '%2021-04-09' and
inning = '1st innings'

---total runs in 1st inngings in that match
select  sum(total_runs) from ipl where match_name like '%2021-04-09' and
inning = '2nd innings'

---- who is winner of the match 
select distinct(winner) from ipl where match_name like '%2021-04-09' 

----highest scoring batsman in that  tournment 
select sum(batsman_run) as runs ,non_striker  from ipl group by non_striker 
order by runs  desc   

---- highest scoring batsmen in that match 
select * from (select sum(batsman_run) as runs ,batsman ,row_number() over
(  order by sum(batsman_run) desc ) as rno  from ipl) as e 
where match_name like '%2021-04-09' and rno =1    group by batsman  


present match 
select * from ipl where match_name like '%2021-04-09'

-----player of match 
select distinct(player_of_match) from ipl where match_name like '%2021-04-09'

---- show only top batsmen 
select * from (select sum(total_runs) as runs , batsman, row_number() over
( order by sum(total_runs) desc ) as rno  from ipl
where match_name like '%2021-04-09' group by batsman ) as e where rno =1

select * from ipl

-----most runs in one match 

select sum(total_runs)as totalrunspermatch , match_name   from ipl group by match_name 
order by sum(total_runs) desc 

-----
select * from ipl
select player_out,elimination_kind ,fielders_caught from ipl where player_out is not null

--- how virat kohili  out all the times 
select player_out,elimination_kind ,fielders_caught from ipl where player_out like 'V Kohli'


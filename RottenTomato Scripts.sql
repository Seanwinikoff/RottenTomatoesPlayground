--this selects the top movies/decade
select 
count(1),
(date_part('decade', release_date) * 10) as decade
from 
movies
group by
decade
order by 
decade desc;

--this shows how many times these actors show up in movies-- uses joins to connect all 3 tables together 
select 
count(entertainment_workers.name)
, entertainment_workers."name" names
from  
movies  
inner join movie_workers  
on movies.id = movie_workers.movie_id
inner join entertainment_workers 
on movie_workers.worker_id = entertainment_workers.id
where
movie_workers.credit_type = 'actor'
group by
 entertainment_workers."name"
order by 
count desc 
limit 10;


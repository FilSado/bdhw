--Задание 2
--    Название и продолжительность самого длительного трека.
 select duration, name
 from track 
 order by duration DESC 
 limit 1;
 --    Название треков, продолжительность которых не менее 3,5 минут.
select name, duration
from track 
where duration >= 210
order by duration DESC;
--    Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name 
from compilation 
where year between 2018 and 2020;
--    Исполнители, чьё имя состоит из одного слова.
select nickname
from performers 
where nickname not like '%% %%';
--    Название треков, которые содержат слово «Мой» или «My».
select name from track 
where name ilike 'my %'
or name ilike '% my'
or name ilike '% my %'
or name ilike 'my'
or name ilike '% мой'
or name ilike '% мой %'
or name ilike 'мой'
or name ilike 'мой %'
;

-- Дополнительные необязательные способы реализации
-- 1
SELECT name from track 
WHERE string_to_array (lower(name), ' ') 
&& ARRAY['my %', '% my', '% my %', 'my', '% мой', '% мой %', 'мой', 'мой %']; 




--Задание 3
--    Количество исполнителей в каждом жанре.
select g.type, count(nickname)
from genres as g
join genresperformers as gp on g.id = gp.genresid
join performers as p on gp.performersid = p.id 
group by g.type
order by count(p.id) DESC;
--    Количество треков, вошедших в альбомы 2019–2020 годов.
select t.name, a.year
from album as a
join track as t on t.album_id = a.id
where a."year" between 2019 and 2020;
 --    Средняя продолжительность треков по каждому альбому.
select a.name, AVG(t.duration)
from album as a
join track as t on t.album_id = a.id
group by a.name
order by AVG(t.duration);
--    Все исполнители, которые не выпустили альбомы в 2020 году.
select distinct nickname 
from performers as p
where nickname  not in (
    select distinct nickname 
    from performers as p
    join albumperformers as ap on p.id = ap.performersid
    join album as a on a.id = ap.albumid
    where a.year = 2020
)
order by nickname;
--    Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct coll.name, nickname
from performers as p
join albumperformers as ap on ap.performersid = p.id
join album as a on ap.albumid = a.id
join track as t on t.album_id = a.id
join compilationtrack as cp on cp.trackid = t.id
join compilation as coll  on coll.id = cp.compilationid 
where nickname = '50 Cent';

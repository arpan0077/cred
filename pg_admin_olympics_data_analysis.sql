DROP TABLE IF EXISTS OLYMPICS_HISTORY;
CREATE TABLE IF NOT EXISTS OLYMPICS_HISTORY
(
    id          INT,
    name        VARCHAR,
    sex         VARCHAR,
    age         VARCHAR,
    height      VARCHAR,
    weight      VARCHAR,
    team        VARCHAR,
    noc         VARCHAR,
    games       VARCHAR,
    year        INT,
    season      VARCHAR,
    city        VARCHAR,
    sport       VARCHAR,
    event       VARCHAR,
    medal       VARCHAR
);

DROP TABLE IF EXISTS OLYMPICS_HISTORY_NOC_REGIONS;
CREATE TABLE IF NOT EXISTS OLYMPICS_HISTORY_NOC_REGIONS
(
    noc         VARCHAR,
    region      VARCHAR,
    notes       VARCHAR
);

select * from OLYMPICS_HISTORY;
select * from OLYMPICS_HISTORY_NOC_REGIONS;

select sport, min(date), max(date),count(year) 
from olympics_history;

--count of medal team wise
select team ,count(medal)  from olympics_history
group by 1
order by count(medal) desc
;
---more than 5 medal
select team ,count(medal)  from olympics_history
group by 1
having count(medal) >5
order by count(medal) desc
;

---zero medal 
select team ,count(medal)  from olympics_history
group by 1
having count(medal) =0
order by team asc
;

---zero medal 
select team   from olympics_history
group by 1
having count(medal) <1
order by team asc
;
---- winter + height in where calus
select distinct event from olympics_history
where season ='Winter' and
height between '180' and '210'  
order by event asc;
--atelr table
alter TABLE olympics_history
alter COLUMN height  type int8 USING height::int8; --not changing

---- name +gold+silver+40age
select name from olympics_history 
where age > '40' and medal in ('Bronze', 'Silver')
order by name desc;

--age below 18 and game played
select name, age,games, event from olympics_history 
where age <= '18' 

--unique event 
select  distinct event from olympics_history
where name = 'Christine Jacoba Aaftink';

---sport +event
select distinct name from olympics_history
where sport = 'Swimming' and city = 'London'
order by 1 asc;

---athlete +team+won >0 select distinct name from olympics
select distinct name from olympics_history
where team = 'Denmark' 
group by 1
having count(medal) >0;

---age between 20 and 30 which is includede
select count(*) from olympics_history;
select team,
avg(weight) as avgerage_player_weight  from olympics_history 
where  sport = 'Judo' and medal is not null
group by 1
having min (age) >= 20 and max (age) <= 30;

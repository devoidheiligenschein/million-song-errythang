sqlite3 year2.db

drop table year2;
CREATE TABLE year2 ( year INT, count_songs INT);
.separator "\t"
.import /home/moham1f/year2/part-r-00000 year2

drop table name2;
CREATE TABLE name2 ( artist_name varchar2,  count_title int, release varchar2);
.separator "\t"
.import /home/moham1f/name2/part-r-00000 name2

drop table loud2;
CREATE TABLE loud2 ( year int, loudness float, artist_name varchar2, title varchar2);
.separator "\t"
.import /home/moham1f/loud3/part-r-00000 loud2

drop table hot2;
CREATE TABLE hot2 ( year int, artist_hotttness float, artist_name varchar2, title varchar2);
.separator "\t"
.import /home/moham1f/hot3/part-r-00000 hot2




--1) Number of songs released each year | 
select * from year2 where year = 1990;
--2) Average number of songs released per year | 
select avg(count_songs) from year2;
--3) List the names of artists with a particular number of songs released | 
select artist_name from name2 where count_title > 50;
--4) List the names of all the albums released by a particular artist | 
select artist_name, release from name2 where count_title > 30;
--5)List the maximum loudness for every year
select year,loudness from loud2;
--6)List the mean of artist_hotness for all artists every year 
select artist_hotttness from hot2;



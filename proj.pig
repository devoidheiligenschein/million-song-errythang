~~pig -x local

songs = LOAD 'hdfs://ChipCloud1/user/moham1f/project/MillionSong.csv' USING PigStorage(',') AS (artist_id:chararray, artist_name:chararray, 
title:chararray, release:chararray, track_id:chararray, duration:float, year:int, loudness:float, tempo:float, danceability:float,
 song_hotttness:float, artist_hotttness:float, artist_familiarity:float, artist_location:chararray,  similar_artists:chararray);

generate_track_id = FOREACH songs GENERATE track_id, title;
grouped_track_id = GROUP generate_track_id BY track_id;
count = FOREACH grouped_track_id GENERATE group, COUNT($1) AS cnt, $1;
filter_count = FILTER count BY $1 < 4;
grp_count = GROUP filter_count ALL;
filtered_count = FOREACH grp_count GENERATE COUNT(filter_count);

grp_year = GROUP songs by year; 
grp_year1 = FILTER grp_year by (songs.year) is not null;
grp_year2 = FOREACH grp_year1 GENERATE $0 AS year, COUNT(songs.track_id); 
STORE grp_year2 into 'year2';

grp_name = GROUP songs by artist_name;  
grp_name1 = FILTER grp_name by (songs.artist_name) is not null;
grp_name2 = FOREACH grp_name1 GENERATE $0 AS artist_name, COUNT(songs.title), songs.release;
STORE grp_name2 into 'name2';

grp_name = GROUP songs by year;  
grp_name1 = FILTER grp_name by (songs.year) is not null;
grp_name2 = FOREACH grp_name1 GENERATE $0 AS year, MAX(songs.loudness), songs.artist_name, songs.title;
STORE grp_name2 into 'loud3';

grp_name = GROUP songs by year;
grp_name1 = FILTER grp_name by (songs.year) is not null;
grp_name2 = FOREACH grp_name1 GENERATE $0 AS year, MAX(songs.artist_hotttness), songs.artist_name, songs.title;
STORE grp_name2 into 'hot3';






 

 

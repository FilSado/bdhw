create table if not exists album (
id SERIAL PRIMARY key,
name varchar(50) UNIQUE not null,
year integer,
-- for year of realise use year not older then 1984
CONSTRAINT check_age_1 CHECK (year > '1984')
);
create table if not exists track (
id SERIAL PRIMARY KEY,
name varchar(50) UNIQUE not null,
duration integer,
-- for time use seconds but no more then 600 seconds
album_id integer references album(id),
CONSTRAINT check_duration_1 CHECK (duration < '600')
);
create table if not exists performers(
id serial primary key,
nickname varchar(50) UNIQUE not null
);
create table if not exists albumperformers(
performersid integer references performers(id),
albumid integer references album(id),
constraint pk_1 primary key (performersid, albumid)
);
create table if not exists genres(
id serial primary key,
type varchar(50) unique not null
);
create table if not exists genresperformers(
performersid integer references performers(id),
genresid integer references genres(id),
constraint pk_2 primary key (performersid, genresid)
);
create  table if not exists compilation(
id serial primary key,
name varchar(50) UNIQUE not null,
year integer not null,
-- for year of realise use year not older then 1984
CONSTRAINT check_age_2 CHECK (year > '1984')
);
create table if not exists compilationtrack(
trackid integer references track(id),
compilationid integer references compilation(id),
constraint pk_3 primary key (trackid, compilationid)
);
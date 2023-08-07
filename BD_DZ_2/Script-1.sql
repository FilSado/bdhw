INSERT INTO genres(type)
values ('hip-hop'),('electronica'),('rock');

INSERT INTO performers(nickname)
values ('50 Cent'),
('Snoop Dogg'),
('Skrillex'),
('The Prodigy'),
('Gorillaz'),
('Freddie Mercury');

INSERT INTO album(name, year)
values ('Best of 50 Cent', '2017'),('I Wanna Thank Me', '2019'),('Recess', '2014'),('Best Hits', '2011'),('Demon Days', '2015'),('Mr Bad Guy', '1985');

INSERT INTO track(name, duration, album_id)
values ('Just A Lil Bit', '257', 1),('In Da Club', '225', 1),('I C Your Bullshit', '227', 2),('What U Talkin Bout', '162', 2),('Stranger', '289', 3),('Doompy Poomp', '205', 3),('The Way It Original Mix', '346', 4),('Piranha Original Mix', '244', 4),('Demon Days', '268', 5),('Dirty Harry', '223', 5),('Living On My Own', '219', 6),('I Was Born To Love You', '216', 6);

INSERT INTO compilation(name, year)
values ('Eminem & 50 Cent - Breaking Point 2', '2014'), ('2 Of Americaz Most Wanted', '1998'), ('Don’t Get Too Close', '2023'), ('We Live Forever Teddy Killerz Remix', '2019'), ('The Now Now', '2018'), ('Messenger Of The Gods', '2016');

INSERT INTO genresperformers (performersid, genresid)
values (1,1),(2,1),(3,2),(4,2),(5,3),(6,3);

INSERT INTO albumperformers (performersid, albumid)
values (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);

INSERT INTO compilationtrack (trackid,compilationid)
values (1,1),(3,2),(5,3),(7,4),(9,5),(11,6);
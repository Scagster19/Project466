SET FOREIGN_KEY_CHECKS=0;
-- Drop existing tables if they exist
DROP TABLE IF EXISTS Singer, Song, Contributor, KFile, Queue, QueuePaid;

CREATE TABLE Singer(
    SingerID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SingerName VARCHAR(255)
);

CREATE TABLE Contributor(
    ContributorID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ContributorName VARCHAR(255),
    ContributorToSong VARCHAR(255),
    ContributorAs VARCHAR(255)
);

CREATE TABLE Song(
    SongID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Title VARCHAR(255),
    Artist VARCHAR(255),
    ContributorID INT,
    FOREIGN KEY (ContributorID) REFERENCES Contributor(ContributorID)
);


CREATE TABLE KFile(
    KFileID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Song VARCHAR(255),
    SongID INT,
    Version VARCHAR(255),
    FOREIGN KEY (SongID) REFERENCES Song(SongID)
);

CREATE TABLE Queue(
    QueueID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SingerID INT,
    KFileID INT,
    FOREIGN KEY (SingerID) REFERENCES Singer(SingerID),
    FOREIGN KEY (KFileID) REFERENCES KFile(KFileID)
);

CREATE TABLE QueuePaid(
    QueuePaidID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Paid DECIMAL(10,2),
    SingerID INT,
    KFileID INT,
    FOREIGN KEY (SingerID) REFERENCES Singer(SingerID),
    FOREIGN KEY (KFileID) REFERENCES KFile(KFileID)
);

-- Inserts for Singer table
INSERT INTO Singer (SingerName) VALUES ('John Doe'), ('Jane Smith');

-- Inserts for Contributor table
INSERT INTO Contributor (ContributorName, ContributorToSong, ContributorAs) VALUES
('Freddie Mercury', 'Bohemian Rhapsody', 'Singer'),
('Steve Perry', 'Don''t Stop Believin''', 'Singer'),
('Neil Diamond', 'Sweet Caroline', 'Singer'),
('Jon Bon Jovi', 'Livin'' on a Prayer', 'Singer'),
('Noel Gallagher', 'Wonderwall', 'Singer/Guitarist'),
('Michael Jackson', 'Billie Jean', 'Singer'),
('Don Felder', 'Hotel California', 'Guitarist'),
('Adele', 'Rolling in the Deep', 'Singer'),
('Bryan Adams', 'Summer of ''69', 'Singer'),
('Billy Joel', 'Piano Man', 'Singer'),
('Sting', 'Every Breath You Take', 'Singer'),
('Dolly Parton', 'I Will Always Love You', 'Singer'),
('Magne Furuholmen', 'Take on Me', 'Keyboardist'),
('Kurt Cobain', 'Smells Like Teen Spirit', 'Singer/Guitarist'),
('Cyndi Lauper', 'Girls Just Want to Have Fun', 'Singer'),
('Frankie Sullivan', 'Eye of the Tiger', 'Guitarist'),
('Maurice White', 'Boogie Wonderland', 'Singer'),
('John Lennon', 'I Want to Hold Your Hand', 'Singer'),
('Whitney Houston', 'I Wanna Dance with Somebody', 'Singer'),
('Phil Oakey', 'Don''t You Want Me', 'Singer');

-- Inserts for Song table
INSERT INTO Song (Title, Artist, ContributorID) VALUES
('Bohemian Rhapsody', 'Queen', 1),
('Dont Stop Believin', 'Journey', 2),
('Sweet Caroline', 'Neil Diamond', 3),
('Livin on a Prayer', 'Bon Jovi', 4),
('Wonderwall', 'Oasis', 5),
('Billie Jean', 'Michael Jackson', 6),
('Hotel California', 'Eagles', 7),
('Rolling in the Deep', 'Adele', 8),
('Summer of 69', 'Bryan Adams', 9),
('Piano Man', 'Billy Joel', 10),
('Every Breath You Take', 'The Police', 11),
('I Will Always Love You', 'Whitney Houston', 12),
('Take on Me', 'a-ha', 13),
('Smells Like Teen Spirit', 'Nirvana', 14),
('Girls Just Want to Have Fun', 'Cyndi Lauper', 15),
('Eye of the Tiger', 'Survivor', 16),
('Boogie Wonderland', 'Earth, Wind & Fire', 17),
('I Want to Hold Your Hand', 'The Beatles', 18),
('I Wanna Dance with Somebody', 'Whitney Houston', 19),
('Dont You Want Me', 'The Human League', 20);

INSERT INTO KFile (Song, SongID, Version) VALUES
('bohemian_rhapsody_karaoke.mp3', 1, 'Standard'),
('bohemian_rhapsody_duet_karaoke.mp3', 1, 'Duet'),
('dont_stop_believin_karaoke.mp3', 2, 'Standard'),
('dont_stop_believin_duet_karaoke.mp3', 2, 'Duet'),
('sweet_caroline_karaoke.mp3', 3, 'Standard'),
('sweet_caroline_duet_karaoke.mp3', 3, 'Duet'),
('livin_on_a_prayer_karaoke.mp3', 4, 'Standard'),
('livin_on_a_prayer_duet_karaoke.mp3', 4, 'Duet'),
('wonderwall_karaoke.mp3', 5, 'Standard'),
('wonderwall_duet_karaoke.mp3', 5, 'Duet'),
('billie_jean_karaoke.mp3', 6, 'Standard'),
('billie_jean_duet_karaoke.mp3', 6, 'Duet'),
('hotel_california_karaoke.mp3', 7, 'Standard'),
('hotel_california_duet_karaoke.mp3', 7, 'Duet'),
('rolling_in_the_deep_karaoke.mp3', 8, 'Standard'),
('rolling_in_the_deep_duet_karaoke.mp3', 8, 'Duet'),
('summer_of_69_karaoke.mp3', 9, 'Standard'),
('summer_of_69_duet_karaoke.mp3', 9, 'Duet'),
('piano_man_karaoke.mp3', 10, 'Standard'),
('piano_man_duet_karaoke.mp3', 10, 'Duet'),
('every_breath_you_take_karaoke.mp3', 11, 'Standard'),
('every_breath_you_take_duet_karaoke.mp3', 11, 'Duet'),
('i_will_always_love_you_karaoke.mp3', 12, 'Standard'),
('i_will_always_love_you_duet_karaoke.mp3', 12, 'Duet'),
('take_on_me_karaoke.mp3', 13, 'Standard'),
('take_on_me_duet_karaoke.mp3', 13, 'Duet'),
('smells_like_teen_spirit_karaoke.mp3', 14, 'Standard'),
('smells_like_teen_spirit_duet_karaoke.mp3', 14, 'Duet'),
('girls_just_want_to_have_fun_karaoke.mp3', 15, 'Standard'),
('girls_just_want_to_have_fun_duet_karaoke.mp3', 15, 'Duet'),
('eye_of_the_tiger_karaoke.mp3', 16, 'Standard'),
('eye_of_the_tiger_duet_karaoke.mp3', 16, 'Duet'),
('boogie_wonderland_karaoke.mp3', 17, 'Standard'),
('boogie_wonderland_duet_karaoke.mp3', 17, 'Duet'),
('i_want_to_hold_your_hand_karaoke.mp3', 18, 'Standard'),
('i_want_to_hold_your_hand_duet_karaoke.mp3', 18, 'Duet'),
('i_wanna_dance_with_somebody_karaoke.mp3', 19, 'Standard'),
('i_wanna_dance_with_somebody_duet_karaoke.mp3', 19, 'Duet'),
('dont_you_want_me_karaoke.mp3', 20, 'Standard'),
('dont_you_want_me_duet_karaoke.mp3', 20, 'Duet');

-- Inserts for Contributor table
INSERT INTO Contributor (ContributorName, ContributorToSong, ContributorAs) VALUES
('David Bowie', 'Space Oddity', 'Singer'),
('David Bowie', 'Heroes', 'Singer'),
('David Bowie', 'Let''s Dance', 'Singer'),
('David Bowie', 'Life on Mars?', 'Singer'),
('David Bowie', 'All the Young Dudes', 'Writer');

-- Inserts for Song table
INSERT INTO Song (Title, Artist, ContributorID) VALUES
('Space Oddity', 'David Bowie', (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'Space Oddity')),
('Heroes', 'David Bowie', (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'Heroes')),
('Let''s Dance', 'David Bowie', (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'Let''s Dance')),
('Life on Mars?', 'David Bowie', (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'Life on Mars?')),
('All the Young Dudes', 'Mott the Hoople', (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'All the Young Dudes'));

-- Inserts for Queue table
INSERT INTO Queue (SingerID, KFileID) VALUES (1, 1), (2, 2);

-- Inserts for QueuePaid table
INSERT INTO QueuePaid (Paid, SingerID, KFileID) VALUES (20.50, 1, 1), (15.75, 2, 2);

SELECT * FROM Singer;
SELECT * FROM Contributor;
SELECT * FROM Song;
SELECT * FROM KFile;
SELECT * FROM Queue;
SELECT * FROM QueuePaid;

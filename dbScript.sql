SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Singer, Artist, Song, Contributor, KFile, Queue, QueuePaid;

CREATE TABLE Singer(
    SingerID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SingerName VARCHAR(255)
);

CREATE TABLE Artist(
    ArtistID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ArtistName VARCHAR(255)
);

CREATE TABLE Contributor(
    ContributorID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ArtistID INT,
    ContributorName VARCHAR(255),
    ContributorToSong VARCHAR(255),
    ContributorAs VARCHAR(255),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

CREATE TABLE Song(
    SongID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Title VARCHAR(255),
    ArtistID INT,
    ContributorID INT,
    FOREIGN KEY (ContributorID) REFERENCES Contributor(ContributorID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
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

INSERT INTO Singer (SingerName) VALUES ('John Doe'), ('Jane Smith');

INSERT INTO Artist (ArtistName) VALUES
('Queen'),
('Journey'),
('Neil Diamond'),
('Bon Jovi'),
('Oasis'),
('Michael Jackson'),
('Eagles'),
('Adele'),
('Bryan Adams'),
('Billy Joel'),
('The Police'),
('Whitney Houston'),
('a-ha'),
('Nirvana'),
('Cyndi Lauper'),
('Survivor'),
('Earth, Wind & Fire'),
('The Beatles'),
('The Human League'),
('Mott the Hoople'), 
('David Bowie'); 

INSERT INTO Contributor (ArtistID, ContributorName, ContributorToSong, ContributorAs) VALUES
(1, 'Freddie Mercury', 'Bohemian Rhapsody', 'Singer'),
(2, 'Steve Perry', 'Dont Stop Believin', 'Singer'),
(3, 'Neil Diamond', 'Sweet Caroline', 'Singer'),
(4, 'Jon Bon Jovi', 'Livin on a Prayer', 'Singer'),
(5, 'Noel Gallagher', 'Wonderwall', 'Singer/Guitarist'),
(6, 'Michael Jackson', 'Billie Jean', 'Singer'),
(7, 'Don Felder', 'Hotel California', 'Guitarist'),
(8, 'Adele', 'Rolling in the Deep', 'Singer'),
(9, 'Bryan Adams', 'Summer of ''69', 'Singer'),
(10, 'Billy Joel', 'Piano Man', 'Singer'),
(11, 'Sting', 'Every Breath You Take', 'Singer'),
(12, 'Dolly Parton', 'I Will Always Love You', 'Singer'),
(13, 'Magne Furuholmen', 'Take on Me', 'Keyboardist'),
(14, 'Kurt Cobain', 'Smells Like Teen Spirit', 'Singer/Guitarist'),
(15, 'Cyndi Lauper', 'Girls Just Want to Have Fun', 'Singer'),
(16, 'Frankie Sullivan', 'Eye of the Tiger', 'Guitarist'),
(17, 'Maurice White', 'Boogie Wonderland', 'Singer'),
(18, 'John Lennon', 'I Want to Hold Your Hand', 'Singer'),
(19, 'Whitney Houston', 'I Wanna Dance with Somebody', 'Singer'),
(20, 'Phil Oakey', 'Dont You Want Me', 'Singer'),
(21, 'David Bowie', 'Space Oddity', 'Singer'),
(21, 'David Bowie', 'Heroes', 'Singer'),
(21, 'David Bowie', 'Lets Dance', 'Singer'),
(21, 'David Bowie', 'Life on Mars?', 'Singer'),
(21, 'David Bowie', 'All the Young Dudes', 'Writer');

INSERT INTO Song (Title, ArtistID, ContributorID) VALUES
('Bohemian Rhapsody', 1, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Freddie Mercury' AND ContributorToSong = 'Bohemian Rhapsody')),
('Dont Stop Believin', 2, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Steve Perry' AND ContributorToSong = 'Dont Stop Believin')),
('Sweet Caroline', 3, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Neil Diamond' AND ContributorToSong = 'Sweet Caroline')),
('Livin on a Prayer', 4, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Jon Bon Jovi' AND ContributorToSong = 'Livin on a Prayer')),
('Wonderwall', 5, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Noel Gallagher' AND ContributorToSong = 'Wonderwall')),
('Billie Jean', 6, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Michael Jackson' AND ContributorToSong = 'Billie Jean')),
('Hotel California', 7, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Don Felder' AND ContributorToSong = 'Hotel California')),
('Rolling in the Deep', 8, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Adele' AND ContributorToSong = 'Rolling in the Deep')),
('Summer of 69', 9, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Bryan Adams' AND ContributorToSong = 'Summer of 69')),
('Piano Man', 10, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Billy Joel' AND ContributorToSong = 'Piano Man')),
('Every Breath You Take', 11, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Sting' AND ContributorToSong = 'Every Breath You Take')),
('I Will Always Love You', 12, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Dolly Parton' AND ContributorToSong = 'I Will Always Love You')),
('Take on Me', 13, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Magne Furuholmen' AND ContributorToSong = 'Take on Me')),
('Smells Like Teen Spirit', 14, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Kurt Cobain' AND ContributorToSong = 'Smells Like Teen Spirit')),
('Girls Just Want to Have Fun', 15, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Cyndi Lauper' AND ContributorToSong = 'Girls Just Want to Have Fun')),
('Eye of the Tiger', 16, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Frankie Sullivan' AND ContributorToSong = 'Eye of the Tiger')),
('Boogie Wonderland', 17, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Maurice White' AND ContributorToSong = 'Boogie Wonderland')),
('I Want to Hold Your Hand', 18, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'John Lennon' AND ContributorToSong = 'I Want to Hold Your Hand')),
('I Wanna Dance with Somebody', 19, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Whitney Houston' AND ContributorToSong = 'I Wanna Dance with Somebody')),
('Dont You Want Me', 20, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'Phil Oakey' AND ContributorToSong = 'Dont You Want Me')),
('Space Oddity', 21, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'Space Oddity')),
('Heroes', 21, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'Heroes')),
('Lets Dance', 21, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'Lets Dance')),
('Life on Mars?', 21, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'Life on Mars?')),
('All the Young Dudes', 21, (SELECT ContributorID FROM Contributor WHERE ContributorName = 'David Bowie' AND ContributorToSong = 'All the Young Dudes'));


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

INSERT INTO Queue (SingerID, KFileID) VALUES (1, 1), (2, 2);

-- Inserts for QueuePaid table
INSERT INTO QueuePaid (Paid, SingerID, KFileID) VALUES (20.50, 1, 1), (15.75, 2, 2);

SELECT * FROM Singer;
SELECT * FROM Artist;
SELECT * FROM Contributor;
SELECT * FROM Song;
SELECT * FROM KFile;
SELECT * FROM Queue;
SELECT * FROM QueuePaid;

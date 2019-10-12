/*
File name: C:\Users\Felix\IdeaProjects\Projects\publicer\src\main\resources\web-root\resources\sql\testDBtransPost.sql
Creation date: 10/10/2019
Created by MySQL to PostgreSQL 4.3 [Demo]
--------------------------------------------------
More conversion tools at http://www.convert-in.com
*/
set client_encoding to 'UTF8';

/*
Table structure for table 'public.club'
*/

DROP TABLE IF EXISTS public."club" CASCADE;
CREATE TABLE public."club"("clubId" SERIAL NOT NULL,"clubName" VARCHAR(255) NOT NULL,"clubPassword" VARCHAR(255) NOT NULL,"numberOfTastings" INTEGER DEFAULT 0 NOT NULL,"numWinesCorrect" DOUBLE PRECISION DEFAULT 0.0000000000000000e+00 NOT NULL,"numWinesGuessed" DOUBLE PRECISION DEFAULT 0.0000000000000000e+00 NOT NULL,"averageWineCorrect" DOUBLE PRECISION DEFAULT 0.0000000000000000e+00 NOT NULL,"clubCreator" VARCHAR(255));
DROP INDEX IF EXISTS "PRIMARY";
ALTER TABLE public."club" ADD CONSTRAINT "PRIMARY" PRIMARY KEY ("clubId");

/*
Dumping data for table 'public.club'
*/

INSERT INTO public."club"("clubId", "clubName", "clubPassword", "numberOfTastings", "numWinesCorrect", "numWinesGuessed", "averageWineCorrect", "clubCreator")VALUES (1, 'KlubbToppar', '53q8p0127', 1, 6.0000000000000000e+00, 8.0000000000000000e+00, 7.5000000000000000e-01, 'Felix');
INSERT INTO public."club"("clubId", "clubName", "clubPassword", "numberOfTastings", "numWinesCorrect", "numWinesGuessed", "averageWineCorrect", "clubCreator")VALUES (2, 'TestKlubben', '123', 13, 3.8000000000000000e+01, 1.0100000000000000e+02, 3.8000000000000000e-01, 'TestFelix1');
INSERT INTO public."club"("clubId", "clubName", "clubPassword", "numberOfTastings", "numWinesCorrect", "numWinesGuessed", "averageWineCorrect", "clubCreator")VALUES (3, 'RiojaKlubben', 'tvÃ¥ord', 1, 9.0000000000000000e+00, 4.4000000000000000e+01, 2.0000000000000001e-01, 'Felix');

/*
Table structure for table 'public.club_member'
*/

DROP TABLE IF EXISTS public."club_member" CASCADE;
CREATE TABLE public."club_member"("clubMemberId" SERIAL NOT NULL,"clubId" INTEGER NOT NULL,"username" VARCHAR(255) NOT NULL,"isBacchus" VARCHAR(255) NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00000";
ALTER TABLE public."club_member" ADD CONSTRAINT "PRIMARY00000" PRIMARY KEY ("clubMemberId");

/*
Dumping data for table 'public.club_member'
*/

INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (1, 1, 'Felix', 'true');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (2, 1, 'Linnea', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (3, 1, 'Vinberra', 'true');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (4, 1, 'Carina', 'true');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (5, 2, 'TestFelix1', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (6, 2, 'TestFelix2', 'true');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (7, 2, 'TestFelix3', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (8, 2, 'As', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (9, 2, 'cartop1', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (10, 2, 'cartop2', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (11, 2, 'Vinproffset', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (12, 2, 'LINTOP', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (13, 2, 'lintop2', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (14, 3, 'Felix', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (15, 3, 'Linnea', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (16, 3, 'LÃ¥dvinsViktor', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (17, 3, 'Tove', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (18, 3, 'Lillamy', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (19, 3, 'Carina', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (20, 3, 'Ingalill', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (21, 3, 'steffe rfe', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (22, 3, 'Vinberra', 'false');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (23, 3, 'dagny', 'true');
INSERT INTO public."club_member"("clubMemberId", "clubId", "username", "isBacchus")VALUES (24, 3, 'JUKKA', 'false');

/*
Table structure for table 'public.club_wine_stat'
*/

DROP TABLE IF EXISTS public."club_wine_stat" CASCADE;
CREATE TABLE public."club_wine_stat"("clubWineStatId" SERIAL NOT NULL,"clubId" INTEGER NOT NULL,"wineName" VARCHAR(255) NOT NULL,"wineUrl" VARCHAR(8000) NOT NULL,"numberOfServings" INTEGER NOT NULL,"averageGrade" DOUBLE PRECISION NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00001";
ALTER TABLE public."club_wine_stat" ADD CONSTRAINT "PRIMARY00001" PRIMARY KEY ("clubWineStatId");

/*
Dumping data for table 'public.club_wine_stat'
*/

INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (1, 1, 'Penfolds Koonunga Hill', 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 1, 2.7999999999999998e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (2, 1, 'Marques De Arienzo', 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 1, 3.7999999999999998e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (3, 2, 'Villa Righetti', 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 3.1499999999999999e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (4, 2, 'Ecoltura', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 12, 2.9600000000000000e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (5, 2, 'First Edition', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 7, 3.2999999999999998e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (6, 2, 'La Rioja Alta', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 11, 3.4800000000000000e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (7, 2, 'Apothic Red', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 7, 3.5000000000000000e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (8, 2, 'Barbera Del Monferrato', 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 1, 5.0000000000000000e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (9, 3, 'Diemersfontein', 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 1, 3.2000000000000002e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (10, 3, 'Montelciego', 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 1, 3.0000000000000000e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (11, 3, 'Governo', 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 1, 3.5000000000000000e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (12, 3, 'Baron De Ley', 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 1, 3.2999999999999998e+00);
INSERT INTO public."club_wine_stat"("clubWineStatId", "clubId", "wineName", "wineUrl", "numberOfServings", "averageGrade")VALUES (13, 2, 'Mcmanis', 'https://www.systembolaget.se/dryck/roda-viner/mcmanis-9946001', 1, 3.5000000000000000e+00);

/*
Table structure for table 'public.game_point'
*/

DROP TABLE IF EXISTS public."game_point" CASCADE;
CREATE TABLE public."game_point"("gamePointId" SERIAL NOT NULL,"gameResultId" INTEGER NOT NULL,"username" VARCHAR(255) NOT NULL,"points" INTEGER NOT NULL,"pointsNoRegion" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00002";
ALTER TABLE public."game_point" ADD CONSTRAINT "PRIMARY00002" PRIMARY KEY ("gamePointId");

/*
Dumping data for table 'public.game_point'
*/

INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (1, 1, 'Carina', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (2, 1, 'Felix', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (3, 1, 'Linnea', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (4, 1, 'Vinberra', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (5, 2, 'As', 2, 1);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (6, 2, 'cartop1', 2, 1);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (7, 2, 'cartop2', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (8, 2, 'LINTOP', 5, 4);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (9, 2, 'lintop2', 1, 1);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (10, 2, 'TestFelix1', 0, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (11, 2, 'TestFelix2', 0, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (12, 2, 'TestFelix3', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (13, 2, 'Vinproffset', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (14, 3, 'TestFelix1', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (15, 3, 'TestFelix2', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (16, 4, 'TestFelix1', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (17, 5, 'TestFelix1', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (18, 5, 'TestFelix2', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (19, 7, 'TestFelix1', 4, 4);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (20, 7, 'TestFelix2', 0, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (21, 8, 'TestFelix1', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (22, 8, 'TestFelix2', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (23, 9, 'TestFelix1', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (24, 9, 'TestFelix2', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (25, 10, 'TestFelix1', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (26, 11, 'TestFelix1', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (27, 11, 'TestFelix2', 1, 1);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (28, 12, 'Carina', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (29, 12, 'dagny', 4, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (30, 12, 'Felix', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (31, 12, 'Ingalill', 3, 1);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (32, 12, 'JUKKA', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (33, 12, 'Lillamy', 3, 1);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (34, 12, 'Linnea', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (35, 12, 'LÃ¥dvinsViktor', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (36, 12, 'steffe rfe', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (37, 12, 'Tove', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (38, 12, 'Vinberra', 2, 1);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (39, 13, 'TestFelix1', 0, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (40, 14, 'TestFelix1', 1, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (41, 14, 'TestFelix2', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (42, 15, 'TestFelix1', 1, 1);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (43, 16, 'TestFelix1', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (44, 17, 'TestFelix1', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (45, 16, 'TestFelix2', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (46, 17, 'TestFelix2', 3, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (47, 18, 'TestFelix1', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (48, 19, 'TestFelix1', 2, 2);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (49, 18, 'TestFelix2', 0, 0);
INSERT INTO public."game_point"("gamePointId", "gameResultId", "username", "points", "pointsNoRegion")VALUES (50, 20, 'TestFelix3', 0, 0);

/*
Table structure for table 'public.game_result'
*/

DROP TABLE IF EXISTS public."game_result" CASCADE;
CREATE TABLE public."game_result"("gameResultId" SERIAL NOT NULL,"gameId" VARCHAR(255) NOT NULL,"url" VARCHAR(8000) NOT NULL,"comment" VARCHAR(8000));
DROP INDEX IF EXISTS "PRIMARY00003";
ALTER TABLE public."game_result" ADD CONSTRAINT "PRIMARY00003" PRIMARY KEY ("gameResultId");

/*
Dumping data for table 'public.game_result'
*/

INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (1, '502437', 'wineguesser.herokuapp.com/gameResults/502437', 'Valborg.
Mat: Grillad kycklingfile med mangosalsa och vitlÃ¶ksbrÃ¶d, tapas snacks och gurka.

NÃ¤rvarande: Hela KlubbToppar.

Plats: Hemma.');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (2, '365249', 'wineguesser.herokuapp.com/gameResults/365249', 'How did I escape Iraq?

Iran.');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (3, '939654', 'wineguesser.herokuapp.com/gameResults/939654', 'qaasdads');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (4, '481712', 'wineguesser.herokuapp.com/gameResults/481712', 'sadasd');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (5, '378335', 'wineguesser.herokuapp.com/gameResults/378335', 'gggd');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (7, '598039', 'wineguesser.herokuapp.com/gameResults/598039', 'asdasdda');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (8, '940586', 'wineguesser.herokuapp.com/gameResults/940586', 'asadad');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (9, '769978', 'wineguesser.herokuapp.com/gameResults/769978', 'asdasda');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (10, '466144', 'wineguesser.herokuapp.com/gameResults/466144', 'asda');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (11, '178198', 'wineguesser.herokuapp.com/gameResults/178198', 'asdasd');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (12, '200434', 'wineguesser.herokuapp.com/gameResults/200434', 'FÃ¶rsta digitala provningen.

Mat: Marinerad flÃ¤skfile med potatisgratÃ¤ng, rabbarberpaj.

Plats: TÃ¤by, Toppars

NÃ¤rvarande: Felix, Linnea, Carina, Bernt, Tove, Hanna, Stefan, Ingalill, Viktor, Sara, Jukka.');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (13, '487431', 'wineguesser.herokuapp.com/gameResults/487431', 'fÃ¶rsta test efter paus i utveckling');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (14, '292396', 'wineguesser.herokuapp.com/gameResults/292396', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (15, '236610', 'wineguesser.herokuapp.com/gameResults/236610', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (16, '737931', 'wineguesser.herokuapp.com/gameResults/737931', 'Testar deadlock');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (18, '522373', 'wineguesser.herokuapp.com/gameResults/522373', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (20, '855185', 'wineguesser.herokuapp.com/gameResults/855185', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (22, '867264', 'wineguesser.herokuapp.com/gameResults/867264', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (23, '867264', 'wineguesser.herokuapp.com/gameResults/867264', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (24, '643737', 'wineguesser.herokuapp.com/gameResults/643737', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (25, '155360', 'wineguesser.herokuapp.com/gameResults/155360', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (28, '247136', 'wineguesser.herokuapp.com/gameResults/247136', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (29, '167419', 'wineguesser.herokuapp.com/gameResults/167419', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (31, '668422', 'wineguesser.herokuapp.com/gameResults/668422', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (33, '302215', 'wineguesser.herokuapp.com/gameResults/302215', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (34, '302215', 'wineguesser.herokuapp.com/gameResults/302215', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (35, '187704', 'wineguesser.herokuapp.com/gameResults/187704', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (36, '187704', 'wineguesser.herokuapp.com/gameResults/187704', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (37, '570049', 'wineguesser.herokuapp.com/gameResults/570049', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (38, '570049', 'wineguesser.herokuapp.com/gameResults/570049', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (39, '554472', 'wineguesser.herokuapp.com/gameResults/554472', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (40, '554472', 'wineguesser.herokuapp.com/gameResults/554472', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (41, '779502', 'wineguesser.herokuapp.com/gameResults/779502', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (42, '779502', 'wineguesser.herokuapp.com/gameResults/779502', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (43, '129842', 'wineguesser.herokuapp.com/gameResults/129842', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (44, '133971', 'wineguesser.herokuapp.com/gameResults/133971', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (45, '133971', 'wineguesser.herokuapp.com/gameResults/133971', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (46, '937745', 'wineguesser.herokuapp.com/gameResults/937745', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (47, '937745', 'wineguesser.herokuapp.com/gameResults/937745', '');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (48, '272681', 'wineguesser.herokuapp.com/gameResults/272681', 'asdasd');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (50, '581985', 'wineguesser.herokuapp.com/gameResults/581985', 'test');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (51, '677023', 'wineguesser.herokuapp.com/gameResults/677023', '214124');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (53, '690081', 'wineguesser.herokuapp.com/gameResults/690081', 'test 2 player');
INSERT INTO public."game_result"("gameResultId", "gameId", "url", "comment")VALUES (54, '234922', 'wineguesser.herokuapp.com/gameResults/234922', 'Potatis och ris');

/*
Table structure for table 'public.game_settings'
*/

DROP TABLE IF EXISTS public."game_settings" CASCADE;
CREATE TABLE public."game_settings"("gameSettingsId" BIGSERIAL NOT NULL,"gameHost" VARCHAR(255) NOT NULL,"gameId" VARCHAR(255) NOT NULL,"qrCode" VARCHAR(8000) NOT NULL,"url" VARCHAR(8000) NOT NULL,"imgSource" VARCHAR(8000) NOT NULL,"wineName" VARCHAR(255) NOT NULL,"region" VARCHAR(8000) ,"description" VARCHAR(8000) NOT NULL,"servingOrder" VARCHAR(255));
DROP INDEX IF EXISTS "PRIMARY00004";
ALTER TABLE public."game_settings" ADD CONSTRAINT "PRIMARY00004" PRIMARY KEY ("gameSettingsId");

/*
Dumping data for table 'public.game_settings'
*/

INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (52, 'Felix', '200434', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABK0lEQVR4Xu2VQYoFMQhEhVxL8OqC1xIyVXb4/MnMThcz8KUhydtoyjIt+5eQGzA+8Iq/CVNELHbajtqOQNupy0XUuJ2BiqOvVEBup6CuiO1YB6ExTcSVvQEpSKFbpQZEt/TEt2424BNpruvs+xCJkKDsAKljBkKLOKYtjw3AzcPy6pnbKb4JE6OVstg2R/+GoNCz4Vwq0wC0XNv1DBhuMAE5UkKloQc1HoBsGXQ21A1+BOlCSFEG4yVeiXoQjduPs+JxxARUGAEvFSXmDUagUYeS4s1gXQhrCb1Vo3uK70FGonKOVr4/Vg2YbJtV/7TyTECjJvzYvTyJmlD5k8pFWeRV/AAUZHA8AhBlDCon1vlTPYI0odG3wQUDNgTPuDpyVe0D8Gd84BX/BX4BGe/eKdCOb/gAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', '', 'Smak: Fruktig smak med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, russin, choklad, sÃ¶tlakrits och vanilj.

Doft: Fruktig doft med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, russin, choklad, lakrits, vanilj och Ã¶rter.', '3');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (53, 'Felix', '200434', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2V0YrEMAhFBX8r4K8L+S0he69NOzPdfVp9mIGRkqQnEO3VWFl/mNwB7Qtv9p4wRGToCluTS2uBxgdEYxzLBjhkDHNRcCz7oM65HHMnFNBohFSBcmB4CFKETNy212z+H6Yh9KFux0sdhmQVHOVwCVKD1ABp44jNLUgRhjruAefAdeCqDrGYbg45Jj/g9F6DDBr1hZrl7nZUg4h35tVaHEkboEFbh7xA8WgsNaiuCH9I5m+ewdeg8XxkDzSFboDEcCRZr1cx1GBk80ORBfugtUAezndwbDRB1yxbypJ564CLvoKe7CqGIuT5Nn1Hf2azCI11i9xB4eiC/Iug+eHCbkV6IK8BXWQCu6Dlf0/zUzqgLTYrTkcT7IBQAbEHG78/Z7MAf9sX3uxT4A/Fiwe0w3oTUgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Rioja', 'Smak: Kryddig smak med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, muskot, nypon och kryddpeppar.

Doft: Kryddig doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, kryddpeppar, russin och nypon.', '2');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (54, 'Felix', '200434', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2VwQrDQAhEBX9rwV9f8LcW7IxJCk172zm0UA/FfQm4HUdj9SHsDhh/eIvvhMvMIlfMmIOpBEatEdMzO9XAYWOw1gymMog6xUwJkWamEAa4Z2VNkKWB6NY446WbG5CxnLXyOAjg8gQLWMGgB8UWwAHLDodng89DAQtH6oAG+rSz0DZk2/Coph1GE8AkWHZcHqkAIkuOP3Sp1kMAKTMieE7Uk8DknQcFZlYKSMPCWPQEXtBA9Mxx56Qb4hrYTYgZ4JaGKlT5atwe5PVRi/bK9oUAQomJUXV2rfefAHap4BDAENREAHsBHrA1kcDoOk4x8MJZaBPyK8IVyAlz/hUNxKXhCGzV5+X3IZbU7B+/TLsJIUgX4EZ9Ttwm7MZBkRZYA9/jD2/xK/ABiqv4LagboWUAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Rioja', 'Smak: Nyanserad, balanserad smak med fatkaraktÃ¤r, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj.

Doft: Nyanserad, utvecklad doft med fatkaraktÃ¤r, inslag av torkade fikon, dill, kanel, choklad, russin, kÃ¶rsbÃ¤r och vanilj.', '4');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (55, 'Felix', '200434', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKklEQVR4Xu2VQW5DMQhEkbgWEle3xLWQ3Bl+fps62cGilUISf/tlMQ4MRPabkBMwPvCIvwlTRDzNfEdtR6BvoiXm3M5AwxGHBKztEMRb96rnGPSAUsSh3oC4uenSyDNLDYhq2SN+VbMBK5Ymc3JFH0LIRCOWcI0Z6Bt2vUxbHhuBF1r8+H35HkTZvJb0RVeMwMtYCs9qlNIA5K1pWhTP+CsGYAqO+EYD+ciHUBeiCVg62BVWuM3QgzQsXshF6r6FmpB1A2VW1tNk6MJkn5bN7sJ1IZ9Yo0r41FwdCAdgsuiinkFxAJZMpbfwCEwOQMhgsljpTEDf1QSsXVaWB2ClI/gfJT/TewLmd3+NQTYtPEs8Ar38gKZNpnoGsnAOOfHr7gPwNT7wiP8CvwD7JedNAFUfkQAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', '', 'Smak: Mycket fruktig smak med pÃ¥taglig rostad fatkaraktÃ¤r, inslag av kaffe, mÃ¶rka kÃ¶rsbÃ¤r, plommon, choklad och vanilj.

Doft: Mycket fruktig doft med pÃ¥taglig rostad fatkaraktÃ¤r, inslag av kaffe, mÃ¶rka kÃ¶rsbÃ¤r, plommon, mÃ¶rk choklad och vanilj.', '1');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (62, 'hej', '655309', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwYrEQAhEBX9L6F8X+reEnio7M8lk9zR62IWRBMzLQVNWG1m/hNwB4wtv8TdhiMhYrqFhmXbAgcuHm41MW6CJ4cEIM22CeEbf7L4RKrqesw8OXp7NZ9oB0bYd8TbNAswI3XdGHSJ3nVADRTavw7Wc+tJjmBxpHYaoY14gkHochcpQNgmYtguOie7dcGKdbzogvJXOUle47GmGGkTHLiQYIN+2QGRzwQvQQ1OSDjiDBnPa6yxUhGvyuOriEngKUoTwl9hWZGalBsgjIHt4lKMHkqMSF+vLDDXIYMsod10CJRhcgPkBsj3bAdG8KYZmFIUlGyD/IsE9wDU9j0INkL7FwT3N0AGXk+IjroU+hykIVitSyHxV6XOYgwueK5QbR6Ea/BlfeIv/Ah+IPuVtv4VrrAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Rioja', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (63, 'hej', '655309', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwYrEQAhEBX9L6F8X+reEnio7M8lk9zR62IWRBMzLQVNWG1m/hNwB4wtv8TdhiMhYrqFhmXbAgcuHm41MW6CJ4cEIM22CeEbf7L4RKrqesw8OXp7NZ9oB0bYd8TbNAswI3XdGHSJ3nVADRTavw7Wc+tJjmBxpHYaoY14gkHochcpQNgmYtguOie7dcGKdbzogvJXOUle47GmGGkTHLiQYIN+2QGRzwQvQQ1OSDjiDBnPa6yxUhGvyuOriEngKUoTwl9hWZGalBsgjIHt4lKMHkqMSF+vLDDXIYMsod10CJRhcgPkBsj3bAdG8KYZmFIUlGyD/IsE9wDU9j0INkL7FwT3N0AGXk+IjroU+hykIVitSyHxV6XOYgwueK5QbR6Ea/BlfeIv/Ah+IPuVtv4VrrAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Rioja', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (110, 'TestFelix3', '129842', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABK0lEQVR4Xu2VQYoDUQhEBa8leHXBawlJlZ2km57Z6WIGIiGY9xcl9csfefxScgesL7zV34QlIh6apWVsV6DzE2LmR7sBTQxCRch2C5ppiHD6TWjimXuQLoSzuRgyhLgtKrXa9TYHsAtza+nrxxyiD4122Q8+h8hW+xCdCNI5LIGGhmcfvNWH0Dwxe3Vo1yDCFfCioPYJwwxyYq6r0mp7h2EGC7NDKDNxTJ0NKPT38EPbkg0oxmgV43UKDSFTy+xiG86NG8LeVU2c5Oc2h9DRJyPLrD1ew48hOY1uazYgC8CZiPMRmMHjAYQUk0udDeg0AtHtb2zFBux/ET4DfKbzJbQA6UXghaHsFsSG9RugV6EBpCHWe8X8XlwaQF4crAi6QY8X4M/6wlv9F/gES5LYxQwYgBoAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', '', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, hallon och vanilj.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, hallon och vanilj.', '2');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (111, 'TestFelix3', '129842', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2V4YrDQAiEBV9L8NWFfa0Fb8a0TW/v/umPO6gsyeZLYaw7GslfQk7A+MAj/ibcIuLbzHPVdgR6EoWYczsDDY/kgLUdgliaUfcx6AtZr3WoNyAz1zDdZ5UaEKdlj/h2mg1YEYq3+njoQwiZ6FohvK4RmAlgl2nLYwMQNxo2lBvnj/oQOoteCON6Jt+FEIJpoaarlPoQEpqlpLvqMgHZqCD4B+Gs8QgUImihNLwOQMQWdqvDtU+hJtzXDEAl4LPXEGhCL55l3PvgujCZOkpxG6wLmfE1q9i6PgEZqPJma+33YdWANQBRCUwWK50J6FgcAXRvVXkAGgXqGyX39B6ANCwKzf4ag9TBh4p4BKIgFEIzaLy5rgV5cJhTqMWV+wD8GR94xH+BX75k68FnpuziAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Rioja', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '1');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (136, 'TestFelix2', '234922', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2UzQrEIAyEA3ktIa8e8LUEdyb9kXX3lhx2oWlpzedhNI6R+SVkB4wHbvGbcIiIjdZs9hiWQJtELs04rIENKTlgDIsgXp0e/zJoHavufVNPQK5cvenYq5SAOK12xttpJmCEK2b1TPIQQk20dxd+ewk8RA7ThscKYJgBpkWRp9u1+BwMoTg+c7qiBILQC/Cs9lDKw6F8KKODu6iASJGIYg8eNS6AuAVwgk6UAla4HJKD9EDDBPS4hRKIIWoLb+G3mkASGhI79Ow+uCSkB458GSwL4VWBHbABXl2rgIwhtEHgEhgNEDLOPkhWAY11phfYVvwUSkI2FhQXF1ZW9y6AvLJoBJiqg4IWQEvo7ZAcREFCiD1rGSwHeXAGOWFVrAR+xgO3+Bf4Aq5n442faC35AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Rioja', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '1');
INSERT INTO public."game_settings"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "imgSource", "wineName", "region", "description", "servingOrder")VALUES (137, 'TestFelix2', '234922', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNklEQVR4Xu2VwWrEMAxEDfotgX5d4N8ypPOcbDekvUmHFlYswXl7GHk0dsbxS40noD7wUX8TrjFGpB3LlrNsgcEvY3mcyw7owyW0XJBlF3S3HIPuO6GPmLMP4kIGi5shRahpobTV7tMswF3q25ZdL3WodVpul+PkDdBjphMxEgFtgcioef54C1WgWt87mBqcd8EppLNlPF9hKEI0NDf1rx34KyE1KCXJRA7jJoir+Rpcpu6JbRAyLGmAwzn/mpu28S1UhHqZGM1peF+qNWhklmNrzLAHyooDpSC/x9V8GSoDxvR0w7yar0EKMR1YbD6FihAraDq5B9HpgNuIFXM/M1ogX5EcCqwUY15CHVBeKBK3MNShxjaVM7e7UAFiiF5khc4ZdjdABqeJJW7gcQP8WR/4qP8CvwC4M98Z7Dm2dAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/mcmanis-9946001', 'https://static.systembolaget.se/imagelibrary/publishedmedia/5oiofk97gpfg70h20frt/17823966.jpg', 'Mcmanis', '', 'Smak: GenerÃ¶st fruktig smak med tydlig rostad fatkaraktÃ¤r, inslag av bjÃ¶rnbÃ¤r, kaffe, choklad, smÃ¶rkola, plommon, kokos, korinter och vanilj.

Doft: Stor, mycket fruktig doft med tydlig rostad fatkaraktÃ¤r, inslag av bjÃ¶rnbÃ¤r, kaffe, choklad, plommon, kokos, svarta vinbÃ¤r och vanilj.', '2');

/*
Table structure for table 'public.game_setup'
*/

DROP TABLE IF EXISTS public."game_setup" CASCADE;
CREATE TABLE public."game_setup"("gameHost" VARCHAR(255) NOT NULL,"amountOfWines" VARCHAR(255) NOT NULL,"gameId" VARCHAR(255) NOT NULL,"clubName" VARCHAR(255) ,"comment" VARCHAR(8000));
DROP INDEX IF EXISTS "PRIMARY00005";
ALTER TABLE public."game_setup" ADD CONSTRAINT "PRIMARY00005" PRIMARY KEY ("gameId");

/*
Dumping data for table 'public.game_setup'
*/

INSERT INTO public."game_setup"("gameHost", "amountOfWines", "gameId", "clubName", "comment")VALUES ('Felix', '2', '367782', '', '');
INSERT INTO public."game_setup"("gameHost", "amountOfWines", "gameId", "clubName", "comment")VALUES ('hej', '2', '655309', '', 'hej');

/*
Table structure for table 'public.judgement'
*/

DROP TABLE IF EXISTS public."judgement" CASCADE;
CREATE TABLE public."judgement"("judgementId" SERIAL NOT NULL,"username" VARCHAR(255) NOT NULL,"servingOrder" INTEGER NOT NULL,"personalGrade" INTEGER NOT NULL,"gameId" VARCHAR(255) NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00006";
ALTER TABLE public."judgement" ADD CONSTRAINT "PRIMARY00006" PRIMARY KEY ("judgementId");

/*
Dumping data for table 'public.judgement'
*/

INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (41, 'TestFelix3', 1, 2, '167419');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (42, 'TestFelix3', 2, 4, '167419');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (43, 'TestFelix3', 1, 5, '668422');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (44, 'TestFelix3', 2, 1, '668422');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (45, 'TestFelix3', 1, 4, '302215');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (46, 'TestFelix3', 2, 3, '302215');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (47, 'TestFelix3', 1, 2, '187704');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (48, 'TestFelix3', 2, 4, '187704');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (49, 'TestFelix3', 1, 2, '570049');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (50, 'TestFelix3', 2, 4, '570049');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (51, 'TestFelix3', 1, 2, '554472');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (52, 'TestFelix3', 2, 4, '554472');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (53, 'TestFelix3', 1, 2, '779502');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (54, 'TestFelix3', 2, 4, '779502');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (57, 'TestFelix2', 1, 4, '133971');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (58, 'TestFelix2', 2, 3, '133971');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (59, 'TestFelix1', 1, 2, '937745');
INSERT INTO public."judgement"("judgementId", "username", "servingOrder", "personalGrade", "gameId")VALUES (60, 'TestFelix1', 2, 4, '937745');

/*
Table structure for table 'public.lobby'
*/

DROP TABLE IF EXISTS public."lobby" CASCADE;
CREATE TABLE public."lobby"("lobbyId" BIGSERIAL NOT NULL,"gameId" VARCHAR(255) NOT NULL,"gameStart" VARCHAR(255) NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00007";
ALTER TABLE public."lobby" ADD CONSTRAINT "PRIMARY00007" PRIMARY KEY ("lobbyId");

/*
Dumping data for table 'public.lobby'
*/

INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (1, '502437', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (2, '365249', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (3, '140282', 'canceled');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (4, '939654', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (5, '481712', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (6, '378335', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (7, '238238', 'canceled');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (8, '454591', 'canceled');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (9, '225752', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (10, '618728', 'canceled');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (11, '598039', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (12, '180233', 'canceled');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (13, '940586', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (14, '769978', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (15, '466144', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (16, '178198', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (17, '200434', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (18, '655309', 'started');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (19, '487431', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (20, '292396', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (21, '236610', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (22, '737931', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (23, '522373', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (24, '855185', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (25, '867264', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (26, '643737', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (27, '155360', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (28, '558125', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (29, '289275', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (30, '203847', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (31, '247136', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (32, '167419', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (33, '668422', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (34, '302215', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (35, '187704', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (36, '570049', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (37, '554472', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (38, '937745', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (39, '779502', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (40, '129842', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (41, '133971', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (42, '272681', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (43, '581985', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (44, '677023', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (45, '690081', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (46, '486663', 'canceled');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (47, '293388', 'canceled');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (48, '741277', 'canceled');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (49, '234922', 'finished');
INSERT INTO public."lobby"("lobbyId", "gameId", "gameStart")VALUES (50, '220207', 'canceled');

/*
Table structure for table 'public.lobby_data'
*/

DROP TABLE IF EXISTS public."lobby_data" CASCADE;
CREATE TABLE public."lobby_data"("lobbyId" BIGINT NOT NULL,"gameHost" VARCHAR(255) ,"gameId" VARCHAR(255) NOT NULL,"participants" VARCHAR(255) NOT NULL,"score" INTEGER DEFAULT 0,"ready" INTEGER DEFAULT 0,"done" INTEGER DEFAULT 0);
DROP INDEX IF EXISTS "PRIMARY00008";
ALTER TABLE public."lobby_data" ADD CONSTRAINT "PRIMARY00008" PRIMARY KEY ("participants");

/*
Dumping data for table 'public.lobby_data'
*/


/*
Table structure for table 'public.lobby_history'
*/

DROP TABLE IF EXISTS public."lobby_history" CASCADE;
CREATE TABLE public."lobby_history"("lobbyId" BIGINT NOT NULL,"gameHost" VARCHAR(255) ,"gameId" VARCHAR(255) NOT NULL,"participants" VARCHAR(255) NOT NULL,"score" INTEGER DEFAULT 0,"ready" INTEGER DEFAULT 0,"done" INTEGER DEFAULT 0);
DROP INDEX IF EXISTS "PRIMARY00009";
ALTER TABLE public."lobby_history" ADD CONSTRAINT "PRIMARY00009" PRIMARY KEY ("participants");

/*
Dumping data for table 'public.lobby_history'
*/

INSERT INTO public."lobby_history"("lobbyId", "gameHost", "gameId", "participants", "score", "ready", "done")VALUES (3, '', '140282', 'cartop1', 0, 1, 0);
INSERT INTO public."lobby_history"("lobbyId", "gameHost", "gameId", "participants", "score", "ready", "done")VALUES (12, 'Felix', '180233', 'Felix', 0, 0, 0);
INSERT INTO public."lobby_history"("lobbyId", "gameHost", "gameId", "participants", "score", "ready", "done")VALUES (18, 'hej', '655309', 'hej', 0, 0, 0);
INSERT INTO public."lobby_history"("lobbyId", "gameHost", "gameId", "participants", "score", "ready", "done")VALUES (50, 'TestFelix1', '220207', 'TestFelix1', 0, 0, 0);
INSERT INTO public."lobby_history"("lobbyId", "gameHost", "gameId", "participants", "score", "ready", "done")VALUES (45, '', '690081', 'TestFelix2', 0, 0, 0);

/*
Table structure for table 'public.match_history'
*/

DROP TABLE IF EXISTS public."match_history" CASCADE;
CREATE TABLE public."match_history"("matchHistoryId" SERIAL NOT NULL,"userResultsId" INTEGER NOT NULL,"datePlayed" VARCHAR(255) NOT NULL,"url" VARCHAR(255) NOT NULL,"gameId" VARCHAR(255) NOT NULL,"clubName" VARCHAR(255));
DROP INDEX IF EXISTS "PRIMARY00010";
ALTER TABLE public."match_history" ADD CONSTRAINT "PRIMARY00010" PRIMARY KEY ("matchHistoryId");

/*
Dumping data for table 'public.match_history'
*/

INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (1, 2, '2019-04-30', 'wineguesser.herokuapp.com/gameResults/502437', '502437', 'KlubbToppar');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (2, 1, '2019-04-30', 'wineguesser.herokuapp.com/gameResults/502437', '502437', 'KlubbToppar');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (3, 3, '2019-04-30', 'wineguesser.herokuapp.com/gameResults/502437', '502437', 'KlubbToppar');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (4, 4, '2019-04-30', 'wineguesser.herokuapp.com/gameResults/502437', '502437', 'KlubbToppar');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (5, 8, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (6, 10, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (7, 11, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (8, 12, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (9, 13, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (10, 5, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (11, 6, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (12, 7, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (13, 9, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (14, 5, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/939654', '939654', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (15, 6, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/939654', '939654', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (16, 5, '2019-05-01', 'wineguesser.herokuapp.com/gameResults/481712', '481712', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (17, 5, '2019-05-02', 'wineguesser.herokuapp.com/gameResults/378335', '378335', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (18, 6, '2019-05-02', 'wineguesser.herokuapp.com/gameResults/378335', '378335', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (19, 5, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/225752', '225752', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (20, 5, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/598039', '598039', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (21, 6, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/598039', '598039', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (22, 5, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/940586', '940586', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (23, 6, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/940586', '940586', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (24, 5, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/769978', '769978', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (25, 6, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/769978', '769978', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (26, 5, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/466144', '466144', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (27, 5, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/178198', '178198', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (28, 6, '2019-05-03', 'wineguesser.herokuapp.com/gameResults/178198', '178198', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (29, 2, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (30, 21, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (31, 1, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (32, 19, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (33, 22, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (34, 18, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (35, 3, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (36, 16, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (37, 20, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (38, 17, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (39, 4, '2019-05-04', 'wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (40, 5, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/487431', '487431', '');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (41, 5, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/292396', '292396', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (42, 6, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/292396', '292396', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (43, 5, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/236610', '236610', '');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (44, 5, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/737931', '737931', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (45, 5, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/737931', '737931', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (46, 6, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/737931', '737931', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (47, 6, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/737931', '737931', 'TestKlubben');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (48, 5, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/522373', '522373', '');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (49, 5, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/522373', '522373', '');
INSERT INTO public."match_history"("matchHistoryId", "userResultsId", "datePlayed", "url", "gameId", "clubName")VALUES (50, 6, '2019-09-13', 'wineguesser.herokuapp.com/gameResults/522373', '522373', '');

/*
Table structure for table 'public.result_data'
*/

DROP TABLE IF EXISTS public."result_data" CASCADE;
CREATE TABLE public."result_data"("resultDataId" SERIAL NOT NULL,"gameResultId" INTEGER NOT NULL,"username" VARCHAR(255) NOT NULL,"servingOrder" INTEGER NOT NULL,"winePicture" VARCHAR(8000) NOT NULL,"wineName" VARCHAR(255) NOT NULL,"wineDescription" VARCHAR(8000) NOT NULL,"grade" INTEGER NOT NULL,"url" VARCHAR(8000) NOT NULL,"personalGrade" INTEGER NOT NULL,"averageGrade" DOUBLE PRECISION NOT NULL,"region" VARCHAR(255) ,"correctRegionGuess" VARCHAR(255));
DROP INDEX IF EXISTS "PRIMARY00011";
ALTER TABLE public."result_data" ADD CONSTRAINT "PRIMARY00011" PRIMARY KEY ("resultDataId");

/*
Dumping data for table 'public.result_data'
*/

INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (1, 1, 'Carina', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/hhzjq2ymt4r5us2un7y9/256950.jpg', 'Penfolds Koonunga Hill', 'Smak: Mycket fruktig smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, kaffe, mynta, vanilj och mÃ¶rk choklad.

Doft: Mycket fruktig doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, eukalyptus, kaffe, vanilj och mÃ¶rk choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 4, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (2, 1, 'Felix', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/hhzjq2ymt4r5us2un7y9/256950.jpg', 'Penfolds Koonunga Hill', 'Smak: Mycket fruktig smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, kaffe, mynta, vanilj och mÃ¶rk choklad.

Doft: Mycket fruktig doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, eukalyptus, kaffe, vanilj och mÃ¶rk choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 2, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (3, 1, 'Linnea', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/hhzjq2ymt4r5us2un7y9/256950.jpg', 'Penfolds Koonunga Hill', 'Smak: Mycket fruktig smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, kaffe, mynta, vanilj och mÃ¶rk choklad.

Doft: Mycket fruktig doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, eukalyptus, kaffe, vanilj och mÃ¶rk choklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 2, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (4, 1, 'Vinberra', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/hhzjq2ymt4r5us2un7y9/256950.jpg', 'Penfolds Koonunga Hill', 'Smak: Mycket fruktig smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, kaffe, mynta, vanilj och mÃ¶rk choklad.

Doft: Mycket fruktig doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, eukalyptus, kaffe, vanilj och mÃ¶rk choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 3, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (5, 1, 'Carina', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/gbqjz1kivfkg7qvm0gss/2006.jpg', 'Marques De Arienzo', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.', 2, 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 5, 3.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (6, 1, 'Felix', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/gbqjz1kivfkg7qvm0gss/2006.jpg', 'Marques De Arienzo', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.', 2, 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 3, 3.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (7, 1, 'Linnea', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/gbqjz1kivfkg7qvm0gss/2006.jpg', 'Marques De Arienzo', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.', 1, 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 3, 3.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (8, 1, 'Vinberra', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/gbqjz1kivfkg7qvm0gss/2006.jpg', 'Marques De Arienzo', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.', 2, 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 4, 3.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (9, 2, 'As', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (10, 2, 'cartop1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 3, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (11, 2, 'cartop2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (12, 2, 'LINTOP', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (13, 2, 'lintop2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 3, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (14, 2, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (15, 2, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 3, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (16, 2, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (17, 2, 'Vinproffset', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 2.7999999999999998e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (18, 2, 'As', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (19, 2, 'cartop1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (20, 2, 'cartop2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (21, 2, 'LINTOP', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (22, 2, 'lintop2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 1, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (23, 2, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (24, 2, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (25, 2, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (26, 2, 'Vinproffset', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 3.1000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (27, 2, 'As', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 4, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (28, 2, 'cartop1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 3, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (29, 2, 'cartop2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 4, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (30, 2, 'LINTOP', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 1, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (31, 2, 'lintop2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (32, 2, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 3, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (33, 2, 'TestFelix2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (34, 2, 'TestFelix3', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (35, 2, 'Vinproffset', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.6000000000000001e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (36, 2, 'As', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (37, 2, 'cartop1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (38, 2, 'cartop2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.7999999999999998e+00, 'Rioja', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (39, 2, 'LINTOP', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 2, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (40, 2, 'lintop2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 4, 2.7999999999999998e+00, 'Rioja', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (41, 2, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.7999999999999998e+00, 'Rioja', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (42, 2, 'TestFelix2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 5, 2.7999999999999998e+00, 'Rioja', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (43, 2, 'TestFelix3', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (44, 2, 'Vinproffset', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 2, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 1, 2.7999999999999998e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (45, 3, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.5000000000000000e+00, 'Rioja', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (46, 3, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.5000000000000000e+00, 'Rioja', 'rÃ¤tt.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (47, 3, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 3.0000000000000000e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (48, 3, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.0000000000000000e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (49, 4, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 5, 5.0000000000000000e+00, '', 'fel.');
INSERT INTO public."result_data"("resultDataId", "gameResultId", "username", "servingOrder", "winePicture", "wineName", "wineDescription", "grade", "url", "personalGrade", "averageGrade", "region", "correctRegionGuess")VALUES (50, 4, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5.0000000000000000e+00, '', 'fel.');

/*
Table structure for table 'public.settings_history'
*/

DROP TABLE IF EXISTS public."settings_history" CASCADE;
CREATE TABLE public."settings_history"("gameSettingsId" BIGINT NOT NULL,"gameHost" VARCHAR(255) NOT NULL,"gameId" VARCHAR(255) NOT NULL,"qrCode" VARCHAR(8000) NOT NULL,"url" VARCHAR(8000) NOT NULL,"description" VARCHAR(8000) NOT NULL,"servingOrder" VARCHAR(255));

/*
Dumping data for table 'public.settings_history'
*/

INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (19, '378335', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VQYpDMQxDA76WwVcP+FqGjOR8Uub/WY29aKFuKcnbyFHkdKw/atwB6wtv9Z4wxhi2poSE5rIDGr7TPNRy2QJ1KDeEuWyC2KNvdt8IBUrufZCd0+SHSwWItvWqX7dZgFmB7nGCXXWI/RR3nxCJ5HW4FtwVZoymkNZhyGa8s2mXUBnGlsjcNkHMlfkEFOichNSgYgJoND6IQwvEFhIDB4Af1GmAoXRXAlFQTkMHhAeRAWO8jnoNQsF5Z7Ic3pyJq0KmAXMAfC6uCM3zBPyhHS1QMVc7s3hhTkJKkAV7kYS0eQsVYT6AMHfyHaROBzT27wEEt4/JNch/kXypoJiGN0FYgnfAXmFogBAafAPkpv5faDQkOAJpSgvkxVnw7hyJuIRq8FlfeKtPgT+tuudN5KpLowAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', '3');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (20, '378335', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VUYoDQQhEBa8leHXBazX0VjkzSXZ2//QjgUhI9AViT1ltZP8TcgeML7zFe8IlIr7MfGelI9A3UYg50xloKFEswEqHIF66oz7HoCc6Zd66NyBObhqsmc5ATMvO+DXNBqwI6AFNjuhDNDLRzBC+5wjcTNZh2tJkArIXRhfA4SwHIKo4ZhZ0xRAUlArPalanAYgsadpQyIInGIBLl6CL0w+l8QQU5U3YbJn74ZAW5M8bDeYL356NmhBrioODElm3dgTynhLRuNfg2lC8XFtWu1TqQtjLTPEQvLrX4VuQsWgEqv26rBpwcQFCCSwWqz4T0Dk7moxrJc5GTQgHUNyAGs/tPQDrjw/WpS5TEIrg1hrxCIQgRkUwvngYrAk5OJ5fqIqPwL/xhbf4FPgD3/HRCdKJ4W4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (23, '238238', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2VS4oDMQxEDb6WwFcX+FoG55W6O5+e2UmLGYhIGvv1opRS2Wn7l2p3oPrCW/1NuFprY3tffVksK+Dg48PNRixLoDXTZgFjWQTZ07e6L4QdpTnroDrfLjuOZQWkbTvrY5oJGLX68Y3KQ9beJ24gcvACyAakjDE50TzUGSANE5u3j1MoC+fcEpqR2xrIQSWvbpxYdK4wJKFJg3fOG7sSkoPbCRga/AZXbCtgCNE6UeApSyoggIS54vUSysE+GZ6ixeN54tLQlS+mt+drmjk4cDcuKXmzz+az0OmYmOlifSYkB1XYi8lh8yGUhEsXIAFTzkKnAtK5HWMbcVdXQP2LLN1UTdfWKVQAr0hItgpKCGoKcAVERedLicDmN5cSUIPTzOSGj1MoB3/WF97qv8AHCsjrwaSLKHkAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (24, '357041', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2VwYoDQQhEG/wtwV8X+rcEU2VmMsns3vSwC5Fk0v0u1mhpVv4S6w4YX3iLvwljrWWharnrOAItiXyp8TgDFVdywDoOQXwkvX7HoG2o3vuWvQGpXJx3HmcguqVHfHSzAStcYAU5Ln2IRLpkb1987hGYrhL6NG3VZASKSxi/6XaI70IodiRw5ecU34VMBTvAuLsy9WHggr6V/KrLCOSgsmnJdzgTtWBSMchmafgcgAHNsCwLzVeYgahtQD+y1dTOQByF3kWFX41rQ4iuEbgM1oY0awgKwtE9xbcgg4bgaMX7smrA4ALExbkHySagZS1+IGRjlQegMkH9R61rew9AGhaLgPM1B5EH24V4BBr9gERJQwxBNs6CvXtqH4A/4wtv8V/gA+LBy6V5EaFCAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (25, '357041', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2VwYoDQQhEG/wtwV8X+rcEU2VmMsns3vSwC5Fk0v0u1mhpVv4S6w4YX3iLvwljrWWharnrOAItiXyp8TgDFVdywDoOQXwkvX7HoG2o3vuWvQGpXJx3HmcguqVHfHSzAStcYAU5Ln2IRLpkb1987hGYrhL6NG3VZASKSxi/6XaI70IodiRw5ecU34VMBTvAuLsy9WHggr6V/KrLCOSgsmnJdzgTtWBSMchmafgcgAHNsCwLzVeYgahtQD+y1dTOQByF3kWFX41rQ4iuEbgM1oY0awgKwtE9xbcgg4bgaMX7smrA4ALExbkHySagZS1+IGRjlQegMkH9R61rew9AGhaLgPM1B5EH24V4BBr9gERJQwxBNs6CvXtqH4A/4wtv8V/gA+LBy6V5EaFCAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (26, '207117', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKElEQVR4Xu2V0YrDUAhEBX9L8NcFfyvgzthstpvtmz50oSYk3hPoXHS8lXoRcgeMD7zFe8JDRPww88pOV6AXUYg50x1oWJIDdroEcWtFv9egJ3adeVMfQO5cg2umOxDdsjN+dXMAO0Kpdi7mEEImmhnCZ65AiKC6D9N2TTYgFshp2grneg6xeQ9QfAq6YgMWKxGwA4ybrbQB8es0beijLgsQZYUUtDBeXeMNqJTho5KKO5C1hcEcX36EZhCNy2iD9dSuQBRE0bBghb8bN4XMlb6tJ9eNoSmPK+/RPTc/g4yjJ7XxCkQilMHJYq2zAR33obioxiovQOM53f9RkLyqNIfQQds061loCOkHOlcvM8ygN9fimF0GG0I2DsEZ670vwL/xgbf4L/ALEMPFjXnzUccAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (1, '502437', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2V4YrDQAiEBV9L8NUFX2thO2PS5i7tP/1xB5Wk2XyBasZZI/tDyB0wvvAWfxMuEfFl5jtrOQJ9E2WYczkDTYw3C7CWQxCH7qjrGPREpsxb9gZE5aYh8qZSA6JbdsavbjZgRegyaHJEHyKRiWaifPzmDFSqe5i2NBmA0DWIgqefxbehaJRl8dDP4rsw8f9BO5hmZRqAyJE0bTUPbzABqTHKTyakxiOQFZPg8X4J0oIcKUaD+dL9TNSF0GMJlcAMvCZDE1p5lc71Z+PaUJTZcHcZrA2VB1pXW9cnIAO1L26t9XNYNeAxADFUghewCcgktNaqPXsmakI4wI5vlFzTewBCZLRNaztMQfHAyDLiEQhBIAXNwFEwA6txyCV+1D4A3+MLb/Ff4AMuAN05j0NGEgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, choklad, plommon, vanilj och kaffe.', '2');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (2, '502437', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwQ4CMQhESfpbJPw6SX+rCc5Q3birNzhospzweSgOMyjxpeQKWDe81G/CJSI2l7m5sm2BFkvNZcxse6CKKt9yY9sGzUew64Ro55yN0MDHXAKR7aRSAWJb+qzTNguQtcbi+PtDA1wYHAxWEOhBsRsgGtcBzxq/tyaI3SEKKgPWPR6qQFKHHBEu22gNkKMHvcDhfQ9fhW7wK407I/VogbRV2iFo3Q7IxUXeKbpi7oeq0Dg5lofht3HrMLgsp2lhiVdgizANhk9b5efiijAYrGC2sMDogSszgARga3n/GiALf1F5/1KTBpgHkMQ1NWmBxvkZf6TruLRFiLPHeBmNO/hTeqAyBDTvMXwdWjrLh2dsGyAE4QOehngTuQJzcTgsKXAP/KwbXupf4AMuO/XV/Jz+gwAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 'Smak: Mycket fruktig smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, kaffe, mynta, vanilj och mÃ¶rk choklad.

Doft: Mycket fruktig doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, eukalyptus, kaffe, vanilj och mÃ¶rk choklad.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (3, '639645', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VwYrDMAxEBf4tg35doN8yuDPyJtB0b5rDLlSUoDwf5I5Giu1fwp6A8YWP+JtwmZnn8vCYTCXQ95oeNrJSDZw2UWGOcKYy6DE2MyVEmplC6OAjkyL7m0oNiG7Nn3jrZgMy1liO258XAVwji6Ei9KDYAggZglaAGXDuCrg3CoVTmQHrnkJNCDPg5jvM+RNB6DDwPJdnxT6kyigD4+YuPRSQ94Zt+Z7rNlgPlsbwg9EVkEYBg2OKaaXUZVwBRAJpszp4DWwTIq+mOYfh7mYPsnMbxoLUp6QAosLEbGFdYcVg0BSwStUfmF6aCGAtQAzW5Bpk8xTQeX9OP5S2q1ATlr8wVjAaj1Tw0MVTGQQLflGjxlYAnZzrCo9ruLqwGsclQIE18DO+8BH/Bb4A8oD0MZ43hA4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (4, '639645', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNklEQVR4Xu2VTWpDMQyEBb6WQFcX6FoCd0bv1TQv3UmLFiKysL9ARh79RPYvIU/A+MBH/E2YImLbV67UOk5Aw8fNVa2OI1BFeUnAOg5B3JE3sx+EC0oRc5CZ0+Q3lxoQaesdL9VswIpE9njBFX2Iu6+IcIhk8T7csYGqx9YlNgC3s16YA1ht30JdmCXBLtMhCKQWrphY6JwO6UEBwm35wtCeDulBSIgKagc/qDMAIYHCoXr1NS3pQxqi4M72OupNKPh9Y2sFlsBxqQfhB32GyXzADMQIoBeY9UuD9eC1ApOL9TRDDzLQZOiEsvkSasJagNj8zj1InQlo7Kxg2QwPsBHItbK5/bmm4xaagJgG7gLKTkFu1KiB+CHUgFDh/xNqlrD5FmrCKhwo3XC7hXrwPT7wEf8FfgGxZueJSZQpsAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 'Smak: Mycket fruktig smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, kaffe, mynta, vanilj och mÃ¶rk choklad.

Doft: Mycket fruktig doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, plommon, eukalyptus, kaffe, vanilj och mÃ¶rk choklad.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (5, '365249', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VUYoDQQhEBa8leHXBawm9VSaTJbP7px+7EENIz5shbZelI+eXkDtgfOAt/iYsEfHyEx7G5Qr0UyYemr3cgSZmuNJwLtegJzco24TNcxE6d4C+ENnfVBpAVMue8VbNAWSUaQkq94g5LM3SAy+UQA/dgRQ2A3o47/sG7A5wQKQf8txoDCEFvsEbsQORPCQmY/LhGxAqw1ZwrOdpPRZgybe8KN61+wieTBos2w9tsjmsqwuQPB/YgCf5oSoYg1fDDiESp8F4jZtXNWcQKisPADsg9R2I/4db+wDCPtuAjHYrjtCaLMAegJgsgI/ibUBveVvoHjIb0LhiO2BOK4+yA+kH621eTh5D5o+ppaH8XYAgfJ84J+qr44awCxd4m9AIO/BnfOAt/gv8AgdS441pCTi1AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '2');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (6, '365249', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VQWoEUQhEBa/1wasLXuuDqfJ3J5lOdrpIYJxe2K8XSlk6kr+EPAHjDR/xN+EWEYttbr6YjkDLvcxFo9IZuGShwlI3pmPQXJPZJEQaEYPQwDWCItuLSg2Iaa0rXqbZgIytMAMmd6IPtwYZ9BDoQbEH4BJi6GH8bhMwM7ABRmUU1j2FmpBSuKWL8ZmBiTKKKqd5fB6A0AI5jRtZeoxAbIBydpBm367rQVLcFE3n/GiyARjcVN1sHvkQROOaQafZvbBNSDXs/KDyPbgezHOm+Y7WZ+Cue0KKE7PABiADJhPev9JkANYB5OXzVcYdgYYHimxul9yFmpD/IjAZClGWq1Af1g1Ema/m+/C6VzgHn6btQQhSBcpl30TuwBoctqEEnoE/4w0f8V/gBxSW5LllrrSWAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '4');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (13, '481712', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABK0lEQVR4Xu2US4rEMAxEBb6WQFc3+FoGTz0nIXSmVy0tZqCLLKy3kVL62HojewL0hQ/9TTjNzK2N2abrGSUw+HoI+X5WQIIxRMnkdXC2blYNra3VvQziwhgyO/azBNK4U6/d/Bwi+atpoHCUh/JXjVP98uMuPgc1W4oZsa7OtTN7Ep6VG/3b9eehGqbSmYm9DlEBVb0WNkjXb0NycBK7N7liDi+Ax/7HGtLC7RLobWpsmzxp2+U85Klx0A1QroUKIDaQq6l2bkEFVEzfRlemezuSsKtd1M2xiitREm6+KB1XKiDSD4QWVr9AlIccQEX4wkTUwFgMQ0yOQIwa6EqwrwoZK6E6h9HXchXA0LTqpAZWl0AZ4rtoduJKlIR2nGjadmxsHv7WFz70X+APcEvTYRNOcD4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '2');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (14, '481712', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJklEQVR4Xu2UUYrDMAxEBbqWQFcX+FoC74yabWl2/zwfu1CRpM5zYZzxWLZ/KbsD1gfe6m/CNrPsiNxrhhKYm6gskkMNDLySA85QBHH5rvmVwVxY9Vo39QPIlXuF992lA4jdiqvedvMATpVj1q+XcwihMF+rjM8lgZclwdBOxhSwJrC8MeSfBHCGyEJnMRUK2ObFLEDJ1yidw72ZWFzlsAVfIIFlPmr4CnqsgAgW1k4xROHbpUNYbAEIWPbMKCBCO+cfOpxOCQyGgHpw+Lmbp9AevYr8GbBTyDaFgOUc3VRAVs9JHSyBzQYIJ9BZYnQUMCdb7aNGlwUQCaC5DTde3VsBH6dh7TehMwhH0FWCWAJhCCjDgFsEuXEonrFZuwD+rA+81X+BX2D24TXPadCAAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '4');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (17, '378335', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2W0QpCQQhEBX9L8NeF/S3hNmNt1K2n9KEgict2ehibHS053pScAesPT/WdMEXEQ1dqGo8j0PkKMfPrcQKaGISSkMcpaKYhwu4noYmvNQfpQuDx4lID4raoVGqPt9mAVegbptze9GHqERrlsmfxPkT3SCwiVokgHYDoXBeQ8YMt1IQYLE6WJkI7BYHKi1RGwidgMlfBUYDVthPSg3AhcVyhPLH7AQiLF0cMfmhZ0occKis3EK8t1IYCL5hdLoHtUhMS1CAAl9IANOxU5yjwexy7+S6U2n64P7knpAdZDBnGizZfhZowuQAdOeMepM4EdBoBIaunj0D+iqQgY1zT6yY0AI8KhD+EoQ+T/yW4CZ7VP4ZOzg0Av42aA5AXByuCbtDjAfhaf3iqX4EX86XXIUNZiioAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '2');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (18, '378335', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2VUYrDMAxEBbqWQVcX6FoG74yclm7aP8/HLlSERHmGSBmNE1sfwu6A8YW3+JtwmlnMMWJVpxIYiyhtBFMNHLglB+xUBHH4yr7KYBS6rrpVP4Ds3JP3TDUQ0xpX/JrmAexI6AFNdpxDFBrmVWk8lwQuJHNs07YmCpgxfbZpkV7NH0I8unLPLOkKCaQNoDAqeXWlc4ihFeaGMr51UUDMDFWcfuA7SCBk4PB6eT3McAgrx6DBMD8qroBwVVssuEpHSCCUxcBg2b6KIDw7aa1Xg53B4F7tBW7dq/kzyJhGGySxBO4PoAWrdR0FjPXcBLNVFkA4AAbjPwolH80LoPHH10s6CIQt2wUlEILACo7M8+WreAQ5OGgMLXbvAvgeX3iL/wJ/AGBS0b0RElgkAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '4');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (15, '481712', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2WwY7DMAhEkfgtJH4dyb+F5J1xnLbr3RscWqlcYr8cph4GNzL/KTkB6wuPek+YIuJjps+xli3QZ5qGiDmXPdCwDU0D5LILmo4xA89G6JQZ41AvQBoCrHm6VIDolu361c0CvIoautd1CCEIrDjA6tECqcG2MbRGTzrgnKEjPMz5ZgvV4OoXQovGgd8nKkJmFVYgs9RrgZOrsD1gOEEDRAZC4YfguTzugKbLlFz9uw0pQtEwBgzzNR9CRchkre3gS2+BHANnwGj0LVSETyuO1FUgk4CA+Rrd+0QlyIKYcbTy9bIqwOQFKLSYEwHWAf3Sua6V3EJFaBQwxeDK8/bugE6vdd2DXRAUreOf6jakCGEINgktDFgTZOMgFPzs4W9vgH/rC4/6FPgDRt3ZebbqIKAAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 'Smak: Fruktig, kryddig smak med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, Ã¶rter, lavendel, anis, bjÃ¶rnbÃ¤r och choklad.

Doft: Fruktig doft med fatkaraktÃ¤r, inslag av mÃ¶rka kÃ¶rsbÃ¤r, plommon, Ã¶rter, lavendel, choklad och svartpeppar.', '3');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (16, '481712', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VS4oDMQxEDb6WQFcX6FoGTZXcDZ6eWUVaJBCRj/N6UaJcUkb8U+MJWF/4qPeEa4yhYXPNJXnsgIqXqYloHlugDOGPBZjHJojf6JvdN8IJJfc+yM7DaMc+dkC0LVf9us0CzFozHO9ddYizTXc3iGxeh6RQYcZwc6QNMDgF6rA5TG+hGlxDnUKRue2BAEOmCSbW+KQF0gWHLYYncoehBldulQGL4Qd1WqBHtk7FtKQOA9kSJMwYr1uoCHEkoCtYArchVYiLG7Q4ve6BIL6jdaSuCJVBQMS4WI8wVCCLw4CBpc1bqAj3AiTNrx6oNMKDn7mrOyD/RbJzrmm/hBogtjSiq2cY6hBDC4qBOIVeh2nIor1Ir5wuvQ55cbo4V5DTS6gG/9YXPupT4A+QmgfwwQdY/AAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (27, '207117', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKElEQVR4Xu2V0YrDUAhEBX9L8NcFfyvgzthstpvtmz50oSYk3hPoXHS8lXoRcgeMD7zFe8JDRPww88pOV6AXUYg50x1oWJIDdroEcWtFv9egJ3adeVMfQO5cg2umOxDdsjN+dXMAO0Kpdi7mEEImmhnCZ65AiKC6D9N2TTYgFshp2grneg6xeQ9QfAq6YgMWKxGwA4ybrbQB8es0beijLgsQZYUUtDBeXeMNqJTho5KKO5C1hcEcX36EZhCNy2iD9dSuQBRE0bBghb8bN4XMlb6tJ9eNoSmPK+/RPTc/g4yjJ7XxCkQilMHJYq2zAR33obioxiovQOM53f9RkLyqNIfQQds061loCOkHOlcvM8ygN9fimF0GG0I2DsEZ670vwL/xgbf4L/ALEMPFjXnzUccAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (28, '454591', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2V0arDQAhEhf2tBX9d8LcEO2PT3Nu0b/rQQqVJ3LOF2ejsRvJNyBUwfvASnwlDRDT21vRKR6AmkclWpjNwY0gOWOkQxG+l1XMMqmPV7hf1BuTKl3HMdAaiW/uIp242YIUtWGEdgz6E0JblbsK7j8BMT9t301ZNJiDyw7Rpyj8NQLYNAh5qdMUErILAtIHLS6kP2TTKqa16iwkI96NjtjDHd8gJWBEkCSucZuhBt01nQWXlKdSDSJ37Xzl7HgJNSG9hn9JnenazCbH0QHUx/mewJtTgF4XGpdUei29BBmob3FqcnoBRB6CgLPXIEUiR4N7isWKHUBNuDp3fKPk7vScgdwI6mE9CTYijAJ4lHoFKj5UZcA1BNg5aqMV97QPwNX7wEt8Cb2jC052t5se+AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (31, '225752', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VUQoDMQhEBa8V8OoBrxWwM6a7pdt+VT9aqIQ2eQvrxDhZiTchV8D4w0t8J1wiMmzq0jUwtRZoGBM/A8+46oBcrKGRmUYfzC00Q/eImKMNIgvEA1hOWyAP7h7Pp/k5ZKDG6AYKZ9Th0sn+Ckc9HuKr0ANZ0GPMpUeiEgz3achGO2z9DRDaY6K4k+MuvgpRCkM14FharAd6rrAFtCxnDRBFZjnUEbmRBgi9zqFss6xyA4R6GAupIm3bAfFuZycIG02OritCXTAszEUzPIxQhFzjgfGysiNRDYrysjJKl1N8DTIW7wCjx7iqQ16A1L3r0gQtKwvpI+3aAuEpNphmRu+DqHI2w+m4OoTqfX52XAJFiILk9wn/TNkChR++fXbbsXX4Gn94iV+BNyi10UUuRiyVAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (32, '618728', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2V0QrDMAhFhfxWwF8X8luCuzfJuq7b0/Rhg0lp0/NQm+vVSLwJuQLGH17iO6GLSG/hGoNLLYHKC6R5X8sC2KV3NWngWNbBNkYYnpVQQL0QUgXKgdtDkCRk4XY8V/NzOAN6xDBdL3noMl0Ajg0cgiShIsugEjCDHioloaMPltCBqwLiHUUzyEtRdqIkBKBnBzzbls55GJSBrRVsMNICOAwUBbNGs5VALKYJWDlWsAKSQgvryGEUugKyCTAJpl8PM+QgftqZB+2AOaglMCjCFBlz0IugwQvIMI8T1q0CIjhPKbGfh1UC8vs6Kf9+Fy4LlQOArYpEVbDTBt7QsFuRGkgXMAX9UAbXudeCW6mASs4DABu4N1cWCvs1CNXO1UzA1/jDS/wKvAGdbAlY6zeYOAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (33, '618728', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2VwYoEMQhEA/6W4K8L/paQrbIzMzu9e9PDLoykIXk5lGjFXvuXWHfA+MBb/E2Yay3bLimptZ2AhuXmqlbbEahLeUjA2g5BnJE3sx+EAqWIOcjMt7Mc13YCIm098dbNBqxIub6KPsTeJVANiFx8AOIARI+hc6R9yM5JtQ2ltiPUhHlIlG+HoOJhCVYKdB5m6MEdKUE9x40+zNCEKMjCwdFA2nYGsnFQw61USQYg3ikSD6e9nkI9SC8ERXj7fHFNyGrscAyrHa8h0INaiTPr7wbrwlz8nVhWAycgAwoQqzJfQk2YHIAornMOUmcCWumUWs3qCci/SHJScUzHEZqA7B7l3oSa0PgUVDkOJmAVBH7Y9C8tNgDZOGRf1XA7Qj34Mz7wFv8FfgEwHe1lOuTg6gAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (34, '598039', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VUWrDQAxEBbqWQFcX7LUE6szadVInX5U+Wogw8foZouRpvJZ6U3IHrA+81d+EKSKmlV6LSx+BzgNE047lADQx8xAFx3IO6loVOE9CAc1BSAvQQScPIU3IwZ31c5q/h7vgo1b4cdGHKTsF4IjDJaQHMTBHH5hAGPwU0oVshQ9TiKbrCbjWThfa1Z7dAMQpEa+FzOrhuQ8rjLjYTIu0D1OcMpxa8pG6HvTUwMCoY6HdBIRYpiEMPYK3JiAUQ4rsvF5h6MH04KMKJ9wHfQTuzDJYuKfM1wSkEKrgDsO5TcBiL/xw3LjC0IT8fufGTzH6nZAmdB5UgkZTkG+RMG5+p5EZiMsdV+ZhDNIEmu2/MgGdXLkX6PVwdaHwxefJjT+ep9mAr/WBt/ov8At4/gnQAxm5EAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '2');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (49, '178198', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABK0lEQVR4Xu2VwWoDMQxEBfotg39doN8yqDOOaRK3N82hhWg3jvftQfJ45LX6JewGjA+84m/CZWZzjTEr91QCZxGFjcmpBg48kgPuqQji9or9L4MzUXXmlb0BWbnH8HWr1IDYrXHibTcbcEc4rODnoQ+RaJgn3YUxNXAGJRk07faYAFZWHNMWXj8SNeHeL4yJjHSFBmbQtAu/3JkEkPtF04ZDFqxAACmweeCCHlyHAIJ5Fq/KPUogGzahBZbxTNSD8OoxGMWeEsj2Z+V88b1xTQhCx4K/GawHUTPEgHnZuqf4HmQ85A1iCVw8AD3QsTz8wRRw8qbEPFaosgAOntP7G2XP01sAadhgQ7wmakKDHvhQEUsgBGH16AZILYLcOOYyundK4M/4wCv+C/wCYUjdOZVcql4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (50, '178198', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VwYoDQQhEG/q3BH9d6N8S3KruycDO7s06JBAJxHlz0JSlGfVPjCdgfOEj3hPmGMNXengYUwn0SvOYa+1UA22YsVY4UxlEnWKmhEjXWkLo4HPlrABJDcS07Ipf02xARs7k6M6DACYbT4ceA3pQ7D6kBmETnnW+dwUkA+IAZ4xX9R5k90EzVIxjtD5M7oEnqrD5uJpvQqdfYQhftfUQwCqOzPjE7BRqQhSCJuybrqDJBNBgL5Rg85RaAQs6VLAatKY1BDAxt7m/8OIeXA9CjVMLd5UVFTC5WPDX5YhSQAbOCpbAfGsigPsAYlWNZ9Bf02xCxwfNJy/LfWmb0LhXWCv+P0/+FA08NPfSqiBOSuw7yJ1QQAjCAosX9d64JuTgMLojsAb+jS98xKfAH6lFCKRM3f8rAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', '3');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (51, '178198', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2WwYrDMAxEDfotgX5doN8SeGccJ3S9e5MOLVSXOK+QcUdjJWP+U+MErC886j1hjjEsZtqMtWyBNlPFx1Djsgcqbl1SAbnsgioR03FthEaZiEO9AGnI2v7pUgGiW7rrVzcL8Kq0SNnrOoQQBFRwhdXRAicEYod2ZawDIgQSLq423fbmizCZgiGJxoHf/6gGpysOLH+gHpXqMPn0vCKGPFgHhJAyVi7wgx53QDgyLyvQvycMJYgs8KAKVISRaIEYK3g+7A1/mQw1aBRC75bRt1ARKu+ptW3pgMZYIWC2ju69+RJkAcAJJ26ByQGIJV9TS6cDGvdPKY6V3EJFqGtO43WK9j2bb4CMq2MIMGddEE5wBBK3QBjCjEELB6wJsnEwwvnZw703wL/1hUd9CvwBebLniasGansAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', '2');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (52, '661453', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VSWoEMQxFBbqWQVc3+FoC5333lFSyirRIoEXR7XpeSPoayvYPZlcge8OL/U2YZjZienoOjtECg2fyM7jTWwfUSw7fx9PogyeFZrjW3nuONogXgkfnOMcWqMLd7Ws1fw9laEw3KHBZHaZP9dde6PEKvgbBaKweky9/eC/BpLWM4DUOt/jrUGqkxJ16HsHXoPrfUYOJ1Yj1QEmLxnDl0AKpmMWadAPTMKVIHaapWFTuKNMEg5r5nqYEtqwDcqYdzNe5aYGu1eJSZK/P1axARR6pDmMLxN1RFdKxaKzQpUwHlBHyYmAjxRrgcXSbsHF2QAeExPE09NcDKRviTm0ClOmDWgRqhudw1SEnekI5PDdDDQac8F0X2v8d0PThQxFSuE1sHX63N7zYf4EfNFDZAd0jo84AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (53, '152429', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNUlEQVR4Xu2V4QqDMAyEA32tQl490NcKZHfVVef2a8mPDQyK9RPaermkEh9CroBxw0v8JnQR6S1cY3CoJVB5gTTv27AAduldTRo4hnWwjRGGZyUUUC+EVAFyUJNDkCRk4vZ4zeb3cAb0iGG6veShy3QBOOywBElCpM1303Z9CpKDEcbZN6GpdQF0NUxvkJeiPFfPwWBVwV/wbNt0zkOIjO2jtIIFRpqHwTWaKz/6MlgOQtcBI0AW2mzsm09CUaceHWsYhS6A9ALMKtOvyyE56JyfMjv7oJZAqIxa7YobH4ogXrB7ZdZm3ipgUAf2ARTEuVklIOenylCDh0CUQOVFZxldUQPnKeLNaIi1+TykC7gE/VAGUQn0WMz/KIBKPnt1OyouCYUHnzobv52zmYDvccNL/At8AIlaEci1WAbmAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (54, '152429', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABOUlEQVR4Xu2VUWoDMQxEBb6WQVc36FoG9412m5C0f9JHCxEEtG8hkkdjrZ1fwt6B4gPf4m/CbWYe25evqbQF+tnTl43ItAdOm1SYY7nSNuhrHGWdkDQiGqHDR4RE9heVCpBpzTteplmAij0wA5O7og73CDH0MPSQ2HVI92PLCpiB994BNzqA8iXWvavX4EEH/h687DJaHW7fTItfNq+KdQiNy7hxUo8GqA3gqKznUM0GiBSxtANMroi7eg1uHmUvNc+1bYEHYWmc9Tcl9t18DUpgF0qVv6dZg3kRtKV1BPmsAeIF7j9uZWq5/xqgIoVm/6UmDTAXIB8p+TaH1wH96j83y2PTFqEGl1uVPT10lB44+aBoGTybr0MK4QIOkNe2ASIIlfArrT9uXBHm4FAkBe6BP+MD3+K/wC+w4PA1J9wHnAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (57, '469492', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABM0lEQVR4Xu2VW2rEMAxFBd6WQFsXeFuG9B5nHmnaP+mjhREzg+cYch3pSrbjl7A7ID7wFn8TLjOLHHON5SxbYPDJWB7nsgO6uYSWC7Lsgu4jzTh9J5TMnH2QLGRM/V4SUoSq1lZSfKtmAe6YK+SGx5861DpH7izHyRsgiV1YDEdAG6A0YkrG2XgK1eDBUp2lsqkXeqCEZCzQYDc64D5xug1S7U8z1KCer4aNY05to9MBTW21D71f4yFUhLJrIIe9XkJVmJxdhCHwTEgR8niaK4W3UgMMfMALHBeDVSF3CVQj5mWGGiSW44ed5lOoCPcADM2rtNOzHTDQkZC+FLEFcotIZKCoO6ANSoEee5uhAU7NwKnjj6tQAZIQXc5S0Mwm3Q2QwqliSTbIcQP8GR94i/8CvwB/M/jhOmFFLwAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/castillo-de-gredos-1279708', 'Smak: BÃ¤rig smak med inslag av kÃ¶rsbÃ¤r, blÃ¥bÃ¤r och kryddor.

Doft: BÃ¤rig doft med inslag av kÃ¶rsbÃ¤r, blÃ¥bÃ¤r och kryddor.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (58, '222230', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2UQYoDMQwEDfqWwF836FsGp1oZQnY2N+mwCxEhI9dFnu7WjPOhxh2ovvBWfxPuMcbc7vNEti1wHqE1fKrtgc5RHJhtE+RnZ+WzDc7g1hG36QWom9ty23eVChC3/KofbhZg1jKiYNehDhnkwyLW0H+0wHNo9jO0mbEWuOSXQnvW1LkO5dfl2VIqWqCGEFomWeSkOkSQwDfGGLLwBg1wEy82C9PQQxp3QLorXPA3lQoQ44ayxRS9Qgvcee0MWKaiBeKbMhAK7svNImS1tuWt3wNWhBkCQxCt7uyAqqe8iVtgfgAZw5fFc04HnNJZn2knalK5AZIAicscRr5UqkOswzbTfrVBosUquHALRBCFgU5S90AZx6yhddDdG+Dv+sJb/Rf4ADzY35FcTdfiAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (59, '222230', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2WwWrGQAiEhX0twVdf8LUEO2NCSLe96aGF30vMdxmjo0Tyl5ATMD7wiL8JQ0TMMyy90hFoGbq2bTWmM1BFba9QQKZTUJd7bjwHoVHG/VBvQDak0NmlBsS09I5v02zAK8I81p33IYQgADuIoNU+AjGwlbdpy2MjEBqUUcttd/FNGFitkMWxbcxvBtJdaMVGU7yUBuDi9qtcC4YvmIBigRuQXK/q8QTEOzXwCv40pAfLXtTCZzxCXQhblbN8vy5DE0IFY2OL7RlcFxZl2S+DdSEKx6aiIVxdm4AMGEy5WvE+Vg0YPIBIuQmlMwEtef3s+gr2ZQAqK4fBeAef4gcgbbBxBOpcDUH+S8CzxCOQrcCtRoYFG4I1ONTO3x7WPgB/xgce8V/gFxC/1bknEWfMAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/castillo-de-gredos-1279708', 'Smak: BÃ¤rig smak med inslag av kÃ¶rsbÃ¤r, blÃ¥bÃ¤r och kryddor.

Doft: BÃ¤rig doft med inslag av kÃ¶rsbÃ¤r, blÃ¥bÃ¤r och kryddor.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (60, '523910', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2VUWoDMQxEBbqWQVcX6FoGd0ZN2GTbP81HCxHJrv0CGVkey3Z+CbsDxgfe4m/CbWax14pTPZTAOERpKzjUwIUpOWAPRRAfP9lvGYxC1lU39QFk5p7L971KA4jdWo94280B7EiHFfwxmUMILfOqND5LA72+rQCp9pgEIvXdpj0Zz+SH0GADbFjhB7pCAn0bTQslr1YSQFbC8cISui4CiCkOgDn8kF1jAcQp4AoOSoHCPAsygzz8tBb0uAQJhMHaYahLXk1gCAN2gECywtfGzSD/ux/nxWBDiDMQbFfRRzcUkIHcmT6xBG42QEzQWVbrKCBFNts02wqrLICLfbrvKLu6twDSsLhT6rwKDSF1cFERSyAKQqHsrwhy4xDcu85dAH/GB97iv8AvsdrXIWHaJiYAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (61, '523910', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2VwWrDQAxEBfotgX5doN9acGdkGxK3p+4cWogIQXk5zHo0WtvxQ9kTsD7wUX8TLjPL8l6+gq0EJj+VK/JsFTAsILQCkK0KRniZ8fRKCJluHaQLlY3vF0M2IaY1Sqi3aW7AqaaGXz/2IfryGpfz5AKYB81AxJgIUgGEEd6QCf5xC21CTg2bhbFhF1RwYWHhxXLo4CkEEHZ0IQdOq+MOwyakI2gLA0zqCOCawcX44WOJAM6Zgy77+KGAMIE6fvASuDduE/oyHr3hyKRXAekBdsCvVgIRMGxCY2pYhvvwe5CFB0BumdxLaBOeFyASUXZmVgHzYLKwtLS6UgLnLYIbkIrZl5AAQgHZzZcw7MODV2rxJnxT/zWkIXQE7bitgBwc7r6iG/RYAL/XBz7qv8AvNX3oef9QsYkAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/castillo-de-gredos-1279708', 'Smak: BÃ¤rig smak med inslag av kÃ¶rsbÃ¤r, blÃ¥bÃ¤r och kryddor.

Doft: BÃ¤rig doft med inslag av kÃ¶rsbÃ¤r, blÃ¥bÃ¤r och kryddor.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (62, '227322', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VW4pDQQhEBbcl9NYFt9XgVJnHTXrmTz8mEAlJ3xNImfLRkn+EnIDxhUf8T7hFZG2zlVHHEbiSyMUWjzPQ8EgOWMchiJem1+cYXIGsIw71BmTm6qb7dKkBUS27x1s1G7DCFd/q/aEPIWSiES58jxGY4cvt1rTVYwMQ3hI5TE5fj+R7MIMpV82cXTEBN8YVnih6VqOU+hADoF4yWv9iBAZ8CFf0gy96PACRPFRoBKzJy5AeRPfDZ6govR6Bmhx/OBF+LYEmXFE/X437rGYXwmCrEXhpsCbEPuGu8uozOD4AGRChDvEIZOEog81ipTMBKcIVsGkKXR6AvKRud5Rc23sACimWQL4KNSFaC1vFiEcgDMGtpzjR6hnIwjF/jG3lPgB/xxce8SnwB7bn2bUonLfiAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (63, '139313', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VS47DQAhEkbhWS1wdiWsh9VThxE48s4PFRAryovuxgC4+lv2HyR3QvvBm/xOmiFjadvPF4wi0nUvMNeo4A5eshZu68TgGLRgg1yQsHoPQGAH6QmR7U6kBUa31sLdqNiAtl+KL4zIAUyN1uyIi9NAZuBBFHXoY/TYClco6qwfXGb0FdwSFhhwMNgMZCPn7kbxfyTdgpY5JQNvu0mMCBkfh6ITIZ4P1IDprB1VxdgV9A9AYCIbk6ZuA7NfNvoXPngPbhGnhrBsP+6xmD1KRYBQxqjIC0QUsV2ABSu2/AUhLYdPCS00GYC1AbJaqHos3Aa2q5RyHfF3+HYgIxgng/1n5lBm4QKj1lXwfUmB2ryvfMQAhCOQ9Nuo1cT1YhcOirp/eDPxtX3izT4E/WDnrSVennJkAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (64, '487431', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2WwQoDMQhEA/mtgL8u+FtCOmPSbbvbmx5aWCms+w7VjBPZNr9EOwPGDU/xm9Bba2LTZVqkJVCmj66tDWFaAwdetfsAZFoFRzebimchZAkxO1VPQAqCXC8qJSCmNXZ8TDMBV2B23neehyiEAmEHSG0lEBReoBIQmZpUQA6sqyiFlt18EoYPYFrUAH+eKAdRSWlaeLZbVMpDFgqLxQXDCQog5GXrnJmGxjVw1cHkbB5myEHFDlCOzsMSFdAh7lxLVV9LIAklFvTgreUJSiD+27zz8e66JOx8gbfi6u7mc5CBW8A6xCUw1BBeBy5/JBVQ1m+tFd+FkjBGhp3KPXg0XwBpV64CiFIG+S0BzxKXQKgRveNy6WGwJIzBYVGjVvReAK9xw1P8C3wAGvvVQTgtzowAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, hallon och vanilj.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, hallon och vanilj.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (65, '487431', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VQarDMAxEDb6WwVc36FoG/zdyEtL076RFCxUN2C+LUcZjtax/qjyB6gcf9ZlwllL6GnXW2XyZATu/0Udr3ZcpsJWmzQT6Mgmyp291nwgrSmZ5UJ0v/HhzKQBpux31cpoB6DXrfrzikPWoZjYQ2TwOF4DAKmOcnGgGxFmObTSs7pdQCBJWQ6Kb5zYHQltFhhuLzhGGKKRrk9ejkrIzDDGongsaZvghnQxYtMcOvqK6JQmQC0DjNhSvSygI5a1ElobAaUgQ+piSxdWzlgIVftNFWPfUBaFPFj4BySsMMajCXkx2m7dQEMqQBmCy7MxmQBkhU6Ym9WlyEO5/Efej6JplwelzoN/CEIeaqFBe3YQCUIbUKXsnNh9CQegHh5zcILkZ8L1+8FHfAv8A7q/3eTUPUVwAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av bjÃ¶rnbÃ¤rssylt, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta, bjÃ¶rnbÃ¤r och choklad.', '2');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (66, '487431', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2UXYoDQQiEBa8leHXBazX0VpnJTDLZN33YhciQdH8JlFP+yP4l5A4YX3iLvwmXiPgy8511HIG+iTLMeZyBJsbLAqzjEMSjO+p7DHpCKfOm3oDI3DQ0PlxqQFTLjnirZgNWhKIV9Lj0IYRMNDOEnzkC98ZhPZq2PBmAqBhRsGbh/FMfUim8NIJdMQGXJjtBoYSTz0Bfuph3KF4CbzAAoRSigTnAD/R4AGKiMAYkG/xpSBNyDIReoGtPoSaEt9gBcAI78NoMXYj84TIdPgvXhM72qhF4abAmxDpRriuv0X0m34KMh72FR+DiAsQFm8VKZwI6H6y/VTN7CDWhUUDZaHJt7wGosASLoMZhCqK1MApGPAJhCIU4XHF1XQ9W4axqV7kPwM/4wlv8F/gD13HLpRvfNB4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', '3');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (7, '365249', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VUYrDMAxEBbqWwFcX+FoG78wkm3bT/kkfXahI0/g5IDEaK7bfhN0B4wtv8ZlwmdlYEWNPPbbAsYlmxuBjDwwLLhagHpsgLt+p/zY4JjLNectegKg8PD1fVCpAdCvO+NPNAlSkwwp+LuoQicJ80l24zxaIgLqHaaVJA1w+09fgb+fgO3WoXh2WSLqiBaJoLB2eRUq+UIdLIqBulC9dOqDsZTgH2NB+HSqVU4gNfglSgxhTdBiy+L4S1SDNilRQArvXEChCpkHDkgpfjStCKMtZJf5rsDLEhQkAQXh0z+JrkKENeuF5WBXg4gDEYuIkKE8HVPHHbJEsHTB4EvSNssf0boD68GEI7OdERQhrwWVB3AIHfYtEm4ZogmpcqHeqvQG+xhfe4r/AH6HX4xXt1JgdAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, Ã¶rter, blÃ¥bÃ¤r, ceder, choklad, peppar och hallon.

Doft: Mycket fruktig, nyanserad doft med fatkaraktÃ¤r, inslag av svarta vinbÃ¤r, fÃ¤rska Ã¶rter, blÃ¥bÃ¤r, choklad, peppar och hallon.', '3');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (8, '365249', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJklEQVR4Xu2VUYrEQAhEhb6WUFdv8FqCa9nJsJPdP/3YhZFJ6LzAlF3aRuKXkCdgfOAj/iZ0EYEjNrZyOQIRroK9rJYzUEU1n9YGl2MQRgHXSZi/ZTYIQQUFTcabSw2Y1dIr3qrZgAzXFazciT70ZV7Ihb6MwAizsJ0tBr7HCHRl6gqXteUW6kH+depkz1JsCiZSMia/MQLztKYjrnXHJdSEOKA24a/B0oMqp7vYD9VkfcjCoW5WfTECc3XxzJxb6EPnIweA0+VXNVsw0olKfSNTn4FOiV2dIDX/BiDDKcP86ckAPAMQhNxCjMA0memTe2U/APkV4Qng93lxKzNQeZXMnXwfprtgU2RbfEu+AdMQKoET9T5cXcjCnStFZuDP+MBH/Bf4BW1t8sn9rYRVAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 'Smak: Kryddig, nÃ¥got utvecklad smak med fatkaraktÃ¤r, inslag av kÃ¶rsbÃ¤r, kanel, tobak, choklad, plommon och vanilj.

Doft: Kryddig, nÃ¥got utvecklad doft med fatkaraktÃ¤r, inslag av torkade kÃ¶rsbÃ¤r, tobak, choklad, plommon och lÃ¤der.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (9, '140282', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNUlEQVR4Xu2VUYrEQAhEhb6W4NUFryX0VplsNpudP/2YhZGQdL8MaKpLR/aLkCdgfOAj3hOmiFjstB21HIG2U5eLqHE5AxVbX6mAXE5BXRHb8RyETGERj+wNSEGUEj9VakCclp7x6zQb8IjEB6xz3YdIhARlB0gdI3Bvh75UIpjNJmDKSgu8wN6NPxqAKih8JV652vcX9SAy0bNRj8rUh/RrWawaDE4bgbA/qmZ7lcYDsIIK4x77MkMPOsTFGHC69krUgzgviott+G0IdKEunloJ/ZOoCRcti3a9ua4J9TAY6mfrnsX3IANdoGytvA+rBkwOQFQezuEPNgENV1BqjhW6YQCyD2gwzsGr+Alo5Qn21xhEAliCf6qnIE0IQbBhZ9FoM5AHhxNzsaP2Afg3PvAR/wV+AWWu1bmG9lqOAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (10, '140282', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2V4YoDMQiEhbyW4KsLvpaQmzHd0u7dP/1xhUoL5tsF3cnEyP4j5A4YX3iL/wlTRCzS3FyZjkDbqeayotIZqKLKWm5Mx6D52swmIdKIGIQGvsC2g+QMxG7pI952swEZudISO3eiD7EggxUEelDsAWgwrC54lrWeKjUhCgFYyoJ1r0ItCBvgwYbFXI7RRmBKVWHzfppvQiwjnMaNXXoMwM2mMQa4ZskRWElCD7qCJutDqrB8JZun4BNwQ1jUCk4D4xYOQGqh5x98YQKiEo1LqdH6DEQFKc9i12r+DUBGLZ1fIFf1FqwBaDxYWpqMQMOPTzhZ5CrUhLxFcGiN9/Pip8xAVY6+5NMxaOWsOg8vzTcgBEEdYLT+PHFNyI3DTXIEnoG/4wtv8SnwB6WM/kUFihTKAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (11, '939654', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VUWrDQAxEBbqWQFcX7LUE2xllHRK3X5U+WogweP0Mmc1oVpb9Q8kdsD7wVn8Tpoh46EpN43IEOq8QM38sJ6CJQSgJuZyCZhoi3P0kNPG15iBdCOfixZAmRLeoVGqv3WzAKuwbppyHPkzdoVEuexbvQ7hcPkQlgnQA7k0ZD+OLS6gHUxdpVmiH4F6QCHiRULvC0IWbE4BHAVbbMwwtiM2n6F4L/4GxHYHmJ15JW45QD+IkECs9KT8GYLlbeYXe88R14eNaAXw1rgvRLAbMy5t9Nt+GUtPPMWKeYehBFmdfVHKPUBPWAMTvB+cgdSagb+aLKSu5EcivCEKmVPR1hAYgbjiu/hqGNkwEgjNA39V/DZ1c6w6bj1ATsnE8rnSDHg/A7/WBt/ov8AtpwdrhuBSv0AAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '2');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (12, '939654', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2V0aoDMQhEBX8r4K8L/lYgnTG93Tbtmz70QiXsJiewyjjJyvoQcgLGDx7xnXCKiM0xbEVOW6AtIpdhnPbAgSU5YE6bIIYuz3cbtEDVEUf2AmTl6kPnqVIBolvjHi/dLMAMhx7QZEcdItEQjXDhM1rgihU+tmnTYx3QofA27XK7F1+F+Da94IPjr/gahBOoiSKTRmZqgOj/5HCdqUsPxJJNgx7zSlSDoKKpC3rYA7mGs5Ald3pg8PhDCfjscQkU4VZ2pXGvbhahsGO01rPBahD+p8FwV/HoWgdkwBDcI26BkxegujFb5umAlmZA7bxWqHID5E9KcQqghjyKb4DCH19u9UEg4T2ol0NKEILAClhOSN0E2TjkQtN27Q3wPX7wiP8Cb3MzxY3dNK4DAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '1');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (21, '238238', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2V0aoDMQhEBX8r4K8L/paQzmTT5d60b/rQQqVlzemD6Yy6Mt+EnIDxg0d8JkwRsZhpM1baAm3mUBcZxrQHDhxdcwAy7YJDI6bj2QhZwiKO6gVIQQYlPlUqQLg1dvxzswCvgHepO69DFEIBMBFIHT0Q6s7dtKvHGuB0ZOHmENptX74KIzEGStvA9+WLMAmgBHpWY1Wqw+nI0QjXgOEfNMDU1a70jNLs6jVIZZdvkIYO9kClJooqev1Wh8mVyj6b0OVeAkXIDOe1Am83i9D4DY7rnwarwoAkyz2OrnVABgCUcOIWmFyAvLlw+YN1QHt+hrF7WyCMwxGLAHvwvnwDFONaUc5XGxx87zlfqluQIqQUaFk8MGBNkMZBCOeQ8e4N8DV+8IhvgQ9Kdffxbnu2kwAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (22, '905439', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJElEQVR4Xu2VSwrDMAxEDbqWQVcX6FqGdEZOKE270yxaqMjHflnIHo2VcXyIcQeMP7zFd8I1xvA1px9ZQwn0gyjGdA41cGKKyQKsoQjisiPqLYOeyJR5y96AWPm04JxDDUS15hkv1WzAijBYwc5JHyLRHJZ0F54pgiTbtKWJAnqG8QEcfi2+CeEtegFX0BUKuBWBHXBnZRJAFA01QxqDLNiBArJkHjgH0IMaK2AYsFFg8EuQJkRP2VrUFiRwMUGUwerUSuBkk4K5qPBVuD40qhvkT9f1oONQ2eIHOu3aUQsyVi27sAQuNkBMMrYwEuhcf55tJc5ETcjCWfIfNZ7dWwFh2KhPOogTC0tUQgmEIEyEJghDiCAL54vJ9toF8D3+8Ba/Ah/w39H5OJaFXgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: GenerÃ¶st fruktig smak med fatkaraktÃ¤r och viss sÃ¶tma, inslag av katrinplommon, vanilj, blÃ¥bÃ¤r och mjÃ¶lkchoklad.

Doft: GenerÃ¶st fruktig doft med fatkaraktÃ¤r, inslag av blÃ¥bÃ¤rssylt, vanilj, mynta och mjÃ¶lkchoklad.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (29, '454591', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2V0arDQAhEhf2tBX9d8LcEO2PT3Nu0b/rQQqVJ3LOF2ejsRvJNyBUwfvASnwlDRDT21vRKR6AmkclWpjNwY0gOWOkQxG+l1XMMqmPV7hf1BuTKl3HMdAaiW/uIp242YIUtWGEdgz6E0JblbsK7j8BMT9t301ZNJiDyw7Rpyj8NQLYNAh5qdMUErILAtIHLS6kP2TTKqa16iwkI96NjtjDHd8gJWBEkCSucZuhBt01nQWXlKdSDSJ37Xzl7HgJNSG9hn9JnenazCbH0QHUx/mewJtTgF4XGpdUei29BBmob3FqcnoBRB6CgLPXIEUiR4N7isWKHUBNuDp3fKPk7vScgdwI6mE9CTYijAJ4lHoFKj5UZcA1BNg5aqMV97QPwNX7wEt8Cb2jC052t5se+AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktÃ¤r, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nÃ¶tter.

Doft: Komplex, utvecklad, kryddig doft med fatkaraktÃ¤r, inslag av plommon, dadlar, tobak, choklad, dill och nÃ¶tter.', '');
INSERT INTO public."settings_history"("gameSettingsId", "gameHost", "gameId", "qrCode", "url", "description", "servingOrder")VALUES (30, '225752', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VUYoEMQhEBa8leHXBawVmq0ymt+ndP/3YhZGmJ3kNU1IaI69fQp6A8YGP+JtwiYiH5tJlXI5A5xNi5ns5AU0MQouQyylopiHC7CehiWfOQboQzsXNkCZEtahUavdqNmAF8talZ9OHWIdGueybD0B/JV9RHUHah9gtTyDjhyPUhuxWaPBnCibzhhdL42qGJlximsGjAKvt6pAWROWwgSVa1pzke5A575KVLUe9CYUUubO9LqEmxAaJgySGwNulJtTFOaV0pLp3ApoQ0IrvBmtDZf4JQzBh3sn3IANN5rtzj1AT1gDE/yfvKepMQBqB/FE23xN7APIWgQjrh1vlCA3A6jKcsFsztCHOatYkuAs1IA0xTgDWjy02AOviE3jiHIVHqAd/xgc+4r/AL5bYz2WzYqH9AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, kÃ¶rsbÃ¤r, Ã¶rter, choklad och hallon.

Doft: Kryddig doft med inslag fat, kÃ¶rsbÃ¤r, pinjenÃ¶tter, choklad och hallon.', '2');

/*
Table structure for table 'public.user'
*/

DROP TABLE IF EXISTS public."user" CASCADE;
CREATE TABLE public."user"("userId" BIGSERIAL NOT NULL,"username" VARCHAR(255) NOT NULL,"password" VARCHAR(255) NOT NULL,"activeGame" VARCHAR(255));
DROP INDEX IF EXISTS "PRIMARY00012";
ALTER TABLE public."user" ADD CONSTRAINT "PRIMARY00012"  PRIMARY KEY ("userId");
DROP INDEX IF EXISTS "username";

/*
Dumping data for table 'public.user'
*/

INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (1, 'Felix', 'hejmorma80', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (2, 'Carina', 'qwe', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (3, 'Linnea', 'katt', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (4, 'Vinberra', 'vatrodu', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (5, 'TestFelix1', '123', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (6, 'TestFelix2', '123', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (7, 'TestFelix3', '123', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (8, 'As', 'df', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (9, 'Vinproffset', '123', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (10, 'cartop1', '123', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (11, 'cartop2', '234', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (12, 'LINTOP', 'kanin', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (13, 'lintop2', 'hÃ¤st', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (14, 'hej', '123', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (16, 'LÃ¥dvinsViktor', 'Vin', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (17, 'Tove', '19980109', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (18, 'Lillamy', '7Bubbelgum', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (19, 'Ingalill', 'lillan1448', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (20, 'steffe rfe', 'rioja', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (21, 'dagny', '123', '');
INSERT INTO public."user"("userId", "username", "password", "activeGame")VALUES (22, 'JUKKA', 'vino', '');

/*
Table structure for table 'public.user_guesses'
*/

DROP TABLE IF EXISTS public."user_guesses" CASCADE;
CREATE TABLE public."user_guesses"("userGuessesId" BIGSERIAL NOT NULL,"username" VARCHAR(255) NOT NULL,"servingOrderGuess" INTEGER NOT NULL,"descriptionGuess" VARCHAR(8000) NOT NULL,"gameId" VARCHAR(255) NOT NULL,"regionGuess" VARCHAR(255));
DROP INDEX IF EXISTS "PRIMARY00013";
ALTER TABLE public."user_guesses" ADD CONSTRAINT "PRIMARY00013" PRIMARY KEY ("userGuessesId");

/*
Dumping data for table 'public.user_guesses'
*/


/*
Table structure for table 'public.user_results'
*/

DROP TABLE IF EXISTS public."user_results" CASCADE;
CREATE TABLE public."user_results"("userResultsId" SERIAL NOT NULL,"username" VARCHAR(255) NOT NULL,"playedGames" INTEGER DEFAULT 0,"numWinesGuessed" DOUBLE PRECISION DEFAULT 0.0000000000000000e+00,"numWinesCorrect" DOUBLE PRECISION DEFAULT 0.0000000000000000e+00,"correctPercent" DOUBLE PRECISION DEFAULT 0.0000000000000000e+00,"wins" INTEGER DEFAULT 0,"isBacchus" VARCHAR(255) NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00014";
ALTER TABLE public."user_results" ADD CONSTRAINT "PRIMARY00014" PRIMARY KEY ("userResultsId");

/*
Dumping data for table 'public.user_results'
*/

INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (1, 'Felix', 2, 6.0000000000000000e+00, 4.0000000000000000e+00, 6.7000000000000004e-01, 1, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (2, 'Carina', 2, 6.0000000000000000e+00, 2.0000000000000000e+00, 3.3000000000000002e-01, 1, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (3, 'Linnea', 2, 6.0000000000000000e+00, 0.0000000000000000e+00, 0.0000000000000000e+00, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (4, 'Vinberra', 2, 6.0000000000000000e+00, 3.0000000000000000e+00, 5.0000000000000000e-01, 1, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (5, 'TestFelix1', 22, 6.5000000000000000e+01, 2.9000000000000000e+01, 4.5000000000000001e-01, 19, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (6, 'TestFelix2', 14, 4.4000000000000000e+01, 1.5000000000000000e+01, 3.4000000000000002e-01, 7, 'true');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (7, 'TestFelix3', 16, 3.4000000000000000e+01, 2.0000000000000000e+01, 5.8999999999999997e-01, 15, 'true');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (8, 'As', 1, 4.0000000000000000e+00, 1.0000000000000000e+00, 2.5000000000000000e-01, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (9, 'Vinproffset', 1, 4.0000000000000000e+00, 2.0000000000000000e+00, 5.0000000000000000e-01, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (10, 'cartop1', 1, 4.0000000000000000e+00, 1.0000000000000000e+00, 2.5000000000000000e-01, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (11, 'cartop2', 1, 4.0000000000000000e+00, 2.0000000000000000e+00, 5.0000000000000000e-01, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (12, 'LINTOP', 1, 4.0000000000000000e+00, 4.0000000000000000e+00, 1.0000000000000000e+00, 1, 'true');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (13, 'lintop2', 1, 4.0000000000000000e+00, 1.0000000000000000e+00, 2.5000000000000000e-01, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (14, 'hej', 0, 0.0000000000000000e+00, 0.0000000000000000e+00, 0.0000000000000000e+00, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (15, 'Sara', 0, 0.0000000000000000e+00, 0.0000000000000000e+00, 0.0000000000000000e+00, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (16, 'LÃ¥dvinsViktor', 1, 4.0000000000000000e+00, 0.0000000000000000e+00, 0.0000000000000000e+00, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (17, 'Tove', 1, 4.0000000000000000e+00, 2.0000000000000000e+00, 5.0000000000000000e-01, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (18, 'Lillamy', 1, 4.0000000000000000e+00, 1.0000000000000000e+00, 2.5000000000000000e-01, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (19, 'Ingalill', 1, 4.0000000000000000e+00, 1.0000000000000000e+00, 2.5000000000000000e-01, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (20, 'steffe rfe', 1, 4.0000000000000000e+00, 0.0000000000000000e+00, 0.0000000000000000e+00, 0, 'false');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (21, 'dagny', 1, 4.0000000000000000e+00, 2.0000000000000000e+00, 5.0000000000000000e-01, 1, 'true');
INSERT INTO public."user_results"("userResultsId", "username", "playedGames", "numWinesGuessed", "numWinesCorrect", "correctPercent", "wins", "isBacchus")VALUES (22, 'JUKKA', 1, 4.0000000000000000e+00, 0.0000000000000000e+00, 0.0000000000000000e+00, 0, 'false');

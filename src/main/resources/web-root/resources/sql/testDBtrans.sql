SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `wineguesser`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `club`
--

CREATE TABLE `club` (
                        `clubId` int(11) NOT NULL,
                        `clubName` varchar(255) NOT NULL,
                        `clubPassword` varchar(255) NOT NULL,
                        `numberOfTastings` int(11) NOT NULL DEFAULT '0',
                        `numWinesCorrect` double NOT NULL DEFAULT '0',
                        `numWinesGuessed` double NOT NULL DEFAULT '0',
                        `averageWineCorrect` double NOT NULL DEFAULT '0',
                        `clubCreator` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `club`
--

INSERT INTO `club` (`clubId`, `clubName`, `clubPassword`, `numberOfTastings`, `numWinesCorrect`, `numWinesGuessed`, `averageWineCorrect`, `clubCreator`) VALUES
(1, 'KlubbToppar', '53q8p0127', 1, 6, 8, 0.75, 'Felix'),
(2, 'TestKlubben', '123', 10, 32, 86, 0.37, 'TestFelix1'),
(3, 'RiojaKlubben', 'tvåord', 1, 9, 44, 0.2, 'Felix');

-- --------------------------------------------------------

--
-- Tabellstruktur `club_member`
--

CREATE TABLE `club_member` (
                               `clubMemberId` int(11) NOT NULL,
                               `clubId` int(11) NOT NULL,
                               `username` varchar(255) NOT NULL,
                               `isBacchus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `club_member`
--

INSERT INTO `club_member` (`clubMemberId`, `clubId`, `username`, `isBacchus`) VALUES
(1, 1, 'Felix', 'true'),
(2, 1, 'Linnea', 'false'),
(3, 1, 'Vinberra', 'true'),
(4, 1, 'Carina', 'true'),
(5, 2, 'TestFelix1', 'false'),
(6, 2, 'TestFelix2', 'true'),
(7, 2, 'TestFelix3', 'false'),
(8, 2, 'As', 'false'),
(9, 2, 'cartop1', 'false'),
(10, 2, 'cartop2', 'false'),
(11, 2, 'Vinproffset', 'false'),
(12, 2, 'LINTOP', 'false'),
(13, 2, 'lintop2', 'false'),
(14, 3, 'Felix', 'false'),
(15, 3, 'Linnea', 'false'),
(16, 3, 'LådvinsViktor', 'false'),
(17, 3, 'Tove', 'false'),
(18, 3, 'Lillamy', 'false'),
(19, 3, 'Carina', 'false'),
(20, 3, 'Ingalill', 'false'),
(21, 3, 'steffe rfe', 'false'),
(22, 3, 'Vinberra', 'false'),
(23, 3, 'dagny', 'true'),
(24, 3, 'JUKKA', 'false');

-- --------------------------------------------------------

--
-- Tabellstruktur `club_wine_stat`
--

CREATE TABLE `club_wine_stat` (
                                  `clubWineStatId` int(11) NOT NULL,
                                  `clubId` int(11) NOT NULL,
                                  `wineName` varchar(255) NOT NULL,
                                  `wineUrl` varchar(8000) NOT NULL,
                                  `numberOfServings` int(11) NOT NULL,
                                  `averageGrade` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `club_wine_stat`
--

INSERT INTO `club_wine_stat` (`clubWineStatId`, `clubId`, `wineName`, `wineUrl`, `numberOfServings`, `averageGrade`) VALUES
(1, 1, 'Penfolds Koonunga Hill', 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 1, 2.8),
(2, 1, 'Marques De Arienzo', 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 1, 3.8),
(3, 2, 'Villa Righetti', 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 3.15),
(4, 2, 'Ecoltura', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 10, 3.06),
(5, 2, 'First Edition', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 5, 3.22),
(6, 2, 'La Rioja Alta', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 8, 3.41),
(7, 2, 'Apothic Red', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 6, 3.33),
(8, 2, 'Barbera Del Monferrato', 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 1, 5),
(9, 3, 'Diemersfontein', 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 1, 3.2),
(10, 3, 'Montelciego', 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 1, 3),
(11, 3, 'Governo', 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 1, 3.5),
(12, 3, 'Baron De Ley', 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 1, 3.3);

-- --------------------------------------------------------

--
-- Tabellstruktur `game_point`
--

CREATE TABLE `game_point` (
                              `gamePointId` int(11) NOT NULL,
                              `gameResultId` int(11) NOT NULL,
                              `username` varchar(255) NOT NULL,
                              `points` int(11) NOT NULL,
                              `pointsNoRegion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `game_point`
--

INSERT INTO `game_point` (`gamePointId`, `gameResultId`, `username`, `points`, `pointsNoRegion`) VALUES
(1, 1, 'Carina', 3, 2),
(2, 1, 'Felix', 3, 2),
(3, 1, 'Linnea', 1, 0),
(4, 1, 'Vinberra', 3, 2),
(5, 2, 'As', 2, 1),
(6, 2, 'cartop1', 2, 1),
(7, 2, 'cartop2', 2, 2),
(8, 2, 'LINTOP', 5, 4),
(9, 2, 'lintop2', 1, 1),
(10, 2, 'TestFelix1', 0, 0),
(11, 2, 'TestFelix2', 0, 0),
(12, 2, 'TestFelix3', 1, 0),
(13, 2, 'Vinproffset', 3, 2),
(14, 3, 'TestFelix1', 2, 2),
(15, 3, 'TestFelix2', 1, 0),
(16, 4, 'TestFelix1', 2, 2),
(17, 5, 'TestFelix1', 3, 2),
(18, 5, 'TestFelix2', 2, 2),
(19, 7, 'TestFelix1', 4, 4),
(20, 7, 'TestFelix2', 0, 0),
(21, 8, 'TestFelix1', 1, 0),
(22, 8, 'TestFelix2', 1, 0),
(23, 9, 'TestFelix1', 2, 2),
(24, 9, 'TestFelix2', 2, 2),
(25, 10, 'TestFelix1', 1, 0),
(26, 11, 'TestFelix1', 3, 2),
(27, 11, 'TestFelix2', 1, 1),
(28, 12, 'Carina', 1, 0),
(29, 12, 'dagny', 4, 2),
(30, 12, 'Felix', 3, 2),
(31, 12, 'Ingalill', 3, 1),
(32, 12, 'JUKKA', 1, 0),
(33, 12, 'Lillamy', 3, 1),
(34, 12, 'Linnea', 1, 0),
(35, 12, 'LådvinsViktor', 1, 0),
(36, 12, 'steffe rfe', 1, 0),
(37, 12, 'Tove', 3, 2),
(38, 12, 'Vinberra', 2, 1),
(39, 13, 'TestFelix1', 0, 0),
(40, 14, 'TestFelix1', 1, 0),
(41, 14, 'TestFelix2', 2, 2),
(42, 15, 'TestFelix1', 1, 1),
(43, 16, 'TestFelix1', 3, 2),
(44, 17, 'TestFelix1', 3, 2),
(45, 16, 'TestFelix2', 3, 2),
(46, 17, 'TestFelix2', 3, 2),
(47, 18, 'TestFelix1', 2, 2),
(48, 19, 'TestFelix1', 2, 2),
(49, 18, 'TestFelix2', 0, 0),
(50, 20, 'TestFelix3', 0, 0),
(51, 21, 'TestFelix3', 0, 0),
(52, 22, 'TestFelix3', 2, 2),
(53, 23, 'TestFelix3', 2, 2),
(54, 24, 'TestFelix3', 3, 2),
(55, 25, 'TestFelix3', 0, 0),
(56, 26, 'TestFelix3', 0, 0),
(57, 27, 'TestFelix3', 1, 0),
(58, 28, 'TestFelix3', 1, 0),
(59, 29, 'TestFelix3', 2, 2),
(60, 30, 'TestFelix3', 2, 2);

-- --------------------------------------------------------

--
-- Tabellstruktur `game_result`
--

CREATE TABLE `game_result` (
                               `gameResultId` int(11) NOT NULL,
                               `gameId` varchar(255) NOT NULL,
                               `url` varchar(8000) NOT NULL,
                               `comment` varchar(8000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `game_result`
--

INSERT INTO `game_result` (`gameResultId`, `gameId`, `url`, `comment`) VALUES
(1, '502437', 'https://wineguesser.herokuapp.com/gameResults/502437', 'Valborg.\r\nMat: Grillad kycklingfile med mangosalsa och vitlöksbröd, tapas snacks och gurka.\r\n\r\nNärvarande: Hela KlubbToppar.\r\n\r\nPlats: Hemma.'),
(2, '365249', 'https://wineguesser.herokuapp.com/gameResults/365249', 'How did I escape Iraq?\r\n\r\nIran.'),
(3, '939654', 'https://wineguesser.herokuapp.com/gameResults/939654', 'qaasdads'),
(4, '481712', 'https://wineguesser.herokuapp.com/gameResults/481712', 'sadasd'),
(5, '378335', 'https://wineguesser.herokuapp.com/gameResults/378335', 'gggd'),
(7, '598039', 'https://wineguesser.herokuapp.com/gameResults/598039', 'asdasdda'),
(8, '940586', 'https://wineguesser.herokuapp.com/gameResults/940586', 'asadad'),
(9, '769978', 'https://wineguesser.herokuapp.com/gameResults/769978', 'asdasda'),
(10, '466144', 'https://wineguesser.herokuapp.com/gameResults/466144', 'asda'),
(11, '178198', 'https://wineguesser.herokuapp.com/gameResults/178198', 'asdasd'),
(12, '200434', 'https://wineguesser.herokuapp.com/gameResults/200434', 'Första digitala provningen.\r\n\r\nMat: Marinerad fläskfile med potatisgratäng, rabbarberpaj.\r\n\r\nPlats: Täby, Toppars\r\n\r\nNärvarande: Felix, Linnea, Carina, Bernt, Tove, Hanna, Stefan, Ingalill, Viktor, Sara, Jukka.'),
(13, '487431', 'https://wineguesser.herokuapp.com/gameResults/487431', 'första test efter paus i utveckling'),
(14, '292396', 'https://wineguesser.herokuapp.com/gameResults/292396', NULL),
(15, '236610', 'https://wineguesser.herokuapp.com/gameResults/236610', NULL),
(16, '737931', 'https://wineguesser.herokuapp.com/gameResults/737931', 'Testar deadlock'),
(18, '522373', 'https://wineguesser.herokuapp.com/gameResults/522373', NULL),
(20, '855185', 'https://wineguesser.herokuapp.com/gameResults/855185', NULL),
(22, '867264', 'https://wineguesser.herokuapp.com/gameResults/867264', NULL),
(23, '867264', 'https://wineguesser.herokuapp.com/gameResults/867264', NULL),
(24, '643737', 'https://wineguesser.herokuapp.com/gameResults/643737', NULL),
(25, '155360', 'https://wineguesser.herokuapp.com/gameResults/155360', NULL),
(28, '247136', 'https://wineguesser.herokuapp.com/gameResults/247136', NULL),
(29, '167419', 'https://wineguesser.herokuapp.com/gameResults/167419', NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur `game_settings`
--

CREATE TABLE `game_settings` (
                                 `gameSettingsId` bigint(20) NOT NULL,
                                 `gameHost` varchar(255) NOT NULL,
                                 `gameId` varchar(255) NOT NULL,
                                 `qrCode` varchar(8000) NOT NULL,
                                 `url` varchar(8000) NOT NULL,
                                 `imgSource` varchar(8000) NOT NULL,
                                 `wineName` varchar(255) NOT NULL,
                                 `region` varchar(8000) DEFAULT NULL,
                                 `description` varchar(8000) NOT NULL,
                                 `servingOrder` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `game_settings`
--

INSERT INTO `game_settings` (`gameSettingsId`, `gameHost`, `gameId`, `qrCode`, `url`, `imgSource`, `wineName`, `region`, `description`, `servingOrder`) VALUES
(52, 'Felix', '200434', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABK0lEQVR4Xu2VQYoFMQhEhVxL8OqC1xIyVXb4/MnMThcz8KUhydtoyjIt+5eQGzA+8Iq/CVNELHbajtqOQNupy0XUuJ2BiqOvVEBup6CuiO1YB6ExTcSVvQEpSKFbpQZEt/TEt2424BNpruvs+xCJkKDsAKljBkKLOKYtjw3AzcPy6pnbKb4JE6OVstg2R/+GoNCz4Vwq0wC0XNv1DBhuMAE5UkKloQc1HoBsGXQ21A1+BOlCSFEG4yVeiXoQjduPs+JxxARUGAEvFSXmDUagUYeS4s1gXQhrCb1Vo3uK70FGonKOVr4/Vg2YbJtV/7TyTECjJvzYvTyJmlD5k8pFWeRV/AAUZHA8AhBlDCon1vlTPYI0odG3wQUDNgTPuDpyVe0D8Gd84BX/BX4BGe/eKdCOb/gAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', NULL, 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', '3'),
(53, 'Felix', '200434', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2V0YrEMAhFBX8r4K8L+S0he69NOzPdfVp9mIGRkqQnEO3VWFl/mNwB7Qtv9p4wRGToCluTS2uBxgdEYxzLBjhkDHNRcCz7oM65HHMnFNBohFSBcmB4CFKETNy212z+H6Yh9KFux0sdhmQVHOVwCVKD1ABp44jNLUgRhjruAefAdeCqDrGYbg45Jj/g9F6DDBr1hZrl7nZUg4h35tVaHEkboEFbh7xA8WgsNaiuCH9I5m+ewdeg8XxkDzSFboDEcCRZr1cx1GBk80ORBfugtUAezndwbDRB1yxbypJ564CLvoKe7CqGIuT5Nn1Hf2azCI11i9xB4eiC/Iug+eHCbkV6IK8BXWQCu6Dlf0/zUzqgLTYrTkcT7IBQAbEHG78/Z7MAf9sX3uxT4A/Fiwe0w3oTUgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Rioja', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', '2'),
(54, 'Felix', '200434', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2VwQrDQAhEBX9rwV9f8LcW7IxJCk172zm0UA/FfQm4HUdj9SHsDhh/eIvvhMvMIlfMmIOpBEatEdMzO9XAYWOw1gymMog6xUwJkWamEAa4Z2VNkKWB6NY446WbG5CxnLXyOAjg8gQLWMGgB8UWwAHLDodng89DAQtH6oAG+rSz0DZk2/Coph1GE8AkWHZcHqkAIkuOP3Sp1kMAKTMieE7Uk8DknQcFZlYKSMPCWPQEXtBA9Mxx56Qb4hrYTYgZ4JaGKlT5atwe5PVRi/bK9oUAQomJUXV2rfefAHap4BDAENREAHsBHrA1kcDoOk4x8MJZaBPyK8IVyAlz/hUNxKXhCGzV5+X3IZbU7B+/TLsJIUgX4EZ9Ttwm7MZBkRZYA9/jD2/xK/ABiqv4LagboWUAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Rioja', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', '4'),
(55, 'Felix', '200434', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKklEQVR4Xu2VQW5DMQhEkbgWEle3xLWQ3Bl+fps62cGilUISf/tlMQ4MRPabkBMwPvCIvwlTRDzNfEdtR6BvoiXm3M5AwxGHBKztEMRb96rnGPSAUsSh3oC4uenSyDNLDYhq2SN+VbMBK5Ymc3JFH0LIRCOWcI0Z6Bt2vUxbHhuBF1r8+H35HkTZvJb0RVeMwMtYCs9qlNIA5K1pWhTP+CsGYAqO+EYD+ciHUBeiCVg62BVWuM3QgzQsXshF6r6FmpB1A2VW1tNk6MJkn5bN7sJ1IZ9Yo0r41FwdCAdgsuiinkFxAJZMpbfwCEwOQMhgsljpTEDf1QSsXVaWB2ClI/gfJT/TewLmd3+NQTYtPEs8Ar38gKZNpnoGsnAOOfHr7gPwNT7wiP8CvwD7JedNAFUfkQAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', NULL, 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', '1'),
(62, 'hej', '655309', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwYrEQAhEBX9L6F8X+reEnio7M8lk9zR62IWRBMzLQVNWG1m/hNwB4wtv8TdhiMhYrqFhmXbAgcuHm41MW6CJ4cEIM22CeEbf7L4RKrqesw8OXp7NZ9oB0bYd8TbNAswI3XdGHSJ3nVADRTavw7Wc+tJjmBxpHYaoY14gkHochcpQNgmYtguOie7dcGKdbzogvJXOUle47GmGGkTHLiQYIN+2QGRzwQvQQ1OSDjiDBnPa6yxUhGvyuOriEngKUoTwl9hWZGalBsgjIHt4lKMHkqMSF+vLDDXIYMsod10CJRhcgPkBsj3bAdG8KYZmFIUlGyD/IsE9wDU9j0INkL7FwT3N0AGXk+IjroU+hykIVitSyHxV6XOYgwueK5QbR6Ea/BlfeIv/Ah+IPuVtv4VrrAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Rioja', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(63, 'hej', '655309', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwYrEQAhEBX9L6F8X+reEnio7M8lk9zR62IWRBMzLQVNWG1m/hNwB4wtv8TdhiMhYrqFhmXbAgcuHm41MW6CJ4cEIM22CeEbf7L4RKrqesw8OXp7NZ9oB0bYd8TbNAswI3XdGHSJ3nVADRTavw7Wc+tJjmBxpHYaoY14gkHochcpQNgmYtguOie7dcGKdbzogvJXOUle47GmGGkTHLiQYIN+2QGRzwQvQQ1OSDjiDBnPa6yxUhGvyuOriEngKUoTwl9hWZGalBsgjIHt4lKMHkqMSF+vLDDXIYMsod10CJRhcgPkBsj3bAdG8KYZmFIUlGyD/IsE9wDU9j0INkL7FwT3N0AGXk+IjroU+hykIVitSyHxV6XOYgwueK5QbR6Ea/BlfeIv/Ah+IPuVtv4VrrAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Rioja', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(76, 'TestFelix1', '522373', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKklEQVR4Xu2U0apCUQhEN/hbgr8u+FvCbsbTKTr1pg8F+XDzLoLZjaNrf6h1Baw/vNR3wlxrWey0HdWOQNup4mupsZ2Bin9dUgHZTkGViO34HISUsIiLegPSEPT+5lIDYlp6r5dpNuBRCRm5930IIQhUHGB1jMCSEToRVLMJmJKUMafRxq/04XbBVlVowc/Hd6GWE8isRCn1IbY1KmK1YPgFAxBLxcMSLvCDHg9ATsxrqTaicCakCemxcnRHJEbg4g3gs8OfR6AJjVfF9YjDKdSEyAKRMRZnwPqwEgZDuLo2AVlYMDhReAQmDyBaJqJ0JqCVz/jL6dGXAaiMV+IA4g4+Hj8AqeHcXJ+DEHBEgngElhVYMCyXPwLWhBwchXhe+PYB+F5/eKlfgTcSDcFVSxz0rAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', NULL, 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '1'),
(77, 'TestFelix1', '522373', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VwWrDQAxEBfotgX5dsL+1sJ3Rum1wesrOIYUIm6zfwVJGI9nWH2F3wPjAW7wnnGYWiFyDx5TAxFXm02fwKIGBPJZjIBGOQhi+qn91MCshhw5ShelFkX8FOYRX4xhP3XwRdswIH8jVcQ4nfIAUrN3njyBncA3E3KaNvAQ5hbWVCNh24VJA2h9a0LSreyeA7JxXODx76XwOWW/RtJgETMOV/QyyfHPUXs6cGliWMyju2qIIIEQuCGL0GP+CAvL91WsltzoCiA1wzUFwv0ggMXJhtWBo6S8FrM6zesP0QQD7mWVXPjjkCPL96BfKZvXf3TyESZ0xX8jVfVNAfkU4B7DYVkQDOf7M0XtQBZPjwAmjGwQwwZNfPt4PIp9AqIDqqTQmVwOf4wNv8V/gFyVT80HvjK/yAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', NULL, 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '2'),
(94, 'TestFelix3', '167419', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2V3QrDMAiFhbxWwFcX8lpCdo7pz9btanqxQWW06VeY5nhMZX4IuQLGDS/xm9BFpLfpOgeXWgKVP5DmfS0LYJfe1aSBY1kH2xjTcK+EAuqFkCpADmpyCpKEbNwWr938HkZAjzlM10MeuoQLwGGHQ5AkRNdsM23XXZA0ZNW4QWhqXQFhV4Npu1KUPVESonb6C7gtnQugMg1Ga/JKWgA5BgZ5gfxwXRo2V6ajzcZWfBJiDNSRCjmMQhdAdCs2EH7dzZCEKDxOFE4td1ABUb0iEy1GZWogvNXihaxzpQJO5kLhkPgwQxLy/2O2pqH6o5s5iLLhAX5R4IkiiJap4XRB787TOw/pAqZw6lIF42PaW2ylAir5OlHPiUtCibmCbV3tuZsJ+B43vMS/wAfV8Olp24xZbgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', NULL, 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '2'),
(95, 'TestFelix3', '167419', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNklEQVR4Xu2VwWoEQQhEBX+rwV8X/C2hU2VPZtlJbnpIYGVhet4eWqpKR/YvJU/A+sBH/U2YImKR5uaLxxFoO5e5aNRxBi5Zi3e58TgGzXXzNAlxjIhBaOAaQZHtTaUGhFvrqjc3G5CVijDAuVN9mBpk0EOgB8Xuw11AoYfxfxuBeIEOCTkU0b0u6sHUDdM2IuZygjYAYZfCvtO8n+abcPPpDG7s0mMAonmkNY3vMM9GYPmWFBhPhmwAIldgyeYxtiOw2ocWVNv2d8B6EBvAlXokVb7dbEFWhdWhTLnYhxh/jCnSCtdq/w1AFmxb3H+lyQCsBcjN56uCOwINv8AkcLruTduE9RUJ6sLJvS7qw4UPCtIgr+b70PiNgnlM2gg0cmSBKbsnrglpHHbfEXgG/qwPfNR/gV9VE/yhYdt/2wAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Kalifornien', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '1');

-- --------------------------------------------------------

--
-- Tabellstruktur `game_setup`
--

CREATE TABLE `game_setup` (
                              `gameHost` varchar(255) NOT NULL,
                              `amountOfWines` varchar(255) NOT NULL,
                              `gameId` varchar(255) NOT NULL,
                              `clubName` varchar(255) DEFAULT NULL,
                              `comment` varchar(8000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `game_setup`
--

INSERT INTO `game_setup` (`gameHost`, `amountOfWines`, `gameId`, `clubName`, `comment`) VALUES
('TestFelix3', '2', '167419', NULL, NULL),
('Felix', '2', '367782', NULL, NULL),
('hej', '2', '655309', NULL, 'hej');

-- --------------------------------------------------------

--
-- Tabellstruktur `judgement`
--

CREATE TABLE `judgement` (
                             `judgementId` int(11) NOT NULL,
                             `username` varchar(255) NOT NULL,
                             `servingOrder` int(11) NOT NULL,
                             `personalGrade` int(11) NOT NULL,
                             `gameId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `judgement`
--

INSERT INTO `judgement` (`judgementId`, `username`, `servingOrder`, `personalGrade`, `gameId`) VALUES
(41, 'TestFelix3', 1, 2, '167419'),
(42, 'TestFelix3', 2, 4, '167419');

-- --------------------------------------------------------

--
-- Tabellstruktur `lobby`
--

CREATE TABLE `lobby` (
                         `lobbyId` bigint(20) NOT NULL,
                         `gameId` varchar(255) NOT NULL,
                         `gameStart` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `lobby`
--

INSERT INTO `lobby` (`lobbyId`, `gameId`, `gameStart`) VALUES
(1, '502437', 'finished'),
(2, '365249', 'finished'),
(3, '140282', 'canceled'),
(4, '939654', 'finished'),
(5, '481712', 'finished'),
(6, '378335', 'finished'),
(7, '238238', 'canceled'),
(8, '454591', 'canceled'),
(9, '225752', 'finished'),
(10, '618728', 'canceled'),
(11, '598039', 'finished'),
(12, '180233', 'canceled'),
(13, '940586', 'finished'),
(14, '769978', 'finished'),
(15, '466144', 'finished'),
(16, '178198', 'finished'),
(17, '200434', 'finished'),
(18, '655309', 'started'),
(19, '487431', 'finished'),
(20, '292396', 'finished'),
(21, '236610', 'finished'),
(22, '737931', 'finished'),
(23, '522373', 'finished'),
(24, '855185', 'finished'),
(25, '867264', 'finished'),
(26, '643737', 'finished'),
(27, '155360', 'finished'),
(28, '558125', 'finished'),
(29, '289275', 'finished'),
(30, '203847', 'finished'),
(31, '247136', 'finished'),
(32, '167419', 'finished');

-- --------------------------------------------------------

--
-- Tabellstruktur `lobby_data`
--

CREATE TABLE `lobby_data` (
                              `lobbyId` bigint(20) NOT NULL,
                              `gameHost` varchar(255) DEFAULT NULL,
                              `gameId` varchar(255) NOT NULL,
                              `participants` varchar(255) NOT NULL,
                              `score` int(11) DEFAULT '0',
                              `ready` int(11) DEFAULT '0',
                              `done` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `lobby_data`
--

INSERT INTO `lobby_data` (`lobbyId`, `gameHost`, `gameId`, `participants`, `score`, `ready`, `done`) VALUES
(32, 'TestFelix3', '167419', 'TestFelix3', 0, 0, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `lobby_history`
--

CREATE TABLE `lobby_history` (
                                 `lobbyId` bigint(20) NOT NULL,
                                 `gameHost` varchar(255) DEFAULT NULL,
                                 `gameId` varchar(255) NOT NULL,
                                 `participants` varchar(255) NOT NULL,
                                 `score` int(11) DEFAULT '0',
                                 `ready` int(11) DEFAULT '0',
                                 `done` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `lobby_history`
--

INSERT INTO `lobby_history` (`lobbyId`, `gameHost`, `gameId`, `participants`, `score`, `ready`, `done`) VALUES
(3, NULL, '140282', 'cartop1', 0, 1, 0),
(12, 'Felix', '180233', 'Felix', 0, 0, 0),
(18, 'hej', '655309', 'hej', 0, 0, 0),
(10, 'TestFelix1', '618728', 'TestFelix1', 0, 0, 0),
(22, NULL, '737931', 'TestFelix2', 0, 0, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `match_history`
--

CREATE TABLE `match_history` (
                                 `matchHistoryId` int(11) NOT NULL,
                                 `userResultsId` int(11) NOT NULL,
                                 `datePlayed` varchar(255) NOT NULL,
                                 `url` varchar(255) NOT NULL,
                                 `gameId` varchar(255) NOT NULL,
                                 `clubName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `match_history`
--

INSERT INTO `match_history` (`matchHistoryId`, `userResultsId`, `datePlayed`, `url`, `gameId`, `clubName`) VALUES
(1, 2, '2019-04-30', 'https://wineguesser.herokuapp.com/gameResults/502437', '502437', 'KlubbToppar'),
(2, 1, '2019-04-30', 'https://wineguesser.herokuapp.com/gameResults/502437', '502437', 'KlubbToppar'),
(3, 3, '2019-04-30', 'https://wineguesser.herokuapp.com/gameResults/502437', '502437', 'KlubbToppar'),
(4, 4, '2019-04-30', 'https://wineguesser.herokuapp.com/gameResults/502437', '502437', 'KlubbToppar'),
(5, 8, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(6, 10, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(7, 11, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(8, 12, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(9, 13, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(10, 5, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(11, 6, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(12, 7, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(13, 9, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/365249', '365249', 'TestKlubben'),
(14, 5, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/939654', '939654', 'TestKlubben'),
(15, 6, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/939654', '939654', 'TestKlubben'),
(16, 5, '2019-05-01', 'https://wineguesser.herokuapp.com/gameResults/481712', '481712', 'TestKlubben'),
(17, 5, '2019-05-02', 'https://wineguesser.herokuapp.com/gameResults/378335', '378335', 'TestKlubben'),
(18, 6, '2019-05-02', 'https://wineguesser.herokuapp.com/gameResults/378335', '378335', 'TestKlubben'),
(19, 5, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/225752', '225752', 'TestKlubben'),
(20, 5, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/598039', '598039', 'TestKlubben'),
(21, 6, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/598039', '598039', 'TestKlubben'),
(22, 5, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/940586', '940586', 'TestKlubben'),
(23, 6, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/940586', '940586', 'TestKlubben'),
(24, 5, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/769978', '769978', 'TestKlubben'),
(25, 6, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/769978', '769978', 'TestKlubben'),
(26, 5, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/466144', '466144', 'TestKlubben'),
(27, 5, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/178198', '178198', 'TestKlubben'),
(28, 6, '2019-05-03', 'https://wineguesser.herokuapp.com/gameResults/178198', '178198', 'TestKlubben'),
(29, 2, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(30, 21, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(31, 1, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(32, 19, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(33, 22, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(34, 18, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(35, 3, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(36, 16, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(37, 20, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(38, 17, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(39, 4, '2019-05-04', 'https://wineguesser.herokuapp.com/gameResults/200434', '200434', 'RiojaKlubben'),
(40, 5, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/487431', '487431', NULL),
(41, 5, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/292396', '292396', 'TestKlubben'),
(42, 6, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/292396', '292396', 'TestKlubben'),
(43, 5, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/236610', '236610', NULL),
(44, 5, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/737931', '737931', 'TestKlubben'),
(45, 5, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/737931', '737931', 'TestKlubben'),
(46, 6, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/737931', '737931', 'TestKlubben'),
(47, 6, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/737931', '737931', 'TestKlubben'),
(48, 5, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/522373', '522373', NULL),
(49, 5, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/522373', '522373', NULL),
(50, 6, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/522373', '522373', NULL),
(51, 6, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/522373', '522373', NULL),
(52, 7, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/855185', '855185', NULL),
(53, 7, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/855185', '855185', NULL),
(54, 7, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/867264', '867264', 'TestKlubben'),
(55, 7, '2019-09-13', 'https://wineguesser.herokuapp.com/gameResults/867264', '867264', 'TestKlubben'),
(56, 7, '2019-09-14', 'https://wineguesser.herokuapp.com/gameResults/643737', '643737', NULL),
(57, 7, '2019-09-14', 'https://wineguesser.herokuapp.com/gameResults/155360', '155360', NULL),
(58, 7, '2019-09-14', 'https://wineguesser.herokuapp.com/gameResults/155360', '155360', NULL),
(59, 7, '2019-09-14', 'https://wineguesser.herokuapp.com/gameResults/247136', '247136', NULL),
(60, 7, '2019-09-14', 'https://wineguesser.herokuapp.com/gameResults/247136', '247136', NULL),
(61, 7, '2019-09-14', 'https://wineguesser.herokuapp.com/gameResults/167419', '167419', NULL),
(62, 7, '2019-09-14', 'https://wineguesser.herokuapp.com/gameResults/167419', '167419', NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur `result_data`
--

CREATE TABLE `result_data` (
                               `resultDataId` int(11) NOT NULL,
                               `gameResultId` int(11) NOT NULL,
                               `username` varchar(255) NOT NULL,
                               `servingOrder` int(11) NOT NULL,
                               `winePicture` varchar(8000) NOT NULL,
                               `wineName` varchar(255) NOT NULL,
                               `wineDescription` varchar(8000) NOT NULL,
                               `grade` int(11) NOT NULL,
                               `url` varchar(8000) NOT NULL,
                               `personalGrade` int(11) NOT NULL,
                               `averageGrade` double NOT NULL,
                               `region` varchar(255) DEFAULT NULL,
                               `correctRegionGuess` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `result_data`
--

INSERT INTO `result_data` (`resultDataId`, `gameResultId`, `username`, `servingOrder`, `winePicture`, `wineName`, `wineDescription`, `grade`, `url`, `personalGrade`, `averageGrade`, `region`, `correctRegionGuess`) VALUES
(1, 1, 'Carina', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/hhzjq2ymt4r5us2un7y9/256950.jpg', 'Penfolds Koonunga Hill', 'Smak: Mycket fruktig smak med fatkaraktär, inslag av svarta vinbär, plommon, kaffe, mynta, vanilj och mörk choklad. \n\nDoft: Mycket fruktig doft med fatkaraktär, inslag av svarta vinbär, plommon, eukalyptus, kaffe, vanilj och mörk choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 4, 2.8, NULL, 'fel.'),
(2, 1, 'Felix', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/hhzjq2ymt4r5us2un7y9/256950.jpg', 'Penfolds Koonunga Hill', 'Smak: Mycket fruktig smak med fatkaraktär, inslag av svarta vinbär, plommon, kaffe, mynta, vanilj och mörk choklad. \n\nDoft: Mycket fruktig doft med fatkaraktär, inslag av svarta vinbär, plommon, eukalyptus, kaffe, vanilj och mörk choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 2, 2.8, NULL, 'fel.'),
(3, 1, 'Linnea', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/hhzjq2ymt4r5us2un7y9/256950.jpg', 'Penfolds Koonunga Hill', 'Smak: Mycket fruktig smak med fatkaraktär, inslag av svarta vinbär, plommon, kaffe, mynta, vanilj och mörk choklad. \n\nDoft: Mycket fruktig doft med fatkaraktär, inslag av svarta vinbär, plommon, eukalyptus, kaffe, vanilj och mörk choklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 2, 2.8, NULL, 'fel.'),
(4, 1, 'Vinberra', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/hhzjq2ymt4r5us2un7y9/256950.jpg', 'Penfolds Koonunga Hill', 'Smak: Mycket fruktig smak med fatkaraktär, inslag av svarta vinbär, plommon, kaffe, mynta, vanilj och mörk choklad. \n\nDoft: Mycket fruktig doft med fatkaraktär, inslag av svarta vinbär, plommon, eukalyptus, kaffe, vanilj och mörk choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 3, 2.8, NULL, 'fel.'),
(5, 1, 'Carina', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/gbqjz1kivfkg7qvm0gss/2006.jpg', 'Marques De Arienzo', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe.', 2, 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 5, 3.8, 'Rioja', 'rätt.'),
(6, 1, 'Felix', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/gbqjz1kivfkg7qvm0gss/2006.jpg', 'Marques De Arienzo', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe.', 2, 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 3, 3.8, 'Rioja', 'rätt.'),
(7, 1, 'Linnea', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/gbqjz1kivfkg7qvm0gss/2006.jpg', 'Marques De Arienzo', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe.', 1, 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 3, 3.8, 'Rioja', 'rätt.'),
(8, 1, 'Vinberra', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/gbqjz1kivfkg7qvm0gss/2006.jpg', 'Marques De Arienzo', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe.', 2, 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 4, 3.8, 'Rioja', 'rätt.'),
(9, 2, 'As', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 2.8, NULL, 'fel.'),
(10, 2, 'cartop1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 3, 2.8, NULL, 'fel.'),
(11, 2, 'cartop2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 2.8, NULL, 'fel.'),
(12, 2, 'LINTOP', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 2.8, NULL, 'fel.'),
(13, 2, 'lintop2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 3, 2.8, NULL, 'fel.'),
(14, 2, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 2, 2.8, NULL, 'fel.'),
(15, 2, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 3, 2.8, NULL, 'fel.'),
(16, 2, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 2.8, NULL, 'fel.'),
(17, 2, 'Vinproffset', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 2.8, NULL, 'fel.'),
(18, 2, 'As', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 3.1, NULL, 'fel.'),
(19, 2, 'cartop1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.1, NULL, 'fel.'),
(20, 2, 'cartop2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 3.1, NULL, 'fel.'),
(21, 2, 'LINTOP', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 3.1, NULL, 'fel.'),
(22, 2, 'lintop2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 1, 3.1, NULL, 'fel.'),
(23, 2, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.1, NULL, 'fel.'),
(24, 2, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.1, NULL, 'fel.'),
(25, 2, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 3.1, NULL, 'fel.'),
(26, 2, 'Vinproffset', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 3.1, NULL, 'fel.'),
(27, 2, 'As', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 4, 2.6, NULL, 'fel.'),
(28, 2, 'cartop1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 3, 2.6, NULL, 'fel.'),
(29, 2, 'cartop2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 4, 2.6, NULL, 'fel.'),
(30, 2, 'LINTOP', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 1, 2.6, NULL, 'fel.'),
(31, 2, 'lintop2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.6, NULL, 'fel.'),
(32, 2, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 3, 2.6, NULL, 'fel.'),
(33, 2, 'TestFelix2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.6, NULL, 'fel.'),
(34, 2, 'TestFelix3', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.6, NULL, 'fel.'),
(35, 2, 'Vinproffset', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.6, NULL, 'fel.'),
(36, 2, 'As', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.8, 'Rioja', 'rätt.'),
(37, 2, 'cartop1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.8, 'Rioja', 'rätt.'),
(38, 2, 'cartop2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.8, 'Rioja', 'fel.'),
(39, 2, 'LINTOP', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 2, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.8, 'Rioja', 'rätt.'),
(40, 2, 'lintop2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 4, 2.8, 'Rioja', 'fel.'),
(41, 2, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.8, 'Rioja', 'fel.'),
(42, 2, 'TestFelix2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 5, 2.8, 'Rioja', 'fel.'),
(43, 2, 'TestFelix3', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.8, 'Rioja', 'rätt.'),
(44, 2, 'Vinproffset', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 2, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 1, 2.8, 'Rioja', 'rätt.'),
(45, 3, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.5, 'Rioja', 'fel.'),
(46, 3, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.5, 'Rioja', 'rätt.'),
(47, 3, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 3, NULL, 'fel.'),
(48, 3, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3, NULL, 'fel.'),
(49, 4, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 5, 5, NULL, 'fel.'),
(50, 4, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5, NULL, 'fel.'),
(51, 4, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/wdm19xz2zlct8rpxzdkw/1005524.jpg', 'Barbera Del Monferrato', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', 0, 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 5, 5, NULL, 'fel.'),
(52, 4, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 5, 5, 'Rioja', 'fel.'),
(53, 5, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 4, 3, NULL, 'fel.'),
(54, 5, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 3, NULL, 'fel.'),
(55, 5, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 2.5, NULL, 'fel.'),
(56, 5, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 2.5, NULL, 'fel.'),
(57, 5, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 3, 4, NULL, 'fel.'),
(58, 5, 'TestFelix2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 5, 4, NULL, 'fel.'),
(59, 5, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 5, 4, 'Rioja', 'rätt.'),
(60, 5, 'TestFelix2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 4, 'Rioja', 'fel.'),
(61, 7, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 4, 3.5, NULL, 'fel.'),
(62, 7, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 3, 3.5, NULL, 'fel.'),
(63, 7, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.5, NULL, 'fel.'),
(64, 7, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 3.5, NULL, 'fel.'),
(65, 7, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 4, 3.5, NULL, 'fel.'),
(66, 7, 'TestFelix2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 3, 3.5, NULL, 'fel.'),
(67, 7, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 4, 3.5, 'Rioja', 'fel.'),
(68, 7, 'TestFelix2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 3.5, 'Rioja', 'fel.'),
(69, 8, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 4, 3.5, 'Rioja', 'rätt.'),
(70, 8, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 3.5, 'Rioja', 'rätt.'),
(71, 8, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 4, NULL, 'fel.'),
(72, 8, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 4, NULL, 'fel.'),
(73, 9, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 2, 2.5, NULL, 'fel.'),
(74, 9, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 3, 2.5, NULL, 'fel.'),
(75, 9, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 2.5, NULL, 'fel.'),
(76, 9, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 2.5, NULL, 'fel.'),
(77, 9, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2.5, NULL, 'fel.'),
(78, 9, 'TestFelix2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 3, 2.5, NULL, 'fel.'),
(79, 9, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2.5, 'Rioja', 'fel.'),
(80, 9, 'TestFelix2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2.5, 'Rioja', 'fel.'),
(81, 10, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2, 'Kalifornien', 'rätt.'),
(82, 10, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 2, NULL, 'fel.'),
(83, 11, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 2, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 4, 3.5, 'Rioja', 'rätt.'),
(84, 11, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 3.5, 'Rioja', 'fel.'),
(85, 11, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 3.5, NULL, 'fel.'),
(86, 11, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 0, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 3, 3.5, NULL, 'fel.'),
(87, 11, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 4, 3.5, NULL, 'fel.'),
(88, 11, 'TestFelix2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 3, 3.5, NULL, 'fel.'),
(89, 11, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 3.5, NULL, 'fel.'),
(90, 11, 'TestFelix2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/rohdirurayfr348tyo67/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 3.5, NULL, 'fel.'),
(91, 12, 'Carina', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 3, 3.2, NULL, 'fel.'),
(92, 12, 'dagny', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 4, 3.2, NULL, 'fel.'),
(93, 12, 'Felix', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 4, 3.2, NULL, 'fel.'),
(94, 12, 'Ingalill', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 4, 3.2, NULL, 'fel.'),
(95, 12, 'JUKKA', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 3, 3.2, NULL, 'fel.'),
(96, 12, 'Lillamy', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 2, 3.2, NULL, 'fel.'),
(97, 12, 'Linnea', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 3, 3.2, NULL, 'fel.'),
(98, 12, 'LådvinsViktor', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 4, 3.2, NULL, 'fel.'),
(99, 12, 'steffe rfe', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 2, 3.2, NULL, 'fel.'),
(100, 12, 'Tove', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 2, 3.2, NULL, 'fel.'),
(101, 12, 'Vinberra', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/83v42xcey2amdzfv7nfs/537338.jpg', 'Diemersfontein', 'Smak: Mycket fruktig smak med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, choklad och vanilj. \n\nDoft: Mycket fruktig doft med påtaglig rostad fatkaraktär, inslag av kaffe, mörka körsbär, plommon, mörk choklad och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/diemersfontein-631501', 4, 3.2, NULL, 'fel.'),
(102, 12, 'Carina', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 4, 3, 'Rioja', 'rätt.'),
(103, 12, 'dagny', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 3, 3, 'Rioja', 'rätt.'),
(104, 12, 'Felix', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 3, 3, 'Rioja', 'fel.'),
(105, 12, 'Ingalill', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 2, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 4, 3, 'Rioja', 'rätt.'),
(106, 12, 'JUKKA', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 2, 3, 'Rioja', 'fel.'),
(107, 12, 'Lillamy', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 3, 3, 'Rioja', 'rätt.'),
(108, 12, 'Linnea', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 2, 3, 'Rioja', 'fel.'),
(109, 12, 'LådvinsViktor', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 3, 3, 'Rioja', 'fel.'),
(110, 12, 'steffe rfe', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 3, 3, 'Rioja', 'rätt.');
INSERT INTO `result_data` (`resultDataId`, `gameResultId`, `username`, `servingOrder`, `winePicture`, `wineName`, `wineDescription`, `grade`, `url`, `personalGrade`, `averageGrade`, `region`, `correctRegionGuess`) VALUES
(111, 12, 'Tove', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 1, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 2, 3, 'Rioja', 'rätt.'),
(112, 12, 'Vinberra', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/xabwsct26ygti8cgh9yn/1131456.jpg', 'Montelciego', 'Smak: Kryddig smak med fatkaraktär, inslag av torkade körsbär, muskot, nypon och kryddpeppar. \n\nDoft: Kryddig doft med fatkaraktär, inslag av torkade körsbär, kryddpeppar, russin och nypon.', 2, 'https://www.systembolaget.se/dryck/roda-viner/montelciego-7843501', 4, 3, 'Rioja', 'rätt.'),
(113, 12, 'Carina', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 5, 3.5, NULL, 'fel.'),
(114, 12, 'dagny', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 4, 3.5, NULL, 'fel.'),
(115, 12, 'Felix', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 5, 3.5, NULL, 'fel.'),
(116, 12, 'Ingalill', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 3, 3.5, NULL, 'fel.'),
(117, 12, 'JUKKA', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 4, 3.5, NULL, 'fel.'),
(118, 12, 'Lillamy', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 3, 3.5, NULL, 'fel.'),
(119, 12, 'Linnea', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 2, 3.5, NULL, 'fel.'),
(120, 12, 'LådvinsViktor', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 2, 3.5, NULL, 'fel.'),
(121, 12, 'steffe rfe', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 3, 3.5, NULL, 'fel.'),
(122, 12, 'Tove', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 2, 3.5, NULL, 'fel.'),
(123, 12, 'Vinberra', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/e2becfq78oey4ch81vul/819205.jpg', 'Governo', 'Smak: Fruktig smak med fatkaraktär, inslag av mörka körsbär, russin, choklad, sötlakrits och vanilj. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, russin, choklad, lakrits, vanilj och örter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/governo-7252601', 5, 3.5, NULL, 'fel.'),
(124, 12, 'Carina', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 4, 3.3, 'Rioja', 'fel.'),
(125, 12, 'dagny', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 3, 3.3, 'Rioja', 'rätt.'),
(126, 12, 'Felix', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 2, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 3, 3.3, 'Rioja', 'rätt.'),
(127, 12, 'Ingalill', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 4, 3.3, 'Rioja', 'rätt.'),
(128, 12, 'JUKKA', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 4, 3.3, 'Rioja', 'rätt.'),
(129, 12, 'Lillamy', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 3, 3.3, 'Rioja', 'rätt.'),
(130, 12, 'Linnea', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 2, 3.3, 'Rioja', 'rätt.'),
(131, 12, 'LådvinsViktor', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 4, 3.3, 'Rioja', 'rätt.'),
(132, 12, 'steffe rfe', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 3, 3.3, 'Rioja', 'fel.'),
(133, 12, 'Tove', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 2, 3.3, 'Rioja', 'fel.'),
(134, 12, 'Vinberra', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/fo1mjuurjp83h8uq8mqj/16065857.jpg', 'Baron De Ley', 'Smak: Nyanserad, balanserad smak med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, plommon, tobak och vanilj. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av torkade fikon, dill, kanel, choklad, russin, körsbär och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/baron-de-ley-276801', 4, 3.3, 'Rioja', 'fel.'),
(135, 13, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4, NULL, 'fel.'),
(136, 13, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 3, 3, 'Kalifornien', 'fel.'),
(137, 13, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/6h3cvk22np8nm2tuy8ta/17986001.jpg', 'First Edition', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', 0, 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 1, 1, NULL, 'fel.'),
(138, 14, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 1, 1.5, NULL, 'fel.'),
(139, 14, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 1.5, NULL, 'fel.'),
(140, 14, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 5, 4, 'Kalifornien', 'rätt.'),
(141, 14, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 3, 4, 'Kalifornien', 'fel.'),
(142, 15, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/wdm19xz2zlct8rpxzdkw/1005524.jpg', 'Barbera Del Monferrato', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', 1, 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 2, 2, NULL, NULL),
(143, 15, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 3, 3, NULL, NULL),
(144, 15, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 1, 1, NULL, NULL),
(145, 16, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 4, NULL, 'fel.'),
(146, 17, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 4, NULL, 'fel.'),
(147, 16, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 4, NULL, 'fel.'),
(148, 17, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/awh7vbrqz09y7vqddowa/740764.jpg', 'Villa Righetti', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', 1, 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 4, 4, NULL, 'fel.'),
(149, 16, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/wdm19xz2zlct8rpxzdkw/1005524.jpg', 'Barbera Del Monferrato', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', 0, 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 4, 3.5, NULL, 'fel.'),
(150, 17, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/wdm19xz2zlct8rpxzdkw/1005524.jpg', 'Barbera Del Monferrato', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', 0, 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 4, 3.5, NULL, 'fel.'),
(151, 16, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/wdm19xz2zlct8rpxzdkw/1005524.jpg', 'Barbera Del Monferrato', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', 0, 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 3, 3.5, NULL, 'fel.'),
(152, 17, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/wdm19xz2zlct8rpxzdkw/1005524.jpg', 'Barbera Del Monferrato', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', 0, 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 3, 3.5, NULL, 'fel.'),
(153, 16, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 1, 2, 'Rioja', 'rätt.'),
(154, 17, 'TestFelix1', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 1, 2, 'Rioja', 'rätt.'),
(155, 16, 'TestFelix2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2, 'Rioja', 'rätt.'),
(156, 17, 'TestFelix2', 3, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 3, 2, 'Rioja', 'rätt.'),
(157, 16, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5, NULL, 'fel.'),
(158, 17, 'TestFelix1', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5, NULL, 'fel.'),
(159, 16, 'TestFelix2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5, NULL, 'fel.'),
(160, 17, 'TestFelix2', 4, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5, NULL, 'fel.'),
(161, 18, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4.5, NULL, NULL),
(162, 19, 'TestFelix1', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4.5, NULL, NULL),
(163, 18, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 4.5, NULL, NULL),
(164, 19, 'TestFelix2', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 4.5, NULL, NULL),
(165, 18, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2.5, NULL, NULL),
(166, 19, 'TestFelix1', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2.5, NULL, NULL),
(167, 18, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 3, 2.5, NULL, NULL),
(168, 19, 'TestFelix2', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 3, 2.5, NULL, NULL),
(169, 20, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 2, NULL, NULL),
(170, 21, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 2, 2, NULL, NULL),
(171, 20, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 4, 4, NULL, NULL),
(172, 21, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 0, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 4, 4, NULL, NULL),
(173, 22, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2, NULL, NULL),
(174, 23, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 1, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2, NULL, NULL),
(175, 22, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4, NULL, NULL),
(176, 23, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4, NULL, NULL),
(177, 24, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 2, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2, 'Kalifornien', 'rätt.'),
(178, 24, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5, NULL, 'fel.'),
(179, 25, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2, NULL, NULL),
(180, 26, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/zbre70e2ezhzvf9ebglu/7325.jpg', 'La Rioja Alta', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', 0, 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 2, 2, NULL, NULL),
(181, 25, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5, NULL, NULL),
(182, 26, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 5, 5, NULL, NULL),
(183, 28, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2, 'Kalifornien', 'rätt.'),
(184, 27, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2, 'Kalifornien', 'rätt.'),
(185, 28, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4, NULL, 'fel.'),
(186, 27, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 0, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4, NULL, 'fel.'),
(187, 30, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2, 'Kalifornien', 'fel.'),
(188, 29, 'TestFelix3', 1, 'https://static.systembolaget.se/imagelibrary/publishedmedia/42t3gt8wrr1dsirdpd80/1004489.jpg', 'Apothic Red', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', 1, 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 2, 2, 'Kalifornien', 'fel.'),
(189, 29, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4, NULL, 'fel.'),
(190, 30, 'TestFelix3', 2, 'https://static.systembolaget.se/imagelibrary/publishedmedia/pt2mpq51gu48s7qe0ytd/1026925.jpg', 'Ecoltura', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', 1, 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 4, 4, NULL, 'fel.');

-- --------------------------------------------------------

--
-- Tabellstruktur `settings_history`
--

CREATE TABLE `settings_history` (
                                    `gameSettingsId` bigint(20) NOT NULL,
                                    `gameHost` varchar(255) NOT NULL,
                                    `gameId` varchar(255) NOT NULL,
                                    `qrCode` varchar(8000) NOT NULL,
                                    `url` varchar(8000) NOT NULL,
                                    `description` varchar(8000) NOT NULL,
                                    `servingOrder` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `settings_history`
--

INSERT INTO `settings_history` (`gameSettingsId`, `gameHost`, `gameId`, `qrCode`, `url`, `description`, `servingOrder`) VALUES
(19, '378335', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VQYpDMQxDA76WwVcP+FqGjOR8Uub/WY29aKFuKcnbyFHkdKw/atwB6wtv9Z4wxhi2poSE5rIDGr7TPNRy2QJ1KDeEuWyC2KNvdt8IBUrufZCd0+SHSwWItvWqX7dZgFmB7nGCXXWI/RR3nxCJ5HW4FtwVZoymkNZhyGa8s2mXUBnGlsjcNkHMlfkEFOichNSgYgJoND6IQwvEFhIDB4Af1GmAoXRXAlFQTkMHhAeRAWO8jnoNQsF5Z7Ic3pyJq0KmAXMAfC6uCM3zBPyhHS1QMVc7s3hhTkJKkAV7kYS0eQsVYT6AMHfyHaROBzT27wEEt4/JNch/kXypoJiGN0FYgnfAXmFogBAafAPkpv5faDQkOAJpSgvkxVnw7hyJuIRq8FlfeKtPgT+tuudN5KpLowAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', '3'),
(20, '378335', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VUYoDQQhEBa8leHXBazX0VjkzSXZ2//QjgUhI9AViT1ltZP8TcgeML7zFe8IlIr7MfGelI9A3UYg50xloKFEswEqHIF66oz7HoCc6Zd66NyBObhqsmc5ATMvO+DXNBqwI6AFNjuhDNDLRzBC+5wjcTNZh2tJkArIXRhfA4SwHIKo4ZhZ0xRAUlArPalanAYgsadpQyIInGIBLl6CL0w+l8QQU5U3YbJn74ZAW5M8bDeYL356NmhBrioODElm3dgTynhLRuNfg2lC8XFtWu1TqQtjLTPEQvLrX4VuQsWgEqv26rBpwcQFCCSwWqz4T0Dk7moxrJc5GTQgHUNyAGs/tPQDrjw/WpS5TEIrg1hrxCIQgRkUwvngYrAk5OJ5fqIqPwL/xhbf4FPgD3/HRCdKJ4W4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', '1'),
(23, '238238', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2VS4oDMQxEDb6WwFcX+FoG55W6O5+e2UmLGYhIGvv1opRS2Wn7l2p3oPrCW/1NuFprY3tffVksK+Dg48PNRixLoDXTZgFjWQTZ07e6L4QdpTnroDrfLjuOZQWkbTvrY5oJGLX68Y3KQ9beJ24gcvACyAakjDE50TzUGSANE5u3j1MoC+fcEpqR2xrIQSWvbpxYdK4wJKFJg3fOG7sSkoPbCRga/AZXbCtgCNE6UeApSyoggIS54vUSysE+GZ6ixeN54tLQlS+mt+drmjk4cDcuKXmzz+az0OmYmOlifSYkB1XYi8lh8yGUhEsXIAFTzkKnAtK5HWMbcVdXQP2LLN1UTdfWKVQAr0hItgpKCGoKcAVERedLicDmN5cSUIPTzOSGj1MoB3/WF97qv8AHCsjrwaSLKHkAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', NULL),
(24, '357041', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2VwYoDQQhEG/wtwV8X+rcEU2VmMsns3vSwC5Fk0v0u1mhpVv4S6w4YX3iLvwljrWWharnrOAItiXyp8TgDFVdywDoOQXwkvX7HoG2o3vuWvQGpXJx3HmcguqVHfHSzAStcYAU5Ln2IRLpkb1987hGYrhL6NG3VZASKSxi/6XaI70IodiRw5ecU34VMBTvAuLsy9WHggr6V/KrLCOSgsmnJdzgTtWBSMchmafgcgAHNsCwLzVeYgahtQD+y1dTOQByF3kWFX41rQ4iuEbgM1oY0awgKwtE9xbcgg4bgaMX7smrA4ALExbkHySagZS1+IGRjlQegMkH9R61rew9AGhaLgPM1B5EH24V4BBr9gERJQwxBNs6CvXtqH4A/4wtv8V/gA+LBy6V5EaFCAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(25, '357041', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2VwYoDQQhEG/wtwV8X+rcEU2VmMsns3vSwC5Fk0v0u1mhpVv4S6w4YX3iLvwljrWWharnrOAItiXyp8TgDFVdywDoOQXwkvX7HoG2o3vuWvQGpXJx3HmcguqVHfHSzAStcYAU5Ln2IRLpkb1987hGYrhL6NG3VZASKSxi/6XaI70IodiRw5ecU34VMBTvAuLsy9WHggr6V/KrLCOSgsmnJdzgTtWBSMchmafgcgAHNsCwLzVeYgahtQD+y1dTOQByF3kWFX41rQ4iuEbgM1oY0awgKwtE9xbcgg4bgaMX7smrA4ALExbkHySagZS1+IGRjlQegMkH9R61rew9AGhaLgPM1B5EH24V4BBr9gERJQwxBNs6CvXtqH4A/4wtv8V/gA+LBy6V5EaFCAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(26, '207117', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKElEQVR4Xu2V0YrDUAhEBX9L8NcFfyvgzthstpvtmz50oSYk3hPoXHS8lXoRcgeMD7zFe8JDRPww88pOV6AXUYg50x1oWJIDdroEcWtFv9egJ3adeVMfQO5cg2umOxDdsjN+dXMAO0Kpdi7mEEImmhnCZ65AiKC6D9N2TTYgFshp2grneg6xeQ9QfAq6YgMWKxGwA4ybrbQB8es0beijLgsQZYUUtDBeXeMNqJTho5KKO5C1hcEcX36EZhCNy2iD9dSuQBRE0bBghb8bN4XMlb6tJ9eNoSmPK+/RPTc/g4yjJ7XxCkQilMHJYq2zAR33obioxiovQOM53f9RkLyqNIfQQds061loCOkHOlcvM8ygN9fimF0GG0I2DsEZ670vwL/xgbf4L/ALEMPFjXnzUccAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(1, '502437', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2V4YrDQAiEBV9L8NUFX2thO2PS5i7tP/1xB5Wk2XyBasZZI/tDyB0wvvAWfxMuEfFl5jtrOQJ9E2WYczkDTYw3C7CWQxCH7qjrGPREpsxb9gZE5aYh8qZSA6JbdsavbjZgRegyaHJEHyKRiWaifPzmDFSqe5i2NBmA0DWIgqefxbehaJRl8dDP4rsw8f9BO5hmZRqAyJE0bTUPbzABqTHKTyakxiOQFZPg8X4J0oIcKUaD+dL9TNSF0GMJlcAMvCZDE1p5lc71Z+PaUJTZcHcZrA2VB1pXW9cnIAO1L26t9XNYNeAxADFUghewCcgktNaqPXsmakI4wI5vlFzTewBCZLRNaztMQfHAyDLiEQhBIAXNwFEwA6txyCV+1D4A3+MLb/Ff4AMuAN05j0NGEgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/marques-de-arienzo-271002', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av mörka körsbär, choklad, plommon, vanilj och kaffe.', '2'),
(2, '502437', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwQ4CMQhESfpbJPw6SX+rCc5Q3birNzhospzweSgOMyjxpeQKWDe81G/CJSI2l7m5sm2BFkvNZcxse6CKKt9yY9sGzUew64Ro55yN0MDHXAKR7aRSAWJb+qzTNguQtcbi+PtDA1wYHAxWEOhBsRsgGtcBzxq/tyaI3SEKKgPWPR6qQFKHHBEu22gNkKMHvcDhfQ9fhW7wK407I/VogbRV2iFo3Q7IxUXeKbpi7oeq0Dg5lofht3HrMLgsp2lhiVdgizANhk9b5efiijAYrGC2sMDogSszgARga3n/GiALf1F5/1KTBpgHkMQ1NWmBxvkZf6TruLRFiLPHeBmNO/hTeqAyBDTvMXwdWjrLh2dsGyAE4QOehngTuQJzcTgsKXAP/KwbXupf4AMuO/XV/Jz+gwAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 'Smak: Mycket fruktig smak med fatkaraktär, inslag av svarta vinbär, plommon, kaffe, mynta, vanilj och mörk choklad. \n\nDoft: Mycket fruktig doft med fatkaraktär, inslag av svarta vinbär, plommon, eukalyptus, kaffe, vanilj och mörk choklad.', '1'),
(3, '639645', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VwYrDMAxEBf4tg35doN8yuDPyJtB0b5rDLlSUoDwf5I5Giu1fwp6A8YWP+JtwmZnn8vCYTCXQ95oeNrJSDZw2UWGOcKYy6DE2MyVEmplC6OAjkyL7m0oNiG7Nn3jrZgMy1liO258XAVwji6Ei9KDYAggZglaAGXDuCrg3CoVTmQHrnkJNCDPg5jvM+RNB6DDwPJdnxT6kyigD4+YuPRSQ94Zt+Z7rNlgPlsbwg9EVkEYBg2OKaaXUZVwBRAJpszp4DWwTIq+mOYfh7mYPsnMbxoLUp6QAosLEbGFdYcVg0BSwStUfmF6aCGAtQAzW5Bpk8xTQeX9OP5S2q1ATlr8wVjAaj1Tw0MVTGQQLflGjxlYAnZzrCo9ruLqwGsclQIE18DO+8BH/Bb4A8oD0MZ43hA4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(4, '639645', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNklEQVR4Xu2VTWpDMQyEBb6WQFcX6FoCd0bv1TQv3UmLFiKysL9ARh79RPYvIU/A+MBH/E2YImLbV67UOk5Aw8fNVa2OI1BFeUnAOg5B3JE3sx+EC0oRc5CZ0+Q3lxoQaesdL9VswIpE9njBFX2Iu6+IcIhk8T7csYGqx9YlNgC3s16YA1ht30JdmCXBLtMhCKQWrphY6JwO6UEBwm35wtCeDulBSIgKagc/qDMAIYHCoXr1NS3pQxqi4M72OupNKPh9Y2sFlsBxqQfhB32GyXzADMQIoBeY9UuD9eC1ApOL9TRDDzLQZOiEsvkSasJagNj8zj1InQlo7Kxg2QwPsBHItbK5/bmm4xaagJgG7gLKTkFu1KiB+CHUgFDh/xNqlrD5FmrCKhwo3XC7hXrwPT7wEf8FfgGxZueJSZQpsAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/penfolds-koonunga-hill-625302', 'Smak: Mycket fruktig smak med fatkaraktär, inslag av svarta vinbär, plommon, kaffe, mynta, vanilj och mörk choklad. \n\nDoft: Mycket fruktig doft med fatkaraktär, inslag av svarta vinbär, plommon, eukalyptus, kaffe, vanilj och mörk choklad.', NULL),
(5, '365249', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VUYoDQQhEBa8leHXBawm9VSaTJbP7px+7EENIz5shbZelI+eXkDtgfOAt/iYsEfHyEx7G5Qr0UyYemr3cgSZmuNJwLtegJzco24TNcxE6d4C+ENnfVBpAVMue8VbNAWSUaQkq94g5LM3SAy+UQA/dgRQ2A3o47/sG7A5wQKQf8txoDCEFvsEbsQORPCQmY/LhGxAqw1ZwrOdpPRZgybe8KN61+wieTBos2w9tsjmsqwuQPB/YgCf5oSoYg1fDDiESp8F4jZtXNWcQKisPADsg9R2I/4db+wDCPtuAjHYrjtCaLMAegJgsgI/ibUBveVvoHjIb0LhiO2BOK4+yA+kH621eTh5D5o+ppaH8XYAgfJ84J+qr44awCxd4m9AIO/BnfOAt/gv8AgdS441pCTi1AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(6, '365249', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VQWoEUQhEBa/1wasLXuuDqfJ3J5lOdrpIYJxe2K8XSlk6kr+EPAHjDR/xN+EWEYttbr6YjkDLvcxFo9IZuGShwlI3pmPQXJPZJEQaEYPQwDWCItuLSg2Iaa0rXqbZgIytMAMmd6IPtwYZ9BDoQbEH4BJi6GH8bhMwM7ABRmUU1j2FmpBSuKWL8ZmBiTKKKqd5fB6A0AI5jRtZeoxAbIBydpBm367rQVLcFE3n/GiyARjcVN1sHvkQROOaQafZvbBNSDXs/KDyPbgezHOm+Y7WZ+Cue0KKE7PABiADJhPev9JkANYB5OXzVcYdgYYHimxul9yFmpD/IjAZClGWq1Af1g1Ema/m+/C6VzgHn6btQQhSBcpl30TuwBoctqEEnoE/4w0f8V/gBxSW5LllrrSWAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '4'),
(13, '481712', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABK0lEQVR4Xu2US4rEMAxEBb6WQFc3+FoGTz0nIXSmVy0tZqCLLKy3kVL62HojewL0hQ/9TTjNzK2N2abrGSUw+HoI+X5WQIIxRMnkdXC2blYNra3VvQziwhgyO/azBNK4U6/d/Bwi+atpoHCUh/JXjVP98uMuPgc1W4oZsa7OtTN7Ep6VG/3b9eehGqbSmYm9DlEBVb0WNkjXb0NycBK7N7liDi+Ax/7HGtLC7RLobWpsmzxp2+U85Klx0A1QroUKIDaQq6l2bkEFVEzfRlemezuSsKtd1M2xiitREm6+KB1XKiDSD4QWVr9AlIccQEX4wkTUwFgMQ0yOQIwa6EqwrwoZK6E6h9HXchXA0LTqpAZWl0AZ4rtoduJKlIR2nGjadmxsHv7WFz70X+APcEvTYRNOcD4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(14, '481712', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJklEQVR4Xu2UUYrDMAxEBbqWQFcX+FoC74yabWl2/zwfu1CRpM5zYZzxWLZ/KbsD1gfe6m/CNrPsiNxrhhKYm6gskkMNDLySA85QBHH5rvmVwVxY9Vo39QPIlXuF992lA4jdiqvedvMATpVj1q+XcwihMF+rjM8lgZclwdBOxhSwJrC8MeSfBHCGyEJnMRUK2ObFLEDJ1yidw72ZWFzlsAVfIIFlPmr4CnqsgAgW1k4xROHbpUNYbAEIWPbMKCBCO+cfOpxOCQyGgHpw+Lmbp9AevYr8GbBTyDaFgOUc3VRAVs9JHSyBzQYIJ9BZYnQUMCdb7aNGlwUQCaC5DTde3VsBH6dh7TehMwhH0FWCWAJhCCjDgFsEuXEonrFZuwD+rA+81X+BX2D24TXPadCAAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '4'),
(17, '378335', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2W0QpCQQhEBX9L8NeF/S3hNmNt1K2n9KEgict2ehibHS053pScAesPT/WdMEXEQ1dqGo8j0PkKMfPrcQKaGISSkMcpaKYhwu4noYmvNQfpQuDx4lID4raoVGqPt9mAVegbptze9GHqERrlsmfxPkT3SCwiVokgHYDoXBeQ8YMt1IQYLE6WJkI7BYHKi1RGwidgMlfBUYDVthPSg3AhcVyhPLH7AQiLF0cMfmhZ0occKis3EK8t1IYCL5hdLoHtUhMS1CAAl9IANOxU5yjwexy7+S6U2n64P7knpAdZDBnGizZfhZowuQAdOeMepM4EdBoBIaunj0D+iqQgY1zT6yY0AI8KhD+EoQ+T/yW4CZ7VP4ZOzg0Av42aA5AXByuCbtDjAfhaf3iqX4EX86XXIUNZiioAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(18, '378335', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2VUYrDMAxEBbqWQVcX6FoG74yclm7aP8/HLlSERHmGSBmNE1sfwu6A8YW3+JtwmlnMMWJVpxIYiyhtBFMNHLglB+xUBHH4yr7KYBS6rrpVP4Ds3JP3TDUQ0xpX/JrmAexI6AFNdpxDFBrmVWk8lwQuJHNs07YmCpgxfbZpkV7NH0I8unLPLOkKCaQNoDAqeXWlc4ihFeaGMr51UUDMDFWcfuA7SCBk4PB6eT3McAgrx6DBMD8qroBwVVssuEpHSCCUxcBg2b6KIDw7aa1Xg53B4F7tBW7dq/kzyJhGGySxBO4PoAWrdR0FjPXcBLNVFkA4AAbjPwolH80LoPHH10s6CIQt2wUlEILACo7M8+WreAQ5OGgMLXbvAvgeX3iL/wJ/AGBS0b0RElgkAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '4'),
(15, '481712', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2WwY7DMAhEkfgtJH4dyb+F5J1xnLbr3RscWqlcYr8cph4GNzL/KTkB6wuPek+YIuJjps+xli3QZ5qGiDmXPdCwDU0D5LILmo4xA89G6JQZ41AvQBoCrHm6VIDolu361c0CvIoautd1CCEIrDjA6tECqcG2MbRGTzrgnKEjPMz5ZgvV4OoXQovGgd8nKkJmFVYgs9RrgZOrsD1gOEEDRAZC4YfguTzugKbLlFz9uw0pQtEwBgzzNR9CRchkre3gS2+BHANnwGj0LVSETyuO1FUgk4CA+Rrd+0QlyIKYcbTy9bIqwOQFKLSYEwHWAf3Sua6V3EJFaBQwxeDK8/bugE6vdd2DXRAUreOf6jakCGEINgktDFgTZOMgFPzs4W9vgH/rC4/6FPgDRt3ZebbqIKAAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', '3'),
(16, '481712', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VS4oDMQxEDb6WQFcX6FoGTZXcDZ6eWUVaJBCRj/N6UaJcUkb8U+MJWF/4qPeEa4yhYXPNJXnsgIqXqYloHlugDOGPBZjHJojf6JvdN8IJJfc+yM7DaMc+dkC0LVf9us0CzFozHO9ddYizTXc3iGxeh6RQYcZwc6QNMDgF6rA5TG+hGlxDnUKRue2BAEOmCSbW+KQF0gWHLYYncoehBldulQGL4Qd1WqBHtk7FtKQOA9kSJMwYr1uoCHEkoCtYArchVYiLG7Q4ve6BIL6jdaSuCJVBQMS4WI8wVCCLw4CBpc1bqAj3AiTNrx6oNMKDn7mrOyD/RbJzrmm/hBogtjSiq2cY6hBDC4qBOIVeh2nIor1Ir5wuvQ55cbo4V5DTS6gG/9YXPupT4A+QmgfwwQdY/AAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', '1'),
(27, '207117', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKElEQVR4Xu2V0YrDUAhEBX9L8NcFfyvgzthstpvtmz50oSYk3hPoXHS8lXoRcgeMD7zFe8JDRPww88pOV6AXUYg50x1oWJIDdroEcWtFv9egJ3adeVMfQO5cg2umOxDdsjN+dXMAO0Kpdi7mEEImmhnCZ65AiKC6D9N2TTYgFshp2grneg6xeQ9QfAq6YgMWKxGwA4ybrbQB8es0beijLgsQZYUUtDBeXeMNqJTho5KKO5C1hcEcX36EZhCNy2iD9dSuQBRE0bBghb8bN4XMlb6tJ9eNoSmPK+/RPTc/g4yjJ7XxCkQilMHJYq2zAR33obioxiovQOM53f9RkLyqNIfQQds061loCOkHOlcvM8ygN9fimF0GG0I2DsEZ670vwL/xgbf4L/ALEMPFjXnzUccAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(28, '454591', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2V0arDQAhEhf2tBX9d8LcEO2PT3Nu0b/rQQqVJ3LOF2ejsRvJNyBUwfvASnwlDRDT21vRKR6AmkclWpjNwY0gOWOkQxG+l1XMMqmPV7hf1BuTKl3HMdAaiW/uIp242YIUtWGEdgz6E0JblbsK7j8BMT9t301ZNJiDyw7Rpyj8NQLYNAh5qdMUErILAtIHLS6kP2TTKqa16iwkI96NjtjDHd8gJWBEkCSucZuhBt01nQWXlKdSDSJ37Xzl7HgJNSG9hn9JnenazCbH0QHUx/mewJtTgF4XGpdUei29BBmob3FqcnoBRB6CgLPXIEUiR4N7isWKHUBNuDp3fKPk7vScgdwI6mE9CTYijAJ4lHoFKj5UZcA1BNg5aqMV97QPwNX7wEt8Cb2jC052t5se+AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(31, '225752', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VUQoDMQhEBa8V8OoBrxWwM6a7pdt+VT9aqIQ2eQvrxDhZiTchV8D4w0t8J1wiMmzq0jUwtRZoGBM/A8+46oBcrKGRmUYfzC00Q/eImKMNIgvEA1hOWyAP7h7Pp/k5ZKDG6AYKZ9Th0sn+Ckc9HuKr0ANZ0GPMpUeiEgz3achGO2z9DRDaY6K4k+MuvgpRCkM14FharAd6rrAFtCxnDRBFZjnUEbmRBgi9zqFss6xyA4R6GAupIm3bAfFuZycIG02OritCXTAszEUzPIxQhFzjgfGysiNRDYrysjJKl1N8DTIW7wCjx7iqQ16A1L3r0gQtKwvpI+3aAuEpNphmRu+DqHI2w+m4OoTqfX52XAJFiILk9wn/TNkChR++fXbbsXX4Gn94iV+BNyi10UUuRiyVAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', '1'),
(32, '618728', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2V0QrDMAhFhfxWwF8X8luCuzfJuq7b0/Rhg0lp0/NQm+vVSLwJuQLGH17iO6GLSG/hGoNLLYHKC6R5X8sC2KV3NWngWNbBNkYYnpVQQL0QUgXKgdtDkCRk4XY8V/NzOAN6xDBdL3noMl0Ajg0cgiShIsugEjCDHioloaMPltCBqwLiHUUzyEtRdqIkBKBnBzzbls55GJSBrRVsMNICOAwUBbNGs5VALKYJWDlWsAKSQgvryGEUugKyCTAJpl8PM+QgftqZB+2AOaglMCjCFBlz0IugwQvIMI8T1q0CIjhPKbGfh1UC8vs6Kf9+Fy4LlQOArYpEVbDTBt7QsFuRGkgXMAX9UAbXudeCW6mASs4DABu4N1cWCvs1CNXO1UzA1/jDS/wKvAGdbAlY6zeYOAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', NULL),
(33, '618728', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2VwYoEMQhEA/6W4K8L/paQrbIzMzu9e9PDLoykIXk5lGjFXvuXWHfA+MBb/E2Yay3bLimptZ2AhuXmqlbbEahLeUjA2g5BnJE3sx+EAqWIOcjMt7Mc13YCIm098dbNBqxIub6KPsTeJVANiFx8AOIARI+hc6R9yM5JtQ2ltiPUhHlIlG+HoOJhCVYKdB5m6MEdKUE9x40+zNCEKMjCwdFA2nYGsnFQw61USQYg3ikSD6e9nkI9SC8ERXj7fHFNyGrscAyrHa8h0INaiTPr7wbrwlz8nVhWAycgAwoQqzJfQk2YHIAornMOUmcCWumUWs3qCci/SHJScUzHEZqA7B7l3oSa0PgUVDkOJmAVBH7Y9C8tNgDZOGRf1XA7Qj34Mz7wFv8FfgEwHe1lOuTg6gAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', NULL),
(34, '598039', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VUWrDQAxEBbqWQFcX7LUE6szadVInX5U+Wogw8foZouRpvJZ6U3IHrA+81d+EKSKmlV6LSx+BzgNE047lADQx8xAFx3IO6loVOE9CAc1BSAvQQScPIU3IwZ31c5q/h7vgo1b4cdGHKTsF4IjDJaQHMTBHH5hAGPwU0oVshQ9TiKbrCbjWThfa1Z7dAMQpEa+FzOrhuQ8rjLjYTIu0D1OcMpxa8pG6HvTUwMCoY6HdBIRYpiEMPYK3JiAUQ4rsvF5h6MH04KMKJ9wHfQTuzDJYuKfM1wSkEKrgDsO5TcBiL/xw3LjC0IT8fufGTzH6nZAmdB5UgkZTkG+RMG5+p5EZiMsdV+ZhDNIEmu2/MgGdXLkX6PVwdaHwxefJjT+ep9mAr/WBt/ov8At4/gnQAxm5EAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(49, '178198', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABK0lEQVR4Xu2VwWoDMQxEBfotg39doN8yqDOOaRK3N82hhWg3jvftQfJ45LX6JewGjA+84m/CZWZzjTEr91QCZxGFjcmpBg48kgPuqQji9or9L4MzUXXmlb0BWbnH8HWr1IDYrXHibTcbcEc4rODnoQ+RaJgn3YUxNXAGJRk07faYAFZWHNMWXj8SNeHeL4yJjHSFBmbQtAu/3JkEkPtF04ZDFqxAACmweeCCHlyHAIJ5Fq/KPUogGzahBZbxTNSD8OoxGMWeEsj2Z+V88b1xTQhCx4K/GawHUTPEgHnZuqf4HmQ85A1iCVw8AD3QsTz8wRRw8qbEPFaosgAOntP7G2XP01sAadhgQ7wmakKDHvhQEUsgBGH16AZILYLcOOYyundK4M/4wCv+C/wCYUjdOZVcql4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '1'),
(50, '178198', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VwYoDQQhEG/q3BH9d6N8S3KruycDO7s06JBAJxHlz0JSlGfVPjCdgfOEj3hPmGMNXengYUwn0SvOYa+1UA22YsVY4UxlEnWKmhEjXWkLo4HPlrABJDcS07Ipf02xARs7k6M6DACYbT4ceA3pQ7D6kBmETnnW+dwUkA+IAZ4xX9R5k90EzVIxjtD5M7oEnqrD5uJpvQqdfYQhftfUQwCqOzPjE7BRqQhSCJuybrqDJBNBgL5Rg85RaAQs6VLAatKY1BDAxt7m/8OIeXA9CjVMLd5UVFTC5WPDX5YhSQAbOCpbAfGsigPsAYlWNZ9Bf02xCxwfNJy/LfWmb0LhXWCv+P0/+FA08NPfSqiBOSuw7yJ1QQAjCAosX9d64JuTgMLojsAb+jS98xKfAH6lFCKRM3f8rAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', '3'),
(51, '178198', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2WwYrDMAxEDfotgX5doN8SeGccJ3S9e5MOLVSXOK+QcUdjJWP+U+MErC886j1hjjEsZtqMtWyBNlPFx1Djsgcqbl1SAbnsgioR03FthEaZiEO9AGnI2v7pUgGiW7rrVzcL8Kq0SNnrOoQQBFRwhdXRAicEYod2ZawDIgQSLq423fbmizCZgiGJxoHf/6gGpysOLH+gHpXqMPn0vCKGPFgHhJAyVi7wgx53QDgyLyvQvycMJYgs8KAKVISRaIEYK3g+7A1/mQw1aBRC75bRt1ARKu+ptW3pgMZYIWC2ju69+RJkAcAJJ26ByQGIJV9TS6cDGvdPKY6V3EJFqGtO43WK9j2bb4CMq2MIMGddEE5wBBK3QBjCjEELB6wJsnEwwvnZw703wL/1hUd9CvwBebLniasGansAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', '2'),
(52, '661453', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VSWoEMQxFBbqWQVc3+FoC5333lFSyirRIoEXR7XpeSPoayvYPZlcge8OL/U2YZjZienoOjtECg2fyM7jTWwfUSw7fx9PogyeFZrjW3nuONogXgkfnOMcWqMLd7Ws1fw9laEw3KHBZHaZP9dde6PEKvgbBaKweky9/eC/BpLWM4DUOt/jrUGqkxJ16HsHXoPrfUYOJ1Yj1QEmLxnDl0AKpmMWadAPTMKVIHaapWFTuKNMEg5r5nqYEtqwDcqYdzNe5aYGu1eJSZK/P1axARR6pDmMLxN1RFdKxaKzQpUwHlBHyYmAjxRrgcXSbsHF2QAeExPE09NcDKRviTm0ClOmDWgRqhudw1SEnekI5PDdDDQac8F0X2v8d0PThQxFSuE1sHX63N7zYf4EfNFDZAd0jo84AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', NULL),
(53, '152429', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNUlEQVR4Xu2V4QqDMAyEA32tQl490NcKZHfVVef2a8mPDQyK9RPaermkEh9CroBxw0v8JnQR6S1cY3CoJVB5gTTv27AAduldTRo4hnWwjRGGZyUUUC+EVAFyUJNDkCRk4vZ4zeb3cAb0iGG6veShy3QBOOywBElCpM1303Z9CpKDEcbZN6GpdQF0NUxvkJeiPFfPwWBVwV/wbNt0zkOIjO2jtIIFRpqHwTWaKz/6MlgOQtcBI0AW2mzsm09CUaceHWsYhS6A9ALMKtOvyyE56JyfMjv7oJZAqIxa7YobH4ogXrB7ZdZm3ipgUAf2ARTEuVklIOenylCDh0CUQOVFZxldUQPnKeLNaIi1+TykC7gE/VAGUQn0WMz/KIBKPnt1OyouCYUHnzobv52zmYDvccNL/At8AIlaEci1WAbmAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', NULL),
(54, '152429', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABOUlEQVR4Xu2VUWoDMQxEBb6WQVc36FoG9412m5C0f9JHCxEEtG8hkkdjrZ1fwt6B4gPf4m/CbWYe25evqbQF+tnTl43ItAdOm1SYY7nSNuhrHGWdkDQiGqHDR4RE9heVCpBpzTteplmAij0wA5O7og73CDH0MPSQ2HVI92PLCpiB994BNzqA8iXWvavX4EEH/h687DJaHW7fTItfNq+KdQiNy7hxUo8GqA3gqKznUM0GiBSxtANMroi7eg1uHmUvNc+1bYEHYWmc9Tcl9t18DUpgF0qVv6dZg3kRtKV1BPmsAeIF7j9uZWq5/xqgIoVm/6UmDTAXIB8p+TaH1wH96j83y2PTFqEGl1uVPT10lB44+aBoGTybr0MK4QIOkNe2ASIIlfArrT9uXBHm4FAkBe6BP+MD3+K/wC+w4PA1J9wHnAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(57, '469492', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABM0lEQVR4Xu2VW2rEMAxFBd6WQFsXeFuG9B5nHmnaP+mjhREzg+cYch3pSrbjl7A7ID7wFn8TLjOLHHON5SxbYPDJWB7nsgO6uYSWC7Lsgu4jzTh9J5TMnH2QLGRM/V4SUoSq1lZSfKtmAe6YK+SGx5861DpH7izHyRsgiV1YDEdAG6A0YkrG2XgK1eDBUp2lsqkXeqCEZCzQYDc64D5xug1S7U8z1KCer4aNY05to9MBTW21D71f4yFUhLJrIIe9XkJVmJxdhCHwTEgR8niaK4W3UgMMfMALHBeDVSF3CVQj5mWGGiSW44ed5lOoCPcADM2rtNOzHTDQkZC+FLEFcotIZKCoO6ANSoEee5uhAU7NwKnjj6tQAZIQXc5S0Mwm3Q2QwqliSTbIcQP8GR94i/8CvwB/M/jhOmFFLwAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/castillo-de-gredos-1279708', 'Smak: Bärig smak med inslag av körsbär, blåbär och kryddor. \n\nDoft: Bärig doft med inslag av körsbär, blåbär och kryddor.', NULL),
(58, '222230', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2UQYoDMQwEDfqWwF836FsGp1oZQnY2N+mwCxEhI9dFnu7WjPOhxh2ovvBWfxPuMcbc7vNEti1wHqE1fKrtgc5RHJhtE+RnZ+WzDc7g1hG36QWom9ty23eVChC3/KofbhZg1jKiYNehDhnkwyLW0H+0wHNo9jO0mbEWuOSXQnvW1LkO5dfl2VIqWqCGEFomWeSkOkSQwDfGGLLwBg1wEy82C9PQQxp3QLorXPA3lQoQ44ayxRS9Qgvcee0MWKaiBeKbMhAK7svNImS1tuWt3wNWhBkCQxCt7uyAqqe8iVtgfgAZw5fFc04HnNJZn2knalK5AZIAicscRr5UqkOswzbTfrVBosUquHALRBCFgU5S90AZx6yhddDdG+Dv+sJb/Rf4ADzY35FcTdfiAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(59, '222230', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2WwWrGQAiEhX0twVdf8LUEO2NCSLe96aGF30vMdxmjo0Tyl5ATMD7wiL8JQ0TMMyy90hFoGbq2bTWmM1BFba9QQKZTUJd7bjwHoVHG/VBvQDak0NmlBsS09I5v02zAK8I81p33IYQgADuIoNU+AjGwlbdpy2MjEBqUUcttd/FNGFitkMWxbcxvBtJdaMVGU7yUBuDi9qtcC4YvmIBigRuQXK/q8QTEOzXwCv40pAfLXtTCZzxCXQhblbN8vy5DE0IFY2OL7RlcFxZl2S+DdSEKx6aiIVxdm4AMGEy5WvE+Vg0YPIBIuQmlMwEtef3s+gr2ZQAqK4fBeAef4gcgbbBxBOpcDUH+S8CzxCOQrcCtRoYFG4I1ONTO3x7WPgB/xgce8V/gFxC/1bknEWfMAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/castillo-de-gredos-1279708', 'Smak: Bärig smak med inslag av körsbär, blåbär och kryddor. \n\nDoft: Bärig doft med inslag av körsbär, blåbär och kryddor.', NULL),
(60, '523910', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2VUWoDMQxEBbqWQVcX6FoGd0ZN2GTbP81HCxHJrv0CGVkey3Z+CbsDxgfe4m/CbWax14pTPZTAOERpKzjUwIUpOWAPRRAfP9lvGYxC1lU39QFk5p7L971KA4jdWo94280B7EiHFfwxmUMILfOqND5LA72+rQCp9pgEIvXdpj0Zz+SH0GADbFjhB7pCAn0bTQslr1YSQFbC8cISui4CiCkOgDn8kF1jAcQp4AoOSoHCPAsygzz8tBb0uAQJhMHaYahLXk1gCAN2gECywtfGzSD/ux/nxWBDiDMQbFfRRzcUkIHcmT6xBG42QEzQWVbrKCBFNts02wqrLICLfbrvKLu6twDSsLhT6rwKDSF1cFERSyAKQqHsrwhy4xDcu85dAH/GB97iv8AvsdrXIWHaJiYAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(61, '523910', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2VwWrDQAxEBfotgX5doN9acGdkGxK3p+4cWogIQXk5zHo0WtvxQ9kTsD7wUX8TLjPL8l6+gq0EJj+VK/JsFTAsILQCkK0KRniZ8fRKCJluHaQLlY3vF0M2IaY1Sqi3aW7AqaaGXz/2IfryGpfz5AKYB81AxJgIUgGEEd6QCf5xC21CTg2bhbFhF1RwYWHhxXLo4CkEEHZ0IQdOq+MOwyakI2gLA0zqCOCawcX44WOJAM6Zgy77+KGAMIE6fvASuDduE/oyHr3hyKRXAekBdsCvVgIRMGxCY2pYhvvwe5CFB0BumdxLaBOeFyASUXZmVgHzYLKwtLS6UgLnLYIbkIrZl5AAQgHZzZcw7MODV2rxJnxT/zWkIXQE7bitgBwc7r6iG/RYAL/XBz7qv8AvNX3oef9QsYkAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/castillo-de-gredos-1279708', 'Smak: Bärig smak med inslag av körsbär, blåbär och kryddor. \n\nDoft: Bärig doft med inslag av körsbär, blåbär och kryddor.', NULL),
(62, '227322', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VW4pDQQhEBbcl9NYFt9XgVJnHTXrmTz8mEAlJ3xNImfLRkn+EnIDxhUf8T7hFZG2zlVHHEbiSyMUWjzPQ8EgOWMchiJem1+cYXIGsIw71BmTm6qb7dKkBUS27x1s1G7DCFd/q/aEPIWSiES58jxGY4cvt1rTVYwMQ3hI5TE5fj+R7MIMpV82cXTEBN8YVnih6VqOU+hADoF4yWv9iBAZ8CFf0gy96PACRPFRoBKzJy5AeRPfDZ6govR6Bmhx/OBF+LYEmXFE/X437rGYXwmCrEXhpsCbEPuGu8uozOD4AGRChDvEIZOEog81ipTMBKcIVsGkKXR6AvKRud5Rc23sACimWQL4KNSFaC1vFiEcgDMGtpzjR6hnIwjF/jG3lPgB/xxce8SnwB7bn2bUonLfiAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '1'),
(63, '139313', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VS47DQAhEkbhWS1wdiWsh9VThxE48s4PFRAryovuxgC4+lv2HyR3QvvBm/xOmiFjadvPF4wi0nUvMNeo4A5eshZu68TgGLRgg1yQsHoPQGAH6QmR7U6kBUa31sLdqNiAtl+KL4zIAUyN1uyIi9NAZuBBFHXoY/TYClco6qwfXGb0FdwSFhhwMNgMZCPn7kbxfyTdgpY5JQNvu0mMCBkfh6ITIZ4P1IDprB1VxdgV9A9AYCIbk6ZuA7NfNvoXPngPbhGnhrBsP+6xmD1KRYBQxqjIC0QUsV2ABSu2/AUhLYdPCS00GYC1AbJaqHos3Aa2q5RyHfF3+HYgIxgng/1n5lBm4QKj1lXwfUmB2ryvfMQAhCOQ9Nuo1cT1YhcOirp/eDPxtX3izT4E/WDnrSVennJkAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '1'),
(64, '487431', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2WwQoDMQhEA/mtgL8u+FtCOmPSbbvbmx5aWCms+w7VjBPZNr9EOwPGDU/xm9Bba2LTZVqkJVCmj66tDWFaAwdetfsAZFoFRzebimchZAkxO1VPQAqCXC8qJSCmNXZ8TDMBV2B23neehyiEAmEHSG0lEBReoBIQmZpUQA6sqyiFlt18EoYPYFrUAH+eKAdRSWlaeLZbVMpDFgqLxQXDCQog5GXrnJmGxjVw1cHkbB5myEHFDlCOzsMSFdAh7lxLVV9LIAklFvTgreUJSiD+27zz8e66JOx8gbfi6u7mc5CBW8A6xCUw1BBeBy5/JBVQ1m+tFd+FkjBGhp3KPXg0XwBpV64CiFIG+S0BzxKXQKgRveNy6WGwJIzBYVGjVvReAK9xw1P8C3wAGvvVQTgtzowAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '1'),
(65, '487431', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VQarDMAxEDb6WwVc36FoG/zdyEtL076RFCxUN2C+LUcZjtax/qjyB6gcf9ZlwllL6GnXW2XyZATu/0Udr3ZcpsJWmzQT6Mgmyp291nwgrSmZ5UJ0v/HhzKQBpux31cpoB6DXrfrzikPWoZjYQ2TwOF4DAKmOcnGgGxFmObTSs7pdQCBJWQ6Kb5zYHQltFhhuLzhGGKKRrk9ejkrIzDDGongsaZvghnQxYtMcOvqK6JQmQC0DjNhSvSygI5a1ElobAaUgQ+piSxdWzlgIVftNFWPfUBaFPFj4BySsMMajCXkx2m7dQEMqQBmCy7MxmQBkhU6Ym9WlyEO5/Efej6JplwelzoN/CEIeaqFBe3YQCUIbUKXsnNh9CQegHh5zcILkZ8L1+8FHfAv8A7q/3eTUPUVwAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '2'),
(66, '487431', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2UXYoDQQiEBa8leHXBazX0VpnJTDLZN33YhciQdH8JlFP+yP4l5A4YX3iLvwmXiPgy8511HIG+iTLMeZyBJsbLAqzjEMSjO+p7DHpCKfOm3oDI3DQ0PlxqQFTLjnirZgNWhKIV9Lj0IYRMNDOEnzkC98ZhPZq2PBmAqBhRsGbh/FMfUim8NIJdMQGXJjtBoYSTz0Bfuph3KF4CbzAAoRSigTnAD/R4AGKiMAYkG/xpSBNyDIReoGtPoSaEt9gBcAI78NoMXYj84TIdPgvXhM72qhF4abAmxDpRriuv0X0m34KMh72FR+DiAsQFm8VKZwI6H6y/VTN7CDWhUUDZaHJt7wGosASLoMZhCqK1MApGPAJhCIU4XHF1XQ9W4axqV7kPwM/4wlv8F/gD13HLpRvfNB4AAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', '3'),
(7, '365249', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VUYrDMAxEBbqWwFcX+FoG78wkm3bT/kkfXahI0/g5IDEaK7bfhN0B4wtv8ZlwmdlYEWNPPbbAsYlmxuBjDwwLLhagHpsgLt+p/zY4JjLNectegKg8PD1fVCpAdCvO+NPNAlSkwwp+LuoQicJ80l24zxaIgLqHaaVJA1w+09fgb+fgO3WoXh2WSLqiBaJoLB2eRUq+UIdLIqBulC9dOqDsZTgH2NB+HSqVU4gNfglSgxhTdBiy+L4S1SDNilRQArvXEChCpkHDkgpfjStCKMtZJf5rsDLEhQkAQXh0z+JrkKENeuF5WBXg4gDEYuIkKE8HVPHHbJEsHTB4EvSNssf0boD68GEI7OdERQhrwWVB3AIHfYtEm4ZogmpcqHeqvQG+xhfe4r/AH6HX4xXt1JgdAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', '3'),
(8, '365249', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJklEQVR4Xu2VUYrEQAhEhb6WUFdv8FqCa9nJsJPdP/3YhZFJ6LzAlF3aRuKXkCdgfOAj/iZ0EYEjNrZyOQIRroK9rJYzUEU1n9YGl2MQRgHXSZi/ZTYIQQUFTcabSw2Y1dIr3qrZgAzXFazciT70ZV7Ihb6MwAizsJ0tBr7HCHRl6gqXteUW6kH+depkz1JsCiZSMia/MQLztKYjrnXHJdSEOKA24a/B0oMqp7vYD9VkfcjCoW5WfTECc3XxzJxb6EPnIweA0+VXNVsw0olKfSNTn4FOiV2dIDX/BiDDKcP86ckAPAMQhNxCjMA0memTe2U/APkV4Qng93lxKzNQeZXMnXwfprtgU2RbfEu+AdMQKoET9T5cXcjCnStFZuDP+MBH/Bf4BW1t8sn9rYRVAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', '1'),
(9, '140282', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNUlEQVR4Xu2VUYrEQAhEhb6W4NUFryX0VplsNpudP/2YhZGQdL8MaKpLR/aLkCdgfOAj3hOmiFjstB21HIG2U5eLqHE5AxVbX6mAXE5BXRHb8RyETGERj+wNSEGUEj9VakCclp7x6zQb8IjEB6xz3YdIhARlB0gdI3Bvh75UIpjNJmDKSgu8wN6NPxqAKih8JV652vcX9SAy0bNRj8rUh/RrWawaDE4bgbA/qmZ7lcYDsIIK4x77MkMPOsTFGHC69krUgzgviott+G0IdKEunloJ/ZOoCRcti3a9ua4J9TAY6mfrnsX3IANdoGytvA+rBkwOQFQezuEPNgENV1BqjhW6YQCyD2gwzsGr+Alo5Qn21xhEAliCf6qnIE0IQbBhZ9FoM5AHhxNzsaP2Afg3PvAR/wV+AWWu1bmG9lqOAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', NULL),
(10, '140282', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2V4YoDMQiEhbyW4KsLvpaQmzHd0u7dP/1xhUoL5tsF3cnEyP4j5A4YX3iL/wlTRCzS3FyZjkDbqeayotIZqKLKWm5Mx6D52swmIdKIGIQGvsC2g+QMxG7pI952swEZudISO3eiD7EggxUEelDsAWgwrC54lrWeKjUhCgFYyoJ1r0ItCBvgwYbFXI7RRmBKVWHzfppvQiwjnMaNXXoMwM2mMQa4ZskRWElCD7qCJutDqrB8JZun4BNwQ1jUCk4D4xYOQGqh5x98YQKiEo1LqdH6DEQFKc9i12r+DUBGLZ1fIFf1FqwBaDxYWpqMQMOPTzhZ5CrUhLxFcGiN9/Pip8xAVY6+5NMxaOWsOg8vzTcgBEEdYLT+PHFNyI3DTXIEnoG/4wtv8SnwB6WM/kUFihTKAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', NULL),
(11, '939654', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VUWrDQAxEBbqWQFcX7LUE2xllHRK3X5U+WogweP0Mmc1oVpb9Q8kdsD7wVn8Tpoh46EpN43IEOq8QM38sJ6CJQSgJuZyCZhoi3P0kNPG15iBdCOfixZAmRLeoVGqv3WzAKuwbppyHPkzdoVEuexbvQ7hcPkQlgnQA7k0ZD+OLS6gHUxdpVmiH4F6QCHiRULvC0IWbE4BHAVbbMwwtiM2n6F4L/4GxHYHmJ15JW45QD+IkECs9KT8GYLlbeYXe88R14eNaAXw1rgvRLAbMy5t9Nt+GUtPPMWKeYehBFmdfVHKPUBPWAMTvB+cgdSagb+aLKSu5EcivCEKmVPR1hAYgbjiu/hqGNkwEgjNA39V/DZ1c6w6bj1ATsnE8rnSDHg/A7/WBt/ov8AtpwdrhuBSv0AAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(12, '939654', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2V0aoDMQhEBX8r4K8L/lYgnTG93Tbtmz70QiXsJiewyjjJyvoQcgLGDx7xnXCKiM0xbEVOW6AtIpdhnPbAgSU5YE6bIIYuz3cbtEDVEUf2AmTl6kPnqVIBolvjHi/dLMAMhx7QZEcdItEQjXDhM1rgihU+tmnTYx3QofA27XK7F1+F+Da94IPjr/gahBOoiSKTRmZqgOj/5HCdqUsPxJJNgx7zSlSDoKKpC3rYA7mGs5Ald3pg8PhDCfjscQkU4VZ2pXGvbhahsGO01rPBahD+p8FwV/HoWgdkwBDcI26BkxegujFb5umAlmZA7bxWqHID5E9KcQqghjyKb4DCH19u9UEg4T2ol0NKEILAClhOSN0E2TjkQtN27Q3wPX7wiP8Cb3MzxY3dNK4DAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '1'),
(21, '238238', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2V0aoDMQhEBX8r4K8L/paQzmTT5d60b/rQQqVlzemD6Yy6Mt+EnIDxg0d8JkwRsZhpM1baAm3mUBcZxrQHDhxdcwAy7YJDI6bj2QhZwiKO6gVIQQYlPlUqQLg1dvxzswCvgHepO69DFEIBMBFIHT0Q6s7dtKvHGuB0ZOHmENptX74KIzEGStvA9+WLMAmgBHpWY1Wqw+nI0QjXgOEfNMDU1a70jNLs6jVIZZdvkIYO9kClJooqev1Wh8mVyj6b0OVeAkXIDOe1Am83i9D4DY7rnwarwoAkyz2OrnVABgCUcOIWmFyAvLlw+YN1QHt+hrF7WyCMwxGLAHvwvnwDFONaUc5XGxx87zlfqluQIqQUaFk8MGBNkMZBCOeQ8e4N8DV+8IhvgQ9Kdffxbnu2kwAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', NULL),
(22, '905439', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJElEQVR4Xu2VSwrDMAxEDbqWQVcX6FqGdEZOKE270yxaqMjHflnIHo2VcXyIcQeMP7zFd8I1xvA1px9ZQwn0gyjGdA41cGKKyQKsoQjisiPqLYOeyJR5y96AWPm04JxDDUS15hkv1WzAijBYwc5JHyLRHJZ0F54pgiTbtKWJAnqG8QEcfi2+CeEtegFX0BUKuBWBHXBnZRJAFA01QxqDLNiBArJkHjgH0IMaK2AYsFFg8EuQJkRP2VrUFiRwMUGUwerUSuBkk4K5qPBVuD40qhvkT9f1oONQ2eIHOu3aUQsyVi27sAQuNkBMMrYwEuhcf55tJc5ETcjCWfIfNZ7dWwFh2KhPOogTC0tUQgmEIEyEJghDiCAL54vJ9toF8D3+8Ba/Ah/w39H5OJaFXgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', NULL),
(29, '454591', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2V0arDQAhEhf2tBX9d8LcEO2PT3Nu0b/rQQqVJ3LOF2ejsRvJNyBUwfvASnwlDRDT21vRKR6AmkclWpjNwY0gOWOkQxG+l1XMMqmPV7hf1BuTKl3HMdAaiW/uIp242YIUtWGEdgz6E0JblbsK7j8BMT9t301ZNJiDyw7Rpyj8NQLYNAh5qdMUErILAtIHLS6kP2TTKqa16iwkI96NjtjDHd8gJWBEkCSucZuhBt01nQWXlKdSDSJ37Xzl7HgJNSG9hn9JnenazCbH0QHUx/mewJtTgF4XGpdUei29BBmob3FqcnoBRB6CgLPXIEUiR4N7isWKHUBNuDp3fKPk7vScgdwI6mE9CTYijAJ4lHoFKj5UZcA1BNg5aqMV97QPwNX7wEt8Cb2jC052t5se+AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(30, '225752', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VUYoEMQhEBa8leHXBawVmq0ymt+ndP/3YhZGmJ3kNU1IaI69fQp6A8YGP+JtwiYiH5tJlXI5A5xNi5ns5AU0MQouQyylopiHC7CehiWfOQboQzsXNkCZEtahUavdqNmAF8talZ9OHWIdGueybD0B/JV9RHUHah9gtTyDjhyPUhuxWaPBnCibzhhdL42qGJlximsGjAKvt6pAWROWwgSVa1pzke5A575KVLUe9CYUUubO9LqEmxAaJgySGwNulJtTFOaV0pLp3ApoQ0IrvBmtDZf4JQzBh3sn3IANN5rtzj1AT1gDE/yfvKepMQBqB/FE23xN7APIWgQjrh1vlCA3A6jKcsFsztCHOatYkuAs1IA0xTgDWjy02AOviE3jiHIVHqAd/xgc+4r/AL5bYz2WzYqH9AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(35, '598039', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABM0lEQVR4Xu2UUWrEMAxEBbqWQVc3+FoG9412t2nT/kkfLawIif0CkTMayc4vYXegeMNb/E24zSz2GHFWLltgHKFpI7TsgYOtODCXTZDLz8xnG4zFqde6ZS9Andyn9lr2QKo1nvGtmgWYMR0r+HNThyQa5kvu4r5aoOSQF2Ta1KQBbs96ybRnxuvwNXjm8P2o2ZQrWqAk5gWZfGWmBkjB+Dxp+Avp0gEpHRkoGnpI4wa4pe4jGfzTISWoTIiLFry5spfgthAg28qubYF4S59fMu6rcHXo1EzWugxWhcwTVztEtm50QAWibLXW/jqsCnBrAKLENA1/WAcMLmYVbUA2qdwAh+Y0kqDGNb0boAzLIFB/tUEUMaaLcAsM+YFhRbJ5ua4GVTgNa5osz94Af8Yb3uK/wA9LD+NRq2W6ewAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '4'),
(36, '598039', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNUlEQVR4Xu2VUWoDMQxEBbqWQVcX+FqC7Rvvpm02+bM+WogIxH6GaDKSZTvehN2B4gNv8TdhmVnMiowcWrbAOGpE+pxr2QOHjaFcGVq2QfIcWnVClnPORhhwn2WYHE8ubUCqNa54quYGVJSXSnduGmAhHIYfhh8yuwGyz+H0bOg8OiCYZggV0NOuRJuQXz+wgk/a2Wj7kLWawE7xZGyBMTnghITyowOWp+OJ9mrdDojiiX50qyvmmWgTggeoJJ5r2wO5/tRrqhvicWE3IV/STDa5fBVuE9IHckLthfQeqESMFKwudcTRARWl6c/8W540wDUAIzVVlictEPEwlxn1PWk3oV4R3HC9z66/0gMXJc2P+H3IkKILUjf3l/gNiCFKkJL+uFy7UIVz3pRlcA98jQ+8xX+BX0o4AwR+fwvSAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', '1'),
(37, '598039', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2VzWoDMQyEBXotg15doNcyqDNaJ2k3vUmHFiJ2He93GXv0E8lfQu6A8YG3+Jtwi4il69a9ajsBDY+br2W1HYFLFj82YG2HIL5xbp5+ECqUIuYgT57w482lBsSx14kf2WzAiq3XW9GH2LsG3IDIxfswMyKjagyZI+3DDSMUafMFq+0IdaEFLoC16nYIIl1LHWIKnUcx9CCwutaCKnsWQwvSCw1HH8AP6gxAJo2OcAZwHYEbfQAZqLBtj1AP0lv2vyaHwMOQJhRlvTqGVcYzm03IFqghld+rrgsFFYuyRcu+iqEFGVCAyWXzJdSEuwagQK5+ZqBBR6PUcAEbgfwXqSbgmI4jNAG3clq9imECpgtnAC8xAWkITg6FarMRyMQxZ3TD7Qj14Ht84C3+C/wCgsrzfZEysFcAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', '3'),
(38, '180233', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKklEQVR4Xu2U3YpDMQiEA76WkFcX8loBd8bzQ/fs3jkXLVRKa75caCejI/+J8QSML3zEe8I9xpjbfeaqVAJnEsXwyVQDHUdywEpFEB/LqF8ZnAtdr/Wo3oDs3IJnphqI1/Izfr1mA1aE4dbOQx+ikA9bKwa/lwjOFX6YtjQRwGTbu0ybMc/mm3Cj5zjeLOgKBeScwguGSryVwF0GYBnbpYsA1iTUo2X9BwWsqTIKkeCXSj2IPNA4hba8q/cg/Y8dACVWTa0ETtohaVms1qtQE/qAs8paL65rQvjfbRsE4ehezbcgAxe8I5bAzQWIMtgsXnUUkEXosc21QpUF0Lmn4S2Ow928AKJ9Ss350kEsQGwXYgmEIJACRxpCBPlwCGhx9C6Af+MLH/Ep8Adk7d/NFeacUAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(39, '180233', 'Felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKklEQVR4Xu2U3YpDMQiEA76WkFcX8loBd8bzQ/fs3jkXLVRKa75caCejI/+J8QSML3zEe8I9xpjbfeaqVAJnEsXwyVQDHUdywEpFEB/LqF8ZnAtdr/Wo3oDs3IJnphqI1/Izfr1mA1aE4dbOQx+ikA9bKwa/lwjOFX6YtjQRwGTbu0ybMc/mm3Cj5zjeLOgKBeScwguGSryVwF0GYBnbpYsA1iTUo2X9BwWsqTIKkeCXSj2IPNA4hba8q/cg/Y8dACVWTa0ETtohaVms1qtQE/qAs8paL65rQvjfbRsE4ehezbcgAxe8I5bAzQWIMtgsXnUUkEXosc21QpUF0Lmn4S2Ow928AKJ9Ss350kEsQGwXYgmEIJACRxpCBPlwCGhx9C6Af+MLH/Ep8Adk7d/NFeacUAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', NULL),
(40, '940586', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2VwarDUAhEBX9L8NcFf0u4dbwJLy/tqrpooRKSm9PFhNGxtF4U3QHqB2/1mTCISI09OATHEai4jER0HyegkKRQAOI4BUXYiPD1k1BI3ecgXDDF4WJIE2a3oFRq1242YFV9Nx8vfRi8jK1c1ig+AOFv+mA1EaB9WJjt+OEQasOdrGxbyBR0g06ivJ/D0IahbohCWi3nMPQgfIDPlg3E2E7A5Z425wrIO5clfRgZ/gTwhMuPCZhDhVeuNJyGNCECSwhC4rNxXZg9c8fIrr8Ba0OsE/c0BIo6AVGB/a9l8xZqwjJEKw97ZiegondIq+je2AOw/kVyA0JR/RAagI6prcdFqAkXVio2wX/1tyEMQRgU/ZOLSw2IxiGucAMeD8Dn+sFbfQt8AO1i3TkdM3TNAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(41, '940586', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKUlEQVR4Xu2VwQrDQAhEhf0twV8X/K2F7YxJSrrtTQ8tVEKy+/agGcdE1oeQHTD+cIvvhFNEbKraily2QFtELmpc9kDFlhwwl00Q11iezzZogaojtuwFyMqH65i7SgWIbukZL90swAwfzHZu6hCJVEaEC+/RAwfVPUybHmuANAH65RB5uZ3FF+GEuRwJYprTFS2QTsABDyMztcCY6BvLT116IKUY8APf4ZmoAoGHC8mCFU5B6lC5Rxa+QgucKUIeUGxrgcYZSMvCZleiImQiuAtS3A1Wg+iaHMbl6F7FlyADBzwjboHHB1AoCx+rBTLJ5Gzxs0KVG6AyQf6jkPIqvgEqf3yYXI5DFxTDfLkSt0AIAimwxeDeDFaCbBzrR++y9gb4Hn+4xa/AB+xNxRUNZtA8AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '1'),
(42, '769978', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNklEQVR4Xu2WwWoDMQxEBfotgX7doN8SuDPaTbt1e5MOLUQJrPcdMvZoZCL7l5ITsN7wqL8JU0Q8dvqOWo5A32m6RMy5nIGG16VpgFxOQdOIvfAchJTwiEO9AWmI0eLTpQZEt+yub91swKvQu9R73YcQggCYCKyOGUgv9HpUxgYg84/Q+oLRy+/NN2GKIlsVWvDPE/Ug0oVwBTKrUUoDkFNQMhTDCQbghgbHYOEM5fEATF34JK1AFF6GNCF2bAyYX5EYgcwqvd48xMulJnSOLIaBDj+62YPQyRrXZ8B6sG5+5V1FuXvzPciCjnG08nlZNSDt4O9zEkpnAjq+sAKhcBzgFmrCahldMTZwDopTTKOuqyGIZGHEjHgEwhC8oHMY3a/U9SAbh90v/u3h3gfgz3rDo/4L/AAHzL2VOwSfuQAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(43, '769978', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKElEQVR4Xu2VwYoEMQhEBX9L8NcFfyvgVpleerd3bvEwCyNNj3l9MFNWjNSLkCdgfOAj3hMuEfFl5pWdjkAvohBzpjPQsCQH7HQI4tGK/h2Dnth15qP6AeTONUzXU6UDiG7ZFb+6eQA7QmEFvRbnEIVMNOkuvHMGalbYNm17bAB2pW3aCr82fwori15AlaArZuASLBWVNLvSAESGni0PXa3LBAwqGwo/dDYBcaLIIEolpZmA1QdVc+2/MAJp1mDboMw9BA4hAHy7jfvduGPI3rW1boMdw8UbhbOKR9cnIGPLG/15Ai4OQMicOAldZwJ67cEPjVerPAD7kuo7Su7pPQAVkgQ98bPQIcRogXWtnTYBIYhtM1DqGcjGOcqJ770PwL/xgY/4L/ALA+nfkZCkhwYAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '4'),
(44, '769978', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABK0lEQVR4Xu2VUQoCMQxEC7lWIFcP5FqFOhPXXa3+JR8KBt3tPoWp00kc60ONHbD+cKvvhHOMYVPVVuSyBdoiClfjsgfqUD5MwFw2Qbxked7boAWUIjb1AsTOVVxi7i4VIE5Lj3o5zQLMckEU5HioQwjpkGC6cI0eqAoz7qHNjHVAmzDEnGfm9th8DdKJoBw+YCqaIA4MccA7UqkOaYFz3y6p1gFXPBgu/EYPZCfwhiichtQgtnz0luQvaYBkma2FGXhNhipEJ8ASOnweXBkKgMGKK2BliGmC4LIhUrEBsuDtZCDm87AqwMkBCCcCnZA6HZAiRxPMdLkBKgXyP2pc07sDImSOIbBehGqQOoyEXGEoQRgCMxgG8TNgRciDg8eMWe69Ab7XH271K/AG4fLRCRjGDBEAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/first-edition-227801', 'Smak: Mycket fruktig, nyanserad smak med fatkaraktär, inslag av svarta vinbär, örter, blåbär, ceder, choklad, peppar och hallon. \n\nDoft: Mycket fruktig, nyanserad doft med fatkaraktär, inslag av svarta vinbär, färska örter, blåbär, choklad, peppar och hallon.', '1'),
(45, '769978', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2V4WoEMQiEBV9L8NUFXyuQztjQvab9pz9aOAl7yceCuXF0Zf8ScgPGG17xN+ESEV9mvrO2I9A3UYg5tzPQcMRhAdZ2CGLpjvodg57IlHllb0Dc3DRM161SA6JaduJbNRuwIhRW0HPoQyQy0aS78MwZqIkkn6Ytjw3AnYFG8Azg8HP5JqxL7zJt0BUjEEbAUeFZzcrUhygaFEGmUMiCfzAAWThKAT9EaTwAkQKLuXbWcwIGO0ATMitfmIBlMPQsDBbPEGhCX7VlPv+qZheypSgJOJ8T0FA5XZxVbF2fgIwlvHYQj8DFAYgD+tYqzwR0LpbOfJXKA9A4p+sbJc/0HoAQGWWD1V4TNSEUFgwY4hEIQY4ZNB7X9eD58LF2dfcB+DPe8Ir/Aj8AJmjhre5GEWYAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', '3'),
(46, '466144', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2VQYpDQQhEBa8leHXBazX0VJmfkPkzu67FDEQIdL9eWF9LY/uXsDtgfOAt/iZcZpYrd2UFjxKYe4Vlec9RA8MicPNKHmUwmwlWKOHwFsJkhjDfxW/QQHQrrvjWzQPIWOHLux8XAcRtQbgjI+rhGphgXbBY8j0VcKO4IBgG87Ir0SksVMMA+FAq6BVBRvGVEgjRTcdm76mHAK5sJhon9HotliOI4y7mKrqCbwoIZ+UKit9jXAVkdWEybIN8DuwhRHXROvhrqnw17hAiUAs+YV9tDcQV2scJNvtPABnj1mKpX2Y4go8FmIQxzVPA5G5hGjRw1Asg1l5yAvj/7PwUDQz+Js1T/Dm89DtM8Sb+AILMCqT053CdQjYOk4ByJBeCAv6MD7zFf4FfqSDlqVtlRycAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2');
INSERT INTO `settings_history` (`gameSettingsId`, `gameHost`, `gameId`, `qrCode`, `url`, `description`, `servingOrder`) VALUES
(47, '466144', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VQYrDMAxFBbqWwFcX6FoGz/+yA2mmq0qLGagorfOy+O6zlMh6U/IErC981N+EU0TGcp06LZcdcODjw81GLlugifFiAuayCeIa++buG6EiKaIPcufLqWMvOyC2badeTrMAsyZ2j3+wqw5x7RoRjpCZvA7hIFZkj+kOa4BOHzw2qB5XUA0yBxG7aZsgiagbJhY5pxnKEL8B1447djVDEdLvFCjGbeZ0QKQEBws+NJXUIaZUssHYXldQFcIufKC1+BA4QqpQSDkHStc9kI4Hv9e962rQlI9+5enJ1QxFyMKWITk176AizAcg5AYHlzkdMEVgaM1STAvcbxGOLeNOUAOE5HDG3YOqEPMKilv3oM8hhWy9E5pPUBHy4MbMs1vo3A74u77wUf8F/gCFzfe1X0FzMgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av katrinplommon, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta och mjölkchoklad.', '1'),
(48, '178198', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2V4QrCMAyEA32tQF490NcK1Lt2djr9ZfJDwTBd91WW9C6tMt6EXAHjDy/xnTBERNsIG51DK4HGC6SFrmEBVFE1lwaOYR1svQ/HvRIKaBRCqkA58HUKkoQ07ohnNz+HM6DH6G7rIQ9DZheAYwFbkCRsQdugBJrB7oIk4VI2FJP4xVF8EmJnOZpWjaLcE+UgR2xaiNGWznkY5tYdW2twg5EWQI5YNCZid10WhoUuOTrSlUBpDuSKHM6pAghFoAfKVpsrqYBwDUngGlewjcvB+XKUjw8miiD6lRk6Txj6VgEHcwUz2W6GJOT7jYe0sfrtZg4arWNzIVEV5L+Iwz3RQ5EaiMfZruyHOoiqkWwupQIa+TpRzx2XhDL3VfDg90c3E/A1/vASvwJv4P8DuOEIlwUAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '4'),
(55, '197151', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2WwQrDQAhEBX9L2F8X9reEdMZN05D0pocWYkvYvhzGnVW3sn0JuQLGAy/xmzBEZLjO0DAuW+Dg18VsrGUHNDEIBSGXXdBMXYTZd0KTMWcfpAuOx82lAsRpUSnVzqdZgBmTMrr/qEOsXT1d3nkdbhMf+OBZEaR1GPRDgYwv3uo1CJGJ3COLtgkGihU6kc9PMZRgKgXzh9V2FEMJomLhCDaAAxzU6YDIGl2QfmhaUocsBY4/epJ+NECeGNNWdsPRcUUoqaB0JKu3A0IHueNdLt/JFyGs1TmRP1ri2FEJMmgK2ou7WEJFuAYgrylZNdsBaQRpcFL7aIG8RTAG6AdulV2oAdIL8FMx1GHwvwRmgJ6FCpBWSPZVpNsdMA8OQnSDHjfAezzwEv8CX7Kv0nHjIAA1AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(56, '469492', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2WQWrEMAxFDb6WQFc3+FoC932PM6Rpd9KihdEmylvkO9KXkrZ+ifYEig98xN+E0VrzuYavudMS6CusDx/mSmugNfPRw4BKq6D1yfG5FkKXzJwP9QRUQcA9nlVKQLplJ751MwFfEZI6eR4ihAB2aI1SzxK41uhrqhJTal4CRx/HtJqGI5SEk1RaIX4dPgfDtmeZVi5bKQ8R0mSdAeMNSiC9wwcar13jCghSyzg3/KpSEuIs3+sK176FcpDJ769jz3HfDCnobCmXy1ToSygLwaZZWDeDJaEeL4P5Ht3rjVJQgWFNoxX3ZZWAoQVIOoeWP0kFdNWZlWJaK3GEkhAHWA8WIHvwffgCiG3Vvf3tL4P8S+BZ4RJIQbgJtBiwIrgbx6I+vz0V8Gd84CP+C/wCPpLd7X+obBoAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/vina-pedrosa-reserva-9500201', 'Smak: Nyanserad, utvecklad smak med fatkaraktär, inslag av plommon, lakrits, tobak, kakao, mörka körsbär, kaffe och kryddor. \n\nDoft: Nyanserad, utvecklad doft med fatkaraktär, inslag av plommon, lakrits, rökta charkuterier, choklad, mörka körsbär och kryddor.', NULL),
(67, '292396', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKElEQVR4Xu2VS2oEMQxEBb6WQVc36FqGTj17ZkI6WcW1SGCEF/JraInSx3H9YHEH2Bve7G/CGRE9Ws02u9y0wOSMFOrLdUAuVaJE6j4424hww2jXNboNokKVxM7lWiCFe9jXav4eYtK3KfXct3PINUv5L/pM/gyC8UcOVa49ox9CzUCpfNRv5X8O98/piTUOaYHqruQmZT5VOoTRJURvElnesEDyJueSaRYs8BFIekwcC5QGQ4poBygWcQ1wooW6QXv1GuwCB6S7JDKgXoU7haPxBYVpMg9k+9VF6qjigJg6Vn2rzl0zcQ5ZgMy/Xr++58wAk6MgLIEsDyTA2ipEdEKeU0n9Gq5zqOTVEltqC5QgqMumCva/A8Z++Cjbnthz+N3e8Gb/BX4AIx/UycEjudEAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '1'),
(68, '292396', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJ0lEQVR4Xu2U0YrFMAhEhfyW4K8L/lbAnbFZbm933/RhF66ENjmBmo4TJX8JeQLGBz7ib8ItIrZVLaOmI9CSyEWN0xmoWGKxAWs6BDFWer3HoAUyRTyyNyBOrst17adKDYhq6Ym3ajZghS9mO4s+RCKVFeHCZ4zAdNr1Mm15bAJucwgcDoz9k6gH8fVkzQKbdMUMXNQED11Rmfoww1mx+gWlLgMQCYTGwpYbNR6AVCSSQmRc7z7ciwMGM85sBmLhpQT88GoCPahU4xj3Vc0mhBFWnfpusB60LdQEgvDq2gRkbBqBXrg3qwbcbIDUhH2QbAIaR5y24idRE8IBuKr5fSHGIA3r3LonakJYC12lEo5ACEKLZRliCLJwCGhxnX0A/owPfMR/gV8Q+eNR1a1v1wAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '2'),
(69, '236610', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwQrDQAhEhf0twV8X9rcEO7PtNm3aU/XQQg1Jdt8hI7NqJN+EnAHjD0/xnTBEREXHzFAsrQUad+uhxl0HxEZ1hC0l7YNjzjDXTojVBO6D9MJ8wG09DClCHtwtnk/zc7iCdqAcrlGHMQJfhxt8+lYvQnPza9GieHtgogZgspDeTS5DsdCROLo501sgPk0pnBpo0ugGuNyFiKNkxxaqwpU7mOHWJiirXeEF+KFegUkNDBboJG3ugAETgqMFkod6DbITVuZ4+R4sdYhBhaTdHqquBtGuwXnKZhBqNkAGlpO9xasDcgCuM2M/bEOq0Fhjynow/qlaIAl7QKi4k69Dmjw4WXwn3wAxoTFRUQ1Hx5UgDcE2SO8FVoTwAQbjtwKW2+QafI0/PMWvwAvLzNwNkdEOXQAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '3'),
(70, '236610', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2V0YrDUAhEBX9L8NcFf+tCdsabdEPaN33YhUpob08eJhlHK8eHkidgfeGj/iZcIuKhuXQZjyPQeYWY+T5OQBOD0CLkcQqaaYjw6SehiWfOQboQzsPNkCZEt6hUavduNmAVntuXnj/6EOfQKJdPPgD9yIC3UYkgnYBJGd83XkItiEq8AdsGV6YgBoteLKhdYejCpRDiKMBqu8LQhAetODITflBnAsLiEsKHliV9iMmSChjjdQl1ISSixoBL4Jq4JtSstEKOqZiBJhyvBYnfgLUhIqCZMESYtAnIwg3swLJ5CzVhLUDlOMjO7ASkERBC23xv7AHIf5EFLSp6nkIDEClAcPl1E2pCzCpahwm7CzUgDXFuAPhtjNgAZOPQsaAb9HgAvtcXPuq/wB+EkOE1sey2VAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '2'),
(71, '236610', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABNElEQVR4Xu2VQW4EMQgELfEtJL5uyd9Ccrqcnd1kkhscEmmZOdh1ATeNPfYvMe6AeMNb/E2YY4zI2DOms2yBsdNHTFtn2QN9uGtnM1i2wVgkSO+E+m2tRhhkENyTM/RAdcsf8a2bBUik26Zzn1GHaStByoguLVCx9pIYMoOdBtZhDpvyLN3T4spehLHX0k6NYxx6IIIwBqf4+Si+Bg/GsSFd0KMBJvYyVJba+XRdCeIsQmLrFJisDjOUKtIpXnK3wKPHlFt1G8Q1sEWYmMumn0zPbtbgZhBIMEOl90C5YMpeOEE3jFgDJBgwvVFxNGmA5wLUzeIYjeZ1wEBnfRIDW7RAZQgmgPfZOEoP1FaFk+Yqvg6pP+mf5ZfiC1DEjeJV+mviavA0TsNwHr0e+DPe8Bb/BX4AYDnsOSGNEBEAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', '1'),
(72, '737931', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2UUaoCMQxFA9lWIFsvdFuFem9GnPdGv8z9UDCI0zkO03iSxvaLsCtg/OAlPhMuMwvfK/fkMiUw+QHxFcdSAMMicpiDY6mDPuceuCqhgS4hpAXooJNTSBOycPf4X833YQV87DnyuOnDZdUFRzs8hHQhDdMEmiFPIR3INQzjC6LpWgCRsA80rSWlPHbvweCBnXPwuzwLoK9k+jwJvkn7EHesXe7hFC6BiyZQMuqYeEICWa7htIzUNRCvx/uRdmQ9oYALjYAByPGCS0rgkX39FHQtgdijmgD5V90UEMF5SsVnh/Qg31+ZQwqOwpbA5KDm+MNGKoiS8XRhr7sRDWQXcItFLyrIsTowCfhXFDDBs4a0nyeuCWEhqCTRuH+r2YDP8YOX+BZ4A8Ej+dFbn7dIAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '4'),
(73, '737931', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VUQrDQAhEF7yW4NUFr7WwnTFp0qb9qn60UEnJ5m1g7Oiasd7EuALGH17iO+EcY9hymTI1lx3QcLm5quWyBepQPChhLpsgnpE3s2+Egqwj+qDx8kw+lx0QaeseT9UswIwp2y+jDrF2iQiHyMYboAU2ssdQOdIOCEvUnDVzO4RqUFasgBx2tQkueCHhihMLnb0ZipA3R9OKC7rsHAIlyBW0sOHGN1pgMpiBsqUlDTALJ/SYx3YXqkI2LOcAh8DhUg0O8bsjkUoNEDc+sBNoRw+cyJjdRWOOf1SCDIrhwNLmTagIJwcgAAbL1rMdEJmzF7LF7DS5BPkVCX6hOaZjF2qAlHLuPQoVIYQGZ4Bc1D+FNAT2omYTNj+4VIAsHBxON9C5HfA1/vASvwJvRJLniSPt5LoAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '3'),
(74, '737931', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2WW2oDMQxFBd6WQFs3aFsG91x3wpBp/6SPFqIQYh/DXOfqkdj+JewJFB/4iL8Jl5lF7hU7z7IFxl4+ppmHlj3Q2c6xHKhlF/SRuSefjTAkk/lQL0AZAtbRbUgRki2/4i2bBfgdK3KNa12HCCFwygGrswfG3kqbivZ40gHRGTljeujkpV6CO3lRtGjAr8tXIRuKK6lZ6bXANWDTrwbjGzRALq7HTxv4IY87IIGCrEh50wPxIpZcHqcyGuBSQyltHN5DoAgPMipBRr+EilDP3mf63wVWh1NTlaypdaMDKrDY1VrHnAa4NABZ62fq6HTAkMno8D7564BUAFsGoNs9vTsgYhOnMaUN0rP0rfJ3GVKEiLCTHRoxPVCJk5D+9ujuDfBnfOAj/gv8ArMi7WWvsQEhAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/barbera-del-monferrato-7496001', 'Smak: Fruktig, kryddig smak med fatkaraktär, inslag av mörka körsbär, örter, lavendel, anis, björnbär och choklad. \n\nDoft: Fruktig doft med fatkaraktär, inslag av mörka körsbär, plommon, örter, lavendel, choklad och svartpeppar.', '2'),
(75, '737931', 'TestFelix1', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABM0lEQVR4Xu2WwWoDMQxEBfotgX5doN8yuDOqm2w3uUmHFqJD1nkJjDwei5X9puQOWB94q78Jl4h47uU7azkCfS/TEDHncgYavoYuA+RyCppm7sBzEDplMm/qDUhD0D5/ehrShDgtO/XrNBvwu5bn0rPuQwhBoOIAq3MEsvKEtjwZgEgsOg8N8x3OvwxAsCX8cPCfHXUhHc5EGjRLaQDCW4BzwbCDEWhM1Q6FH/R4AALDkLIC5/cIQwuieWiU1bRmBoJV4zvjOQSakDfVA0moxxHqwvKCfV8C1oQOT5AwnBqv7mm+B1ncAK/Wug6rBlwcgIqACYc/2ARE85h+Tmd4a0egUYADEHPw0fwApEZgCDBnU5ABwwgkHoG0AgMQWhrXgHVgHRyE+NrD3gfga33grf4L/AJAntl5jcPuswAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/villa-righetti-7630801', 'Smak: Kryddig, något utvecklad smak med fatkaraktär, inslag av körsbär, kanel, tobak, choklad, plommon och vanilj. \n\nDoft: Kryddig, något utvecklad doft med fatkaraktär, inslag av torkade körsbär, tobak, choklad, plommon och läder.', '1'),
(76, '655774', 'Carina', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2VwYrDMAxEBfotgX5d4N8SZGfUbEqzvXkOXagusZ8hVkYjxY43YXfA+MJbfCZsM8vVWVnBpQTm0ZFl5rPUwLAIXlDJpQxm+TAlxHKtJYQUxFcbRH4KsglRrTjjpZobkNHeTP+xEcBG4mALN0IPl0BUDPo6PJs8TwVs6EA0D/u9fQ/yIry+2Aw0mgL2vH7aFsnXmfweZMBeMO46Rg8FbO5nx8OUQABUDsnTFTSZAKJj4VgoATDGFUDWK/kJPLxctwWb3nJ8wqhcEjjdBUmmIQ4NbA5+tKo5hA4wAWTAuECRo7cAzgBEMwTHYJ6F24U5+TvF6GsybMKgDHRt2DARhBvoMXsmvw8fjVCUOiUwyWdc+dVcu3AKh38K82fTCuDf+MJb/Bf4A7Ym6D0YI8ZhAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '1'),
(77, '821963', 'felix', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABKklEQVR4Xu2VwQrDQAhEBX9L8NcX9rcEO2PatKS96aGFmhx2Xw7KOBrJDyFXwPjDS3wnDBHx8Fy+jMcR6Hh37qW7jiPQxAw0DCE2Bh058IzDpWsOUoUQf1epAdEtalF6vHazARno3A49zhMwxOgwVr+ctQ9AqKy4A3qUJhMwUTfysIPIOQKj0sAGylnYOQFLEdRPVcDv2bvQILHyhpw2BKtdwWHIPBO1IEyrQTUEbdOHSj2Yx5WjGlyDI3Ch7GodbAtxJiBWipDVFnw0rgmPRHSEvhisB2uZUhFYQpBmAjKCyx8yx3PiWjBqAYJSlPLuAHSOv+be3CxMOwCt9rTTDjII6Qf+puIsvg9BIck+xmECUhAYoUp/GqwH2TjWvvHtnI4efI8/vMSvwBs0aLu1TJNDKgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, choklad och hallon. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, choklad och hallon.', '2'),
(78, '855185', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2VQYrDMAxFBb6WQFcX+FqGzn92U0I7O2kxAzVt6r4sfniSFXv8suwdsL7wbf1NuMwscsw1lrNtgcEnzT3OtgO6uYIWkG0XdB9pxtN3QreYsw9iIXX5sFSAqhZJO+1ezQLcS88tKc8/dbjGI0duy7E2r0PolIfcHQGtQxk2xcS5caVX4VTRxlLZVLsmOOgx0KAlogPym5QN1X41QxHOmVLLJYOcBrhoAjo20IKSBighOv+ywe4KKkKHQhgC14krQo1pHGNkvqpZhIHniYp71xWhTutSTkj31QxFyFLhNAO35hNUhGcA8pqy07MdEBFOe+mrsBa43yJIYUzPZ1AD3CPAGTG3oCJM3ntJm92CChAhJ2Jt2x2QwnFcsYHjBvi5vvBt/Rf4Awz62mmcxJF9AAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '1'),
(79, '855185', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2UUWoDMQxEBb6WQFc36FoG942Sbui2X7U+WsgQgv0Mq/FYtu0fZHcgveFNfxMuM/OYY43lDKMFBr/Jn7OmWQfUZPnYVcn7YG2hGWbuvae3Qapgnpyjhi1QB/fU19P8PZTIGOcyLp3DxZz+2jlFP82fwT0j6QPyoHHpiQ64KooxVW+V/wYYNMK0WORbZ9cDK+MgmVdKp3BvejYJ2Vy8A7qynSMRd6EFopy6rFHLPZA+GJSwoT1I51CtRb5uz5UWaME4aTAqXQd3DCmgZ0qPVVyFjiDGFa6s22X+DEpYzlnBaHYO9QDSBy7/9QZ0wKiz22pYRdwCVYCcR1XMRlj3Sw9rdEG+v7hf8dhFAyQQCrHCgrbRAckB59j38bix5/C73vCm/wI/AOgP2Ik8rb7EAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '2'),
(80, '867264', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VUWrEMAxEBbqWQFc36FoCd0Ybb0PaP+mjhRULcV5gx4zGsuxfSp6A9YGP+pswRcSXRmoalyPQ+Vti5q/lBDQxCCUhl1PQTJcIdz8JTTxiDtKF5VzcDGlCdItKpXbvZgNWYd8w5Xrpw9S9dJXLnsUnYCKxiFglgnQAwgaP5a8PR6gHNzdumsLQTkFEobxIhc4VhibEI6ACNejZSUgP7oAb8CMCflBnAlYcKIG2lSV9mHzj3hmvI9SF9LYIh8BxqQk5ppGGWMDvxjWh0Q8EzPd3wLoQp8Cc3cOIsXdCWpDF2cdE5BkCTVgDEP8fvKeoMwHLCAjxloLYCOQtAhGlosclNAHhBa2m7BTcPLHYvt6FGpCGWJ0rzpebSw3IxvG40g16PAB/1gc+6r/ALwT20UXupBSGAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '2'),
(83, '643737', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJElEQVR4Xu2VwQoCMQxEA/mtQn49kN8q1Jnsirp66xwUDMvavh4mm0yjrQ9hV8D4w0t8J5xmFnOMWNVLCYxFlDaCSw0c2GIzAXspgnh8Zf/KYBSUqi7qGxCZD0/uudRAdGuc8dLNDdiRTrVzsw8hNMyr0vguCaQIyjto2q6JBEYCVQJnnMlvQtjV8+hZ0hUKuJg0TAvPerWSAkKEpk1HWfAFClhtWrDV36CBiOktV+tekD04jY1jLY4TCYT/j0pU31oJRDUcOScP7o3bhVxVZ/3suj2IcRLVxuXVDQVksNC8WvN5WG3AyQFILdyE1lHAWBz8LHJ0cRQQDoC/+B9lj+ktgMBQ4pEQ4r7Cs8QSiIJQ6BiEItiNG927zl0A3+MPL/Er8AZE89+RkMJfLAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '1'),
(84, '155360', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2WwY7DMAhELfm3kPh1JH4Lic64btJ69waHXalc4rwcBg1j2pG/1DgB6wuP+pswxhjqGZq+ji1QM2TaGKI89kDBq80QQB67oEz3NDwbISXU/VAvQBoitPh0qQAxLdn1Mc0CfBZmF3Of6xBCEFhxgNXeAzG13KFdGeuAGpRRmJymr+aLEEIxVmhN9K35Ggw6gcxOX0p1mDYZ133BkLQOCC3abBN+0OMOyGAZBdI5wQ4IRo8xOp74rQM6FfDqdi+BIlQbzBhvrV7TLELsqWDGlLZcAatBXX4gW+vqvpovQRY+CK9WvC+rAoy1AIH4IOuA+tQx4VqJLVSEHBlsNu7Bq/kOCDETRM0aoWEHoP15J6QEISLr54QXrAlycBTi3x723gB/1hce9V/gA/Qs3bHBXKuUAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '2'),
(85, '155360', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwW7DMAxDDei3BPjXBei3DKSknLRbutPEwwZUTQvn5UCFptVx/FDjDlgfeKu/CdcYYx5hy5bXUgEnrpjhPmspgT4cN05YSxHEPfpm90Jo6DpTByevoB17qYBo28/6tpsNWLVsf6v6EOuwzAyIbK6ASJdVxrBzpAJYhhQ/Yl5CPXgkPxBiaGUwELBw41tcYWhC5orJssATfw6BFuTt8AEGP6ijgOg7MakQBbwALRHARRkEjPF6qbfgqnAxWhwCl0tNSC/KYuBSEsAyeG8e7dBAsGS6cCSeCelBFnYNSSibt1AT1oEFCJ5b6iggjUD3mKmzbFFA/ovUpILizFNIASGFyfI1DH0IPzgD7Kb+W0hDEASECz+MmADWoHaeq0QiTqEefK8PvNV/gQ91IMdtGWXlEAAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '1'),
(86, '558125', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VQW5EMQhDI3EtJK6OxLWQUpvpbzW/s4sXU2lYJS8LBxPI2i9i3QHjA2/xnrDXWtGxM9K5lMDY7SvSapYa6MsdO8vgUgajKNCuhMNLCIMK8Bcmx5NLBxDV8u94quYBZLRbW9VjI4DYte00KMIPk0B4ULsSfgTPQwKhACE0w7Jcl9AprKrZUUwD4Ua7ow3m8hkSSAInnL7QDwGEEnlNGn09sDMIgn7F86LanCkgXj+bFZff83DPIevGDHgaV8MeQg6BebHj8lW4M0iRjkcKtTWwOU8gUqjazD8BHKnArTH/xhMBbA5A/Huc11M8BYypFrsVc4C3F0AozK35PxtT0UDa7CPz+5JP4fxPGNZpzEMAYQj+E1iNq/903CFk4TCikQBENPBvfOAt/gv8AnPd5W31HXRqAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '1'),
(81, '867264', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABJklEQVR4Xu2UwQoDMQhEhfyW4K8L/lYgnXG32zbtTQ8tVEo3+/YwMhmV9aFkB6w/3Oo74RQRm6q2Io8t0BaRixqPPVDxSg6YxyaI31iezzZoga4jNvUCZOfDdczdpQLEbelZL7dZgFkOP+DJUXUIIZUR4cL/6IFKR47QZsY64JgYBHOYvNzuzRch3pkFqDhT0QIpBIeR2RGpVIcYAOQ19Q5fWmD2jUvj6RKqQbzFzHDx1AMRV00v8OUSqkFqnAHzxxIoQuPFWcrx2QLROITo71PAqhAtI1wwhKN7Nl+DrBwvZuF5WRVgLkDIYLNo6nRAW9cQzHS5AcINmgsdeWzvDjhzU3O+2qBwYp3zcBpShDCEQtgttLoH8uKgBbGj9wb4Xn+41a/AG7iw0Qkfv1sNAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '1'),
(82, '643737', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VQa4CQQhESbgWCVcn4VokbVX/cdTRHSz8iWhi+xYWU1SjrA8lV8D6wUt9JywR8VzlK/dxBPoq0xAx53EGGr6GlgHyOAVNM1fgcxBSwjMv6g1IQ3CON5caENOyo16m2YB/VUB6nPsQQhDYcYDVOQLhQZbSCZhMTyZgaHiGB432o/km5E8nQgsN8PsT9eDCZWVokVnNrdSHpXTEjguGJ5iAmBsaR//wg08yAR+3AFG4u9SDi+YisVDZkZiAJfRj68RjCTTh1oArdPgcXBM6M6ts+zl1PQghvJJqnOEEZCFkxqtVz8uqAYsLUGgxlz/YBHS8oYNEOG/tCOTItLAAsQfP5gcgxQJLAKaMQeP/HtrXMww9CBF2DzuQ3iG4Byce0Nq9D8D3+sFL/Rd4AyMiyRHCtPBWAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '2'),
(87, '558125', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMUlEQVR4Xu2VUQrDQAhEBa8leHVhr7WwnbFJSJN+VT9aqFnI8gLRjBNX1puQK2D84SW+E04R8TE9PIzbFuhYU0x05LYFmhgWclneu6CHLu5aIWoOjT7oWGPFXaUCRLdsi5duFiBjimlqklGHAEIGoYPCdECou8Yk9JmadECCsegvJNwFqUG8feHiCsWtA4IEHCbP4mPLXoSbvzw/w3ogRgD6lsMFirfAqbiybrRND5VKEFiU5mLKI3sRphaDBguduyA1yLezejPabBekBuktlE97nQ1WgugatAXGI35GB2TgiIJpYd3jj6vBHIAkgTmY/WuAjvo5AJR/VxM0HnxoHc/nHKw90HNKwxPnREUIq3JYoX27aYuQguRoQemHwYqQjYMeGIN4du7m5/Aef3iJX4EPhLvyyWJ9gYkAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '2'),
(88, '289275', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMElEQVR4Xu2VwWrDQAxEBftbC/r1Bf2WQZ23jjFxe6p0aCEiB+8LZOTRjmL5Q9kTUB/4qL8JDzObNuIYx9Sjt0Dns1xo7scOyCFCFKXZB4+xzLqhjcw12yAuRCSe3IYUIYN71fs0fw8p+Ss3aJyqQ/mrwan/Bb2ar8GMiGNyxZbExku9CBc50PiY3+6/AUoq9zsgdjVfhWp5xwDcAznpvg6ZbHzbAuWD0/jQzV040gD180HEZPHYLtchUjsCI4lYdkCFyyNDa0C9sws6oHa0b5OldA+uBln852bRO/ilXoOSUK6SROBKB6Q0PN0Hbi6nOmQBevK/pz3YBT3ZVI6YHnrglIAm51uxE+rCchnuxJUhcdVK9Z3cDihDiKyOx5bsgHauaMZ2JrYOv9cHPuq/wC91ae+Bkj1mAgAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '2'),
(89, '289275', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABMklEQVR4Xu2VUYoDQQhEBa8leHXBazXMVtmzyewkX6sfuxAZOvZLiEZLI8cbkzugfeDN/iZcIuJH6NJl5U5AxxMeZl7uCDQxXIyw3CGIO/Jm9oNQkXXmHHQ+UcmXOwGRtp32o5sNWLaQPX7Btj7EPTQzA0FW8T6kQbLUmO5gAxDtImPPwvmRPly4LVKKdgpCsJphmFjEeSikBY/kl6PWoVDZtxh6EDcoDLES9WCcCQgPDVtSJ0syAFENP4+qxwTERuG46sEl8Jy4FqyuJUoMXJEGIPPNOq8C60HbU0WhyUMMPUhD16CEKvMO1IR7AYpjs2zNTkBH/ppUGaXmI5D/IjUEXNOctCHIUMH3roGaMLmsIV29Rf8tZEGYOV5R5kuVGrAah56xGuFnoB58tQ+82X+BX4cI4xWjT3QOAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/la-rioja-alta-746201', 'Smak: Komplex, utvecklad smak med fatkaraktär, inslag av plommon, tobak, kaffe, torkade jordgubbar, vanilj och nötter. \n\nDoft: Komplex, utvecklad, kryddig doft med fatkaraktär, inslag av plommon, dadlar, tobak, choklad, dill och nötter.', '1'),
(90, '203847', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABL0lEQVR4Xu2VUYrDMAxEBb6WQFcX6FoC74wSQ0j3T/rYhYrSus+QscdjRfYvJW/A+sJX/U2YImK+IlcqhyPQ+HFRtWs4AVUUQknI4RRUXS7C1U9CFYuYg3TB8fXhUgPitKhUas/TbMCqWve6//Rhru3Ly2XL4n24YQZ98EoEaR8mni/LLWriFmrCHTuw9qzQTkE4DB3c18VI2ASEAmzmVYDVehLSg5sC2EAE/KDOBAzn2suPVZb0YfJS0WXG6wh1IToKDg+Et+G41IVXm8YeODcDlRKIQu1jnx31oDlWHAGj0WHO4nuQlfTZmNxbqAmrARozIVdmJ6BdebhTYSOQb5FES6UibsQYZMC8fh5CTeh877ETPIUasKxgB4DfSrsHYL34pLQ4MwE/6wtf9V/gD4DO74Grv0JYAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '2'),
(91, '203847', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLklEQVR4Xu2VwYrDMAxEDfotg3/doN8yZN8oDm2TvUmHXagI1H6HjjIeOe34pdodqL7wVn8TrtbaOKYtWz2WFXDwzDF7H7Esgb11bRYwlkWQPX2r+0JoKLnXQXV+4MfDpQSk7b7r4zQTMGoZUrY3eai9uftEZAXPQ6gTWWWMkxPNw9U0Azo2rB6Xeg4efpIIbRmM9jty6OwwZCF7ly3TSNkVhhxcmn827vghnQqIC3QfflhYkofx90QMmzW2p1AShreuaOkSuAxJwkZew2LTGdbACD8hO73ZzSfh0Gx1XoEr5hWGFFSh4DPeYQslYVyAAG6WM7MVcKDTLNQIxCiB+oooYlKU1VVQQztxRbJlUKPA4Oo6qIAyREHgF5vfXErA/eELN5izCvisL7zVf4E/Ykb3ebW9ehcAAAAASUVORK5CYII=', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '1'),
(92, '247136', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLElEQVR4Xu2UUWrEMAxEBbqWQFc3+FqG9I29KTTtV6WPFlYsRH6EjHYky64fwp5A8YaP+JtwmVmYz+UrSLMFpn4jQbHTDqjDnFApRR9cPsy6ofl1jWiDcmFOzM6dtkA17hVfu/l7qMBfp/Q8pzrUMSf1b3oXX4T6/NKIDTrnL6Ei9HXmQP0LvdEA+Tg6S/4O9a4B7rliEORz7r/SABdCEY7JFuINUIUn+SQQ7YEsqomSLPbtch2CI1kBXFmUFHWoURjsVPSuoV3QAV1bZWEySnfjypB8aqtqKvIWqkFqzy1yXOmAipWaB+1/neoQk033H18Y3SaYlzZVamBJeiB3igkL7RdrhbRORn9erjqkeAb3WN0CMSR0CXhuyQ5oZ0WrbefG1uH3eMNH/Bf4ARGd35GL6/CHAAAAAElFTkSuQmCC', 'https://www.systembolaget.se/dryck/roda-viner/ecoltura-7912501', 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \n\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '2'),
(93, '247136', 'TestFelix3', 'iVBORw0KGgoAAAANSUhEUgAAAKAAAACgAQAAAACjtFqAAAABLUlEQVR4Xu2UUQoDIQxEhVxL8OoBryVs36Ruabf9Sz5aaFoWfcKOO45px4dqV6D6w0t9J1yttXG4LVs9hhVw8PfhvY8YlsDeuiYLGMMiyJx9a/eF0FCasw5q54fLjvuwArLtvuvlNBMwahlStid5qLnNOR2RFbwCAiwyxsmJFkD84LwmNh8+TqEk1MsnWYjc1kCUejMsXobODkMSIoEQvjgr/dEEUhAXHCksZiSdChj3wKIH6FkB5QeOTFe8TqEsVMCiD6gJnC5l4ZIb+snrGkhg+YChJMiOGkiwXI+4EqdQCqokxopsvgslYTRAzA2npVMBwwjs7btXV0DyxYjYqk3PLVQAcVrd6ikMeYjDoiw9CSWgDNHOh+6ZvqMA6uDYfbhBcivge/3hpX4F3gCz1tGBJqYGuQAAAABJRU5ErkJggg==', 'https://www.systembolaget.se/dryck/roda-viner/apothic-red-642008', 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \n\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '1');

-- --------------------------------------------------------

--
-- Tabellstruktur `user`
--

CREATE TABLE `user` (
                        `user_Id` bigint(20) NOT NULL,
                        `username` varchar(255) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        `activeGame` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `user`
--

INSERT INTO `user` (`user_Id`, `username`, `password`, `activeGame`) VALUES
(1, 'Felix', 'hejmorma80', NULL),
(2, 'Carina', 'qwe', NULL),
(3, 'Linnea', 'katt', NULL),
(4, 'Vinberra', 'vatrodu', NULL),
(5, 'TestFelix1', '123', NULL),
(6, 'TestFelix2', '123', NULL),
(7, 'TestFelix3', '123', NULL),
(8, 'As', 'df', NULL),
(9, 'Vinproffset', '123', NULL),
(10, 'cartop1', '123', NULL),
(11, 'cartop2', '234', NULL),
(12, 'LINTOP', 'kanin', NULL),
(13, 'lintop2', 'häst', NULL),
(14, 'hej', '123', NULL),
(16, 'LådvinsViktor', 'Vin', NULL),
(17, 'Tove', '19980109', NULL),
(18, 'Lillamy', '7Bubbelgum', NULL),
(19, 'Ingalill', 'lillan1448', NULL),
(20, 'steffe rfe', 'rioja', NULL),
(21, 'dagny', '123', NULL),
(22, 'JUKKA', 'vino', NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur `user_guesses`
--

CREATE TABLE `user_guesses` (
                                `userGuessesId` bigint(20) NOT NULL,
                                `username` varchar(255) NOT NULL,
                                `servingOrderGuess` int(11) NOT NULL,
                                `descriptionGuess` varchar(8000) NOT NULL,
                                `gameId` varchar(255) NOT NULL,
                                `regionGuess` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `user_guesses`
--

INSERT INTO `user_guesses` (`userGuessesId`, `username`, `servingOrderGuess`, `descriptionGuess`, `gameId`, `regionGuess`) VALUES
(39, 'TestFelix3', 2, 'Smak: Kryddig smak med inslag fat, körsbär, örter, hallon och vanilj. \r\n\r\nDoft: Kryddig doft med inslag fat, körsbär, pinjenötter, hallon och vanilj.', '167419', 'Kalifornien'),
(40, 'TestFelix3', 1, 'Smak: Generöst fruktig smak med fatkaraktär och viss sötma, inslag av björnbärssylt, vanilj, blåbär och mjölkchoklad. \r\n\r\nDoft: Generöst fruktig doft med fatkaraktär, inslag av blåbärssylt, vanilj, mynta, björnbär och choklad.', '167419', NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur `user_results`
--

CREATE TABLE `user_results` (
                                `userResultsId` int(11) NOT NULL,
                                `username` varchar(255) NOT NULL,
                                `playedGames` int(11) DEFAULT '0',
                                `numWinesGuessed` double DEFAULT '0',
                                `numWinesCorrect` double DEFAULT '0',
                                `correctPercent` double DEFAULT '0',
                                `wins` int(11) DEFAULT '0',
                                `isBacchus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `user_results`
--

INSERT INTO `user_results` (`userResultsId`, `username`, `playedGames`, `numWinesGuessed`, `numWinesCorrect`, `correctPercent`, `wins`, `isBacchus`) VALUES
(1, 'Felix', 2, 6, 4, 0.67, 1, 'false'),
(2, 'Carina', 2, 6, 2, 0.33, 1, 'false'),
(3, 'Linnea', 2, 6, 0, 0, 0, 'false'),
(4, 'Vinberra', 2, 6, 3, 0.5, 1, 'false'),
(5, 'TestFelix1', 15, 48, 21, 0.44, 13, 'true'),
(6, 'TestFelix2', 11, 36, 11, 0.31, 5, 'false'),
(7, 'TestFelix3', 9, 20, 8, 0.4, 8, 'true'),
(8, 'As', 1, 4, 1, 0.25, 0, 'false'),
(9, 'Vinproffset', 1, 4, 2, 0.5, 0, 'false'),
(10, 'cartop1', 1, 4, 1, 0.25, 0, 'false'),
(11, 'cartop2', 1, 4, 2, 0.5, 0, 'false'),
(12, 'LINTOP', 1, 4, 4, 1, 1, 'true'),
(13, 'lintop2', 1, 4, 1, 0.25, 0, 'false'),
(14, 'hej', 0, 0, 0, 0, 0, 'false'),
(15, 'Sara', 0, 0, 0, 0, 0, 'false'),
(16, 'LådvinsViktor', 1, 4, 0, 0, 0, 'false'),
(17, 'Tove', 1, 4, 2, 0.5, 0, 'false'),
(18, 'Lillamy', 1, 4, 1, 0.25, 0, 'false'),
(19, 'Ingalill', 1, 4, 1, 0.25, 0, 'false'),
(20, 'steffe rfe', 1, 4, 0, 0, 0, 'false'),
(21, 'dagny', 1, 4, 2, 0.5, 1, 'true'),
(22, 'JUKKA', 1, 4, 0, 0, 0, 'false');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `club`
--
ALTER TABLE `club`
    ADD PRIMARY KEY (`clubId`);

--
-- Index för tabell `club_member`
--
ALTER TABLE `club_member`
    ADD PRIMARY KEY (`clubMemberId`);

--
-- Index för tabell `club_wine_stat`
--
ALTER TABLE `club_wine_stat`
    ADD PRIMARY KEY (`clubWineStatId`);

--
-- Index för tabell `game_point`
--
ALTER TABLE `game_point`
    ADD PRIMARY KEY (`gamePointId`);

--
-- Index för tabell `game_result`
--
ALTER TABLE `game_result`
    ADD PRIMARY KEY (`gameResultId`);

--
-- Index för tabell `game_settings`
--
ALTER TABLE `game_settings`
    ADD PRIMARY KEY (`gameSettingsId`);

--
-- Index för tabell `game_setup`
--
ALTER TABLE `game_setup`
    ADD PRIMARY KEY (`gameId`);

--
-- Index för tabell `judgement`
--
ALTER TABLE `judgement`
    ADD PRIMARY KEY (`judgementId`);

--
-- Index för tabell `lobby`
--
ALTER TABLE `lobby`
    ADD PRIMARY KEY (`lobbyId`);

--
-- Index för tabell `lobby_data`
--
ALTER TABLE `lobby_data`
    ADD PRIMARY KEY (`participants`);

--
-- Index för tabell `lobby_history`
--
ALTER TABLE `lobby_history`
    ADD PRIMARY KEY (`participants`);

--
-- Index för tabell `match_history`
--
ALTER TABLE `match_history`
    ADD PRIMARY KEY (`matchHistoryId`);

--
-- Index för tabell `result_data`
--
ALTER TABLE `result_data`
    ADD PRIMARY KEY (`resultDataId`);

--
-- Index för tabell `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`user_Id`),
    ADD UNIQUE KEY `username` (`username`);

--
-- Index för tabell `user_guesses`
--
ALTER TABLE `user_guesses`
    ADD PRIMARY KEY (`userGuessesId`);

--
-- Index för tabell `user_results`
--
ALTER TABLE `user_results`
    ADD PRIMARY KEY (`userResultsId`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `club`
--
ALTER TABLE `club`
    MODIFY `clubId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT för tabell `club_member`
--
ALTER TABLE `club_member`
    MODIFY `clubMemberId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT för tabell `club_wine_stat`
--
ALTER TABLE `club_wine_stat`
    MODIFY `clubWineStatId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT för tabell `game_point`
--
ALTER TABLE `game_point`
    MODIFY `gamePointId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT för tabell `game_result`
--
ALTER TABLE `game_result`
    MODIFY `gameResultId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT för tabell `game_settings`
--
ALTER TABLE `game_settings`
    MODIFY `gameSettingsId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT för tabell `judgement`
--
ALTER TABLE `judgement`
    MODIFY `judgementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT för tabell `lobby`
--
ALTER TABLE `lobby`
    MODIFY `lobbyId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT för tabell `match_history`
--
ALTER TABLE `match_history`
    MODIFY `matchHistoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT för tabell `result_data`
--
ALTER TABLE `result_data`
    MODIFY `resultDataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT för tabell `user`
--
ALTER TABLE `user`
    MODIFY `user_Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT för tabell `user_guesses`
--
ALTER TABLE `user_guesses`
    MODIFY `userGuessesId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT för tabell `user_results`
--
ALTER TABLE `user_results`
    MODIFY `userResultsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

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
DROP TABLE IF EXISTS `game_setup`;
DROP TABLE IF EXISTS `game_settings`;
DROP TABLE IF EXISTS `lobby_data`;
DROP TABLE IF EXISTS `user_guesses`;
DROP TABLE IF EXISTS `judgement`;


DROP TABLE IF EXISTS `lobby`;
DROP TABLE IF EXISTS `game_point`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `user_results`;
DROP TABLE IF EXISTS `game_result`;
DROP TABLE IF EXISTS `match_history`;
DROP TABLE IF EXISTS `result_data`;

-- --------------------------------------------------------

--
-- Tabellstruktur `game_setup`
--

CREATE TABLE `game_setup` (
  `gameHost` varchar(255) NOT NULL,
  `amountOfWines` varchar (255) NOT NULL,
  `gameId` varchar(255) NOT NULL PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `match_history` (
  `matchHistoryId` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `userResultsId` int NOT NULL,
  `datePlayed` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `gameId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
-- Tabellstruktur `user_guesses`
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

CREATE TABLE `game_result` (
 `gameResultId` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `gameId` varchar(255) NOT NULL,
 `url` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_guesses` (
  `userGuessesId` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `servingOrderGuess` INTEGER NOT NULL,
  `descriptionGuess` varchar (8000) NOT NULL,
  `gameId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `user_results` (
  `userResultsId` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `playedGames` int DEFAULT 0,
  `correctPercent` double DEFAULT 0.00,
  `wins` int DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `game_point` (
  `gamePointId` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `gameResultId` INTEGER NOT NULL,
  `username` varchar(255) NOT NULL,
  `points` INTEGER NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `judgement` (
  `judgementId` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `servingOrder` int NOT NULL,
  `personalGrade` INTEGER NOT NULL,
  `gameId` varchar(255) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `result_data` (
   `resultDataId` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `gameResultId` INTEGER NOT NULL,
   `username` varchar(255) NOT NULL,
   `servingOrder` INTEGER NOT NULL,
   `winePicture` varchar(8000) NOT NULL,
   `wineName` varchar(255) NOT NULL,
   `wineDescription` varchar(8000) NOT NULL,
   `grade` INTEGER NOT NULL,
   `url` varchar(8000) NOT NULL,
    `personalGrade` INTEGER NOT NULL,
   `averageGrade` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Tabellstruktur `game_settings`
--

CREATE TABLE `game_settings` (
  `gameSettingsId` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `gameHost` varchar(255) NOT NULL,
  `gameId` varchar(255) NOT NULL,
  `qrCode` varchar(8000) NOT NULL,
  `url` varchar(8000) NOT NULL,
  `imgSource` varchar(8000) NOT NULL,
  `wineName` varchar(255) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `servingOrder` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `lobby`
--
CREATE TABLE `lobby` (
  `lobbyId` BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  `gameId` varchar(255) NOT NULL,
  `gameStart` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tabellstruktur `lobby_data`
--
CREATE TABLE `lobby_data` (
  `lobbyId` BIGINT NOT NULL,
  `gameHost` varchar(255) DEFAULT NULL,
  `gameId` varchar(255) NOT NULL,
  `participants` varchar(255) NOT NULL PRIMARY KEY,
  `score` INTEGER DEFAULT 0,
  `ready` INTEGER DEFAULT 0,
  `done` INTEGER DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `user`
--

CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `activeGame` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

COMMIT;
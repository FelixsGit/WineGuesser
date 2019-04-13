SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `recruitmentdb`
--
DROP TABLE IF EXISTS `lobby`;
DROP TABLE IF EXISTS `game_setup`;
DROP TABLE IF EXISTS `game_settings`;
DROP TABLE IF EXISTS `lobby_data`;
DROP TABLE IF EXISTS `user`;
-- --------------------------------------------------------

--
-- Tabellstruktur `game_setup`
--

CREATE TABLE `game_setup` (
  `gameHost` varchar(255) NOT NULL,
  `amountOfWines` varchar (255) NOT NULL,
  `gameId` varchar(255) NOT NULL PRIMARY KEY
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
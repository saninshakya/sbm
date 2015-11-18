-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2015 at 01:52 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sbm`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `return_current_form`(IN `team_idpara` int)
BEGIN
create temporary table tmp_last_fix engine=memory SELECT DISTINCT
	gf.fixture_id,
	gf.fixture_date,
	(
		SELECT
			team_fullname
		FROM
			return_gameweek
		WHERE
			fixture_id = gf.fixture_id
		AND home_team = 1
	)AS home_team,
	(
		SELECT
			team_fullname
		FROM
			return_gameweek
		WHERE
			fixture_id = gf.fixture_id
		AND away_team = 1
	)AS away_team
FROM
	return_gameweek gf
WHERE
	gf.fixture_id IN(
		SELECT
			((fixture_id))AS fixture_id
		FROM
			sbm_team_statistics
		WHERE
			team_id = team_idpara
	) LIMIT 5;


SELECT
	ts.fixture_id,
	ts.goal_score,
	ts.goal_concede,
	m.fixture_date,
	m.home_team,
	m.away_team,
	ts.result
FROM
	sbm_team_statistics AS ts
LEFT JOIN tmp_last_fix m ON(ts.fixture_id = m.fixture_id)
WHERE
	ts.team_id = team_idpara;

drop temporary table if exists tmp_last_fix;


#select * from sbm_team where team_id = team_idpara; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `return_gameweek`
--
CREATE TABLE IF NOT EXISTS `return_gameweek` (
`fixture_id` int(11)
,`game_week` varchar(45)
,`fixture_date` datetime
,`team_id` int(11)
,`team_fullname` varchar(100)
,`home_team` varchar(45)
,`away_team` varchar(45)
);
-- --------------------------------------------------------

--
-- Table structure for table `sbm_correct_score_odd`
--

CREATE TABLE IF NOT EXISTS `sbm_correct_score_odd` (
  `correct_score_odd_id` int(11) NOT NULL AUTO_INCREMENT,
  `odd` float NOT NULL,
  `score` varchar(10) NOT NULL,
  `fixture_id` int(11) NOT NULL,
  PRIMARY KEY (`correct_score_odd_id`),
  KEY `correct_score_fixture_id_idx` (`fixture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sbm_country`
--

CREATE TABLE IF NOT EXISTS `sbm_country` (
  `country_name` varchar(45) NOT NULL,
  `continent_name` varchar(45) NOT NULL,
  PRIMARY KEY (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbm_country`
--

INSERT INTO `sbm_country` (`country_name`, `continent_name`) VALUES
('Argentina', 'America'),
('Brazil', 'America'),
('England', 'Europe'),
('France', 'Europe'),
('Germany', 'Europe'),
('Italy', 'Europe'),
('Japan', 'Asia'),
('Mexigo', 'America'),
('Nepal', 'Asia'),
('Spain', 'Europe'),
('Thailand\r', 'Asia');

-- --------------------------------------------------------

--
-- Table structure for table `sbm_fixture`
--

CREATE TABLE IF NOT EXISTS `sbm_fixture` (
  `fixture_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_week` varchar(45) NOT NULL,
  `fixture_date` datetime NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`fixture_id`),
  KEY `league_id_idx` (`league_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sbm_league`
--

CREATE TABLE IF NOT EXISTS `sbm_league` (
  `league_id` int(11) NOT NULL AUTO_INCREMENT,
  `participants_number` int(11) NOT NULL,
  `league_name` varchar(100) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`league_id`),
  KEY `organization_id_idx` (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sbm_league`
--

INSERT INTO `sbm_league` (`league_id`, `participants_number`, `league_name`, `organization_id`) VALUES
(1, 20, 'English Premier League', 1),
(2, 18, 'Toyota Premier League', 2),
(3, 18, 'A Division League', 2),
(4, 12, 'France Premiun League', 4),
(5, 10, 'Japan Premium League', 5),
(6, 15, 'Japan League', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sbm_organization`
--

CREATE TABLE IF NOT EXISTS `sbm_organization` (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(45) NOT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`organization_id`),
  KEY `country_name_idx` (`country_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sbm_organization`
--

INSERT INTO `sbm_organization` (`organization_id`, `organization_name`, `country_name`) VALUES
(1, 'FA', 'England'),
(2, 'AFC', 'Nepal'),
(3, 'Toyota', 'Thailand\r'),
(4, 'France org', 'France'),
(5, 'Japan org', 'Japan');

-- --------------------------------------------------------

--
-- Table structure for table `sbm_owner`
--

CREATE TABLE IF NOT EXISTS `sbm_owner` (
  `team_id` int(11) NOT NULL,
  `owner_name` varchar(45) NOT NULL,
  PRIMARY KEY (`team_id`,`owner_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbm_owner`
--

INSERT INTO `sbm_owner` (`team_id`, `owner_name`) VALUES
(1, 'Maxim Demin'),
(2, 'Alisher Usmanov'),
(2, 'E. Stanley Kroenke'),
(2, 'Farhad Moshiri'),
(3, 'Randy Lerner'),
(4, ' Roman Abramovich'),
(5, 'Jeremy Hosking'),
(5, 'Martin Long'),
(5, 'Stephen Browett'),
(5, 'Steve Parish'),
(6, 'Bill Kenwright CBE'),
(6, 'Jon Woods '),
(6, 'Robert Earl'),
(7, 'The Srivaddhanaprabha Family'),
(8, 'John W. Henry'),
(9, 'Mansour bin Zayed Al Nahyan'),
(10, 'The Glazer Family'),
(11, 'Mike Ashley'),
(12, 'Delia Smith '),
(12, 'Michael Foulger'),
(12, 'Michael Wynn-Jones'),
(13, 'Katharina Liebherr'),
(14, 'The Coates Family'),
(15, 'Ellis Short'),
(16, 'Brian Katzen'),
(16, 'Huw Jenkins'),
(16, 'Mr. & Mrs. Martin Morgan'),
(16, 'Robert Davies'),
(16, 'Swansea City Supporters Trust'),
(17, 'Daniel Levy'),
(17, 'Joe Lewis'),
(18, 'Gino Pozzo'),
(19, 'Jeremy Peace'),
(20, 'CB Holding ehf'),
(20, 'David Gold'),
(20, 'David Sullivan');

-- --------------------------------------------------------

--
-- Table structure for table `sbm_payment_type`
--

CREATE TABLE IF NOT EXISTS `sbm_payment_type` (
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbm_payment_type`
--

INSERT INTO `sbm_payment_type` (`user_id`, `payment_type`) VALUES
(2, 'Paypal'),
(3, 'Draft'),
(5, 'Draft');

-- --------------------------------------------------------

--
-- Table structure for table `sbm_player`
--

CREATE TABLE IF NOT EXISTS `sbm_player` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `player_firstname` varchar(45) NOT NULL,
  `player_lastname` varchar(45) NOT NULL,
  `player_shirt_no` int(11) NOT NULL,
  `player_dob` date NOT NULL,
  `contract_start_date` date DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `team_id_idx` (`team_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=640 ;

--
-- Dumping data for table `sbm_player`
--

INSERT INTO `sbm_player` (`player_id`, `status`, `position`, `player_firstname`, `player_lastname`, `player_shirt_no`, `player_dob`, `contract_start_date`, `contract_end_date`, `team_id`) VALUES
(1, 'Available', 'GK', 'Ryan', 'Allsop', 1, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(2, 'Available', 'MF', 'Harry', 'Arter', 2, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(3, 'Available', 'MF', 'Christian', 'Atsu', 3, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(4, 'Available', 'GK', 'Artur', 'Boruc', 4, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(5, 'Available', 'DF', 'Matt', 'Butcher', 5, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(6, 'Available', 'DF', 'Bailey', 'Cargill', 6, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(7, 'Available', 'DF', 'Steve', 'Cook', 7, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(8, 'Available', 'FW', 'Harry', 'Cornick', 8, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(9, 'Available', 'DF', 'Filippo', 'Costa', 9, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(10, 'Available', 'MF', 'Charlie', 'Daniels', 10, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(11, 'Available', 'DF', 'Sylvain', 'Distin', 11, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(12, 'Available', 'DF', 'Tommy', 'Elphick', 12, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(13, 'Available', 'GK', 'Adam', 'Federici', 13, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(14, 'Available', 'DF', 'Simon', 'Francis', 14, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(15, 'Available', 'MF', 'Dan', 'Gosling', 15, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(16, 'Available', 'FW', 'Max', 'Gradel', 16, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(17, 'Available', 'FW', 'Yann', 'Kermorgant', 17, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(18, 'Available', 'FW', 'Joshua', 'King', 18, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(19, 'Available', 'MF', 'Shaun', 'MacDonald', 19, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(20, 'Available', 'DF', 'Tyrone', 'Mings', 20, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(21, 'Available', 'FW', 'Glenn', 'Murray', 21, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(22, 'Available', 'MF', 'Eunan', 'O''Kane', 22, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(23, 'Available', 'MF', 'Marc', 'Pugh', 23, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(24, 'Available', 'FW', 'Tokelo', 'Rantie', 24, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(25, 'Available', 'MF', 'Matt', 'Ritchie', 25, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(26, 'Available', 'DF', 'Adam', 'Adam ', 26, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(27, 'Available', 'MF', 'Junior', 'Junior ', 27, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(28, 'Available', 'FW', 'Jayden', 'Jayden ', 28, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(29, 'Available', 'MF', 'Andrew', 'Andrew ', 29, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(30, 'Available', 'FW', 'Lee', 'Lee ', 30, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(31, 'Available', 'DF', 'Josh', 'Josh ', 31, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(32, 'Available', 'DF', 'Elliott', 'Elliott ', 32, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(33, 'Available', 'FW', 'Callum', 'Callum ', 33, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(34, 'Available', 'DF', 'Stéphane', 'Stéphane ', 34, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(35, 'Available', 'MF', 'Krystian', 'Krystian ', 1, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(36, 'Available', 'FW', 'Joel', 'Joel ', 2, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(37, 'Available', 'GK', 'Petr', 'Petr ', 3, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(38, 'Available', 'DF', 'Calum', 'Calum ', 4, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(39, 'Available', 'MF', 'Francis', 'Francis ', 5, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(40, 'Available', 'DF', 'Mathieu', 'Mathieu ', 6, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(41, 'Available', 'MF', 'Mathieu', 'Mathieu ', 7, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(42, 'Available', 'DF', 'Gabriel', 'Gabriel ', 8, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(43, 'Available', 'DF', 'Kieran', 'Kieran ', 9, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(44, 'Available', 'FW', 'Olivier', 'Olivier ', 10, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(45, 'Available', 'DF', 'Héctor', 'Héctor ', 11, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(46, 'Available', 'FW', 'Alex', 'Alex ', 12, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(47, 'Available', 'DF', 'Laurent', 'Laurent ', 13, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(48, 'Available', 'GK', 'Matt', 'Matt ', 14, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(49, 'Available', 'DF', 'Per', 'Per ', 15, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(50, 'Available', 'MF', 'Mikel', 'Mikel ', 16, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(51, 'Available', 'DF', 'Nacho', 'Nacho ', 17, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(52, 'Available', 'GK', 'David', 'David ', 18, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(53, 'Available', 'FW', 'Alex', 'Alex ', 19, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(54, 'Available', 'MF', 'Mesut', 'Mesut ', 20, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(55, 'Available', 'MF', 'Aaron', 'Aaron ', 21, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(56, 'Available', 'MF', 'Tomáš', 'Tomáš ', 22, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(57, 'Available', 'FW', 'Alexis', 'Alexis ', 23, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(58, 'Available', 'MF', 'Santi', 'Santi ', 24, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(59, 'Available', 'FW', 'Theo', 'Theo ', 25, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(60, 'Available', 'FW', 'Danny', 'Danny ', 26, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(61, 'Available', 'MF', 'Jack', 'Jack ', 27, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(62, 'Available', 'MF', 'Gedion', 'Gedion ', 28, '0000-00-00', '0000-00-00', '0000-00-00', 2),
(63, 'Available', 'FW', 'Gabriel', 'Gabriel ', 1, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(64, 'Available', 'DF', 'Jordan', 'Jordan ', 2, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(65, 'Available', 'DF', 'Ángel', 'Ángel ', 3, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(66, 'Available', 'FW', 'Jordan', 'Jordan ', 4, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(67, 'Available', 'DF', 'Leandro', 'Leandro ', 5, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(68, 'Available', 'DF', 'Joe', 'Joe ', 6, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(69, 'Available', 'FW', 'Corey', 'Corey ', 7, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(70, 'Available', 'GK', 'Mark', 'Bunn', 8, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(71, 'Available', 'FW', 'Carles', 'Gil', 9, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(72, 'Available', 'DF', 'Ciaran', 'Clark', 10, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(73, 'Available', 'MF', 'Joe', 'Cole', 11, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(74, 'Available', 'MF', 'Gary', 'Gardner', 12, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(75, 'Available', 'FW', 'Rudy', 'Gestede', 13, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(76, 'Available', 'MF', 'Jack', 'Grealish', 14, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(77, 'Available', 'MF', 'Idrissa', 'Gueye', 15, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(78, 'Available', 'GK', 'Brad', 'Guzan', 16, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(79, 'Available', 'DF', 'Alan', 'Hutton', 17, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(80, 'Available', 'DF', 'Lewis', 'Kinsella', 18, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(81, 'Available', 'FW', 'Libor', 'Kozák', 19, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(82, 'Available', 'DF', 'Joleon', 'Lescott', 20, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(83, 'Available', 'MF', 'Charles', 'N''Zogbia', 21, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(84, 'Available', 'DF', 'Jores', 'Okore', 22, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(85, 'Available', 'DF', 'Micah', 'Richards', 23, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(86, 'Available', 'MF', 'Kieran', 'Richardson', 24, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(87, 'Available', 'MF', 'Carlos', 'Sánchez', 25, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(88, 'Available', 'GK', 'Matija', 'Šarki?', 26, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(89, 'Available', 'MF', 'Jerell', 'Sellars', 27, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(90, 'Available', 'DF', 'Philippe', 'Senderos', 28, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(91, 'Available', 'MF', 'Scott', 'Sinclair', 29, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(92, 'Available', 'GK', 'Jed', 'Steer', 30, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(93, 'Available', 'DF', 'Easah', 'Suliman', 31, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(94, 'Available', 'DF', 'Tiago', 'Ilori', 32, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(95, 'Available', 'FW', 'Adama', 'Traoré', 33, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(96, 'Available', 'MF', 'Jordan', 'Veretout', 34, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(97, 'Available', 'GK', 'Bradley', 'Watkins', 35, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(98, 'Available', 'MF', 'Ashley', 'Westwood', 36, '0000-00-00', '0000-00-00', '0000-00-00', 3),
(99, 'Available', 'DF', 'Ola', 'Aina', 1, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(100, 'Available', 'GK', 'Marco', 'Amelia', 2, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(101, 'Available', 'DF', 'Azpilicueta', 'Azpilicueta', 3, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(102, 'Available', 'DF', 'Abdul', 'Rahman Baba', 4, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(103, 'Available', 'GK', 'Asmir', 'Begovi?', 5, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(104, 'Available', 'GK', 'Jamal', 'Blackman', 6, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(105, 'Available', 'DF', 'Gary', 'Cahill', 7, '0000-00-00', '0000-00-01', '0000-00-00', 4),
(106, 'Available', 'MF', 'Cesc', 'Fàbregas', 8, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(107, 'Available', 'GK', 'Thibaut', 'Courtois', 9, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(108, 'Available', 'FW', 'Diego', 'Costa', 10, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(109, 'Available', 'DF', 'Papy', 'Djilobodji', 11, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(110, 'Available', 'FW', 'Radamel', 'Falcao', 12, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(111, 'Available', 'MF', 'Eden', 'Hazard', 13, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(112, 'Available', 'DF', 'Branislav', 'Ivanovi?', 14, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(113, 'Available', 'FW', 'Kenedy', 'Kenedy', 15, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(114, 'Available', 'MF', 'Ruben', 'Loftus-Cheek', 16, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(115, 'Available', 'MF', 'Nemanja', 'Mati?', 17, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(116, 'Available', 'MF', 'John', 'Mikel', 18, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(117, 'Available', 'MF', 'Oscar', 'Oscar', 19, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(118, 'Available', 'MF', 'Pedro', 'Pedro', 20, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(119, 'Available', 'MF', 'Ramires', 'Ramires', 21, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(120, 'Available', 'FW', 'Loïc', 'Rémy', 22, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(121, 'Available', 'DF', 'John', 'Terry', 23, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(122, 'Available', 'FW', 'Bertrand', 'Traoré', 24, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(123, 'Available', 'MF', 'Willian', 'Willian', 25, '0000-00-00', '0000-00-00', '0000-00-00', 4),
(124, 'Available', 'DF', 'Kurt', 'Zouma', 26, '0000-00-00', '0000-00-02', '0000-00-00', 4),
(125, 'Available', 'FW', 'Keshi', 'Anderson', 1, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(126, 'Available', 'FW', 'Kwesi', 'Appiah', 2, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(127, 'Available', 'FW', 'Patrick', 'Bamford', 3, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(128, 'Available', 'MF', 'Hiram', 'Boateng', 4, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(129, 'Available', 'MF', 'Yala', 'Bolasie', 5, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(130, 'Available', 'MF', 'Yohan', 'Cabaye', 6, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(131, 'Available', 'FW', 'Frazier', 'Campbell', 7, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(132, 'Available', 'FW', 'Marouane', 'Chamakh', 8, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(133, 'Available', 'DF', 'Luke', 'Croll', 9, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(134, 'Available', 'DF', 'Scott', 'Dann', 10, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(135, 'Available', 'DF', 'Damien', 'Delaney', 11, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(136, 'Available', 'DF', 'Ezekiel', 'Fryers', 12, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(137, 'Available', 'FW', 'Dwight', 'Gayle', 13, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(138, 'Available', 'MF', 'Jake', 'Gray', 14, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(139, 'Available', 'DF', 'Brede', 'Hangeland', 15, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(140, 'Available', 'GK', 'Wayne', 'Hennessey', 16, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(141, 'Available', 'MF', 'Mile', 'Jedinak', 17, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(142, 'Available', 'MF', 'Sullay', 'Kaikai', 18, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(143, 'Available', 'DF', 'Martin', 'Kelly', 19, '0000-00-00', '0000-00-03', '0000-00-00', 5),
(144, 'Available', 'GK', 'Chris', 'Kettings', 20, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(145, 'Available', 'MF', 'Joe', 'Ledley', 21, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(146, 'Available', 'MF', 'Chung-Yong', 'Lee', 22, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(147, 'Available', 'DF', 'Adrian', 'Mariappa', 23, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(148, 'Available', 'MF', 'James', 'McArthur', 24, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(149, 'Available', 'GK', 'Alex', 'McCarthy', 25, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(150, 'Available', 'DF', 'Paddy', 'McCarthy', 26, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(151, 'Available', 'MF', 'Jordon', 'Mutch', 27, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(152, 'Available', 'MF', 'Jason', 'Puncheon', 28, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(153, 'Available', 'MF', 'Bakary', 'Sako', 29, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(154, 'Available', 'DF', 'Pape', 'Souaré', 30, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(155, 'Available', 'GK', 'Julian', 'Speroni', 31, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(156, 'Available', 'DF', 'Joel', 'Ward', 32, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(157, 'Available', 'FW', 'Connor', 'Wickham', 33, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(158, 'Available', 'MF', 'Jonathan', 'Williams', 34, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(159, 'Available', 'FW', 'Wilfried', 'Zaha', 35, '0000-00-00', '0000-00-00', '0000-00-00', 5),
(160, 'Available', 'DF', 'Leighton', 'Baines', 1, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(161, 'Available', 'MF', 'Ross', 'Barkley', 2, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(162, 'Available', 'MF', 'Gareth', 'Barry', 3, '0000-00-00', '0000-00-04', '0000-00-00', 6),
(163, 'Available', 'MF', 'Muhamed', 'Beši?', 4, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(164, 'Available', 'DF', 'Tyias', 'Browning', 5, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(165, 'Available', 'MF', 'Tom', 'Cleverley', 6, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(166, 'Available', 'DF', 'Séamus', 'Coleman', 7, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(167, 'Available', 'FW', 'Deulofeu', 'Deulofeu', 8, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(168, 'Available', 'MF', 'Francisco', 'Santos', 9, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(169, 'Available', 'DF', 'Ramiro', 'Funes Mori', 10, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(170, 'Available', 'DF', 'Brendan', 'Galloway', 11, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(171, 'Available', 'MF', 'Darron', 'Gibson', 12, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(172, 'Available', 'MF', 'Conor', 'Grant', 13, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(173, 'Available', 'DF', 'Tony', 'Hibbert', 14, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(174, 'Available', 'DF', 'Mason', 'Holgate', 15, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(175, 'Available', 'GK', 'Tim', 'Howard', 16, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(176, 'Available', 'DF', 'Phil', 'Jagielka', 17, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(177, 'Available', 'GK', 'Joel', 'Joel', 18, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(178, 'Available', 'DF', 'Jonjoe', 'Kenny', 19, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(179, 'Available', 'FW', 'Arouna', 'Koné', 20, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(180, 'Available', 'MF', 'Aaron', 'Lennon', 21, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(181, 'Available', 'FW', 'Romelu', 'Lukaku', 22, '0000-00-00', '0000-00-05', '0000-00-00', 6),
(182, 'Available', 'FW', 'Conor', 'McAleny', 23, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(183, 'Available', 'MF', 'James', 'McCarthy', 24, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(184, 'Available', 'MF', 'Aiden', 'McGeady', 25, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(185, 'Available', 'MF', 'Kevin', 'Mirallas', 26, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(186, 'Available', 'FW', 'Steven', 'Naismith', 27, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(187, 'Available', 'MF', 'Leon', 'Osman', 28, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(188, 'Available', 'DF', 'Bryan', 'Oviedo', 29, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(189, 'Available', 'DF', 'Matthew', 'Pennington', 30, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(190, 'Available', 'MF', 'Steven', 'Pienaar', 31, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(191, 'Available', 'FW', 'Leandro', 'Rodríguez', 32, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(192, 'Available', 'GK', 'Jind?ich', 'Stan?k', 33, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(193, 'Available', 'DF', 'John', 'Stones', 34, '0000-00-00', '0000-00-00', '0000-00-00', 6),
(194, 'Available', 'MF', 'Marc', 'Albrighton', 1, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(195, 'Available', 'DF', 'Yohan', 'Benalouane', 2, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(196, 'Available', 'FW', 'Jacob', 'Blyth', 3, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(197, 'Available', 'DF', 'Michael', 'Cain', 4, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(198, 'Available', 'DF', 'Ben', 'Chilwell', 5, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(199, 'Available', 'DF', 'Ritchie', 'De Laet', 6, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(200, 'Available', 'FW', 'Joseph', 'Dodoo', 7, '0000-00-00', '0000-00-06', '0000-00-00', 7),
(201, 'Available', 'MF', 'Danny', 'Drinkwater', 8, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(202, 'Available', 'MF', 'Nathan', 'Dyer', 9, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(203, 'Available', 'DF', 'Christian', 'Fuchs', 10, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(204, 'Available', 'MF', 'Dean', 'Hammond', 11, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(205, 'Available', 'DF', 'Robert', 'Huth', 12, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(206, 'Available', 'MF', 'Gökhan', 'Inler', 13, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(207, 'Available', 'MF', 'Matty', 'James', 14, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(208, 'Available', 'MF', 'N''Golo', 'Kanté', 15, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(209, 'Available', 'MF', 'Andy', 'King', 16, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(210, 'Available', 'FW', 'Andrej', 'Kramari?', 17, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(211, 'Available', 'FW', 'Tom', 'Lawrence', 18, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(212, 'Available', 'GK', 'Jonny', 'Maddison', 19, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(213, 'Available', 'FW', 'Riyad', 'Mahrez', 20, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(214, 'Available', 'DF', 'Liam', 'Moore', 21, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(215, 'Available', 'DF', 'Wes', 'Morgan', 22, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(216, 'Available', 'FW', 'Shinji', 'Okazaki', 23, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(217, 'Available', 'MF', 'André', 'Olukanmi', 24, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(218, 'Available', 'FW', 'Harry', 'Panayiotou', 25, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(219, 'Available', 'DF', 'Jeffrey', 'Schlupp', 26, '0000-00-00', '0000-00-07', '0000-00-00', 7),
(220, 'Available', 'GK', 'Kasper', 'Schmeichel', 27, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(221, 'Available', 'GK', 'Mark', 'Schwarzer', 28, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(222, 'Available', 'DF', 'Danny', 'Simpson', 29, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(223, 'Available', 'FW', 'Leonardo', 'Ulloa', 30, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(224, 'Available', 'FW', 'Jamie', 'Vardy', 31, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(225, 'Available', 'DF', 'Marcin', 'Wasilewski', 32, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(226, 'Available', 'MF', 'Ryan', 'Watson', 33, '0000-00-00', '0000-00-00', '0000-00-00', 7),
(227, 'Available', 'DF', 'Alberto', 'Moreno', 1, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(228, 'Available', 'MF', 'Joe', 'Allen', 2, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(229, 'Available', 'FW', 'Christian', 'Benteke', 3, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(230, 'Available', 'GK', 'Ádám', 'Bogdán', 4, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(231, 'Available', 'MF', 'Cameron', 'Brannagan', 5, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(232, 'Available', 'MF', 'Emre', 'Can', 6, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(233, 'Available', 'DF', 'Daniel', 'Cleary', 7, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(234, 'Available', 'DF', 'Nathaniel', 'Clyne', 8, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(235, 'Available', 'MF', 'Coutinho', 'Coutinho', 9, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(236, 'Available', 'MF', 'Jack', 'Dunn', 10, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(237, 'Available', 'DF', 'Jon', 'Flanagan', 11, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(238, 'Available', 'GK', 'Ryan', 'Fulton', 12, '0000-00-00', '0000-00-08', '0000-00-00', 8),
(239, 'Available', 'DF', 'Joe', 'Gomez', 13, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(240, 'Available', 'MF', 'Jordan', 'Henderson', 14, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(241, 'Available', 'FW', 'Jordon', 'Ibe', 15, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(242, 'Available', 'FW', 'Danny', 'Ings', 16, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(243, 'Available', 'MF', 'João', 'Carlos', 17, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(244, 'Available', 'DF', 'José', 'Enrique', 18, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(245, 'Available', 'MF', 'Adam', 'Lallana', 19, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(246, 'Available', 'DF', 'Dejan', 'Lovren', 20, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(247, 'Available', 'MF', 'Lucas', 'Leiva', 21, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(248, 'Available', 'GK', 'Simon', 'Mignolet', 22, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(249, 'Available', 'MF', 'James', 'Milner', 23, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(250, 'Available', 'FW', 'Divock', 'Origi', 24, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(251, 'Available', 'MF', 'Pedro', 'Chirivella', 25, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(252, 'Available', 'DF', 'Connor', 'Randall', 26, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(253, 'Available', 'MF', 'Roberto', 'Firmino', 27, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(254, 'Available', 'MF', 'Jordan', 'Rossiter', 28, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(255, 'Available', 'DF', 'Mamadou', 'Sakho', 29, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(256, 'Available', 'FW', 'Jerome', 'Sinclair', 30, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(257, 'Available', 'DF', 'Martin', 'Škrtel', 31, '0000-00-00', '0000-00-09', '0000-00-00', 8),
(258, 'Available', 'FW', 'Daniel', 'Sturridge', 32, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(259, 'Available', 'DF', 'Kolo', 'Touré', 33, '0000-00-00', '0000-00-00', '0000-00-00', 8),
(260, 'Available', 'FW', 'Kun', 'Agüero', 1, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(261, 'Available', 'MF', 'Brandon', 'Barker', 2, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(262, 'Available', 'FW', 'Wilfried', 'Bony', 3, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(263, 'Available', 'GK', 'Willy', 'Caballero', 4, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(264, 'Available', 'DF', 'Gaël', 'Clichy', 5, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(265, 'Available', 'MF', 'David', 'Silva', 6, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(266, 'Available', 'MF', 'Kevin', 'De Bruyne', 7, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(267, 'Available', 'MF', 'Fabian', 'Delph', 8, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(268, 'Available', 'DF', 'Martín', 'Demichelis', 9, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(269, 'Available', 'MF', 'George', 'Evans', 10, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(270, 'Available', 'DF', 'Shay', 'Facey', 11, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(271, 'Available', 'MF', 'Fernandinho', 'Fernandinho', 12, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(272, 'Available', 'MF', 'Fernando', 'Fernando', 13, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(273, 'Available', 'GK', 'Joe', 'Hart', 14, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(274, 'Available', 'FW', 'Kelechi', 'Iheanacho', 15, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(275, 'Available', 'MF', 'Jesús', 'Navas', 16, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(276, 'Available', 'DF', 'Aleksandar', 'Kolarov', 17, '0000-00-00', '0000-00-10', '0000-00-00', 9),
(277, 'Available', 'DF', 'Vincent', 'Kompany', 18, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(278, 'Available', 'DF', 'Eliaquim', 'Mangala', 19, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(279, 'Available', 'MF', 'Manu', 'García', 20, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(280, 'Available', 'MF', 'Samir', 'Nasri', 21, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(281, 'Available', 'DF', 'Nicolás', 'Otamendi', 22, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(282, 'Available', 'DF', 'Pablo', 'Maffeo', 23, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(283, 'Available', 'MF', 'Patrick', 'Roberts', 24, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(284, 'Available', 'DF', 'Bacary', 'Sagna', 25, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(285, 'Available', 'MF', 'Raheem', 'Sterling', 26, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(286, 'Available', 'MF', 'Yaya', 'Touré', 27, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(287, 'Available', 'GK', 'Richard', 'Wright', 28, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(288, 'Available', 'DF', 'Pablo', 'Zabaleta', 29, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(289, 'Available', 'MF', 'Bruno', 'Zuculini', 30, '0000-00-00', '0000-00-00', '0000-00-00', 9),
(290, 'Available', 'MF', 'Ander', 'Herrera', 1, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(291, 'Available', 'MF', 'Andreas', 'Pereira', 2, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(292, 'Available', 'DF', 'Daley', 'Blind', 3, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(293, 'Available', 'DF', 'Cameron', 'Borthwick-Jackson', 4, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(294, 'Available', 'MF', 'Michael', 'Carrick', 5, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(295, 'Available', 'DF', 'Matteo', 'Darmian', 6, '0000-00-00', '0000-00-11', '0000-00-00', 10),
(296, 'Available', 'GK', 'De', 'Gea', 7, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(297, 'Available', 'FW', 'Memphis', 'Depay', 8, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(298, 'Available', 'MF', 'Marouane', 'Fellaini', 9, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(299, 'Available', 'GK', 'Sam', 'Johnstone', 10, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(300, 'Available', 'DF', 'Phil', 'Jones', 11, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(301, 'Available', 'MF', 'Jesse', 'Lingard', 12, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(302, 'Available', 'FW', 'Anthony', 'Martial', 13, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(303, 'Available', 'MF', 'Mata', 'Mata', 14, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(304, 'Available', 'DF', 'Paddy', 'McNair', 15, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(305, 'Available', 'DF', 'Marcos', 'Rojo', 16, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(306, 'Available', 'GK', 'Sergio', 'Romero', 17, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(307, 'Available', 'FW', 'Wayne', 'Rooney', 18, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(308, 'Available', 'MF', 'Morgan', 'Schneiderlin', 19, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(309, 'Available', 'MF', 'Bastian', 'Schweinsteiger', 20, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(310, 'Available', 'DF', 'Luke', 'Shaw', 21, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(311, 'Available', 'DF', 'Chris', 'Smalling', 22, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(312, 'Available', 'MF', 'Antonio', 'Valencia', 23, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(313, 'Available', 'GK', 'Víctor', 'Valdés', 24, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(314, 'Available', 'FW', 'James', 'Wilson', 25, '0000-00-00', '0000-00-12', '0000-00-00', 10),
(315, 'Available', 'MF', 'Ashley', 'Young', 26, '0000-00-00', '0000-00-00', '0000-00-00', 10),
(316, 'Available', 'MF', 'Rolando', 'Aarons', 1, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(317, 'Available', 'MF', 'Vurnon', 'Anita', 2, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(318, 'Available', 'FW', 'Adam', 'Armstrong', 3, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(319, 'Available', 'FW', 'Ayoze', 'Pérez', 4, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(320, 'Available', 'FW', 'Daniel', 'Barlaser', 5, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(321, 'Available', 'MF', 'Gaël', 'Bigirimana', 6, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(322, 'Available', 'FW', 'Papiss', 'Demba Cissé', 7, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(323, 'Available', 'MF', 'Jack', 'Colback', 8, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(324, 'Available', 'DF', 'Fabricio', 'Coloccini', 9, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(325, 'Available', 'GK', 'Karl', 'Darlow', 10, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(326, 'Available', 'MF', 'Siem', 'de Jong', 11, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(327, 'Available', 'DF', 'Paul', 'Dummett', 12, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(328, 'Available', 'GK', 'Rob', 'Elliot', 13, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(329, 'Available', 'MF', 'Shane', 'Ferguson', 14, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(330, 'Available', 'DF', 'Curtis', 'Good', 15, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(331, 'Available', 'FW', 'Yoan', 'Gouffran', 16, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(332, 'Available', 'DF', 'Massadio', 'Haïdara', 17, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(333, 'Available', 'DF', 'Daryl', 'Janmaat', 18, '0000-00-00', '0000-00-13', '0000-00-00', 11),
(334, 'Available', 'GK', 'Tim', 'Krul', 19, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(335, 'Available', 'DF', 'Jamaal', 'Lascelles', 20, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(336, 'Available', 'MF', 'Sylvain', 'Marveaux', 21, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(337, 'Available', 'DF', 'Kevin', 'Mbabu', 22, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(338, 'Available', 'DF', 'Chancel', 'Mbemba', 23, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(339, 'Available', 'FW', 'Aleksandar', 'Mitrovi?', 24, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(340, 'Available', 'FW', 'Gabriel', 'Obertan', 25, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(341, 'Available', 'FW', 'Emmanuel', 'Rivière', 26, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(342, 'Available', 'DF', '?ubomír', 'Šatka', 27, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(343, 'Available', 'MF', 'Moussa', 'Sissoko', 28, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(344, 'Available', 'DF', 'Steven', 'Taylor', 29, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(345, 'Available', 'MF', 'Florian', 'Thauvin', 30, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(346, 'Available', 'MF', 'Cheick', 'Tioté', 31, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(347, 'Available', 'FW', 'Ivan', 'Toney', 32, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(348, 'Available', 'MF', 'Georginio', 'Wijnaldum', 33, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(349, 'Available', 'DF', 'Mike', 'Williamson', 34, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(350, 'Available', 'GK', 'Freddie', 'Woodman', 35, '0000-00-00', '0000-00-00', '0000-00-00', 11),
(351, 'Available', 'MF', 'Anthony', 'Andreu', 1, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(352, 'Available', 'DF', 'Sébastien', 'Bassong', 2, '0000-00-00', '0000-00-14', '0000-00-00', 12),
(353, 'Available', 'MF', 'Elliott', 'Bennett', 3, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(354, 'Available', 'DF', 'Ryan', 'Bennett', 4, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(355, 'Available', 'FW', 'Robbie', 'Brady', 5, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(356, 'Available', 'MF', 'Graham', 'Dorrans', 6, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(357, 'Available', 'DF', 'Adel', 'Gafaiti', 7, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(358, 'Available', 'FW', 'Lewis', 'Grabban', 8, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(359, 'Available', 'MF', 'Reece', 'Hall-Johnson', 9, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(360, 'Available', 'MF', 'Wesley', 'Hoolahan', 10, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(361, 'Available', 'FW', 'Gary', 'Hooper', 11, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(362, 'Available', 'MF', 'Jonny', 'Howson', 12, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(363, 'Available', 'MF', 'Matthew', 'Jarvis', 13, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(364, 'Available', 'FW', 'Cameron', 'Jerome', 14, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(365, 'Available', 'GK', 'Jake', 'Kean', 15, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(366, 'Available', 'FW', 'Kyle', 'Lafferty', 16, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(367, 'Available', 'FW', 'Jamar', 'Loza', 17, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(368, 'Available', 'MF', 'Russell', 'Martin', 18, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(369, 'Available', 'GK', 'Remi', 'Matthews', 19, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(370, 'Available', 'FW', 'Dieumerci', 'Mbokani', 20, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(371, 'Available', 'MF', 'Conor', 'McGrandles', 21, '0000-00-00', '0000-00-15', '0000-00-00', 12),
(372, 'Available', 'MF', 'Youssuf', 'Mulumbu', 22, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(373, 'Available', 'MF', 'Gary', 'O''Neil', 23, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(374, 'Available', 'MF', 'Vadis', 'Odjidja-Ofoe', 24, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(375, 'Available', 'DF', 'Martin', 'Olsson', 25, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(376, 'Available', 'MF', 'Nathan', 'Redmond', 26, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(377, 'Available', 'GK', 'Declan', 'Rudd', 27, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(378, 'Available', 'GK', 'John', 'Ruddy', 28, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(379, 'Available', 'MF', 'Alexander', 'Tettey', 29, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(380, 'Available', 'MF', 'Louis', 'Thompson', 30, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(381, 'Available', 'DF', 'Harry', 'Toffolo', 31, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(382, 'Available', 'DF', 'Steven', 'Whittaker', 32, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(383, 'Available', 'DF', 'Andre', 'Wisdom', 33, '0000-00-00', '0000-00-00', '0000-00-00', 12),
(384, 'Available', 'DF', 'Ryan', 'Bertrand', 1, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(385, 'Available', 'DF', 'Steven', 'Caulker', 2, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(386, 'Available', 'DF', 'Cédric', 'Soares', 3, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(387, 'Available', 'MF', 'Jordy', 'Clasie', 4, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(388, 'Available', 'GK', 'Kelvin', 'Davis', 5, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(389, 'Available', 'MF', 'Steven', 'Davis', 6, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(390, 'Available', 'GK', 'Fraser', 'Forster', 7, '0000-00-00', '0000-00-16', '0000-00-00', 13),
(391, 'Available', 'DF', 'Florin', 'Gardo?', 8, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(392, 'Available', 'GK', 'Paulo', 'Gazzaniga', 9, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(393, 'Available', 'MF', 'Lloyd', 'Isgrove', 10, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(394, 'Available', 'DF', 'José', 'Fonte', 11, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(395, 'Available', 'FW', 'Juanmi', 'Juanmi', 12, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(396, 'Available', 'FW', 'Shane', 'Long', 13, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(397, 'Available', 'FW', 'Sadio', 'Mané', 14, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(398, 'Available', 'DF', 'Cuco', 'Martina', 15, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(399, 'Available', 'DF', 'Jason', 'McCarthy', 16, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(400, 'Available', 'MF', 'Samuel', 'McQueen', 17, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(401, 'Available', 'MF', 'Oriol', 'Romeu', 18, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(402, 'Available', 'FW', 'Graziano', 'Pellè', 19, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(403, 'Available', 'MF', 'Gastón', 'Ramírez', 20, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(404, 'Available', 'MF', 'Harrison', 'Reed', 21, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(405, 'Available', 'FW', 'Jay', 'Rodriguez', 22, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(406, 'Available', 'GK', 'Maarten', 'Stekelenburg', 23, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(407, 'Available', 'FW', 'Dušan', 'Tadi?', 24, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(408, 'Available', 'DF', 'Matt', 'Targett', 25, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(409, 'Available', 'DF', 'Virgil', 'van Dijk', 26, '0000-00-00', '0000-00-17', '0000-00-00', 13),
(410, 'Available', 'MF', 'Victor', 'Wanyama', 27, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(411, 'Available', 'MF', 'James', 'Ward-Prowse', 28, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(412, 'Available', 'DF', 'Maya', 'Yoshida', 29, '0000-00-00', '0000-00-00', '0000-00-00', 13),
(413, 'Available', 'MF', 'Charlie', 'Adam', 1, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(414, 'Available', 'MF', 'Ibrahim', 'Afellay', 2, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(415, 'Available', 'FW', 'Marko', 'Arnautovi?', 3, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(416, 'Available', 'GK', 'Daniel', 'Bachmann', 4, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(417, 'Available', 'DF', 'Phil', 'Bardsley', 5, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(418, 'Available', 'FW', 'Bojan', 'Bojan', 6, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(419, 'Available', 'GK', 'Jack', 'Butland', 7, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(420, 'Available', 'DF', 'Geoff', 'Cameron', 8, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(421, 'Available', 'FW', 'Peter', 'Crouch', 9, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(422, 'Available', 'MF', 'Dionatan', 'Teixeira', 10, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(423, 'Available', 'FW', 'Mame', 'Diouf', 11, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(424, 'Available', 'FW', 'Mohamed', 'El Ouriachi', 12, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(425, 'Available', 'GK', 'Shay', 'Given', 13, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(426, 'Available', 'GK', 'Jakob', 'Haugaard', 14, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(427, 'Available', 'MF', 'Stephen', 'Ireland', 15, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(428, 'Available', 'DF', 'Glen', 'Johnson', 16, '0000-00-00', '0000-00-18', '0000-00-00', 14),
(429, 'Available', 'FW', 'Joselu', 'Joselu', 17, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(430, 'Available', 'DF', 'Muniesa', 'Muniesa', 18, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(431, 'Available', 'FW', 'Peter', 'Odemwingie', 19, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(432, 'Available', 'DF', 'Erik', 'Pieters', 20, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(433, 'Available', 'MF', 'Xherdan', 'Shaqiri', 21, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(434, 'Available', 'DF', 'Ryan', 'Shawcross', 22, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(435, 'Available', 'MF', 'Steven', 'Sidwell', 23, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(436, 'Available', 'MF', 'Marco', 'van Ginkel', 24, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(437, 'Available', 'FW', 'Jon', 'Walters', 25, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(438, 'Available', 'MF', 'Glenn', 'Whelan', 26, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(439, 'Available', 'DF', 'Marc', 'Wilson', 27, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(440, 'Available', 'DF', 'Philipp', 'Wollscheid', 28, '0000-00-00', '0000-00-00', '0000-00-00', 14),
(441, 'Available', 'MF', 'Ricardo', 'Álvarez', 1, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(442, 'Available', 'FW', 'Fabio', 'Borini', 2, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(443, 'Available', 'MF', 'Liam', 'Bridcutt', 3, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(444, 'Available', 'DF', 'Wes', 'Brown', 4, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(445, 'Available', 'FW', 'Will', 'Buckley', 5, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(446, 'Available', 'MF', 'Lee', 'Cattermole', 6, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(447, 'Available', 'DF', 'Sebastián', 'Coates', 7, '0000-00-00', '0000-00-19', '0000-00-00', 15),
(448, 'Available', 'FW', 'Jermain', 'Defoe', 8, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(449, 'Available', 'FW', 'Steven', 'Fletcher', 9, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(450, 'Available', 'FW', 'Lynden', 'Gooch', 10, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(451, 'Available', 'FW', 'Danny', 'Graham', 11, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(452, 'Available', 'MF', 'Adam', 'Johnson', 12, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(453, 'Available', 'DF', 'Billy', 'Jones', 13, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(454, 'Available', 'MF', 'Jordi', 'Gómez', 14, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(455, 'Available', 'DF', 'Younès', 'Kaboul', 15, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(456, 'Available', 'MF', 'Sebastian', 'Larsson', 16, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(457, 'Available', 'FW', 'Jeremain', 'Lens', 17, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(458, 'Available', 'MF', 'Yann', 'M''Vila', 18, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(459, 'Available', 'FW', 'Mikael', 'Mandron', 19, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(460, 'Available', 'GK', 'Vito', 'Mannone', 20, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(461, 'Available', 'DF', 'Adam', 'Matthews', 21, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(462, 'Available', 'MF', 'Charis', 'Mavrias', 22, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(463, 'Available', 'DF', 'John', 'O''Shea', 23, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(464, 'Available', 'GK', 'Costel', 'Pantilimon', 24, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(465, 'Available', 'DF', 'Valentin', 'Roberge', 25, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(466, 'Available', 'DF', 'Josh', 'Robson', 26, '0000-00-00', '0000-00-20', '0000-00-00', 15),
(467, 'Available', 'MF', 'Jack', 'Rodwell', 27, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(468, 'Available', 'GK', 'Max', 'Stryjek', 28, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(469, 'Available', 'MF', 'Ola', 'Toivonen', 29, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(470, 'Available', 'DF', 'Patrick', 'van Aanholt', 30, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(471, 'Available', 'FW', 'Duncan', 'Watmore', 31, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(472, 'Available', 'DF', 'DeAndre', 'Yedlin', 32, '0000-00-00', '0000-00-00', '0000-00-00', 15),
(473, 'Available', 'DF', 'Àngel', 'Rangel', 1, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(474, 'Available', 'FW', 'André', 'Ayew', 2, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(475, 'Available', 'FW', 'Modou', 'Barrow', 3, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(476, 'Available', 'DF', 'Kyle', 'Bartley', 4, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(477, 'Available', 'MF', 'Leon', 'Britton', 5, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(478, 'Available', 'MF', 'Jack', 'Cork', 6, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(479, 'Available', 'FW', 'Éder', 'Éder', 7, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(480, 'Available', 'FW', 'Marvin', 'Emnes', 8, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(481, 'Available', 'GK', '?ukasz', 'Fabia?ski', 9, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(482, 'Available', 'DF', 'Federico', 'Fernández', 10, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(483, 'Available', 'MF', 'Jay', 'Fulton', 11, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(484, 'Available', 'FW', 'Bafetimbi', 'Gomis', 12, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(485, 'Available', 'MF', 'Matt', 'Grimes', 13, '0000-00-00', '0000-00-21', '0000-00-00', 16),
(486, 'Available', 'MF', 'Raheem', 'Hanley', 14, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(487, 'Available', 'DF', 'Jordi', 'Amat', 15, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(488, 'Available', 'MF', 'Sung-yueng', 'Ki', 16, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(489, 'Available', 'MF', 'Adam', 'King', 17, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(490, 'Available', 'DF', 'Stephen', 'Kingsley', 18, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(491, 'Available', 'FW', 'Michu', 'Michu', 19, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(492, 'Available', 'MF', 'Jefferson', 'Montero', 20, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(493, 'Available', 'DF', 'Kyle', 'Naughton', 21, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(494, 'Available', 'GK', 'Kristoffer', 'Nordfeldt', 22, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(495, 'Available', 'MF', 'Wayne', 'Routledge', 23, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(496, 'Available', 'MF', 'Josh', 'Sheehan', 24, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(497, 'Available', 'MF', 'Jonjo', 'Shelvey', 25, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(498, 'Available', 'MF', 'Gylfi', 'Sigurðsson', 26, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(499, 'Available', 'MF', 'Franck', 'Tabanou', 27, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(500, 'Available', 'DF', 'Neil', 'Taylor', 28, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(501, 'Available', 'GK', 'Gerhard', 'Tremmel', 29, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(502, 'Available', 'DF', 'Ashley', 'Williams', 30, '0000-00-00', '0000-00-00', '0000-00-00', 16),
(503, 'Available', 'DF', 'Toby', 'Alderweireld', 1, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(504, 'Available', 'MF', 'Bamidele', 'Alli', 2, '0000-00-00', '0000-00-22', '0000-00-00', 17),
(505, 'Available', 'MF', 'Nabil', 'Bentaleb', 3, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(506, 'Available', 'MF', 'Tom', 'Carroll', 4, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(507, 'Available', 'FW', 'Nacer', 'Chadli', 5, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(508, 'Available', 'FW', 'Shaquile', 'Coulthirst', 6, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(509, 'Available', 'DF', 'Ben', 'Davies', 7, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(510, 'Available', 'MF', 'Moussa', 'Dembélé', 8, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(511, 'Available', 'DF', 'Eric', 'Dier', 9, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(512, 'Available', 'MF', 'Christian', 'Eriksen', 10, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(513, 'Available', 'DF', 'Federico', 'Fazio', 11, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(514, 'Available', 'FW', 'Harry', 'Kane', 12, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(515, 'Available', 'MF', 'Èrik', 'Lamela', 13, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(516, 'Available', 'GK', 'Hugo', 'Lloris', 14, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(517, 'Available', 'MF', 'Ryan', 'Mason', 15, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(518, 'Available', 'GK', 'Luke', 'McGee', 16, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(519, 'Available', 'FW', 'Clinton', 'N''Jie', 17, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(520, 'Available', 'DF', 'Connor', 'Ogilvie', 18, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(521, 'Available', 'FW', 'Joshua', 'Onomah', 19, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(522, 'Available', 'MF', 'Alex', 'Pritchard', 20, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(523, 'Available', 'DF', 'Danny', 'Rose', 21, '0000-00-00', '0000-00-23', '0000-00-00', 17),
(524, 'Available', 'FW', 'Heung-min', 'Son', 22, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(525, 'Available', 'MF', 'Andros', 'Townsend', 23, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(526, 'Available', 'DF', 'Kieran', 'Trippier', 24, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(527, 'Available', 'DF', 'Jan', 'Vertonghen', 25, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(528, 'Available', 'GK', 'Michel', 'Vorm', 26, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(529, 'Available', 'DF', 'Kyle', 'Walker', 27, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(530, 'Available', 'DF', 'Kevin', 'Wimmer', 28, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(531, 'Available', 'MF', 'Harry', 'Winks', 29, '0000-00-00', '0000-00-00', '0000-00-00', 17),
(532, 'Available', 'MF', 'Almen', 'Abdi', 1, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(533, 'Available', 'DF', 'Nathan', 'Aké', 2, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(534, 'Available', 'MF', 'Ikechi', 'Anya', 3, '0000-00-00', '0000-00-00', '0000-00-00', 18);
INSERT INTO `sbm_player` (`player_id`, `status`, `position`, `player_firstname`, `player_lastname`, `player_shirt_no`, `player_dob`, `contract_start_date`, `contract_end_date`, `team_id`) VALUES
(535, 'Available', 'GK', 'Giedrius', 'Arlauskis', 4, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(536, 'Available', 'MF', 'Valon', 'Behrami', 5, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(537, 'Available', 'DF', 'Essaïd', 'Belkalem', 6, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(538, 'Available', 'FW', 'Steven', 'Berghuis', 7, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(539, 'Available', 'DF', 'Miguel', 'Britos', 8, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(540, 'Available', 'MF', 'George', 'Byers', 9, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(541, 'Available', 'MF', 'Étienne', 'Capoue', 10, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(542, 'Available', 'DF', 'Craig', 'Cathcart', 11, '0000-00-00', '0000-00-24', '0000-00-00', 18),
(543, 'Available', 'FW', 'Troy', 'Deeney', 12, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(544, 'Available', 'FW', 'Alessandro', 'Diamanti', 13, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(545, 'Available', 'MF', 'Josh', 'Doherty', 14, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(546, 'Available', 'MF', 'Lloyd', 'Dyer', 15, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(547, 'Available', 'DF', 'Joel', 'Ekstrand', 16, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(548, 'Available', 'GK', 'Rene', 'Gilmartin', 17, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(549, 'Available', 'GK', 'Gomes', 'Gomes', 18, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(550, 'Available', 'MF', 'Adlène', 'Guédioura', 19, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(551, 'Available', 'DF', 'Tommy', 'Hoban', 20, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(552, 'Available', 'DF', 'José', 'Holebas', 21, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(553, 'Available', 'FW', 'Víctor', 'Ibarbo', 22, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(554, 'Available', 'FW', 'Odion', 'Ighalo', 23, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(555, 'Available', 'FW', 'Uche', 'Ikpeazu', 24, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(556, 'Available', 'FW', 'Alex', 'Jakubiak', 25, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(557, 'Available', 'DF', 'Jorell', 'Johnson', 26, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(558, 'Available', 'MF', 'Jurado', 'Jurado', 27, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(559, 'Available', 'FW', 'Bernard', 'Mensah', 28, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(560, 'Available', 'MF', 'Sean', 'Murray', 29, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(561, 'Available', 'DF', 'Allan', 'Nyom', 30, '0000-00-00', '0000-00-25', '0000-00-00', 18),
(562, 'Available', 'FW', 'Mamadou', 'Oularé', 31, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(563, 'Available', 'DF', 'Juan', 'Paredes', 32, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(564, 'Available', 'DF', 'Sebastian', 'Prödl', 33, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(565, 'Available', 'FW', 'Mathias', 'Ranégie', 34, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(566, 'Available', 'MF', 'Connor', 'Smith', 35, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(567, 'Available', 'MF', 'Ben', 'Watson', 36, '0000-00-00', '0000-00-00', '0000-00-00', 18),
(568, 'Available', 'FW', 'Victor', 'Anichebe', 1, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(569, 'Available', 'FW', 'Saido', 'Berahino', 2, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(570, 'Available', 'MF', 'Sebastián', 'Blanco', 3, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(571, 'Available', 'MF', 'Chris', 'Brunt', 4, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(572, 'Available', 'DF', 'James', 'Chester', 5, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(573, 'Available', 'DF', 'Craig', 'Dawson', 6, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(574, 'Available', 'FW', 'Shaun', 'Donnellan', 7, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(575, 'Available', 'MF', 'Kyle', 'Edwards', 8, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(576, 'Available', 'DF', 'Jonny', 'Evans', 9, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(577, 'Available', 'MF', 'Darren', 'Fletcher', 10, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(578, 'Available', 'GK', 'Ben', 'Foster', 11, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(579, 'Available', 'DF', 'Cristian', 'Gamboa', 12, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(580, 'Available', 'MF', 'Craig', 'Gardner', 13, '0000-00-00', '0000-00-26', '0000-00-00', 19),
(581, 'Available', 'FW', 'Serge', 'Gnabry', 14, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(582, 'Available', 'FW', 'Rickie', 'Lambert', 15, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(583, 'Available', 'FW', 'Jonathan', 'Jonathan ', 16, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(584, 'Available', 'GK', 'Anders', 'Anders ', 17, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(585, 'Available', 'DF', 'Gareth', 'Gareth ', 18, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(586, 'Available', 'FW', 'James', 'James ', 19, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(587, 'Available', 'FW', 'Callum', 'Callum ', 20, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(588, 'Available', 'MF', 'James', 'James ', 21, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(589, 'Available', 'GK', 'Boaz', 'Boaz ', 22, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(590, 'Available', 'MF', 'Adil', 'Adil ', 23, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(591, 'Available', 'DF', 'Jonas', 'Jonas ', 24, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(592, 'Available', 'GK', 'Alex', 'Alex ', 25, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(593, 'Available', 'DF', 'Sébastien', 'Sébastien ', 26, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(594, 'Available', 'FW', 'Salomón', 'Salomón ', 27, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(595, 'Available', 'GK', 'Jack', 'Jack ', 28, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(596, 'Available', 'MF', 'Stéphane', 'Stéphane ', 29, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(597, 'Available', 'FW', 'Joe', 'Joe ', 30, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(598, 'Available', 'MF', 'Claudio', 'Claudio ', 31, '0000-00-00', '0000-00-00', '0000-00-00', 19),
(599, 'Available', 'GK', 'Adrián', 'Adrián', 1, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(600, 'Available', 'MF', 'Michail', 'Michail ', 2, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(601, 'Available', 'FW', 'Jordan', 'Jordan ', 3, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(602, 'Available', 'DF', 'Reece', 'Reece ', 4, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(603, 'Available', 'FW', 'Andy', 'Andy ', 5, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(604, 'Available', 'DF', 'Leo', 'Leo ', 6, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(605, 'Available', 'DF', 'James', 'James ', 7, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(606, 'Available', 'DF', 'Aaron', 'Aaron ', 8, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(607, 'Available', 'MF', 'Josh', 'Josh ', 9, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(608, 'Available', 'DF', 'Stephen', 'Stephen ', 10, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(609, 'Available', 'DF', 'Doneil', 'Doneil ', 11, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(610, 'Available', 'FW', 'Nikica', 'Nikica ', 12, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(611, 'Available', 'DF', 'Carl', 'Carl ', 13, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(612, 'Available', 'DF', 'Kyle', 'Kyle ', 14, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(613, 'Available', 'MF', 'Cheikhou', 'Cheikhou ', 15, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(614, 'Available', 'MF', 'Manuel', 'Manuel ', 16, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(615, 'Available', 'FW', 'Elliot', 'Elliot ', 17, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(616, 'Available', 'FW', 'Modibo', 'Modibo ', 18, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(617, 'Available', 'FW', 'Nathan', 'Nathan ', 19, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(618, 'Available', 'FW', 'Victor', 'Victor ', 20, '0000-00-00', '0000-00-28', '0000-00-00', 20),
(619, 'Available', 'MF', 'Amos', 'Amos ', 21, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(620, 'Available', 'MF', 'Mark', 'Mark ', 22, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(621, 'Available', 'MF', 'Joey', 'Joey ', 23, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(622, 'Available', 'DF', 'Angelo', 'Angelo ', 24, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(623, 'Available', 'DF', 'Manny', 'Manny ', 25, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(624, 'Available', 'MF', 'Reece', 'Reece ', 26, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(625, 'Available', 'DF', 'Lewis', 'Lewis ', 27, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(626, 'Available', 'FW', 'Djair', 'Djair ', 28, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(627, 'Available', 'DF', 'Josh', 'Josh ', 29, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(628, 'Available', 'MF', 'Dimitri', 'Dimitri ', 30, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(629, 'Available', 'MF', 'Pedro', 'Pedro ', 31, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(630, 'Available', 'FW', 'Alex', 'Alex ', 32, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(631, 'Available', 'GK', 'Darren', 'Darren ', 33, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(632, 'Available', 'DF', 'Winston', 'Winston ', 34, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(633, 'Available', 'FW', 'Diafra', 'Diafra ', 35, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(634, 'Available', 'MF', 'Martin', 'Martin ', 36, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(635, 'Available', 'MF', 'Alex', 'Alex ', 37, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(636, 'Available', 'GK', 'Raphael', 'Raphael Spiegel', 38, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(637, 'Available', 'DF', 'James', 'James ', 39, '0000-00-00', '0000-00-29', '0000-00-00', 20),
(638, 'Available', 'FW', 'Enner', 'Enner ', 40, '0000-00-00', '0000-00-00', '0000-00-00', 20),
(639, 'Available', 'FW', 'Mauro', 'Mauro ', 41, '0000-00-00', '0000-00-00', '0000-00-00', 20);

-- --------------------------------------------------------

--
-- Table structure for table `sbm_player_statistics`
--

CREATE TABLE IF NOT EXISTS `sbm_player_statistics` (
  `player_id` int(11) NOT NULL,
  `fixture_id` int(11) NOT NULL,
  `goal_score` int(11) DEFAULT NULL,
  `goal_concede` int(11) DEFAULT NULL,
  `assist` int(11) DEFAULT NULL,
  `assisted_by` int(11) NOT NULL,
  `red_card` int(11) DEFAULT NULL,
  `yellow_card` int(11) DEFAULT NULL,
  `time_played` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`player_id`,`fixture_id`),
  KEY `player_st_fixture_id_idx` (`fixture_id`),
  KEY `assisted_by_player_id_idx` (`assisted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sbm_team`
--

CREATE TABLE IF NOT EXISTS `sbm_team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `home_ground` varchar(45) NOT NULL,
  `team_fullname` varchar(100) NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `league_id_idx` (`league_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `sbm_team`
--

INSERT INTO `sbm_team` (`team_id`, `home_ground`, `team_fullname`, `league_id`) VALUES
(1, 'Dean Court', 'AFC Bournemouth', 1),
(2, 'Emirates Stadium', 'Arsenal', 1),
(3, 'Villa Park', 'Aston Villa', 1),
(4, 'Stamford Bridge', 'Chelsea', 1),
(5, 'Selhurst Park', 'Crystal Palace', 1),
(6, 'Goodison Park', 'Everton', 1),
(7, 'King Power Stadium', 'Leicester City', 1),
(8, 'Anfield', 'Liverpool', 1),
(9, 'Etihad Stadium', 'Manchester City', 1),
(10, 'Old Trafford', 'Manchester United', 1),
(11, 'St James'' Park', 'Newcastle United', 1),
(12, 'Carrow Road', 'Norwich City', 1),
(13, 'St Mary''s Stadium', 'Southampton', 1),
(14, 'Britannia Stadium', 'Stoke City', 1),
(15, 'Stadium of Light', 'Sunderland', 1),
(16, 'Liberty Stadium', 'Swansea City', 1),
(17, 'White Hart Lane', 'Tottenham Hotspur', 1),
(18, 'Vicarage Road', 'Watford', 1),
(19, 'The Hawthorns', 'West Bromwich Albion', 1),
(20, 'Boleyn Ground', 'West Ham United', 1),
(21, 'Japan Ground', 'Japanese Football Team', 5),
(22, 'France Ground', 'Franch Football Team', 4),
(23, 'Japan Football Ground', 'Nippon team', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sbm_team_coach`
--

CREATE TABLE IF NOT EXISTS `sbm_team_coach` (
  `team_id` int(11) NOT NULL,
  `firstname` varchar(45) CHARACTER SET latin1 NOT NULL,
  `lastname` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `contract_start_date` date NOT NULL,
  `contract_end_date` date NOT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sbm_team_coach`
--

INSERT INTO `sbm_team_coach` (`team_id`, `firstname`, `lastname`, `contract_start_date`, `contract_end_date`, `dob`, `nationality`) VALUES
(1, ' Tommy ', 'Elphick', '0000-00-00', '0000-00-00', '1977-11-29', 'England'),
(2, ' Arsène ', 'Wenger', '0000-00-00', '0000-00-00', '1949-10-22', 'France'),
(3, ' Tim ', 'Sherwood', '0000-00-00', '0000-00-00', '1969-06-02', 'Portugal'),
(4, ' José ', 'Mourinho', '0000-00-00', '0000-00-00', '1963-01-26', 'England'),
(5, ' Alan ', 'Pardew', '0000-00-00', '0000-00-00', '1961-07-18', 'Spain'),
(6, ' Roberto ', 'Martínez', '0000-00-00', '0000-00-00', '1973-07-13', 'Italy'),
(7, ' Claudio ', 'Ranieri', '0000-00-00', '0000-00-00', '1973-08-23', 'Germany'),
(8, ' Jürgen ', 'Klopp', '0000-00-00', '0000-00-00', '1967-01-16', 'Chile'),
(9, ' Manuel ', 'Pellegrini', '0000-00-00', '0000-00-00', '1968-06-16', 'Netherland'),
(10, ' Louis ', 'van Gaal', '0000-00-00', '0000-00-00', '1951-08-08', 'England'),
(11, ' Steve ', 'McClaren', '0000-00-00', '0000-00-00', '1961-05-03', 'Scotland'),
(12, ' Alex ', 'Neil', '0000-00-00', '0000-00-00', '1981-06-09', 'Netherland'),
(13, ' Ronald ', 'Koeman', '0000-00-00', '0000-00-00', '1981-08-09', 'Wales'),
(14, ' Mark ', 'Hughes', '0000-00-00', '0000-00-00', '1963-11-01', 'England'),
(15, ' Sam ', 'Allardyce', '0000-00-00', '0000-00-00', '1954-08-19', 'England'),
(16, ' Garry ', 'Monk', '0000-00-00', '0000-00-00', '1954-11-12', 'Argentina'),
(17, ' Mauricio ', 'Pochettino', '0000-00-00', '0000-00-00', '1972-03-02', 'Argentina'),
(18, ' Quique ', 'Flores', '0000-00-00', '0000-00-00', '1965-01-05', 'Spain'),
(19, ' Tony ', 'Pulis', '0000-00-00', '0000-00-00', '1958-01-16', 'Wales'),
(20, ' Slaven ', 'Bilic', '0000-00-00', '0000-00-00', '1968-09-11', 'Croatia');

-- --------------------------------------------------------

--
-- Table structure for table `sbm_team_fixture`
--

CREATE TABLE IF NOT EXISTS `sbm_team_fixture` (
  `team_id` int(11) NOT NULL,
  `fixture_id` int(11) NOT NULL,
  `home_team` varchar(45) NOT NULL,
  `away_team` varchar(45) NOT NULL,
  PRIMARY KEY (`team_id`,`fixture_id`),
  KEY `team_fixture_id_idx` (`fixture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sbm_team_standing`
--

CREATE TABLE IF NOT EXISTS `sbm_team_standing` (
  `season` year(4) DEFAULT NULL,
  `total_match_played` int(11) DEFAULT NULL,
  `total_win` int(11) DEFAULT NULL,
  `total_draw` int(11) DEFAULT NULL,
  `total_loss` int(11) DEFAULT NULL,
  `total_red_card` int(11) DEFAULT NULL,
  `total_yellow_card` int(11) DEFAULT NULL,
  `total_pts` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `total_goal_score` int(11) DEFAULT NULL,
  `total_goal_concede` int(11) DEFAULT NULL,
  KEY `team_id_idx` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='	';

--
-- Dumping data for table `sbm_team_standing`
--

INSERT INTO `sbm_team_standing` (`season`, `total_match_played`, `total_win`, `total_draw`, `total_loss`, `total_red_card`, `total_yellow_card`, `total_pts`, `ranking`, `team_id`, `total_goal_score`, `total_goal_concede`) VALUES
(2015, 5, 2, 1, 2, 4, 6, 1, NULL, 1, 7, 7),
(2015, 5, 4, 0, 1, 6, 7, 6, NULL, 2, 11, 8),
(2015, 2, 0, 0, 2, 0, 3, 0, NULL, 3, 2, 4),
(2015, 3, 1, 1, 1, 1, 5, 1, NULL, 4, 5, 6),
(2015, 2, 2, 0, 0, 0, 0, 6, NULL, 5, 3, 0),
(2015, 2, 1, 1, 0, 0, 4, 4, NULL, 6, 4, 3),
(2015, 3, 1, 0, 2, 2, 6, 3, NULL, 7, 5, 8),
(2015, 2, 1, 1, 0, 0, 7, 4, NULL, 8, 4, 3),
(2015, 5, 3, 1, 1, 2, 7, 3, NULL, 9, 12, 8),
(2015, 3, 1, 2, 0, 1, 4, 4, NULL, 10, 4, 4),
(2015, 2, 0, 1, 1, 1, 2, 1, NULL, 11, 3, 8),
(2015, 3, 1, 1, 1, 1, 3, 4, NULL, 12, 5, 5),
(2015, 2, 2, 0, 0, 0, 5, 6, NULL, 13, 6, 2),
(2015, 2, 2, 0, 0, 0, 2, 6, NULL, 14, 3, 1),
(2015, 2, 0, 1, 1, 0, 3, 1, NULL, 15, 2, 5),
(2015, 2, 0, 1, 1, 1, 2, 1, NULL, 16, 3, 5),
(2015, 3, 1, 0, 2, 2, 3, 3, NULL, 17, 7, 5),
(2015, 3, 1, 1, 1, 1, 1, 1, NULL, 18, 3, 3),
(2015, 3, 0, 0, 3, 2, 2, 1, NULL, 19, 3, 7),
(2015, 2, 0, 2, 0, 0, 2, 2, NULL, 20, 4, 4),
(2015, 8, 7, 1, 0, 9, 6, 1, NULL, 21, 14, 9),
(2015, 2, 1, 1, 0, 3, 0, 1, NULL, 22, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sbm_team_statistics`
--

CREATE TABLE IF NOT EXISTS `sbm_team_statistics` (
  `team_id` int(11) NOT NULL,
  `fixture_id` int(11) NOT NULL,
  `goal_score` int(11) DEFAULT NULL,
  `goal_concede` int(11) DEFAULT NULL,
  `red_card` int(11) DEFAULT NULL,
  `yellow_card` int(11) DEFAULT NULL,
  `result` char(10) DEFAULT NULL,
  PRIMARY KEY (`team_id`,`fixture_id`),
  KEY `team-st_fixture_id_idx` (`fixture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sbm_user`
--

CREATE TABLE IF NOT EXISTS `sbm_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(150) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `security_code` varchar(45) NOT NULL,
  `role_id` int(11) DEFAULT '2',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `role_id_idx` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `sbm_user`
--

INSERT INTO `sbm_user` (`user_id`, `firstname`, `lastname`, `username`, `password`, `dob`, `address`, `country`, `contact_no`, `email`, `security_code`, `role_id`) VALUES
(1, 'admin', 'admin', 'admin', '66ec78c9658bfbc52708a456656c77b6', '1886-12-16', 'Kathmandu', 'Nepal', '00990055177', 'saninshakya@gmail.com', '9837', 1),
(2, 'narit', 'thai', 'narit', 'narit', '1899-10-10', 'Bangkok', 'Thailand', '93238932832932', 'narit@gmail.com', '8747', 2),
(3, 'remy', 'french', 'remy', 'remy', '2015-10-12', 'Paris', 'France', '324324234332', 'remy@gmail.com', '8763', 2),
(5, 'yang', 'kate', 'yang', 'yang', '1988-06-10', 'Beijing', 'China', '23423455', 'yang@gmail.com', '2345', 2),
(6, 'binita', 'Shakya', 'binita', '66ec78c9658bfbc52708a456656c77b6', '0000-00-00', 'patan', 'Nepal', '09-8787632', 'binitashakya205@gmail.com', '1234', 2),
(7, 'Nikita', 'shakya', 'nikita', 'b00a50c448238a71ed479f81fa4d9066', '0000-00-00', 'patan', 'Nepal', '998302834', 'nikita@hotmail.com', '2343', 2),
(8, 'ganesh', 'shakya', 'ganesh', 'fa1d87bc7f85769ea9dee2e4957321ae', '1960-05-21', 'patan', 'Nepal', '998302834', 'admin@thaimooc.org', '2343', 2),
(9, 'ganesh', 'binita', 'ganesh123', 'fa1d87bc7f85769ea9dee2e4957321ae', '1960-05-21', 'patan', 'Nepal', '09-8787632', 'sysadmin@asianux.hylib.org', '1234', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sbm_user_correct_score_bid`
--

CREATE TABLE IF NOT EXISTS `sbm_user_correct_score_bid` (
  `amount` decimal(10,2) NOT NULL,
  `bid_date` datetime NOT NULL,
  `is_win` tinyint(1) NOT NULL,
  `payoff` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `correct_score_odd_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`correct_score_odd_id`),
  KEY `correct_score_odd_id_idx` (`correct_score_odd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sbm_user_weekly_bid`
--

CREATE TABLE IF NOT EXISTS `sbm_user_weekly_bid` (
  `amount` decimal(10,2) NOT NULL,
  `bid_date` datetime NOT NULL,
  `is_win` tinyint(1) DEFAULT NULL,
  `payoff` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `weekly_odd_id` int(11) NOT NULL,
  `odd_selection` char(5) NOT NULL,
  PRIMARY KEY (`user_id`,`weekly_odd_id`),
  KEY `weekly_bid_odd_id_idx` (`weekly_odd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sbm_weekly_odd`
--

CREATE TABLE IF NOT EXISTS `sbm_weekly_odd` (
  `weekly_odd_id` int(11) NOT NULL AUTO_INCREMENT,
  `odd_home` float NOT NULL,
  `odd_away` float NOT NULL,
  `odd_draw` float NOT NULL,
  `fixture_id` int(11) NOT NULL,
  PRIMARY KEY (`weekly_odd_id`),
  KEY `weekly_odd_fixture_id_idx` (`fixture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_user_role`
--

CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_type` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_type_UNIQUE` (`role_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sys_user_role`
--

INSERT INTO `sys_user_role` (`role_id`, `role_type`) VALUES
(1, 'administrator'),
(2, 'user');

-- --------------------------------------------------------

--
-- Structure for view `return_gameweek`
--
DROP TABLE IF EXISTS `return_gameweek`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `return_gameweek` AS (select `f`.`fixture_id` AS `fixture_id`,`f`.`game_week` AS `game_week`,`f`.`fixture_date` AS `fixture_date`,`t`.`team_id` AS `team_id`,`t`.`team_fullname` AS `team_fullname`,`tf`.`home_team` AS `home_team`,`tf`.`away_team` AS `away_team` from ((`sbm_fixture` `f` left join `sbm_team_fixture` `tf` on((`f`.`fixture_id` = `tf`.`fixture_id`))) left join `sbm_team` `t` on((`tf`.`team_id` = `t`.`team_id`))) order by `f`.`fixture_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sbm_correct_score_odd`
--
ALTER TABLE `sbm_correct_score_odd`
  ADD CONSTRAINT `correct_score_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_fixture`
--
ALTER TABLE `sbm_fixture`
  ADD CONSTRAINT `fixture_league_id` FOREIGN KEY (`league_id`) REFERENCES `sbm_league` (`league_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_league`
--
ALTER TABLE `sbm_league`
  ADD CONSTRAINT `organization_id` FOREIGN KEY (`organization_id`) REFERENCES `sbm_organization` (`organization_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_organization`
--
ALTER TABLE `sbm_organization`
  ADD CONSTRAINT `country_name` FOREIGN KEY (`country_name`) REFERENCES `sbm_country` (`country_name`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_owner`
--
ALTER TABLE `sbm_owner`
  ADD CONSTRAINT `owner_team_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_payment_type`
--
ALTER TABLE `sbm_payment_type`
  ADD CONSTRAINT `payment_user_id` FOREIGN KEY (`user_id`) REFERENCES `sbm_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_player`
--
ALTER TABLE `sbm_player`
  ADD CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_player_statistics`
--
ALTER TABLE `sbm_player_statistics`
  ADD CONSTRAINT `assisted_by_player_id` FOREIGN KEY (`assisted_by`) REFERENCES `sbm_player` (`player_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `player_st_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `player_st_player_id` FOREIGN KEY (`player_id`) REFERENCES `sbm_player` (`player_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_team`
--
ALTER TABLE `sbm_team`
  ADD CONSTRAINT `league_id` FOREIGN KEY (`league_id`) REFERENCES `sbm_league` (`league_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_team_coach`
--
ALTER TABLE `sbm_team_coach`
  ADD CONSTRAINT `team_coach_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_team_fixture`
--
ALTER TABLE `sbm_team_fixture`
  ADD CONSTRAINT `fixture_team_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `team_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_team_standing`
--
ALTER TABLE `sbm_team_standing`
  ADD CONSTRAINT `team_standing_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_team_statistics`
--
ALTER TABLE `sbm_team_statistics`
  ADD CONSTRAINT `team-st_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `team_st_team_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_user`
--
ALTER TABLE `sbm_user`
  ADD CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_user_role` (`role_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_user_correct_score_bid`
--
ALTER TABLE `sbm_user_correct_score_bid`
  ADD CONSTRAINT `correct_score_odd_id` FOREIGN KEY (`correct_score_odd_id`) REFERENCES `sbm_correct_score_odd` (`correct_score_odd_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `score_bid_user_id` FOREIGN KEY (`user_id`) REFERENCES `sbm_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_user_weekly_bid`
--
ALTER TABLE `sbm_user_weekly_bid`
  ADD CONSTRAINT `weekly_bid_odd_id` FOREIGN KEY (`weekly_odd_id`) REFERENCES `sbm_weekly_odd` (`weekly_odd_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `weekly_bid_user_id` FOREIGN KEY (`user_id`) REFERENCES `sbm_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sbm_weekly_odd`
--
ALTER TABLE `sbm_weekly_odd`
  ADD CONSTRAINT `weekly_odd_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
Navicat MySQL Data Transfer

Source Server         : mysql-localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : sbm_v1

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-11-05 13:59:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `milyo`
-- ----------------------------
DROP TABLE IF EXISTS `milyo`;
CREATE TABLE `milyo` (
  `fixture_id` int(11) NOT NULL DEFAULT '0',
  `fixture_date` datetime NOT NULL,
  `home_team` varchar(100) DEFAULT NULL,
  `away_team` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of milyo
-- ----------------------------
INSERT INTO `milyo` VALUES ('4', '2015-10-14 12:45:00', 'Manchester United', 'Sunderland');
INSERT INTO `milyo` VALUES ('19', '2015-10-22 17:30:00', 'Arsenal', 'Manchester United');
INSERT INTO `milyo` VALUES ('24', '2015-10-26 12:45:00', 'Everton', 'Manchester United');

-- ----------------------------
-- Table structure for `sbm_correct_score_odd`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_correct_score_odd`;
CREATE TABLE `sbm_correct_score_odd` (
  `correct_score_odd_id` int(11) NOT NULL AUTO_INCREMENT,
  `odd` float NOT NULL,
  `score` varchar(10) NOT NULL,
  `fixture_id` int(11) NOT NULL,
  PRIMARY KEY (`correct_score_odd_id`),
  KEY `correct_score_fixture_id_idx` (`fixture_id`),
  CONSTRAINT `correct_score_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_correct_score_odd
-- ----------------------------
INSERT INTO `sbm_correct_score_odd` VALUES ('1', '1.1', '1-0', '1');
INSERT INTO `sbm_correct_score_odd` VALUES ('2', '2.2', '0-0', '1');
INSERT INTO `sbm_correct_score_odd` VALUES ('3', '4.3', '0-1', '1');
INSERT INTO `sbm_correct_score_odd` VALUES ('4', '2', '2-0', '1');
INSERT INTO `sbm_correct_score_odd` VALUES ('5', '1.1', '1-1', '1');
INSERT INTO `sbm_correct_score_odd` VALUES ('6', '3.4', '0-2', '1');
INSERT INTO `sbm_correct_score_odd` VALUES ('7', '1.1', '1-0', '2');
INSERT INTO `sbm_correct_score_odd` VALUES ('8', '2.2', '0-0', '2');
INSERT INTO `sbm_correct_score_odd` VALUES ('9', '4.3', '0-1', '2');
INSERT INTO `sbm_correct_score_odd` VALUES ('10', '2', '2-0', '2');
INSERT INTO `sbm_correct_score_odd` VALUES ('11', '1.1', '1-1', '2');
INSERT INTO `sbm_correct_score_odd` VALUES ('12', '3.4', '0-2', '2');
INSERT INTO `sbm_correct_score_odd` VALUES ('13', '1.1', '1-0', '3');
INSERT INTO `sbm_correct_score_odd` VALUES ('14', '2.2', '0-0', '3');
INSERT INTO `sbm_correct_score_odd` VALUES ('15', '4.3', '0-1', '3');
INSERT INTO `sbm_correct_score_odd` VALUES ('16', '2', '2-0', '3');
INSERT INTO `sbm_correct_score_odd` VALUES ('17', '1.1', '1-1', '3');
INSERT INTO `sbm_correct_score_odd` VALUES ('18', '3.4', '0-2', '3');
INSERT INTO `sbm_correct_score_odd` VALUES ('19', '1.1', '1-0', '4');
INSERT INTO `sbm_correct_score_odd` VALUES ('20', '2.2', '0-0', '4');
INSERT INTO `sbm_correct_score_odd` VALUES ('21', '4.3', '0-1', '4');
INSERT INTO `sbm_correct_score_odd` VALUES ('22', '2', '2-0', '4');
INSERT INTO `sbm_correct_score_odd` VALUES ('23', '1.1', '1-1', '4');
INSERT INTO `sbm_correct_score_odd` VALUES ('24', '3.4', '0-2', '4');
INSERT INTO `sbm_correct_score_odd` VALUES ('25', '1.1', '1-0', '5');
INSERT INTO `sbm_correct_score_odd` VALUES ('26', '2.2', '0-0', '5');
INSERT INTO `sbm_correct_score_odd` VALUES ('27', '4.3', '0-1', '5');
INSERT INTO `sbm_correct_score_odd` VALUES ('28', '2', '2-0', '5');
INSERT INTO `sbm_correct_score_odd` VALUES ('29', '1.1', '1-1', '5');
INSERT INTO `sbm_correct_score_odd` VALUES ('30', '3.4', '0-2', '5');
INSERT INTO `sbm_correct_score_odd` VALUES ('31', '1.1', '1-0', '6');
INSERT INTO `sbm_correct_score_odd` VALUES ('32', '2.2', '0-0', '6');
INSERT INTO `sbm_correct_score_odd` VALUES ('33', '4.3', '0-1', '6');
INSERT INTO `sbm_correct_score_odd` VALUES ('34', '2', '2-0', '6');
INSERT INTO `sbm_correct_score_odd` VALUES ('35', '1.1', '1-1', '6');
INSERT INTO `sbm_correct_score_odd` VALUES ('36', '3.4', '0-2', '6');
INSERT INTO `sbm_correct_score_odd` VALUES ('37', '1.1', '1-0', '7');
INSERT INTO `sbm_correct_score_odd` VALUES ('38', '2.2', '0-0', '7');
INSERT INTO `sbm_correct_score_odd` VALUES ('39', '4.3', '0-1', '7');
INSERT INTO `sbm_correct_score_odd` VALUES ('40', '2', '2-0', '7');
INSERT INTO `sbm_correct_score_odd` VALUES ('41', '1.1', '1-1', '7');
INSERT INTO `sbm_correct_score_odd` VALUES ('42', '3.4', '0-2', '7');
INSERT INTO `sbm_correct_score_odd` VALUES ('43', '1.1', '1-0', '8');
INSERT INTO `sbm_correct_score_odd` VALUES ('44', '2.2', '0-0', '8');
INSERT INTO `sbm_correct_score_odd` VALUES ('45', '4.3', '0-1', '8');
INSERT INTO `sbm_correct_score_odd` VALUES ('46', '2', '2-0', '8');
INSERT INTO `sbm_correct_score_odd` VALUES ('47', '1.1', '1-1', '8');
INSERT INTO `sbm_correct_score_odd` VALUES ('48', '3.4', '0-2', '8');
INSERT INTO `sbm_correct_score_odd` VALUES ('49', '1.1', '1-0', '9');
INSERT INTO `sbm_correct_score_odd` VALUES ('50', '2.2', '0-0', '9');
INSERT INTO `sbm_correct_score_odd` VALUES ('51', '4.3', '0-1', '9');
INSERT INTO `sbm_correct_score_odd` VALUES ('52', '2', '2-0', '9');
INSERT INTO `sbm_correct_score_odd` VALUES ('53', '1.1', '1-1', '9');
INSERT INTO `sbm_correct_score_odd` VALUES ('54', '3.4', '0-2', '9');
INSERT INTO `sbm_correct_score_odd` VALUES ('55', '1.1', '1-0', '10');
INSERT INTO `sbm_correct_score_odd` VALUES ('56', '2.2', '0-0', '10');
INSERT INTO `sbm_correct_score_odd` VALUES ('57', '4.3', '0-1', '10');
INSERT INTO `sbm_correct_score_odd` VALUES ('58', '2', '2-0', '10');
INSERT INTO `sbm_correct_score_odd` VALUES ('59', '1.1', '1-1', '10');
INSERT INTO `sbm_correct_score_odd` VALUES ('60', '3.4', '0-2', '10');
INSERT INTO `sbm_correct_score_odd` VALUES ('61', '1.1', '1-0', '11');
INSERT INTO `sbm_correct_score_odd` VALUES ('62', '2.2', '0-0', '11');
INSERT INTO `sbm_correct_score_odd` VALUES ('63', '4.3', '0-1', '11');
INSERT INTO `sbm_correct_score_odd` VALUES ('64', '2', '2-0', '11');
INSERT INTO `sbm_correct_score_odd` VALUES ('65', '1.1', '1-1', '11');
INSERT INTO `sbm_correct_score_odd` VALUES ('66', '3.4', '0-2', '11');
INSERT INTO `sbm_correct_score_odd` VALUES ('67', '1.1', '1-0', '12');
INSERT INTO `sbm_correct_score_odd` VALUES ('68', '2.2', '0-0', '12');
INSERT INTO `sbm_correct_score_odd` VALUES ('69', '4.3', '0-1', '12');
INSERT INTO `sbm_correct_score_odd` VALUES ('70', '2', '2-0', '12');
INSERT INTO `sbm_correct_score_odd` VALUES ('71', '1.1', '1-1', '12');
INSERT INTO `sbm_correct_score_odd` VALUES ('72', '3.4', '0-2', '12');
INSERT INTO `sbm_correct_score_odd` VALUES ('73', '1.1', '1-0', '13');
INSERT INTO `sbm_correct_score_odd` VALUES ('74', '2.2', '0-0', '13');
INSERT INTO `sbm_correct_score_odd` VALUES ('75', '4.3', '0-1', '13');
INSERT INTO `sbm_correct_score_odd` VALUES ('76', '2', '2-0', '13');
INSERT INTO `sbm_correct_score_odd` VALUES ('77', '1.1', '1-1', '13');
INSERT INTO `sbm_correct_score_odd` VALUES ('78', '3.4', '0-2', '13');
INSERT INTO `sbm_correct_score_odd` VALUES ('79', '1.1', '1-0', '14');
INSERT INTO `sbm_correct_score_odd` VALUES ('80', '2.2', '0-0', '14');
INSERT INTO `sbm_correct_score_odd` VALUES ('81', '4.3', '0-1', '14');
INSERT INTO `sbm_correct_score_odd` VALUES ('82', '2', '2-0', '14');
INSERT INTO `sbm_correct_score_odd` VALUES ('83', '1.1', '1-1', '14');
INSERT INTO `sbm_correct_score_odd` VALUES ('84', '3.4', '0-2', '14');
INSERT INTO `sbm_correct_score_odd` VALUES ('85', '1.1', '1-0', '15');
INSERT INTO `sbm_correct_score_odd` VALUES ('86', '2.2', '0-0', '15');
INSERT INTO `sbm_correct_score_odd` VALUES ('87', '4.3', '0-1', '15');
INSERT INTO `sbm_correct_score_odd` VALUES ('88', '2', '2-0', '15');
INSERT INTO `sbm_correct_score_odd` VALUES ('89', '1.1', '1-1', '15');
INSERT INTO `sbm_correct_score_odd` VALUES ('90', '3.4', '0-2', '15');
INSERT INTO `sbm_correct_score_odd` VALUES ('91', '1.1', '1-0', '16');
INSERT INTO `sbm_correct_score_odd` VALUES ('92', '2.2', '0-0', '16');
INSERT INTO `sbm_correct_score_odd` VALUES ('93', '4.3', '0-1', '16');
INSERT INTO `sbm_correct_score_odd` VALUES ('94', '2', '2-0', '16');
INSERT INTO `sbm_correct_score_odd` VALUES ('95', '1.1', '1-1', '16');
INSERT INTO `sbm_correct_score_odd` VALUES ('96', '3.4', '0-2', '17');
INSERT INTO `sbm_correct_score_odd` VALUES ('97', '1.1', '1-0', '17');
INSERT INTO `sbm_correct_score_odd` VALUES ('98', '2.2', '0-0', '17');
INSERT INTO `sbm_correct_score_odd` VALUES ('99', '4.3', '0-1', '17');
INSERT INTO `sbm_correct_score_odd` VALUES ('100', '2', '2-0', '17');
INSERT INTO `sbm_correct_score_odd` VALUES ('101', '1.1', '1-1', '17');
INSERT INTO `sbm_correct_score_odd` VALUES ('102', '3.4', '0-2', '18');
INSERT INTO `sbm_correct_score_odd` VALUES ('103', '1.1', '1-0', '18');
INSERT INTO `sbm_correct_score_odd` VALUES ('104', '2.2', '0-0', '18');
INSERT INTO `sbm_correct_score_odd` VALUES ('105', '4.3', '0-1', '18');
INSERT INTO `sbm_correct_score_odd` VALUES ('106', '2', '2-0', '18');
INSERT INTO `sbm_correct_score_odd` VALUES ('107', '1.1', '1-1', '18');
INSERT INTO `sbm_correct_score_odd` VALUES ('108', '3.4', '0-2', '19');
INSERT INTO `sbm_correct_score_odd` VALUES ('109', '1.1', '1-0', '19');
INSERT INTO `sbm_correct_score_odd` VALUES ('110', '2.2', '0-0', '19');
INSERT INTO `sbm_correct_score_odd` VALUES ('111', '4.3', '0-1', '19');
INSERT INTO `sbm_correct_score_odd` VALUES ('112', '2', '2-0', '19');
INSERT INTO `sbm_correct_score_odd` VALUES ('113', '1.1', '1-1', '19');
INSERT INTO `sbm_correct_score_odd` VALUES ('114', '3.4', '0-2', '20');
INSERT INTO `sbm_correct_score_odd` VALUES ('115', '1.1', '1-0', '20');
INSERT INTO `sbm_correct_score_odd` VALUES ('116', '2.2', '0-0', '20');
INSERT INTO `sbm_correct_score_odd` VALUES ('117', '4.3', '0-1', '20');
INSERT INTO `sbm_correct_score_odd` VALUES ('118', '2', '2-0', '20');
INSERT INTO `sbm_correct_score_odd` VALUES ('119', '1.1', '1-1', '20');
INSERT INTO `sbm_correct_score_odd` VALUES ('120', '3.4', '0-2', '21');
INSERT INTO `sbm_correct_score_odd` VALUES ('121', '1.1', '1-0', '21');
INSERT INTO `sbm_correct_score_odd` VALUES ('122', '2.2', '0-0', '21');
INSERT INTO `sbm_correct_score_odd` VALUES ('123', '4.3', '0-1', '21');
INSERT INTO `sbm_correct_score_odd` VALUES ('124', '2', '2-0', '21');
INSERT INTO `sbm_correct_score_odd` VALUES ('125', '1.1', '1-1', '21');
INSERT INTO `sbm_correct_score_odd` VALUES ('126', '3.4', '0-2', '22');
INSERT INTO `sbm_correct_score_odd` VALUES ('127', '1.1', '1-0', '22');
INSERT INTO `sbm_correct_score_odd` VALUES ('128', '2.2', '0-0', '22');
INSERT INTO `sbm_correct_score_odd` VALUES ('129', '4.3', '0-1', '22');
INSERT INTO `sbm_correct_score_odd` VALUES ('130', '2', '2-0', '22');
INSERT INTO `sbm_correct_score_odd` VALUES ('131', '1.1', '1-1', '22');
INSERT INTO `sbm_correct_score_odd` VALUES ('132', '3.4', '0-2', '23');
INSERT INTO `sbm_correct_score_odd` VALUES ('133', '1.1', '1-0', '23');
INSERT INTO `sbm_correct_score_odd` VALUES ('134', '2.2', '0-0', '23');
INSERT INTO `sbm_correct_score_odd` VALUES ('135', '4.3', '0-1', '23');
INSERT INTO `sbm_correct_score_odd` VALUES ('136', '2', '2-0', '23');
INSERT INTO `sbm_correct_score_odd` VALUES ('137', '1.1', '1-1', '23');
INSERT INTO `sbm_correct_score_odd` VALUES ('138', '3.4', '0-2', '24');
INSERT INTO `sbm_correct_score_odd` VALUES ('139', '1.1', '1-0', '24');
INSERT INTO `sbm_correct_score_odd` VALUES ('140', '2.2', '0-0', '24');
INSERT INTO `sbm_correct_score_odd` VALUES ('141', '4.3', '0-1', '24');
INSERT INTO `sbm_correct_score_odd` VALUES ('142', '2', '2-0', '24');
INSERT INTO `sbm_correct_score_odd` VALUES ('143', '1.1', '1-1', '24');
INSERT INTO `sbm_correct_score_odd` VALUES ('144', '3.4', '0-2', '25');
INSERT INTO `sbm_correct_score_odd` VALUES ('145', '1.1', '1-0', '25');
INSERT INTO `sbm_correct_score_odd` VALUES ('146', '2.2', '0-0', '25');
INSERT INTO `sbm_correct_score_odd` VALUES ('147', '4.3', '0-1', '25');
INSERT INTO `sbm_correct_score_odd` VALUES ('148', '2', '2-0', '25');
INSERT INTO `sbm_correct_score_odd` VALUES ('149', '1.1', '1-1', '25');
INSERT INTO `sbm_correct_score_odd` VALUES ('150', '3.4', '0-2', '26');
INSERT INTO `sbm_correct_score_odd` VALUES ('151', '1.1', '1-0', '26');
INSERT INTO `sbm_correct_score_odd` VALUES ('152', '2.2', '0-0', '26');
INSERT INTO `sbm_correct_score_odd` VALUES ('153', '4.3', '0-1', '26');
INSERT INTO `sbm_correct_score_odd` VALUES ('154', '2', '2-0', '26');
INSERT INTO `sbm_correct_score_odd` VALUES ('155', '1.1', '1-1', '26');
INSERT INTO `sbm_correct_score_odd` VALUES ('156', '3.4', '0-2', '27');
INSERT INTO `sbm_correct_score_odd` VALUES ('157', '1.1', '1-0', '27');
INSERT INTO `sbm_correct_score_odd` VALUES ('158', '2.2', '0-0', '27');
INSERT INTO `sbm_correct_score_odd` VALUES ('159', '4.3', '0-1', '27');
INSERT INTO `sbm_correct_score_odd` VALUES ('160', '2', '2-0', '27');
INSERT INTO `sbm_correct_score_odd` VALUES ('161', '1.1', '1-1', '27');
INSERT INTO `sbm_correct_score_odd` VALUES ('162', '3.4', '0-2', '28');
INSERT INTO `sbm_correct_score_odd` VALUES ('163', '1.1', '1-0', '28');
INSERT INTO `sbm_correct_score_odd` VALUES ('164', '2.2', '0-0', '28');
INSERT INTO `sbm_correct_score_odd` VALUES ('165', '4.3', '0-1', '28');
INSERT INTO `sbm_correct_score_odd` VALUES ('166', '2', '2-0', '28');
INSERT INTO `sbm_correct_score_odd` VALUES ('167', '1.1', '1-1', '28');
INSERT INTO `sbm_correct_score_odd` VALUES ('168', '3.4', '0-2', '29');
INSERT INTO `sbm_correct_score_odd` VALUES ('169', '1.1', '1-0', '29');
INSERT INTO `sbm_correct_score_odd` VALUES ('170', '2.2', '0-0', '29');
INSERT INTO `sbm_correct_score_odd` VALUES ('171', '4.3', '0-1', '29');
INSERT INTO `sbm_correct_score_odd` VALUES ('172', '2', '2-0', '29');
INSERT INTO `sbm_correct_score_odd` VALUES ('173', '1.1', '1-1', '29');
INSERT INTO `sbm_correct_score_odd` VALUES ('174', '3.4', '0-2', '30');
INSERT INTO `sbm_correct_score_odd` VALUES ('175', '1.1', '1-0', '30');
INSERT INTO `sbm_correct_score_odd` VALUES ('176', '2.2', '0-0', '30');
INSERT INTO `sbm_correct_score_odd` VALUES ('177', '4.3', '0-1', '30');
INSERT INTO `sbm_correct_score_odd` VALUES ('178', '1.1', '1-0', '30');
INSERT INTO `sbm_correct_score_odd` VALUES ('179', '2.2', '0-0', '30');

-- ----------------------------
-- Table structure for `sbm_country`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_country`;
CREATE TABLE `sbm_country` (
  `country_name` varchar(45) NOT NULL,
  `continent_name` varchar(45) NOT NULL,
  PRIMARY KEY (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_country
-- ----------------------------
INSERT INTO `sbm_country` VALUES ('Argentina', 'America');
INSERT INTO `sbm_country` VALUES ('Brazil', 'America');
INSERT INTO `sbm_country` VALUES ('England', 'Europe');
INSERT INTO `sbm_country` VALUES ('France', 'Europe');
INSERT INTO `sbm_country` VALUES ('Germany', 'Europe');
INSERT INTO `sbm_country` VALUES ('Italy', 'Europe');
INSERT INTO `sbm_country` VALUES ('Japan', 'Asia');
INSERT INTO `sbm_country` VALUES ('Mexigo', 'America');
INSERT INTO `sbm_country` VALUES ('Nepal', 'Asia');
INSERT INTO `sbm_country` VALUES ('Spain', 'Europe');
INSERT INTO `sbm_country` VALUES ('Thailand\r', 'Asia');

-- ----------------------------
-- Table structure for `sbm_fixture`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_fixture`;
CREATE TABLE `sbm_fixture` (
  `fixture_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_week` varchar(45) NOT NULL,
  `fixture_date` datetime NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`fixture_id`),
  KEY `league_id_idx` (`league_id`),
  CONSTRAINT `fixture_league_id` FOREIGN KEY (`league_id`) REFERENCES `sbm_league` (`league_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_fixture
-- ----------------------------
INSERT INTO `sbm_fixture` VALUES ('1', 'Gameweek7', '2015-10-11 13:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('2', 'Gameweek7', '2015-10-12 16:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('3', 'Gameweek7', '2015-10-13 20:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('4', 'Gameweek7', '2015-10-14 12:45:00', '1');
INSERT INTO `sbm_fixture` VALUES ('5', 'Gameweek7', '2015-10-15 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('6', 'Gameweek7', '2015-10-16 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('7', 'Gameweek7', '2015-10-17 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('8', 'Gameweek7', '2015-10-12 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('9', 'Gameweek7', '2015-10-13 17:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('10', 'Gameweek7', '2015-10-17 13:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('11', 'Gameweek8', '2015-10-18 13:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('12', 'Gameweek8', '2015-10-19 16:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('13', 'Gameweek8', '2015-10-20 20:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('14', 'Gameweek8', '2015-10-21 12:45:00', '1');
INSERT INTO `sbm_fixture` VALUES ('15', 'Gameweek8', '2015-10-22 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('16', 'Gameweek8', '2015-10-23 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('17', 'Gameweek8', '2015-10-24 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('18', 'Gameweek8', '2015-10-20 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('19', 'Gameweek8', '2015-10-22 17:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('20', 'Gameweek8', '2015-10-19 13:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('21', 'Gameweek9', '2015-10-25 13:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('22', 'Gameweek9', '2015-10-25 16:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('23', 'Gameweek9', '2015-10-26 20:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('24', 'Gameweek9', '2015-10-26 12:45:00', '1');
INSERT INTO `sbm_fixture` VALUES ('25', 'Gameweek9', '2015-10-26 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('26', 'Gameweek9', '2015-10-26 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('27', 'Gameweek9', '2015-10-27 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('28', 'Gameweek9', '2015-10-27 15:00:00', '1');
INSERT INTO `sbm_fixture` VALUES ('29', 'Gameweek9', '2015-10-27 17:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('30', 'Gameweek9', '2015-10-27 13:30:00', '1');
INSERT INTO `sbm_fixture` VALUES ('31', 'Gameweek10', '2015-11-05 01:00:00', '1');

-- ----------------------------
-- Table structure for `sbm_league`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_league`;
CREATE TABLE `sbm_league` (
  `league_id` int(11) NOT NULL AUTO_INCREMENT,
  `participants_number` int(11) NOT NULL,
  `league_name` varchar(100) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`league_id`),
  KEY `organization_id_idx` (`organization_id`),
  CONSTRAINT `organization_id` FOREIGN KEY (`organization_id`) REFERENCES `sbm_organization` (`organization_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_league
-- ----------------------------
INSERT INTO `sbm_league` VALUES ('1', '20', 'English Premier League', '1');
INSERT INTO `sbm_league` VALUES ('2', '18', 'Toyota Premier League', '3');
INSERT INTO `sbm_league` VALUES ('3', '18', 'A Division League', '2');
INSERT INTO `sbm_league` VALUES ('4', '12', 'France Premiun League', '4');
INSERT INTO `sbm_league` VALUES ('5', '10', 'Japan Premium League', '5');
INSERT INTO `sbm_league` VALUES ('6', '15', 'Japan League', '5');

-- ----------------------------
-- Table structure for `sbm_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_organization`;
CREATE TABLE `sbm_organization` (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(45) NOT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`organization_id`),
  KEY `country_name_idx` (`country_name`),
  CONSTRAINT `country_name` FOREIGN KEY (`country_name`) REFERENCES `sbm_country` (`country_name`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_organization
-- ----------------------------
INSERT INTO `sbm_organization` VALUES ('1', 'FA', 'England');
INSERT INTO `sbm_organization` VALUES ('2', 'AFC', 'Nepal');
INSERT INTO `sbm_organization` VALUES ('3', 'Toyota', 'Thailand\r');
INSERT INTO `sbm_organization` VALUES ('4', 'France org', 'France');
INSERT INTO `sbm_organization` VALUES ('5', 'Japan org', 'Japan');

-- ----------------------------
-- Table structure for `sbm_owner`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_owner`;
CREATE TABLE `sbm_owner` (
  `team_id` int(11) NOT NULL,
  `owner_name` varchar(45) NOT NULL,
  PRIMARY KEY (`team_id`,`owner_name`),
  CONSTRAINT `owner_team_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_owner
-- ----------------------------
INSERT INTO `sbm_owner` VALUES ('1', 'Maxim Demin');
INSERT INTO `sbm_owner` VALUES ('2', 'Alisher Usmanov');
INSERT INTO `sbm_owner` VALUES ('2', 'E. Stanley Kroenke');
INSERT INTO `sbm_owner` VALUES ('2', 'Farhad Moshiri');
INSERT INTO `sbm_owner` VALUES ('3', 'Randy Lerner');
INSERT INTO `sbm_owner` VALUES ('4', ' Roman Abramovich');
INSERT INTO `sbm_owner` VALUES ('5', 'Jeremy Hosking');
INSERT INTO `sbm_owner` VALUES ('5', 'Martin Long');
INSERT INTO `sbm_owner` VALUES ('5', 'Stephen Browett');
INSERT INTO `sbm_owner` VALUES ('5', 'Steve Parish');
INSERT INTO `sbm_owner` VALUES ('6', 'Bill Kenwright CBE');
INSERT INTO `sbm_owner` VALUES ('6', 'Jon Woods ');
INSERT INTO `sbm_owner` VALUES ('6', 'Robert Earl');
INSERT INTO `sbm_owner` VALUES ('7', 'The Srivaddhanaprabha Family');
INSERT INTO `sbm_owner` VALUES ('8', 'John W. Henry');
INSERT INTO `sbm_owner` VALUES ('9', 'Mansour bin Zayed Al Nahyan');
INSERT INTO `sbm_owner` VALUES ('10', 'The Glazer Family');
INSERT INTO `sbm_owner` VALUES ('11', 'Mike Ashley');
INSERT INTO `sbm_owner` VALUES ('12', 'Delia Smith ');
INSERT INTO `sbm_owner` VALUES ('12', 'Michael Foulger');
INSERT INTO `sbm_owner` VALUES ('12', 'Michael Wynn-Jones');
INSERT INTO `sbm_owner` VALUES ('13', 'Katharina Liebherr');
INSERT INTO `sbm_owner` VALUES ('14', 'The Coates Family');
INSERT INTO `sbm_owner` VALUES ('15', 'Ellis Short');
INSERT INTO `sbm_owner` VALUES ('16', 'Brian Katzen');
INSERT INTO `sbm_owner` VALUES ('16', 'Huw Jenkins');
INSERT INTO `sbm_owner` VALUES ('16', 'Mr. & Mrs. Martin Morgan');
INSERT INTO `sbm_owner` VALUES ('16', 'Robert Davies');
INSERT INTO `sbm_owner` VALUES ('16', 'Swansea City Supporters Trust');
INSERT INTO `sbm_owner` VALUES ('17', 'Daniel Levy');
INSERT INTO `sbm_owner` VALUES ('17', 'Joe Lewis');
INSERT INTO `sbm_owner` VALUES ('18', 'Gino Pozzo');
INSERT INTO `sbm_owner` VALUES ('19', 'Jeremy Peace');
INSERT INTO `sbm_owner` VALUES ('20', 'CB Holding ehf');
INSERT INTO `sbm_owner` VALUES ('20', 'David Gold');
INSERT INTO `sbm_owner` VALUES ('20', 'David Sullivan');

-- ----------------------------
-- Table structure for `sbm_payment_type`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_payment_type`;
CREATE TABLE `sbm_payment_type` (
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`payment_type`),
  CONSTRAINT `payment_user_id` FOREIGN KEY (`user_id`) REFERENCES `sbm_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_payment_type
-- ----------------------------
INSERT INTO `sbm_payment_type` VALUES ('2', 'Paypal');
INSERT INTO `sbm_payment_type` VALUES ('3', 'Draft');
INSERT INTO `sbm_payment_type` VALUES ('5', 'Draft');

-- ----------------------------
-- Table structure for `sbm_player`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_player`;
CREATE TABLE `sbm_player` (
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
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=640 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_player
-- ----------------------------
INSERT INTO `sbm_player` VALUES ('1', 'Available', 'GK', 'Ryan', 'Allsop', '1', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('2', 'Available', 'MF', 'Harry', 'Arter', '2', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('3', 'Available', 'MF', 'Christian', 'Atsu', '3', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('4', 'Available', 'GK', 'Artur', 'Boruc', '4', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('5', 'Available', 'DF', 'Matt', 'Butcher', '5', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('6', 'Available', 'DF', 'Bailey', 'Cargill', '6', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('7', 'Available', 'DF', 'Steve', 'Cook', '7', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('8', 'Available', 'FW', 'Harry', 'Cornick', '8', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('9', 'Available', 'DF', 'Filippo', 'Costa', '9', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('10', 'Available', 'MF', 'Charlie', 'Daniels', '10', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('11', 'Available', 'DF', 'Sylvain', 'Distin', '11', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('12', 'Available', 'DF', 'Tommy', 'Elphick', '12', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('13', 'Available', 'GK', 'Adam', 'Federici', '13', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('14', 'Available', 'DF', 'Simon', 'Francis', '14', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('15', 'Available', 'MF', 'Dan', 'Gosling', '15', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('16', 'Available', 'FW', 'Max', 'Gradel', '16', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('17', 'Available', 'FW', 'Yann', 'Kermorgant', '17', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('18', 'Available', 'FW', 'Joshua', 'King', '18', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('19', 'Available', 'MF', 'Shaun', 'MacDonald', '19', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('20', 'Available', 'DF', 'Tyrone', 'Mings', '20', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('21', 'Available', 'FW', 'Glenn', 'Murray', '21', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('22', 'Available', 'MF', 'Eunan', 'O\'Kane', '22', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('23', 'Available', 'MF', 'Marc', 'Pugh', '23', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('24', 'Available', 'FW', 'Tokelo', 'Rantie', '24', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('25', 'Available', 'MF', 'Matt', 'Ritchie', '25', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('26', 'Available', 'DF', 'Adam', 'Adam ', '26', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('27', 'Available', 'MF', 'Junior', 'Junior ', '27', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('28', 'Available', 'FW', 'Jayden', 'Jayden ', '28', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('29', 'Available', 'MF', 'Andrew', 'Andrew ', '29', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('30', 'Available', 'FW', 'Lee', 'Lee ', '30', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('31', 'Available', 'DF', 'Josh', 'Josh ', '31', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('32', 'Available', 'DF', 'Elliott', 'Elliott ', '32', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('33', 'Available', 'FW', 'Callum', 'Callum ', '33', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('34', 'Available', 'DF', 'Stéphane', 'Stéphane ', '34', '0000-00-00', '0000-00-00', '0000-00-00', '1');
INSERT INTO `sbm_player` VALUES ('35', 'Available', 'MF', 'Krystian', 'Krystian ', '1', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('36', 'Available', 'FW', 'Joel', 'Joel ', '2', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('37', 'Available', 'GK', 'Petr', 'Petr ', '3', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('38', 'Available', 'DF', 'Calum', 'Calum ', '4', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('39', 'Available', 'MF', 'Francis', 'Francis ', '5', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('40', 'Available', 'DF', 'Mathieu', 'Mathieu ', '6', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('41', 'Available', 'MF', 'Mathieu', 'Mathieu ', '7', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('42', 'Available', 'DF', 'Gabriel', 'Gabriel ', '8', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('43', 'Available', 'DF', 'Kieran', 'Kieran ', '9', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('44', 'Available', 'FW', 'Olivier', 'Olivier ', '10', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('45', 'Available', 'DF', 'Héctor', 'Héctor ', '11', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('46', 'Available', 'FW', 'Alex', 'Alex ', '12', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('47', 'Available', 'DF', 'Laurent', 'Laurent ', '13', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('48', 'Available', 'GK', 'Matt', 'Matt ', '14', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('49', 'Available', 'DF', 'Per', 'Per ', '15', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('50', 'Available', 'MF', 'Mikel', 'Mikel ', '16', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('51', 'Available', 'DF', 'Nacho', 'Nacho ', '17', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('52', 'Available', 'GK', 'David', 'David ', '18', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('53', 'Available', 'FW', 'Alex', 'Alex ', '19', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('54', 'Available', 'MF', 'Mesut', 'Mesut ', '20', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('55', 'Available', 'MF', 'Aaron', 'Aaron ', '21', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('56', 'Available', 'MF', 'Tomáš', 'Tomáš ', '22', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('57', 'Available', 'FW', 'Alexis', 'Alexis ', '23', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('58', 'Available', 'MF', 'Santi', 'Santi ', '24', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('59', 'Available', 'FW', 'Theo', 'Theo ', '25', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('60', 'Available', 'FW', 'Danny', 'Danny ', '26', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('61', 'Available', 'MF', 'Jack', 'Jack ', '27', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('62', 'Available', 'MF', 'Gedion', 'Gedion ', '28', '0000-00-00', '0000-00-00', '0000-00-00', '2');
INSERT INTO `sbm_player` VALUES ('63', 'Available', 'FW', 'Gabriel', 'Gabriel ', '1', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('64', 'Available', 'DF', 'Jordan', 'Jordan ', '2', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('65', 'Available', 'DF', 'Ángel', 'Ángel ', '3', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('66', 'Available', 'FW', 'Jordan', 'Jordan ', '4', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('67', 'Available', 'DF', 'Leandro', 'Leandro ', '5', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('68', 'Available', 'DF', 'Joe', 'Joe ', '6', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('69', 'Available', 'FW', 'Corey', 'Corey ', '7', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('70', 'Available', 'GK', 'Mark', 'Bunn', '8', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('71', 'Available', 'FW', 'Carles', 'Gil', '9', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('72', 'Available', 'DF', 'Ciaran', 'Clark', '10', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('73', 'Available', 'MF', 'Joe', 'Cole', '11', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('74', 'Available', 'MF', 'Gary', 'Gardner', '12', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('75', 'Available', 'FW', 'Rudy', 'Gestede', '13', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('76', 'Available', 'MF', 'Jack', 'Grealish', '14', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('77', 'Available', 'MF', 'Idrissa', 'Gueye', '15', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('78', 'Available', 'GK', 'Brad', 'Guzan', '16', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('79', 'Available', 'DF', 'Alan', 'Hutton', '17', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('80', 'Available', 'DF', 'Lewis', 'Kinsella', '18', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('81', 'Available', 'FW', 'Libor', 'Kozák', '19', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('82', 'Available', 'DF', 'Joleon', 'Lescott', '20', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('83', 'Available', 'MF', 'Charles', 'N\'Zogbia', '21', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('84', 'Available', 'DF', 'Jores', 'Okore', '22', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('85', 'Available', 'DF', 'Micah', 'Richards', '23', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('86', 'Available', 'MF', 'Kieran', 'Richardson', '24', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('87', 'Available', 'MF', 'Carlos', 'Sánchez', '25', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('88', 'Available', 'GK', 'Matija', 'Šarki?', '26', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('89', 'Available', 'MF', 'Jerell', 'Sellars', '27', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('90', 'Available', 'DF', 'Philippe', 'Senderos', '28', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('91', 'Available', 'MF', 'Scott', 'Sinclair', '29', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('92', 'Available', 'GK', 'Jed', 'Steer', '30', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('93', 'Available', 'DF', 'Easah', 'Suliman', '31', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('94', 'Available', 'DF', 'Tiago', 'Ilori', '32', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('95', 'Available', 'FW', 'Adama', 'Traoré', '33', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('96', 'Available', 'MF', 'Jordan', 'Veretout', '34', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('97', 'Available', 'GK', 'Bradley', 'Watkins', '35', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('98', 'Available', 'MF', 'Ashley', 'Westwood', '36', '0000-00-00', '0000-00-00', '0000-00-00', '3');
INSERT INTO `sbm_player` VALUES ('99', 'Available', 'DF', 'Ola', 'Aina', '1', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('100', 'Available', 'GK', 'Marco', 'Amelia', '2', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('101', 'Available', 'DF', 'Azpilicueta', 'Azpilicueta', '3', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('102', 'Available', 'DF', 'Abdul', 'Rahman Baba', '4', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('103', 'Available', 'GK', 'Asmir', 'Begovi?', '5', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('104', 'Available', 'GK', 'Jamal', 'Blackman', '6', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('105', 'Available', 'DF', 'Gary', 'Cahill', '7', '0000-00-00', '0000-00-01', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('106', 'Available', 'MF', 'Cesc', 'Fàbregas', '8', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('107', 'Available', 'GK', 'Thibaut', 'Courtois', '9', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('108', 'Available', 'FW', 'Diego', 'Costa', '10', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('109', 'Available', 'DF', 'Papy', 'Djilobodji', '11', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('110', 'Available', 'FW', 'Radamel', 'Falcao', '12', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('111', 'Available', 'MF', 'Eden', 'Hazard', '13', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('112', 'Available', 'DF', 'Branislav', 'Ivanovi?', '14', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('113', 'Available', 'FW', 'Kenedy', 'Kenedy', '15', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('114', 'Available', 'MF', 'Ruben', 'Loftus-Cheek', '16', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('115', 'Available', 'MF', 'Nemanja', 'Mati?', '17', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('116', 'Available', 'MF', 'John', 'Mikel', '18', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('117', 'Available', 'MF', 'Oscar', 'Oscar', '19', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('118', 'Available', 'MF', 'Pedro', 'Pedro', '20', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('119', 'Available', 'MF', 'Ramires', 'Ramires', '21', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('120', 'Available', 'FW', 'Loïc', 'Rémy', '22', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('121', 'Available', 'DF', 'John', 'Terry', '23', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('122', 'Available', 'FW', 'Bertrand', 'Traoré', '24', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('123', 'Available', 'MF', 'Willian', 'Willian', '25', '0000-00-00', '0000-00-00', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('124', 'Available', 'DF', 'Kurt', 'Zouma', '26', '0000-00-00', '0000-00-02', '0000-00-00', '4');
INSERT INTO `sbm_player` VALUES ('125', 'Available', 'FW', 'Keshi', 'Anderson', '1', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('126', 'Available', 'FW', 'Kwesi', 'Appiah', '2', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('127', 'Available', 'FW', 'Patrick', 'Bamford', '3', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('128', 'Available', 'MF', 'Hiram', 'Boateng', '4', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('129', 'Available', 'MF', 'Yala', 'Bolasie', '5', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('130', 'Available', 'MF', 'Yohan', 'Cabaye', '6', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('131', 'Available', 'FW', 'Frazier', 'Campbell', '7', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('132', 'Available', 'FW', 'Marouane', 'Chamakh', '8', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('133', 'Available', 'DF', 'Luke', 'Croll', '9', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('134', 'Available', 'DF', 'Scott', 'Dann', '10', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('135', 'Available', 'DF', 'Damien', 'Delaney', '11', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('136', 'Available', 'DF', 'Ezekiel', 'Fryers', '12', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('137', 'Available', 'FW', 'Dwight', 'Gayle', '13', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('138', 'Available', 'MF', 'Jake', 'Gray', '14', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('139', 'Available', 'DF', 'Brede', 'Hangeland', '15', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('140', 'Available', 'GK', 'Wayne', 'Hennessey', '16', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('141', 'Available', 'MF', 'Mile', 'Jedinak', '17', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('142', 'Available', 'MF', 'Sullay', 'Kaikai', '18', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('143', 'Available', 'DF', 'Martin', 'Kelly', '19', '0000-00-00', '0000-00-03', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('144', 'Available', 'GK', 'Chris', 'Kettings', '20', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('145', 'Available', 'MF', 'Joe', 'Ledley', '21', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('146', 'Available', 'MF', 'Chung-Yong', 'Lee', '22', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('147', 'Available', 'DF', 'Adrian', 'Mariappa', '23', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('148', 'Available', 'MF', 'James', 'McArthur', '24', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('149', 'Available', 'GK', 'Alex', 'McCarthy', '25', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('150', 'Available', 'DF', 'Paddy', 'McCarthy', '26', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('151', 'Available', 'MF', 'Jordon', 'Mutch', '27', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('152', 'Available', 'MF', 'Jason', 'Puncheon', '28', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('153', 'Available', 'MF', 'Bakary', 'Sako', '29', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('154', 'Available', 'DF', 'Pape', 'Souaré', '30', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('155', 'Available', 'GK', 'Julian', 'Speroni', '31', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('156', 'Available', 'DF', 'Joel', 'Ward', '32', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('157', 'Available', 'FW', 'Connor', 'Wickham', '33', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('158', 'Available', 'MF', 'Jonathan', 'Williams', '34', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('159', 'Available', 'FW', 'Wilfried', 'Zaha', '35', '0000-00-00', '0000-00-00', '0000-00-00', '5');
INSERT INTO `sbm_player` VALUES ('160', 'Available', 'DF', 'Leighton', 'Baines', '1', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('161', 'Available', 'MF', 'Ross', 'Barkley', '2', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('162', 'Available', 'MF', 'Gareth', 'Barry', '3', '0000-00-00', '0000-00-04', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('163', 'Available', 'MF', 'Muhamed', 'Beši?', '4', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('164', 'Available', 'DF', 'Tyias', 'Browning', '5', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('165', 'Available', 'MF', 'Tom', 'Cleverley', '6', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('166', 'Available', 'DF', 'Séamus', 'Coleman', '7', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('167', 'Available', 'FW', 'Deulofeu', 'Deulofeu', '8', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('168', 'Available', 'MF', 'Francisco', 'Santos', '9', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('169', 'Available', 'DF', 'Ramiro', 'Funes Mori', '10', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('170', 'Available', 'DF', 'Brendan', 'Galloway', '11', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('171', 'Available', 'MF', 'Darron', 'Gibson', '12', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('172', 'Available', 'MF', 'Conor', 'Grant', '13', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('173', 'Available', 'DF', 'Tony', 'Hibbert', '14', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('174', 'Available', 'DF', 'Mason', 'Holgate', '15', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('175', 'Available', 'GK', 'Tim', 'Howard', '16', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('176', 'Available', 'DF', 'Phil', 'Jagielka', '17', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('177', 'Available', 'GK', 'Joel', 'Joel', '18', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('178', 'Available', 'DF', 'Jonjoe', 'Kenny', '19', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('179', 'Available', 'FW', 'Arouna', 'Koné', '20', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('180', 'Available', 'MF', 'Aaron', 'Lennon', '21', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('181', 'Available', 'FW', 'Romelu', 'Lukaku', '22', '0000-00-00', '0000-00-05', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('182', 'Available', 'FW', 'Conor', 'McAleny', '23', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('183', 'Available', 'MF', 'James', 'McCarthy', '24', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('184', 'Available', 'MF', 'Aiden', 'McGeady', '25', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('185', 'Available', 'MF', 'Kevin', 'Mirallas', '26', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('186', 'Available', 'FW', 'Steven', 'Naismith', '27', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('187', 'Available', 'MF', 'Leon', 'Osman', '28', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('188', 'Available', 'DF', 'Bryan', 'Oviedo', '29', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('189', 'Available', 'DF', 'Matthew', 'Pennington', '30', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('190', 'Available', 'MF', 'Steven', 'Pienaar', '31', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('191', 'Available', 'FW', 'Leandro', 'Rodríguez', '32', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('192', 'Available', 'GK', 'Jind?ich', 'Stan?k', '33', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('193', 'Available', 'DF', 'John', 'Stones', '34', '0000-00-00', '0000-00-00', '0000-00-00', '6');
INSERT INTO `sbm_player` VALUES ('194', 'Available', 'MF', 'Marc', 'Albrighton', '1', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('195', 'Available', 'DF', 'Yohan', 'Benalouane', '2', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('196', 'Available', 'FW', 'Jacob', 'Blyth', '3', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('197', 'Available', 'DF', 'Michael', 'Cain', '4', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('198', 'Available', 'DF', 'Ben', 'Chilwell', '5', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('199', 'Available', 'DF', 'Ritchie', 'De Laet', '6', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('200', 'Available', 'FW', 'Joseph', 'Dodoo', '7', '0000-00-00', '0000-00-06', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('201', 'Available', 'MF', 'Danny', 'Drinkwater', '8', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('202', 'Available', 'MF', 'Nathan', 'Dyer', '9', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('203', 'Available', 'DF', 'Christian', 'Fuchs', '10', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('204', 'Available', 'MF', 'Dean', 'Hammond', '11', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('205', 'Available', 'DF', 'Robert', 'Huth', '12', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('206', 'Available', 'MF', 'Gökhan', 'Inler', '13', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('207', 'Available', 'MF', 'Matty', 'James', '14', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('208', 'Available', 'MF', 'N\'Golo', 'Kanté', '15', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('209', 'Available', 'MF', 'Andy', 'King', '16', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('210', 'Available', 'FW', 'Andrej', 'Kramari?', '17', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('211', 'Available', 'FW', 'Tom', 'Lawrence', '18', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('212', 'Available', 'GK', 'Jonny', 'Maddison', '19', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('213', 'Available', 'FW', 'Riyad', 'Mahrez', '20', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('214', 'Available', 'DF', 'Liam', 'Moore', '21', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('215', 'Available', 'DF', 'Wes', 'Morgan', '22', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('216', 'Available', 'FW', 'Shinji', 'Okazaki', '23', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('217', 'Available', 'MF', 'André', 'Olukanmi', '24', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('218', 'Available', 'FW', 'Harry', 'Panayiotou', '25', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('219', 'Available', 'DF', 'Jeffrey', 'Schlupp', '26', '0000-00-00', '0000-00-07', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('220', 'Available', 'GK', 'Kasper', 'Schmeichel', '27', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('221', 'Available', 'GK', 'Mark', 'Schwarzer', '28', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('222', 'Available', 'DF', 'Danny', 'Simpson', '29', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('223', 'Available', 'FW', 'Leonardo', 'Ulloa', '30', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('224', 'Available', 'FW', 'Jamie', 'Vardy', '31', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('225', 'Available', 'DF', 'Marcin', 'Wasilewski', '32', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('226', 'Available', 'MF', 'Ryan', 'Watson', '33', '0000-00-00', '0000-00-00', '0000-00-00', '7');
INSERT INTO `sbm_player` VALUES ('227', 'Available', 'DF', 'Alberto', 'Moreno', '1', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('228', 'Available', 'MF', 'Joe', 'Allen', '2', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('229', 'Available', 'FW', 'Christian', 'Benteke', '3', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('230', 'Available', 'GK', 'Ádám', 'Bogdán', '4', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('231', 'Available', 'MF', 'Cameron', 'Brannagan', '5', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('232', 'Available', 'MF', 'Emre', 'Can', '6', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('233', 'Available', 'DF', 'Daniel', 'Cleary', '7', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('234', 'Available', 'DF', 'Nathaniel', 'Clyne', '8', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('235', 'Available', 'MF', 'Coutinho', 'Coutinho', '9', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('236', 'Available', 'MF', 'Jack', 'Dunn', '10', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('237', 'Available', 'DF', 'Jon', 'Flanagan', '11', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('238', 'Available', 'GK', 'Ryan', 'Fulton', '12', '0000-00-00', '0000-00-08', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('239', 'Available', 'DF', 'Joe', 'Gomez', '13', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('240', 'Available', 'MF', 'Jordan', 'Henderson', '14', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('241', 'Available', 'FW', 'Jordon', 'Ibe', '15', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('242', 'Available', 'FW', 'Danny', 'Ings', '16', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('243', 'Available', 'MF', 'João', 'Carlos', '17', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('244', 'Available', 'DF', 'José', 'Enrique', '18', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('245', 'Available', 'MF', 'Adam', 'Lallana', '19', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('246', 'Available', 'DF', 'Dejan', 'Lovren', '20', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('247', 'Available', 'MF', 'Lucas', 'Leiva', '21', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('248', 'Available', 'GK', 'Simon', 'Mignolet', '22', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('249', 'Available', 'MF', 'James', 'Milner', '23', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('250', 'Available', 'FW', 'Divock', 'Origi', '24', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('251', 'Available', 'MF', 'Pedro', 'Chirivella', '25', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('252', 'Available', 'DF', 'Connor', 'Randall', '26', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('253', 'Available', 'MF', 'Roberto', 'Firmino', '27', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('254', 'Available', 'MF', 'Jordan', 'Rossiter', '28', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('255', 'Available', 'DF', 'Mamadou', 'Sakho', '29', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('256', 'Available', 'FW', 'Jerome', 'Sinclair', '30', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('257', 'Available', 'DF', 'Martin', 'Škrtel', '31', '0000-00-00', '0000-00-09', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('258', 'Available', 'FW', 'Daniel', 'Sturridge', '32', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('259', 'Available', 'DF', 'Kolo', 'Touré', '33', '0000-00-00', '0000-00-00', '0000-00-00', '8');
INSERT INTO `sbm_player` VALUES ('260', 'Available', 'FW', 'Kun', 'Agüero', '1', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('261', 'Available', 'MF', 'Brandon', 'Barker', '2', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('262', 'Available', 'FW', 'Wilfried', 'Bony', '3', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('263', 'Available', 'GK', 'Willy', 'Caballero', '4', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('264', 'Available', 'DF', 'Gaël', 'Clichy', '5', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('265', 'Available', 'MF', 'David', 'Silva', '6', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('266', 'Available', 'MF', 'Kevin', 'De Bruyne', '7', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('267', 'Available', 'MF', 'Fabian', 'Delph', '8', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('268', 'Available', 'DF', 'Martín', 'Demichelis', '9', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('269', 'Available', 'MF', 'George', 'Evans', '10', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('270', 'Available', 'DF', 'Shay', 'Facey', '11', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('271', 'Available', 'MF', 'Fernandinho', 'Fernandinho', '12', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('272', 'Available', 'MF', 'Fernando', 'Fernando', '13', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('273', 'Available', 'GK', 'Joe', 'Hart', '14', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('274', 'Available', 'FW', 'Kelechi', 'Iheanacho', '15', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('275', 'Available', 'MF', 'Jesús', 'Navas', '16', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('276', 'Available', 'DF', 'Aleksandar', 'Kolarov', '17', '0000-00-00', '0000-00-10', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('277', 'Available', 'DF', 'Vincent', 'Kompany', '18', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('278', 'Available', 'DF', 'Eliaquim', 'Mangala', '19', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('279', 'Available', 'MF', 'Manu', 'García', '20', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('280', 'Available', 'MF', 'Samir', 'Nasri', '21', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('281', 'Available', 'DF', 'Nicolás', 'Otamendi', '22', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('282', 'Available', 'DF', 'Pablo', 'Maffeo', '23', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('283', 'Available', 'MF', 'Patrick', 'Roberts', '24', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('284', 'Available', 'DF', 'Bacary', 'Sagna', '25', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('285', 'Available', 'MF', 'Raheem', 'Sterling', '26', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('286', 'Available', 'MF', 'Yaya', 'Touré', '27', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('287', 'Available', 'GK', 'Richard', 'Wright', '28', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('288', 'Available', 'DF', 'Pablo', 'Zabaleta', '29', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('289', 'Available', 'MF', 'Bruno', 'Zuculini', '30', '0000-00-00', '0000-00-00', '0000-00-00', '9');
INSERT INTO `sbm_player` VALUES ('290', 'Available', 'MF', 'Ander', 'Herrera', '1', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('291', 'Available', 'MF', 'Andreas', 'Pereira', '2', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('292', 'Available', 'DF', 'Daley', 'Blind', '3', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('293', 'Available', 'DF', 'Cameron', 'Borthwick-Jackson', '4', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('294', 'Available', 'MF', 'Michael', 'Carrick', '5', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('295', 'Available', 'DF', 'Matteo', 'Darmian', '6', '0000-00-00', '0000-00-11', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('296', 'Available', 'GK', 'De', 'Gea', '7', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('297', 'Available', 'FW', 'Memphis', 'Depay', '8', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('298', 'Available', 'MF', 'Marouane', 'Fellaini', '9', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('299', 'Available', 'GK', 'Sam', 'Johnstone', '10', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('300', 'Available', 'DF', 'Phil', 'Jones', '11', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('301', 'Available', 'MF', 'Jesse', 'Lingard', '12', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('302', 'Available', 'FW', 'Anthony', 'Martial', '13', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('303', 'Available', 'MF', 'Mata', 'Mata', '14', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('304', 'Available', 'DF', 'Paddy', 'McNair', '15', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('305', 'Available', 'DF', 'Marcos', 'Rojo', '16', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('306', 'Available', 'GK', 'Sergio', 'Romero', '17', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('307', 'Available', 'FW', 'Wayne', 'Rooney', '18', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('308', 'Available', 'MF', 'Morgan', 'Schneiderlin', '19', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('309', 'Available', 'MF', 'Bastian', 'Schweinsteiger', '20', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('310', 'Available', 'DF', 'Luke', 'Shaw', '21', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('311', 'Available', 'DF', 'Chris', 'Smalling', '22', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('312', 'Available', 'MF', 'Antonio', 'Valencia', '23', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('313', 'Available', 'GK', 'Víctor', 'Valdés', '24', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('314', 'Available', 'FW', 'James', 'Wilson', '25', '0000-00-00', '0000-00-12', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('315', 'Available', 'MF', 'Ashley', 'Young', '26', '0000-00-00', '0000-00-00', '0000-00-00', '10');
INSERT INTO `sbm_player` VALUES ('316', 'Available', 'MF', 'Rolando', 'Aarons', '1', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('317', 'Available', 'MF', 'Vurnon', 'Anita', '2', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('318', 'Available', 'FW', 'Adam', 'Armstrong', '3', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('319', 'Available', 'FW', 'Ayoze', 'Pérez', '4', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('320', 'Available', 'FW', 'Daniel', 'Barlaser', '5', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('321', 'Available', 'MF', 'Gaël', 'Bigirimana', '6', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('322', 'Available', 'FW', 'Papiss', 'Demba Cissé', '7', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('323', 'Available', 'MF', 'Jack', 'Colback', '8', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('324', 'Available', 'DF', 'Fabricio', 'Coloccini', '9', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('325', 'Available', 'GK', 'Karl', 'Darlow', '10', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('326', 'Available', 'MF', 'Siem', 'de Jong', '11', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('327', 'Available', 'DF', 'Paul', 'Dummett', '12', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('328', 'Available', 'GK', 'Rob', 'Elliot', '13', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('329', 'Available', 'MF', 'Shane', 'Ferguson', '14', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('330', 'Available', 'DF', 'Curtis', 'Good', '15', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('331', 'Available', 'FW', 'Yoan', 'Gouffran', '16', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('332', 'Available', 'DF', 'Massadio', 'Haïdara', '17', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('333', 'Available', 'DF', 'Daryl', 'Janmaat', '18', '0000-00-00', '0000-00-13', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('334', 'Available', 'GK', 'Tim', 'Krul', '19', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('335', 'Available', 'DF', 'Jamaal', 'Lascelles', '20', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('336', 'Available', 'MF', 'Sylvain', 'Marveaux', '21', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('337', 'Available', 'DF', 'Kevin', 'Mbabu', '22', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('338', 'Available', 'DF', 'Chancel', 'Mbemba', '23', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('339', 'Available', 'FW', 'Aleksandar', 'Mitrovi?', '24', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('340', 'Available', 'FW', 'Gabriel', 'Obertan', '25', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('341', 'Available', 'FW', 'Emmanuel', 'Rivière', '26', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('342', 'Available', 'DF', '?ubomír', 'Šatka', '27', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('343', 'Available', 'MF', 'Moussa', 'Sissoko', '28', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('344', 'Available', 'DF', 'Steven', 'Taylor', '29', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('345', 'Available', 'MF', 'Florian', 'Thauvin', '30', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('346', 'Available', 'MF', 'Cheick', 'Tioté', '31', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('347', 'Available', 'FW', 'Ivan', 'Toney', '32', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('348', 'Available', 'MF', 'Georginio', 'Wijnaldum', '33', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('349', 'Available', 'DF', 'Mike', 'Williamson', '34', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('350', 'Available', 'GK', 'Freddie', 'Woodman', '35', '0000-00-00', '0000-00-00', '0000-00-00', '11');
INSERT INTO `sbm_player` VALUES ('351', 'Available', 'MF', 'Anthony', 'Andreu', '1', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('352', 'Available', 'DF', 'Sébastien', 'Bassong', '2', '0000-00-00', '0000-00-14', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('353', 'Available', 'MF', 'Elliott', 'Bennett', '3', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('354', 'Available', 'DF', 'Ryan', 'Bennett', '4', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('355', 'Available', 'FW', 'Robbie', 'Brady', '5', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('356', 'Available', 'MF', 'Graham', 'Dorrans', '6', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('357', 'Available', 'DF', 'Adel', 'Gafaiti', '7', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('358', 'Available', 'FW', 'Lewis', 'Grabban', '8', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('359', 'Available', 'MF', 'Reece', 'Hall-Johnson', '9', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('360', 'Available', 'MF', 'Wesley', 'Hoolahan', '10', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('361', 'Available', 'FW', 'Gary', 'Hooper', '11', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('362', 'Available', 'MF', 'Jonny', 'Howson', '12', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('363', 'Available', 'MF', 'Matthew', 'Jarvis', '13', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('364', 'Available', 'FW', 'Cameron', 'Jerome', '14', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('365', 'Available', 'GK', 'Jake', 'Kean', '15', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('366', 'Available', 'FW', 'Kyle', 'Lafferty', '16', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('367', 'Available', 'FW', 'Jamar', 'Loza', '17', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('368', 'Available', 'MF', 'Russell', 'Martin', '18', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('369', 'Available', 'GK', 'Remi', 'Matthews', '19', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('370', 'Available', 'FW', 'Dieumerci', 'Mbokani', '20', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('371', 'Available', 'MF', 'Conor', 'McGrandles', '21', '0000-00-00', '0000-00-15', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('372', 'Available', 'MF', 'Youssuf', 'Mulumbu', '22', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('373', 'Available', 'MF', 'Gary', 'O\'Neil', '23', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('374', 'Available', 'MF', 'Vadis', 'Odjidja-Ofoe', '24', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('375', 'Available', 'DF', 'Martin', 'Olsson', '25', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('376', 'Available', 'MF', 'Nathan', 'Redmond', '26', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('377', 'Available', 'GK', 'Declan', 'Rudd', '27', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('378', 'Available', 'GK', 'John', 'Ruddy', '28', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('379', 'Available', 'MF', 'Alexander', 'Tettey', '29', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('380', 'Available', 'MF', 'Louis', 'Thompson', '30', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('381', 'Available', 'DF', 'Harry', 'Toffolo', '31', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('382', 'Available', 'DF', 'Steven', 'Whittaker', '32', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('383', 'Available', 'DF', 'Andre', 'Wisdom', '33', '0000-00-00', '0000-00-00', '0000-00-00', '12');
INSERT INTO `sbm_player` VALUES ('384', 'Available', 'DF', 'Ryan', 'Bertrand', '1', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('385', 'Available', 'DF', 'Steven', 'Caulker', '2', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('386', 'Available', 'DF', 'Cédric', 'Soares', '3', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('387', 'Available', 'MF', 'Jordy', 'Clasie', '4', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('388', 'Available', 'GK', 'Kelvin', 'Davis', '5', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('389', 'Available', 'MF', 'Steven', 'Davis', '6', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('390', 'Available', 'GK', 'Fraser', 'Forster', '7', '0000-00-00', '0000-00-16', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('391', 'Available', 'DF', 'Florin', 'Gardo?', '8', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('392', 'Available', 'GK', 'Paulo', 'Gazzaniga', '9', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('393', 'Available', 'MF', 'Lloyd', 'Isgrove', '10', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('394', 'Available', 'DF', 'José', 'Fonte', '11', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('395', 'Available', 'FW', 'Juanmi', 'Juanmi', '12', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('396', 'Available', 'FW', 'Shane', 'Long', '13', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('397', 'Available', 'FW', 'Sadio', 'Mané', '14', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('398', 'Available', 'DF', 'Cuco', 'Martina', '15', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('399', 'Available', 'DF', 'Jason', 'McCarthy', '16', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('400', 'Available', 'MF', 'Samuel', 'McQueen', '17', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('401', 'Available', 'MF', 'Oriol', 'Romeu', '18', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('402', 'Available', 'FW', 'Graziano', 'Pellè', '19', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('403', 'Available', 'MF', 'Gastón', 'Ramírez', '20', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('404', 'Available', 'MF', 'Harrison', 'Reed', '21', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('405', 'Available', 'FW', 'Jay', 'Rodriguez', '22', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('406', 'Available', 'GK', 'Maarten', 'Stekelenburg', '23', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('407', 'Available', 'FW', 'Dušan', 'Tadi?', '24', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('408', 'Available', 'DF', 'Matt', 'Targett', '25', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('409', 'Available', 'DF', 'Virgil', 'van Dijk', '26', '0000-00-00', '0000-00-17', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('410', 'Available', 'MF', 'Victor', 'Wanyama', '27', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('411', 'Available', 'MF', 'James', 'Ward-Prowse', '28', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('412', 'Available', 'DF', 'Maya', 'Yoshida', '29', '0000-00-00', '0000-00-00', '0000-00-00', '13');
INSERT INTO `sbm_player` VALUES ('413', 'Available', 'MF', 'Charlie', 'Adam', '1', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('414', 'Available', 'MF', 'Ibrahim', 'Afellay', '2', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('415', 'Available', 'FW', 'Marko', 'Arnautovi?', '3', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('416', 'Available', 'GK', 'Daniel', 'Bachmann', '4', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('417', 'Available', 'DF', 'Phil', 'Bardsley', '5', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('418', 'Available', 'FW', 'Bojan', 'Bojan', '6', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('419', 'Available', 'GK', 'Jack', 'Butland', '7', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('420', 'Available', 'DF', 'Geoff', 'Cameron', '8', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('421', 'Available', 'FW', 'Peter', 'Crouch', '9', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('422', 'Available', 'MF', 'Dionatan', 'Teixeira', '10', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('423', 'Available', 'FW', 'Mame', 'Diouf', '11', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('424', 'Available', 'FW', 'Mohamed', 'El Ouriachi', '12', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('425', 'Available', 'GK', 'Shay', 'Given', '13', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('426', 'Available', 'GK', 'Jakob', 'Haugaard', '14', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('427', 'Available', 'MF', 'Stephen', 'Ireland', '15', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('428', 'Available', 'DF', 'Glen', 'Johnson', '16', '0000-00-00', '0000-00-18', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('429', 'Available', 'FW', 'Joselu', 'Joselu', '17', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('430', 'Available', 'DF', 'Muniesa', 'Muniesa', '18', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('431', 'Available', 'FW', 'Peter', 'Odemwingie', '19', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('432', 'Available', 'DF', 'Erik', 'Pieters', '20', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('433', 'Available', 'MF', 'Xherdan', 'Shaqiri', '21', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('434', 'Available', 'DF', 'Ryan', 'Shawcross', '22', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('435', 'Available', 'MF', 'Steven', 'Sidwell', '23', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('436', 'Available', 'MF', 'Marco', 'van Ginkel', '24', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('437', 'Available', 'FW', 'Jon', 'Walters', '25', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('438', 'Available', 'MF', 'Glenn', 'Whelan', '26', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('439', 'Available', 'DF', 'Marc', 'Wilson', '27', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('440', 'Available', 'DF', 'Philipp', 'Wollscheid', '28', '0000-00-00', '0000-00-00', '0000-00-00', '14');
INSERT INTO `sbm_player` VALUES ('441', 'Available', 'MF', 'Ricardo', 'Álvarez', '1', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('442', 'Available', 'FW', 'Fabio', 'Borini', '2', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('443', 'Available', 'MF', 'Liam', 'Bridcutt', '3', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('444', 'Available', 'DF', 'Wes', 'Brown', '4', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('445', 'Available', 'FW', 'Will', 'Buckley', '5', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('446', 'Available', 'MF', 'Lee', 'Cattermole', '6', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('447', 'Available', 'DF', 'Sebastián', 'Coates', '7', '0000-00-00', '0000-00-19', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('448', 'Available', 'FW', 'Jermain', 'Defoe', '8', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('449', 'Available', 'FW', 'Steven', 'Fletcher', '9', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('450', 'Available', 'FW', 'Lynden', 'Gooch', '10', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('451', 'Available', 'FW', 'Danny', 'Graham', '11', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('452', 'Available', 'MF', 'Adam', 'Johnson', '12', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('453', 'Available', 'DF', 'Billy', 'Jones', '13', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('454', 'Available', 'MF', 'Jordi', 'Gómez', '14', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('455', 'Available', 'DF', 'Younès', 'Kaboul', '15', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('456', 'Available', 'MF', 'Sebastian', 'Larsson', '16', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('457', 'Available', 'FW', 'Jeremain', 'Lens', '17', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('458', 'Available', 'MF', 'Yann', 'M\'Vila', '18', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('459', 'Available', 'FW', 'Mikael', 'Mandron', '19', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('460', 'Available', 'GK', 'Vito', 'Mannone', '20', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('461', 'Available', 'DF', 'Adam', 'Matthews', '21', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('462', 'Available', 'MF', 'Charis', 'Mavrias', '22', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('463', 'Available', 'DF', 'John', 'O\'Shea', '23', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('464', 'Available', 'GK', 'Costel', 'Pantilimon', '24', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('465', 'Available', 'DF', 'Valentin', 'Roberge', '25', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('466', 'Available', 'DF', 'Josh', 'Robson', '26', '0000-00-00', '0000-00-20', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('467', 'Available', 'MF', 'Jack', 'Rodwell', '27', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('468', 'Available', 'GK', 'Max', 'Stryjek', '28', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('469', 'Available', 'MF', 'Ola', 'Toivonen', '29', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('470', 'Available', 'DF', 'Patrick', 'van Aanholt', '30', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('471', 'Available', 'FW', 'Duncan', 'Watmore', '31', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('472', 'Available', 'DF', 'DeAndre', 'Yedlin', '32', '0000-00-00', '0000-00-00', '0000-00-00', '15');
INSERT INTO `sbm_player` VALUES ('473', 'Available', 'DF', 'Àngel', 'Rangel', '1', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('474', 'Available', 'FW', 'André', 'Ayew', '2', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('475', 'Available', 'FW', 'Modou', 'Barrow', '3', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('476', 'Available', 'DF', 'Kyle', 'Bartley', '4', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('477', 'Available', 'MF', 'Leon', 'Britton', '5', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('478', 'Available', 'MF', 'Jack', 'Cork', '6', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('479', 'Available', 'FW', 'Éder', 'Éder', '7', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('480', 'Available', 'FW', 'Marvin', 'Emnes', '8', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('481', 'Available', 'GK', '?ukasz', 'Fabia?ski', '9', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('482', 'Available', 'DF', 'Federico', 'Fernández', '10', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('483', 'Available', 'MF', 'Jay', 'Fulton', '11', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('484', 'Available', 'FW', 'Bafetimbi', 'Gomis', '12', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('485', 'Available', 'MF', 'Matt', 'Grimes', '13', '0000-00-00', '0000-00-21', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('486', 'Available', 'MF', 'Raheem', 'Hanley', '14', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('487', 'Available', 'DF', 'Jordi', 'Amat', '15', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('488', 'Available', 'MF', 'Sung-yueng', 'Ki', '16', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('489', 'Available', 'MF', 'Adam', 'King', '17', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('490', 'Available', 'DF', 'Stephen', 'Kingsley', '18', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('491', 'Available', 'FW', 'Michu', 'Michu', '19', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('492', 'Available', 'MF', 'Jefferson', 'Montero', '20', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('493', 'Available', 'DF', 'Kyle', 'Naughton', '21', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('494', 'Available', 'GK', 'Kristoffer', 'Nordfeldt', '22', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('495', 'Available', 'MF', 'Wayne', 'Routledge', '23', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('496', 'Available', 'MF', 'Josh', 'Sheehan', '24', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('497', 'Available', 'MF', 'Jonjo', 'Shelvey', '25', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('498', 'Available', 'MF', 'Gylfi', 'Sigurðsson', '26', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('499', 'Available', 'MF', 'Franck', 'Tabanou', '27', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('500', 'Available', 'DF', 'Neil', 'Taylor', '28', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('501', 'Available', 'GK', 'Gerhard', 'Tremmel', '29', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('502', 'Available', 'DF', 'Ashley', 'Williams', '30', '0000-00-00', '0000-00-00', '0000-00-00', '16');
INSERT INTO `sbm_player` VALUES ('503', 'Available', 'DF', 'Toby', 'Alderweireld', '1', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('504', 'Available', 'MF', 'Bamidele', 'Alli', '2', '0000-00-00', '0000-00-22', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('505', 'Available', 'MF', 'Nabil', 'Bentaleb', '3', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('506', 'Available', 'MF', 'Tom', 'Carroll', '4', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('507', 'Available', 'FW', 'Nacer', 'Chadli', '5', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('508', 'Available', 'FW', 'Shaquile', 'Coulthirst', '6', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('509', 'Available', 'DF', 'Ben', 'Davies', '7', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('510', 'Available', 'MF', 'Moussa', 'Dembélé', '8', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('511', 'Available', 'DF', 'Eric', 'Dier', '9', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('512', 'Available', 'MF', 'Christian', 'Eriksen', '10', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('513', 'Available', 'DF', 'Federico', 'Fazio', '11', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('514', 'Available', 'FW', 'Harry', 'Kane', '12', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('515', 'Available', 'MF', 'Èrik', 'Lamela', '13', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('516', 'Available', 'GK', 'Hugo', 'Lloris', '14', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('517', 'Available', 'MF', 'Ryan', 'Mason', '15', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('518', 'Available', 'GK', 'Luke', 'McGee', '16', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('519', 'Available', 'FW', 'Clinton', 'N\'Jie', '17', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('520', 'Available', 'DF', 'Connor', 'Ogilvie', '18', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('521', 'Available', 'FW', 'Joshua', 'Onomah', '19', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('522', 'Available', 'MF', 'Alex', 'Pritchard', '20', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('523', 'Available', 'DF', 'Danny', 'Rose', '21', '0000-00-00', '0000-00-23', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('524', 'Available', 'FW', 'Heung-min', 'Son', '22', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('525', 'Available', 'MF', 'Andros', 'Townsend', '23', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('526', 'Available', 'DF', 'Kieran', 'Trippier', '24', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('527', 'Available', 'DF', 'Jan', 'Vertonghen', '25', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('528', 'Available', 'GK', 'Michel', 'Vorm', '26', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('529', 'Available', 'DF', 'Kyle', 'Walker', '27', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('530', 'Available', 'DF', 'Kevin', 'Wimmer', '28', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('531', 'Available', 'MF', 'Harry', 'Winks', '29', '0000-00-00', '0000-00-00', '0000-00-00', '17');
INSERT INTO `sbm_player` VALUES ('532', 'Available', 'MF', 'Almen', 'Abdi', '1', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('533', 'Available', 'DF', 'Nathan', 'Aké', '2', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('534', 'Available', 'MF', 'Ikechi', 'Anya', '3', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('535', 'Available', 'GK', 'Giedrius', 'Arlauskis', '4', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('536', 'Available', 'MF', 'Valon', 'Behrami', '5', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('537', 'Available', 'DF', 'Essaïd', 'Belkalem', '6', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('538', 'Available', 'FW', 'Steven', 'Berghuis', '7', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('539', 'Available', 'DF', 'Miguel', 'Britos', '8', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('540', 'Available', 'MF', 'George', 'Byers', '9', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('541', 'Available', 'MF', 'Étienne', 'Capoue', '10', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('542', 'Available', 'DF', 'Craig', 'Cathcart', '11', '0000-00-00', '0000-00-24', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('543', 'Available', 'FW', 'Troy', 'Deeney', '12', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('544', 'Available', 'FW', 'Alessandro', 'Diamanti', '13', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('545', 'Available', 'MF', 'Josh', 'Doherty', '14', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('546', 'Available', 'MF', 'Lloyd', 'Dyer', '15', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('547', 'Available', 'DF', 'Joel', 'Ekstrand', '16', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('548', 'Available', 'GK', 'Rene', 'Gilmartin', '17', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('549', 'Available', 'GK', 'Gomes', 'Gomes', '18', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('550', 'Available', 'MF', 'Adlène', 'Guédioura', '19', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('551', 'Available', 'DF', 'Tommy', 'Hoban', '20', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('552', 'Available', 'DF', 'José', 'Holebas', '21', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('553', 'Available', 'FW', 'Víctor', 'Ibarbo', '22', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('554', 'Available', 'FW', 'Odion', 'Ighalo', '23', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('555', 'Available', 'FW', 'Uche', 'Ikpeazu', '24', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('556', 'Available', 'FW', 'Alex', 'Jakubiak', '25', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('557', 'Available', 'DF', 'Jorell', 'Johnson', '26', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('558', 'Available', 'MF', 'Jurado', 'Jurado', '27', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('559', 'Available', 'FW', 'Bernard', 'Mensah', '28', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('560', 'Available', 'MF', 'Sean', 'Murray', '29', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('561', 'Available', 'DF', 'Allan', 'Nyom', '30', '0000-00-00', '0000-00-25', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('562', 'Available', 'FW', 'Mamadou', 'Oularé', '31', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('563', 'Available', 'DF', 'Juan', 'Paredes', '32', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('564', 'Available', 'DF', 'Sebastian', 'Prödl', '33', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('565', 'Available', 'FW', 'Mathias', 'Ranégie', '34', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('566', 'Available', 'MF', 'Connor', 'Smith', '35', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('567', 'Available', 'MF', 'Ben', 'Watson', '36', '0000-00-00', '0000-00-00', '0000-00-00', '18');
INSERT INTO `sbm_player` VALUES ('568', 'Available', 'FW', 'Victor', 'Anichebe', '1', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('569', 'Available', 'FW', 'Saido', 'Berahino', '2', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('570', 'Available', 'MF', 'Sebastián', 'Blanco', '3', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('571', 'Available', 'MF', 'Chris', 'Brunt', '4', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('572', 'Available', 'DF', 'James', 'Chester', '5', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('573', 'Available', 'DF', 'Craig', 'Dawson', '6', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('574', 'Available', 'FW', 'Shaun', 'Donnellan', '7', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('575', 'Available', 'MF', 'Kyle', 'Edwards', '8', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('576', 'Available', 'DF', 'Jonny', 'Evans', '9', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('577', 'Available', 'MF', 'Darren', 'Fletcher', '10', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('578', 'Available', 'GK', 'Ben', 'Foster', '11', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('579', 'Available', 'DF', 'Cristian', 'Gamboa', '12', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('580', 'Available', 'MF', 'Craig', 'Gardner', '13', '0000-00-00', '0000-00-26', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('581', 'Available', 'FW', 'Serge', 'Gnabry', '14', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('582', 'Available', 'FW', 'Rickie', 'Lambert', '15', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('583', 'Available', 'FW', 'Jonathan', 'Jonathan ', '16', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('584', 'Available', 'GK', 'Anders', 'Anders ', '17', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('585', 'Available', 'DF', 'Gareth', 'Gareth ', '18', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('586', 'Available', 'FW', 'James', 'James ', '19', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('587', 'Available', 'FW', 'Callum', 'Callum ', '20', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('588', 'Available', 'MF', 'James', 'James ', '21', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('589', 'Available', 'GK', 'Boaz', 'Boaz ', '22', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('590', 'Available', 'MF', 'Adil', 'Adil ', '23', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('591', 'Available', 'DF', 'Jonas', 'Jonas ', '24', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('592', 'Available', 'GK', 'Alex', 'Alex ', '25', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('593', 'Available', 'DF', 'Sébastien', 'Sébastien ', '26', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('594', 'Available', 'FW', 'Salomón', 'Salomón ', '27', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('595', 'Available', 'GK', 'Jack', 'Jack ', '28', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('596', 'Available', 'MF', 'Stéphane', 'Stéphane ', '29', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('597', 'Available', 'FW', 'Joe', 'Joe ', '30', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('598', 'Available', 'MF', 'Claudio', 'Claudio ', '31', '0000-00-00', '0000-00-00', '0000-00-00', '19');
INSERT INTO `sbm_player` VALUES ('599', 'Available', 'GK', 'Adrián', 'Adrián', '1', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('600', 'Available', 'MF', 'Michail', 'Michail ', '2', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('601', 'Available', 'FW', 'Jordan', 'Jordan ', '3', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('602', 'Available', 'DF', 'Reece', 'Reece ', '4', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('603', 'Available', 'FW', 'Andy', 'Andy ', '5', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('604', 'Available', 'DF', 'Leo', 'Leo ', '6', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('605', 'Available', 'DF', 'James', 'James ', '7', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('606', 'Available', 'DF', 'Aaron', 'Aaron ', '8', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('607', 'Available', 'MF', 'Josh', 'Josh ', '9', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('608', 'Available', 'DF', 'Stephen', 'Stephen ', '10', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('609', 'Available', 'DF', 'Doneil', 'Doneil ', '11', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('610', 'Available', 'FW', 'Nikica', 'Nikica ', '12', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('611', 'Available', 'DF', 'Carl', 'Carl ', '13', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('612', 'Available', 'DF', 'Kyle', 'Kyle ', '14', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('613', 'Available', 'MF', 'Cheikhou', 'Cheikhou ', '15', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('614', 'Available', 'MF', 'Manuel', 'Manuel ', '16', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('615', 'Available', 'FW', 'Elliot', 'Elliot ', '17', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('616', 'Available', 'FW', 'Modibo', 'Modibo ', '18', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('617', 'Available', 'FW', 'Nathan', 'Nathan ', '19', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('618', 'Available', 'FW', 'Victor', 'Victor ', '20', '0000-00-00', '0000-00-28', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('619', 'Available', 'MF', 'Amos', 'Amos ', '21', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('620', 'Available', 'MF', 'Mark', 'Mark ', '22', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('621', 'Available', 'MF', 'Joey', 'Joey ', '23', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('622', 'Available', 'DF', 'Angelo', 'Angelo ', '24', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('623', 'Available', 'DF', 'Manny', 'Manny ', '25', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('624', 'Available', 'MF', 'Reece', 'Reece ', '26', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('625', 'Available', 'DF', 'Lewis', 'Lewis ', '27', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('626', 'Available', 'FW', 'Djair', 'Djair ', '28', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('627', 'Available', 'DF', 'Josh', 'Josh ', '29', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('628', 'Available', 'MF', 'Dimitri', 'Dimitri ', '30', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('629', 'Available', 'MF', 'Pedro', 'Pedro ', '31', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('630', 'Available', 'FW', 'Alex', 'Alex ', '32', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('631', 'Available', 'GK', 'Darren', 'Darren ', '33', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('632', 'Available', 'DF', 'Winston', 'Winston ', '34', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('633', 'Available', 'FW', 'Diafra', 'Diafra ', '35', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('634', 'Available', 'MF', 'Martin', 'Martin ', '36', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('635', 'Available', 'MF', 'Alex', 'Alex ', '37', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('636', 'Available', 'GK', 'Raphael', 'Raphael Spiegel', '38', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('637', 'Available', 'DF', 'James', 'James ', '39', '0000-00-00', '0000-00-29', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('638', 'Available', 'FW', 'Enner', 'Enner ', '40', '0000-00-00', '0000-00-00', '0000-00-00', '20');
INSERT INTO `sbm_player` VALUES ('639', 'Available', 'FW', 'Mauro', 'Mauro ', '41', '0000-00-00', '0000-00-00', '0000-00-00', '20');

-- ----------------------------
-- Table structure for `sbm_player_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_player_statistics`;
CREATE TABLE `sbm_player_statistics` (
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
  KEY `assisted_by_player_id_idx` (`assisted_by`),
  CONSTRAINT `assisted_by_player_id` FOREIGN KEY (`assisted_by`) REFERENCES `sbm_player` (`player_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `player_st_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `player_st_player_id` FOREIGN KEY (`player_id`) REFERENCES `sbm_player` (`player_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_player_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for `sbm_team`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_team`;
CREATE TABLE `sbm_team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `home_ground` varchar(45) NOT NULL,
  `team_fullname` varchar(100) NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `league_id_idx` (`league_id`),
  CONSTRAINT `league_id` FOREIGN KEY (`league_id`) REFERENCES `sbm_league` (`league_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_team
-- ----------------------------
INSERT INTO `sbm_team` VALUES ('1', 'Dean Court', 'AFC Bournemouth', '1');
INSERT INTO `sbm_team` VALUES ('2', 'Emirates Stadium', 'Arsenal', '1');
INSERT INTO `sbm_team` VALUES ('3', 'Villa Park', 'Aston Villa', '1');
INSERT INTO `sbm_team` VALUES ('4', 'Stamford Bridge', 'Chelsea', '1');
INSERT INTO `sbm_team` VALUES ('5', 'Selhurst Park', 'Crystal Palace', '1');
INSERT INTO `sbm_team` VALUES ('6', 'Goodison Park', 'Everton', '1');
INSERT INTO `sbm_team` VALUES ('7', 'King Power Stadium', 'Leicester City', '1');
INSERT INTO `sbm_team` VALUES ('8', 'Anfield', 'Liverpool', '1');
INSERT INTO `sbm_team` VALUES ('9', 'Etihad Stadium', 'Manchester City', '1');
INSERT INTO `sbm_team` VALUES ('10', 'Old Trafford', 'Manchester United', '1');
INSERT INTO `sbm_team` VALUES ('11', 'St James\' Park', 'Newcastle United', '1');
INSERT INTO `sbm_team` VALUES ('12', 'Carrow Road', 'Norwich City', '1');
INSERT INTO `sbm_team` VALUES ('13', 'St Mary\'s Stadium', 'Southampton', '1');
INSERT INTO `sbm_team` VALUES ('14', 'Britannia Stadium', 'Stoke City', '1');
INSERT INTO `sbm_team` VALUES ('15', 'Stadium of Light', 'Sunderland', '1');
INSERT INTO `sbm_team` VALUES ('16', 'Liberty Stadium', 'Swansea City', '1');
INSERT INTO `sbm_team` VALUES ('17', 'White Hart Lane', 'Tottenham Hotspur', '1');
INSERT INTO `sbm_team` VALUES ('18', 'Vicarage Road', 'Watford', '1');
INSERT INTO `sbm_team` VALUES ('19', 'The Hawthorns', 'West Bromwich Albion', '1');
INSERT INTO `sbm_team` VALUES ('20', 'Boleyn Ground', 'West Ham United', '1');
INSERT INTO `sbm_team` VALUES ('21', 'Japan Ground', 'Japanese Football Team', '2');
INSERT INTO `sbm_team` VALUES ('22', 'France Ground', 'Franch Football Team', '4');

-- ----------------------------
-- Table structure for `sbm_team_coach`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_team_coach`;
CREATE TABLE `sbm_team_coach` (
  `team_id` int(11) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `contract_start_date` date NOT NULL,
  `contract_end_date` date NOT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  CONSTRAINT `team_coach_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_team_coach
-- ----------------------------
INSERT INTO `sbm_team_coach` VALUES ('1', ' Tommy ', 'Elphick', '0000-00-00', '0000-00-00', '1977-11-29', 'England');
INSERT INTO `sbm_team_coach` VALUES ('2', ' Arsène ', 'Wenger', '0000-00-00', '0000-00-00', '1949-10-22', 'France');
INSERT INTO `sbm_team_coach` VALUES ('3', ' Tim ', 'Sherwood', '0000-00-00', '0000-00-00', '1969-06-02', 'Portugal');
INSERT INTO `sbm_team_coach` VALUES ('4', ' José ', 'Mourinho', '0000-00-00', '0000-00-00', '1963-01-26', 'England');
INSERT INTO `sbm_team_coach` VALUES ('5', ' Alan ', 'Pardew', '0000-00-00', '0000-00-00', '1961-07-18', 'Spain');
INSERT INTO `sbm_team_coach` VALUES ('6', ' Roberto ', 'Martínez', '0000-00-00', '0000-00-00', '1973-07-13', 'Italy');
INSERT INTO `sbm_team_coach` VALUES ('7', ' Claudio ', 'Ranieri', '0000-00-00', '0000-00-00', '1973-08-23', 'Germany');
INSERT INTO `sbm_team_coach` VALUES ('8', ' Jürgen ', 'Klopp', '0000-00-00', '0000-00-00', '1967-01-16', 'Chile');
INSERT INTO `sbm_team_coach` VALUES ('9', ' Manuel ', 'Pellegrini', '0000-00-00', '0000-00-00', '1968-06-16', 'Netherland');
INSERT INTO `sbm_team_coach` VALUES ('10', ' Louis ', 'van Gaal', '0000-00-00', '0000-00-00', '1951-08-08', 'England');
INSERT INTO `sbm_team_coach` VALUES ('11', ' Steve ', 'McClaren', '0000-00-00', '0000-00-00', '1961-05-03', 'Scotland');
INSERT INTO `sbm_team_coach` VALUES ('12', ' Alex ', 'Neil', '0000-00-00', '0000-00-00', '1981-06-09', 'Netherland');
INSERT INTO `sbm_team_coach` VALUES ('13', ' Ronald ', 'Koeman', '0000-00-00', '0000-00-00', '1981-08-09', 'Wales');
INSERT INTO `sbm_team_coach` VALUES ('14', ' Mark ', 'Hughes', '0000-00-00', '0000-00-00', '1963-11-01', 'England');
INSERT INTO `sbm_team_coach` VALUES ('15', ' Sam ', 'Allardyce', '0000-00-00', '0000-00-00', '1954-08-19', 'England');
INSERT INTO `sbm_team_coach` VALUES ('16', ' Garry ', 'Monk', '0000-00-00', '0000-00-00', '1954-11-12', 'Argentina');
INSERT INTO `sbm_team_coach` VALUES ('17', ' Mauricio ', 'Pochettino', '0000-00-00', '0000-00-00', '1972-03-02', 'Argentina');
INSERT INTO `sbm_team_coach` VALUES ('18', ' Quique ', 'Flores', '0000-00-00', '0000-00-00', '1965-01-05', 'Spain');
INSERT INTO `sbm_team_coach` VALUES ('19', ' Tony ', 'Pulis', '0000-00-00', '0000-00-00', '1958-01-16', 'Wales');
INSERT INTO `sbm_team_coach` VALUES ('20', ' Slaven ', 'Bilic', '0000-00-00', '0000-00-00', '1968-09-11', 'Croatia');

-- ----------------------------
-- Table structure for `sbm_team_fixture`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_team_fixture`;
CREATE TABLE `sbm_team_fixture` (
  `team_id` int(11) NOT NULL,
  `fixture_id` int(11) NOT NULL,
  `home_team` varchar(45) NOT NULL,
  `away_team` varchar(45) NOT NULL,
  PRIMARY KEY (`team_id`,`fixture_id`),
  KEY `team_fixture_id_idx` (`fixture_id`),
  CONSTRAINT `fixture_team_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `team_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_team_fixture
-- ----------------------------
INSERT INTO `sbm_team_fixture` VALUES ('1', '6', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('1', '13', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('1', '25', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('2', '2', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('2', '19', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('2', '28', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('3', '3', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('3', '12', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('3', '22', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('4', '8', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('4', '17', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('4', '22', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('5', '9', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('5', '11', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('5', '23', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('6', '10', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('6', '18', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('6', '24', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('7', '2', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('7', '15', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('7', '26', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('8', '3', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('8', '18', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('8', '21', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('9', '1', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('9', '14', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('9', '25', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('10', '4', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('10', '19', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('10', '24', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('11', '8', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('11', '14', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('11', '29', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('12', '7', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('12', '15', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('12', '29', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('13', '5', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('13', '17', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('13', '26', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('14', '6', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('14', '12', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('14', '30', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('15', '4', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('15', '16', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('15', '27', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('16', '5', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('16', '20', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('16', '30', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('17', '1', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('17', '20', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('17', '21', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('18', '9', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('18', '13', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('18', '28', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('19', '10', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('19', '11', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('19', '27', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('20', '7', '1', '0');
INSERT INTO `sbm_team_fixture` VALUES ('20', '16', '0', '1');
INSERT INTO `sbm_team_fixture` VALUES ('20', '23', '0', '1');

-- ----------------------------
-- Table structure for `sbm_team_standing`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_team_standing`;
CREATE TABLE `sbm_team_standing` (
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
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `team_standing_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='	';

-- ----------------------------
-- Records of sbm_team_standing
-- ----------------------------
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '1', '1', '0', '2', '1', null, '1', '2', '3');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '2', '0', '0', '0', '1', '6', null, '2', '8', '2');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '0', '2', '0', '3', '0', null, '3', '2', '4');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '1', '1', '0', '4', '1', null, '4', '3', '5');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '2', '0', '0', '0', '0', '6', null, '5', '3', '0');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '1', '1', '0', '0', '4', '4', null, '6', '4', '3');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '1', '0', '1', '1', '4', '3', null, '7', '4', '6');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '1', '1', '0', '0', '7', '4', null, '8', '4', '3');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '1', '0', '1', '0', '3', '3', null, '9', '7', '5');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '1', '1', '0', '0', '2', '4', null, '10', '3', '3');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '1', '1', '1', '2', '1', null, '11', '3', '8');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '1', '1', null, '2', '1', null, '12', '3', '4');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '2', '0', '0', '0', '5', '6', null, '13', '6', '2');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '2', '0', '0', '0', '2', '6', null, '14', '3', '1');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '1', '1', '0', '3', '1', null, '15', '2', '5');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '1', '1', '1', '2', '1', null, '16', '3', '5');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '1', '0', '1', '1', '2', '3', null, '17', '6', '3');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '1', '1', '0', '0', '1', null, '18', '1', '2');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '0', '2', '0', '0', '1', null, '19', '2', '5');
INSERT INTO `sbm_team_standing` VALUES ('2015', '2', '0', '2', '0', '0', '2', '2', null, '20', '4', '4');

-- ----------------------------
-- Table structure for `sbm_team_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_team_statistics`;
CREATE TABLE `sbm_team_statistics` (
  `team_id` int(11) NOT NULL,
  `fixture_id` int(11) NOT NULL,
  `goal_score` int(11) NOT NULL,
  `goal_concede` int(11) NOT NULL,
  `red_card` int(11) DEFAULT NULL,
  `yellow_card` int(11) DEFAULT NULL,
  `result` char(10) NOT NULL,
  PRIMARY KEY (`team_id`,`fixture_id`),
  KEY `team-st_fixture_id_idx` (`fixture_id`),
  CONSTRAINT `team-st_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `team_st_team_id` FOREIGN KEY (`team_id`) REFERENCES `sbm_team` (`team_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_team_statistics
-- ----------------------------
INSERT INTO `sbm_team_statistics` VALUES ('1', '6', '1', '2', '0', '0', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('1', '13', '1', '1', '0', '2', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('1', '25', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('2', '2', '5', '2', '0', '1', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('2', '19', '3', '0', '0', '0', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('2', '28', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('3', '3', '2', '3', '0', '1', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('3', '12', '0', '1', '0', '2', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('3', '22', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('4', '8', '2', '2', '0', '1', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('4', '17', '1', '3', '0', '3', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('4', '22', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('5', '9', '1', '0', '0', '0', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('5', '11', '2', '0', '0', '0', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('5', '23', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('6', '10', '3', '2', '0', '2', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('6', '18', '1', '1', '0', '2', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('6', '24', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('7', '2', '2', '5', '0', '2', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('7', '15', '2', '1', '1', '2', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('7', '26', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('8', '3', '3', '2', '0', '4', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('8', '18', '1', '1', '0', '3', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('8', '21', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('9', '1', '1', '4', '0', '2', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('9', '14', '6', '1', '0', '1', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('9', '25', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('10', '4', '3', '0', '0', '1', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('10', '19', '0', '3', '0', '1', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('10', '24', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('11', '8', '2', '2', '0', '1', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('11', '14', '1', '6', '1', '1', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('11', '29', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('12', '7', '2', '2', '0', '1', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('12', '15', '1', '2', '0', '1', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('12', '29', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('13', '5', '3', '1', '0', '1', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('13', '17', '3', '1', '0', '4', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('13', '26', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('14', '6', '2', '1', '0', '2', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('14', '12', '1', '0', '0', '0', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('14', '30', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('15', '4', '0', '3', '0', '2', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('15', '16', '2', '2', '0', '1', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('15', '27', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('16', '5', '1', '3', '1', '2', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('16', '20', '2', '2', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('16', '30', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('17', '1', '4', '1', '1', '2', 'w');
INSERT INTO `sbm_team_statistics` VALUES ('17', '20', '2', '2', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('17', '21', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('18', '9', '0', '1', '0', '0', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('18', '13', '1', '1', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('18', '28', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('19', '10', '2', '3', '0', '0', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('19', '11', '0', '2', '0', '0', 'l');
INSERT INTO `sbm_team_statistics` VALUES ('19', '27', '0', '0', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('20', '7', '2', '2', '1', '1', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('20', '16', '2', '2', '0', '0', 'd');
INSERT INTO `sbm_team_statistics` VALUES ('20', '23', '0', '0', '0', '0', 'd');

-- ----------------------------
-- Table structure for `sbm_user`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_user`;
CREATE TABLE `sbm_user` (
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
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_user_role` (`role_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_user
-- ----------------------------
INSERT INTO `sbm_user` VALUES ('1', 'admin', 'admin', 'admin', 'admin', '1886-12-16', 'Kathmandu', 'Nepal', '00990055177', 'saninshakya@gmail.com', '9837', '1');
INSERT INTO `sbm_user` VALUES ('2', 'narit', 'thai', 'narit', 'narit', '1899-10-10', 'Bangkok', 'Thailand', '93238932832932', 'narit@gmail.com', '8747', '2');
INSERT INTO `sbm_user` VALUES ('3', 'remy', 'french', 'remy', 'remy', '2015-10-12', 'Paris', 'France', '324324234332', 'remy@gmail.com', '8763', '2');
INSERT INTO `sbm_user` VALUES ('5', 'yang', 'kate', 'yang', 'yang', '1988-06-10', 'Beijing', 'China', '23423455', 'yang@gmail.com', '2345', '2');
INSERT INTO `sbm_user` VALUES ('6', 'binita', 'Shakya', 'binita', '66ec78c9658bfbc52708a456656c77b6', '0000-00-00', 'patan', 'Nepal', '09-8787632', 'binitashakya205@gmail.com', '1234', '2');
INSERT INTO `sbm_user` VALUES ('7', 'Nikita', 'shakya', 'nikita', 'b00a50c448238a71ed479f81fa4d9066', '0000-00-00', 'patan', 'Nepal', '998302834', 'nikita@hotmail.com', '2343', '2');
INSERT INTO `sbm_user` VALUES ('8', 'ganesh', 'shakya', 'ganesh', 'fa1d87bc7f85769ea9dee2e4957321ae', '1960-05-21', 'patan', 'Nepal', '998302834', 'admin@thaimooc.org', '2343', '2');
INSERT INTO `sbm_user` VALUES ('9', 'ganesh', 'binita', 'sanin', 'fa1d87bc7f85769ea9dee2e4957321ae', '1960-05-21', 'patan', 'Nepal', '09-8787632', 'sysadmin@asianux.hylib.org', '1234', '2');

-- ----------------------------
-- Table structure for `sbm_user_correct_score_bid`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_user_correct_score_bid`;
CREATE TABLE `sbm_user_correct_score_bid` (
  `amount` decimal(10,2) NOT NULL,
  `bid_date` datetime NOT NULL,
  `is_win` tinyint(1) NOT NULL,
  `payoff` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `correct_score_odd_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`correct_score_odd_id`),
  KEY `correct_score_odd_id_idx` (`correct_score_odd_id`),
  CONSTRAINT `correct_score_odd_id` FOREIGN KEY (`correct_score_odd_id`) REFERENCES `sbm_correct_score_odd` (`correct_score_odd_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `score_bid_user_id` FOREIGN KEY (`user_id`) REFERENCES `sbm_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_user_correct_score_bid
-- ----------------------------

-- ----------------------------
-- Table structure for `sbm_user_weekly_bid`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_user_weekly_bid`;
CREATE TABLE `sbm_user_weekly_bid` (
  `amount` decimal(10,2) NOT NULL,
  `bid_date` datetime NOT NULL,
  `is_win` tinyint(1) NOT NULL,
  `payoff` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `weekly_odd_id` int(11) NOT NULL,
  `odd_selection` float DEFAULT NULL,
  PRIMARY KEY (`user_id`,`weekly_odd_id`),
  KEY `weekly_bid_odd_id_idx` (`weekly_odd_id`),
  CONSTRAINT `weekly_bid_odd_id` FOREIGN KEY (`weekly_odd_id`) REFERENCES `sbm_weekly_odd` (`weekly_odd_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `weekly_bid_user_id` FOREIGN KEY (`user_id`) REFERENCES `sbm_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_user_weekly_bid
-- ----------------------------
INSERT INTO `sbm_user_weekly_bid` VALUES ('100.00', '2015-08-16 21:50:09', '1', '230.00', '2', '1', '2.3');
INSERT INTO `sbm_user_weekly_bid` VALUES ('1000.00', '2015-08-26 22:03:43', '1', '3700.00', '2', '2', '3.7');
INSERT INTO `sbm_user_weekly_bid` VALUES ('500.00', '2015-08-27 22:05:24', '0', '0.00', '2', '5', '5.6');
INSERT INTO `sbm_user_weekly_bid` VALUES ('200.00', '2015-08-27 22:06:12', '0', '0.00', '2', '7', '4.7');
INSERT INTO `sbm_user_weekly_bid` VALUES ('1000.00', '2015-08-23 22:12:16', '0', '0.00', '2', '9', '5.6');
INSERT INTO `sbm_user_weekly_bid` VALUES ('5000.00', '2015-10-16 23:23:54', '0', '0.00', '2', '21', '6.4');
INSERT INTO `sbm_user_weekly_bid` VALUES ('9000.00', '2015-10-16 23:25:25', '0', '0.00', '2', '22', '2.4');
INSERT INTO `sbm_user_weekly_bid` VALUES ('1000.00', '2015-08-16 22:06:52', '1', '2300.00', '3', '1', '2.3');
INSERT INTO `sbm_user_weekly_bid` VALUES ('10000.00', '2015-10-16 23:24:30', '0', '0.00', '3', '21', '6.4');
INSERT INTO `sbm_user_weekly_bid` VALUES ('2000.00', '2015-08-16 22:07:44', '0', '0.00', '5', '1', '1.1');
INSERT INTO `sbm_user_weekly_bid` VALUES ('10000.00', '2015-08-23 22:11:47', '0', '0.00', '5', '9', '5.6');
INSERT INTO `sbm_user_weekly_bid` VALUES ('1000.00', '2015-10-15 23:24:57', '0', '0.00', '5', '22', '4.3');

-- ----------------------------
-- Table structure for `sbm_weekly_odd`
-- ----------------------------
DROP TABLE IF EXISTS `sbm_weekly_odd`;
CREATE TABLE `sbm_weekly_odd` (
  `weekly_odd_id` int(11) NOT NULL AUTO_INCREMENT,
  `odd_home` float NOT NULL,
  `odd_away` float NOT NULL,
  `odd_draw` float NOT NULL,
  `fixture_id` int(11) NOT NULL,
  PRIMARY KEY (`weekly_odd_id`),
  KEY `weekly_odd_fixture_id_idx` (`fixture_id`),
  CONSTRAINT `weekly_odd_fixture_id` FOREIGN KEY (`fixture_id`) REFERENCES `sbm_fixture` (`fixture_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sbm_weekly_odd
-- ----------------------------
INSERT INTO `sbm_weekly_odd` VALUES ('1', '1.1', '2.3', '3.7', '1');
INSERT INTO `sbm_weekly_odd` VALUES ('2', '1.1', '2.3', '3.7', '2');
INSERT INTO `sbm_weekly_odd` VALUES ('3', '2.2', '4.7', '3.7', '3');
INSERT INTO `sbm_weekly_odd` VALUES ('4', '2.2', '4.7', '3.7', '4');
INSERT INTO `sbm_weekly_odd` VALUES ('5', '2.2', '4.7', '5.6', '5');
INSERT INTO `sbm_weekly_odd` VALUES ('6', '2.2', '4.7', '5.6', '6');
INSERT INTO `sbm_weekly_odd` VALUES ('7', '2.2', '4.7', '5.6', '7');
INSERT INTO `sbm_weekly_odd` VALUES ('8', '1.1', '4.7', '5.6', '8');
INSERT INTO `sbm_weekly_odd` VALUES ('9', '1.1', '4.7', '5.6', '9');
INSERT INTO `sbm_weekly_odd` VALUES ('10', '2.1', '4.7', '5.6', '10');
INSERT INTO `sbm_weekly_odd` VALUES ('11', '2.1', '4.7', '5.6', '11');
INSERT INTO `sbm_weekly_odd` VALUES ('12', '2.1', '4.7', '5.6', '12');
INSERT INTO `sbm_weekly_odd` VALUES ('13', '2.1', '4.7', '5.6', '13');
INSERT INTO `sbm_weekly_odd` VALUES ('14', '1.1', '4.7', '5.6', '14');
INSERT INTO `sbm_weekly_odd` VALUES ('15', '1.1', '4.7', '2.4', '15');
INSERT INTO `sbm_weekly_odd` VALUES ('16', '3.5', '4.7', '2.4', '16');
INSERT INTO `sbm_weekly_odd` VALUES ('17', '3.5', '6.4', '2.4', '17');
INSERT INTO `sbm_weekly_odd` VALUES ('18', '3.5', '6.4', '2.4', '18');
INSERT INTO `sbm_weekly_odd` VALUES ('19', '3.5', '6.4', '2.4', '19');
INSERT INTO `sbm_weekly_odd` VALUES ('20', '3.5', '6.4', '2.4', '20');
INSERT INTO `sbm_weekly_odd` VALUES ('21', '3.5', '6.4', '2.4', '21');
INSERT INTO `sbm_weekly_odd` VALUES ('22', '4.3', '3.4', '2.4', '22');
INSERT INTO `sbm_weekly_odd` VALUES ('23', '4.3', '3.4', '2.4', '23');
INSERT INTO `sbm_weekly_odd` VALUES ('24', '4.3', '3.4', '2.4', '24');
INSERT INTO `sbm_weekly_odd` VALUES ('25', '5.4', '3.4', '2.4', '25');
INSERT INTO `sbm_weekly_odd` VALUES ('26', '5.4', '3.4', '2.4', '26');
INSERT INTO `sbm_weekly_odd` VALUES ('27', '5.4', '5.3', '2.4', '27');
INSERT INTO `sbm_weekly_odd` VALUES ('28', '5.4', '5.3', '2.4', '28');
INSERT INTO `sbm_weekly_odd` VALUES ('29', '5.4', '5.3', '2.4', '29');
INSERT INTO `sbm_weekly_odd` VALUES ('30', '5.4', '5.3', '2.4', '30');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_type` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_type_UNIQUE` (`role_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', 'Bettor');
INSERT INTO `sys_user_role` VALUES ('1', 'Bookmaker');

-- ----------------------------
-- View structure for `return_gameweek`
-- ----------------------------
DROP VIEW IF EXISTS `return_gameweek`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `return_gameweek` AS (select `f`.`fixture_id` AS `fixture_id`,`f`.`game_week` AS `game_week`,`f`.`fixture_date` AS `fixture_date`,`t`.`team_id` AS `team_id`,`t`.`team_fullname` AS `team_fullname`,`tf`.`home_team` AS `home_team`,`tf`.`away_team` AS `away_team` from ((`sbm_fixture` `f` left join `sbm_team_fixture` `tf` on((`f`.`fixture_id` = `tf`.`fixture_id`))) left join `sbm_team` `t` on((`tf`.`team_id` = `t`.`team_id`))) order by `f`.`fixture_id`);

-- ----------------------------
-- Procedure structure for `return_current_form`
-- ----------------------------
DROP PROCEDURE IF EXISTS `return_current_form`;
DELIMITER ;;
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
END
;;
DELIMITER ;

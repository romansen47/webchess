create database WebChess_DB;
create user 'WebChessUser'@'localhost' identified by '12345';
use WebChess_DB;
CREATE TABLE communication (
  commID smallint(6) NOT NULL auto_increment,
  gameID smallint(6) default NULL,
  fromID mediumint(9) default NULL,
  toID mediumint(9) default NULL,
  title varchar(255) default NULL,
  text longtext,
  postDate datetime NOT NULL default '0000-00-00 00:00:00',
  expireDate datetime default '0000-00-00 00:00:00',
  ack tinyint(4) default '0',
  commType smallint(6) default '0',
  PRIMARY KEY  (commID)
);
INSERT INTO communication
(gameID,fromID,toID,title,text,postDate,expireDate,ack,commType)
VALUES (NULL,NULL,NULL,'Database Upgrade tSuccessfull','If you see this message
then the communication table was created successfully... this will allow players
and admins to communicate with each other by posting
messages.',NOW(),'0000-00-00 00:00:00','0','0');
CREATE TABLE `games` (
  `gameID` smallint(6) NOT NULL AUTO_INCREMENT,
  `whitePlayer` mediumint(9) NOT NULL,
  `blackPlayer` mediumint(9) NOT NULL,
  `gameMessage` enum('','playerInvited','inviteDeclined','draw','playerResigned','checkMate') DEFAULT NULL,
  `messageFrom` enum('','black','white') DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `lastMove` datetime NOT NULL,
  PRIMARY KEY (`gameID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `history` (
  `timeOfMove` datetime NOT NULL,
  `gameID` smallint(6) NOT NULL,
  `curPiece` enum('pawn','bishop','knight','rook','queen','king') NOT NULL,
  `curColor` enum('white','black') NOT NULL,
  `fromRow` smallint(6) NOT NULL,
  `fromCol` smallint(6) NOT NULL,
  `toRow` smallint(6) NOT NULL,
  `toCol` smallint(6) NOT NULL,
  `replaced` enum('pawn','bishop','knight','rook','queen','king') DEFAULT NULL,
  `promotedTo` enum('pawn','bishop','knight','rook','queen','king') DEFAULT NULL,
  `isInCheck` tinyint(1) NOT NULL,
  PRIMARY KEY (`timeOfMove`,`gameID`),
  KEY `idx_gameID` (`gameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `messages` (
  `msgID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` smallint(6) NOT NULL,
  `msgType` enum('undo','draw') NOT NULL,
  `msgStatus` enum('request','approved','denied') NOT NULL,
  `destination` enum('black','white') NOT NULL,
  PRIMARY KEY (`msgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `pieces` (
  `gameID` smallint(6) NOT NULL,
  `color` enum('white','black') NOT NULL,
  `piece` enum('pawn','rook','knight','bishop','queen','king') NOT NULL,
  `col` smallint(6) NOT NULL,
  `row` smallint(6) NOT NULL,
  KEY `idx_gameID` (`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `players` (
  `playerID` int(11) NOT NULL AUTO_INCREMENT,
  `password` char(32) NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `nick` varchar(64) NOT NULL,
  `lastAccess` datetime DEFAULT NULL,
  `userlevel` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`playerID`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `preferences` (
  `playerID` int(11) NOT NULL,
  `preference` char(20) NOT NULL,
  `value` char(50) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`preference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
GRANT SELECT, INSERT, UPDATE, DELETE ON WebChess_DB.* TO 'WebChessUser'@'localhost';
flush privileges;

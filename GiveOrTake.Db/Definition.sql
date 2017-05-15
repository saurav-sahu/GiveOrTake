DROP SCHEMA IF EXISTS `GiveOrTake` ;

CREATE SCHEMA IF NOT EXISTS `GiveOrTake` DEFAULT CHARACTER SET utf8 ;
USE `GiveOrTake` ;

CREATE TABLE `User` (
  `Id` VARCHAR(255) NOT NULL PRIMARY KEY,
  `FirstName` TEXT NOT NULL,
  `MiddleName` TEXT,
  `LastName` TEXT NOT NULL,
  `Email` TEXT NOT NULL)
  ENGINE=INNODB;
  
CREATE TABLE `Item` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `ItemName` TEXT NOT NULL,
  `UserId` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`UserId`) REFERENCES `User`(`Id`))
  ENGINE=INNODB;

CREATE TABLE `Transaction` (
  `Id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Description` TEXT,
  `OccurenceDate` DATETIME NOT NULL,
  `ExpectedReturnDate` DATETIME,
  `TransactionType` TINYINT(1) NOT NULL,
  `UserId` VARCHAR(255) NOT NULL,
  `OtherUserId` VARCHAR(255) NOT NULL,
  `ItemId` INT NOT NULL,
   FOREIGN KEY (`UserId`) REFERENCES `User`(`Id`),
   FOREIGN KEY (`ItemId`)  REFERENCES `Item`(`Id`))
   ENGINE=INNODB;

CREATE TABLE `RootAccess` (
  `Id` VARCHAR(255) NOT NULL PRIMARY KEY,
  `Password` TEXT NOT NULL,
   FOREIGN KEY (`Id`) REFERENCES `User`(`Id`))
   ENGINE=INNODB;
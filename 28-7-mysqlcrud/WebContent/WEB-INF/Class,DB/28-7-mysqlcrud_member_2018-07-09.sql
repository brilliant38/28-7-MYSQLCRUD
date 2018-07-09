-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- engineer 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `engineer` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `engineer`;


-- 테이블 engineer의 구조를 덤프합니다. employee
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) DEFAULT NULL,
  `employee_age` int(10) DEFAULT NULL,
  PRIMARY KEY (`employee_no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.employee: ~0 rows (대략적)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. employee_addr
CREATE TABLE IF NOT EXISTS `employee_addr` (
  `employee_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) DEFAULT NULL,
  `employee_addr_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_addr_no`),
  KEY `FK_employee_addr_employee` (`employee_no`),
  CONSTRAINT `FK_employee_addr_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.employee_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `employee_addr` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_addr` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) DEFAULT NULL,
  `member_age` int(10) DEFAULT NULL,
  PRIMARY KEY (`member_no`),
  UNIQUE KEY `member_name` (`member_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.member: ~14 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `member_name`, `member_age`) VALUES
	(3, '김규민', 25),
	(7, '김병욱', 85),
	(12, '김민성', 29),
	(13, '김혜성', 23),
	(14, '김재현', 30),
	(15, '박해민', 24),
	(16, '김헌곤', 29),
	(17, '구자욱', 23),
	(18, '러프', 29),
	(19, '이원석', 32),
	(20, '박한이', 39),
	(21, '이지영', 31),
	(22, '김상수', 29),
	(23, '손주인', 33);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. member_addr
CREATE TABLE IF NOT EXISTS `member_addr` (
  `member_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(11) DEFAULT NULL,
  `member_addr_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_addr_no`),
  KEY `FK_member_addr_member` (`member_no`),
  CONSTRAINT `FK_member_addr_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.member_addr: ~5 rows (대략적)
/*!40000 ALTER TABLE `member_addr` DISABLE KEYS */;
INSERT INTO `member_addr` (`member_addr_no`, `member_no`, `member_addr_content`) VALUES
	(10, 3, '오클랜드'),
	(11, 7, 'LA'),
	(13, 12, '하와이'),
	(15, 3, '울산'),
	(17, 12, '대만');
/*!40000 ALTER TABLE `member_addr` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. member_score
CREATE TABLE IF NOT EXISTS `member_score` (
  `member_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`member_score_no`),
  KEY `FK_member_score_member` (`member_no`),
  CONSTRAINT `FK_member_score_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.member_score: ~0 rows (대략적)
/*!40000 ALTER TABLE `member_score` DISABLE KEYS */;
INSERT INTO `member_score` (`member_score_no`, `member_no`, `score`) VALUES
	(1, 17, 60),
	(2, 17, 50),
	(3, 17, 40),
	(4, 17, 70),
	(5, 17, 80),
	(6, 17, 90),
	(7, 17, 50),
	(8, 13, 60),
	(9, 18, 70),
	(10, 20, 80),
	(11, 15, 40),
	(12, 23, 70);
/*!40000 ALTER TABLE `member_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

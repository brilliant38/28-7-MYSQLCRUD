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


-- 테이블 engineer의 구조를 덤프합니다. student
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) DEFAULT NULL,
  `student_age` int(10) DEFAULT NULL,
  PRIMARY KEY (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.student: ~5 rows (대략적)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_no`, `student_name`, `student_age`) VALUES
	(1, '오리', 20),
	(5, '9999', 21),
	(8, '꽹가리', 15),
	(9, '진돗개', 10),
	(10, '비둘기', 23);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. student_addr
CREATE TABLE IF NOT EXISTS `student_addr` (
  `studentr_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) DEFAULT NULL,
  `student_addr_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`studentr_addr_no`),
  KEY `FK_student_addr_student` (`student_no`),
  CONSTRAINT `FK_student_addr_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.student_addr: ~5 rows (대략적)
/*!40000 ALTER TABLE `student_addr` DISABLE KEYS */;
INSERT INTO `student_addr` (`studentr_addr_no`, `student_no`, `student_addr_content`) VALUES
	(1, 1, '함경북도'),
	(2, 5, '라스베가스'),
	(3, 8, '센프란시스코'),
	(4, 9, '우리집'),
	(5, 10, '시드니');
/*!40000 ALTER TABLE `student_addr` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. student_score
CREATE TABLE IF NOT EXISTS `student_score` (
  `student_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL DEFAULT '0',
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_score_no`),
  KEY `FK_student` (`student_no`),
  CONSTRAINT `FK_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.student_score: ~5 rows (대략적)
/*!40000 ALTER TABLE `student_score` DISABLE KEYS */;
INSERT INTO `student_score` (`student_score_no`, `student_no`, `score`) VALUES
	(1, 1, 100),
	(2, 5, 90),
	(3, 1, 34),
	(4, 10, 50),
	(5, 9, 95);
/*!40000 ALTER TABLE `student_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

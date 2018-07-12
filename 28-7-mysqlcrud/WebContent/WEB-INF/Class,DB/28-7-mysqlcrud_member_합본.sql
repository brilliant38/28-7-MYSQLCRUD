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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.employee: ~25 rows (대략적)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_no`, `employee_name`, `employee_age`) VALUES
	(1, '홍길동', 35),
	(2, '장보고', 45),
	(3, '임꺽정', 23),
	(5, '한석봉', 56),
	(7, '이순신', 34),
	(8, '최영', 44),
	(9, '모하메드살라', 25),
	(10, '해리케인', 27),
	(11, '세르히오아구에로', 30),
	(12, '제이미바디', 29),
	(13, '라힘스털링', 30),
	(14, '로멜루루카쿠', 26),
	(15, '로베르토피르미누', 28),
	(16, '알렉산드레라카제트', 33),
	(17, '가브리엘제주스', 21),
	(18, '에당아자르', 30),
	(19, '글렌머레이', 22),
	(20, '리야드마레즈', 35),
	(21, '손흥민', 24),
	(22, '아르나우토비치', 24),
	(23, '오바메양', 19),
	(24, '크리스우드', 32),
	(25, '사디오마네', 24),
	(26, '웨인루니', 15),
	(27, '렐로이사네', 39);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. employee_addr
CREATE TABLE IF NOT EXISTS `employee_addr` (
  `employee_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) DEFAULT NULL,
  `employee_addr_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_addr_no`),
  KEY `FK_employee_addr_employee` (`employee_no`),
  CONSTRAINT `FK_employee_addr_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.employee_addr: ~4 rows (대략적)
/*!40000 ALTER TABLE `employee_addr` DISABLE KEYS */;
INSERT INTO `employee_addr` (`employee_addr_no`, `employee_no`, `employee_addr_content`) VALUES
	(1, 2, '오클랜드'),
	(2, 1, '부산'),
	(3, 3, '태백'),
	(5, 5, '무주');
/*!40000 ALTER TABLE `employee_addr` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. employee_score
CREATE TABLE IF NOT EXISTS `employee_score` (
  `employee_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`employee_score_no`),
  KEY `FK_employee_score_employee` (`employee_no`),
  CONSTRAINT `FK_employee_score_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.employee_score: ~17 rows (대략적)
/*!40000 ALTER TABLE `employee_score` DISABLE KEYS */;
INSERT INTO `employee_score` (`employee_score_no`, `employee_no`, `score`) VALUES
	(1, 7, 10),
	(2, 3, 9),
	(3, 2, 8),
	(5, 9, 9),
	(6, 5, 5),
	(7, 1, 4),
	(8, 17, 1),
	(9, 19, 2),
	(10, 13, 3),
	(11, 27, 4),
	(12, 14, 5),
	(13, 15, 7),
	(14, 20, 8),
	(15, 25, 10),
	(16, 11, 4),
	(17, 21, 10),
	(18, 22, 7);
/*!40000 ALTER TABLE `employee_score` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) DEFAULT NULL,
  `member_age` int(10) DEFAULT NULL,
  PRIMARY KEY (`member_no`),
  UNIQUE KEY `member_name` (`member_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.member: ~13 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `member_name`, `member_age`) VALUES
	(3, '김규민', 25),
	(7, '김병욱', 85),
	(12, '김민성', 30),
	(13, '김혜성', 23),
	(14, '김재현', 30),
	(15, '박해민', 24),
	(16, '김헌곤', 29),
	(17, '구자욱', 23),
	(18, '러프', 29),
	(19, '이원석', 32),
	(20, '박한이', 39),
	(21, '이지영', 31),
	(23, '손주인', 33);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. member_addr
CREATE TABLE IF NOT EXISTS `member_addr` (
  `member_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(11) DEFAULT NULL,
  `member_addr_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_addr_no`),
  KEY `FK_member_addr_member` (`member_no`),
  CONSTRAINT `FK_member_addr_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.member_addr: ~11 rows (대략적)
/*!40000 ALTER TABLE `member_addr` DISABLE KEYS */;
INSERT INTO `member_addr` (`member_addr_no`, `member_no`, `member_addr_content`) VALUES
	(10, 3, '오클랜드'),
	(11, 7, 'LA'),
	(13, 12, '하와이'),
	(15, 19, '울산'),
	(17, 12, '대만'),
	(18, 18, 'LA'),
	(19, 20, '부산'),
	(20, 15, '하와이'),
	(21, 23, '캐나다'),
	(22, 13, '로마'),
	(23, 14, '대만');
/*!40000 ALTER TABLE `member_addr` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. member_score
CREATE TABLE IF NOT EXISTS `member_score` (
  `member_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`member_score_no`),
  KEY `FK_member_score_member` (`member_no`),
  CONSTRAINT `FK_member_score_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.member_score: ~19 rows (대략적)
/*!40000 ALTER TABLE `member_score` DISABLE KEYS */;
INSERT INTO `member_score` (`member_score_no`, `member_no`, `score`) VALUES
	(1, 17, 90),
	(2, 14, 50),
	(3, 19, 40),
	(4, 21, 90),
	(5, 12, 80),
	(6, 16, 90),
	(7, 3, 50),
	(8, 13, 60),
	(9, 18, 70),
	(10, 20, 80),
	(11, 15, 40),
	(12, 23, 70),
	(13, 18, 80),
	(14, 12, 90),
	(15, 14, 100),
	(16, 19, 100),
	(17, 19, 80),
	(21, 23, 80),
	(22, 18, 25);
/*!40000 ALTER TABLE `member_score` ENABLE KEYS */;


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
  CONSTRAINT `FK_student_addr_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `FK_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE ON UPDATE CASCADE
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


-- 테이블 engineer의 구조를 덤프합니다. teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) DEFAULT NULL,
  `teacher_age` int(10) DEFAULT NULL,
  PRIMARY KEY (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.teacher: ~19 rows (대략적)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacher_no`, `teacher_name`, `teacher_age`) VALUES
	(16, '김진우', 24),
	(17, '송원민', 26),
	(18, '탁재은', 23),
	(19, '최윤석', 25),
	(20, '구해성', 20),
	(21, '이광재', 31),
	(22, '박원우', 26),
	(23, '이응빈', 24),
	(24, '김호순', 24),
	(25, '송유빈', 22),
	(28, '김지완', 26),
	(29, '이경선', 26),
	(30, '최지수', 26),
	(31, '김소희', 26),
	(32, '공세준', 32),
	(33, '이원상', 28),
	(34, '정민수', 25),
	(35, '김준영', 25),
	(36, '김정연', 17);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. teacher_address
CREATE TABLE IF NOT EXISTS `teacher_address` (
  `teacher_address_no` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(11) NOT NULL,
  `teacher_address_content` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_address_no`),
  KEY `FK_teacher_address_teacher` (`teacher_no`),
  CONSTRAINT `FK_teacher_address_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.teacher_address: ~17 rows (대략적)
/*!40000 ALTER TABLE `teacher_address` DISABLE KEYS */;
INSERT INTO `teacher_address` (`teacher_address_no`, `teacher_no`, `teacher_address_content`) VALUES
	(2, 17, '완주'),
	(3, 31, '완주'),
	(4, 19, '완주'),
	(5, 18, '전주'),
	(6, 20, '전주'),
	(7, 16, '전주'),
	(8, 21, '전주'),
	(9, 23, '전주'),
	(10, 24, '전주'),
	(11, 25, '전주'),
	(12, 28, '전주'),
	(13, 29, '전주'),
	(14, 32, '전주'),
	(15, 33, '전주'),
	(17, 30, '전주'),
	(18, 35, '완주'),
	(19, 16, '전주');
/*!40000 ALTER TABLE `teacher_address` ENABLE KEYS */;


-- 테이블 engineer의 구조를 덤프합니다. teacher_score
CREATE TABLE IF NOT EXISTS `teacher_score` (
  `teacher_score` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) NOT NULL DEFAULT '0',
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teacher_score`),
  KEY `FK__teacher` (`teacher_no`),
  CONSTRAINT `FK__teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=euckr;

-- Dumping data for table engineer.teacher_score: ~24 rows (대략적)
/*!40000 ALTER TABLE `teacher_score` DISABLE KEYS */;
INSERT INTO `teacher_score` (`teacher_score`, `teacher_no`, `score`) VALUES
	(1, 16, 100),
	(2, 17, 50),
	(3, 18, 55),
	(4, 19, 90),
	(5, 20, 65),
	(6, 21, 70),
	(7, 22, 75),
	(8, 23, 85),
	(9, 24, 105),
	(10, 25, 105),
	(11, 16, 100),
	(12, 17, 65),
	(13, 16, 100),
	(14, 16, 100),
	(15, 17, 100),
	(16, 17, 100),
	(17, 16, 100),
	(18, 18, 100),
	(19, 19, 90),
	(20, 20, 100),
	(21, 28, 100),
	(22, 30, 150),
	(23, 29, 120),
	(24, 35, 30000);
/*!40000 ALTER TABLE `teacher_score` ENABLE KEYS */;


-- 뷰 engineer의 구조를 덤프합니다. viw_test
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `viw_test` (
	`score` INT(10) NULL
) ENGINE=MyISAM;


-- 뷰 engineer의 구조를 덤프합니다. viw_test
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `viw_test`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `engineer`.`viw_test` AS SELECT score FROM employee_score WHERE employee_no = 5 ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

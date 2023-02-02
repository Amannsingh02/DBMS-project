-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2021 at 11:52 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'aman@gmail.com', 'Dr Aman', 'Cardiology'),
(2, 'raj@gmail.com', 'Dr Raj', 'Dermatology'),
(3, 'abhi@gmail.com', 'Dr Abhi', 'Anesthesiology'),
(4, 'bibha@gmail', 'Dr Bibha', 'Endocrinology'),
(5, 'shilpi@gmail.com', 'Dr Shilpi', 'corona'),
(6, 'batcat@gmail.com', 'Dr Badal', 'Oncology'),
(7, 'kumar@gmail.com', 'Dr Kumar', 'Cardiology'),
(8, 'iyer@gmail.com', 'Dr Iyer', 'Dermatology'),
(9, 'varun@gmail.com', 'Dr Varun', 'Anesthesiology'),
(10, 'mehul@gmail', 'Dr Mehul', 'Endocrinology'),
(11, 'theju@gmail.com', 'Dr Thejaswini Gowda', 'corona'),
(12, 'mohan@gmail.com', 'Dr Mohan', 'Oncology');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(111, 'aniket@gmail.com', 'Aniket Tiwari', 'Male', 'evening', 'NGEO', '21:20:00', '2023-02-02', 'cardiology', '9874561110'),
(112, 'duck.quack@gmail.com', 'sanskriti singh', 'Female', 'morning', 'fever', '09:06:00', '2022-11-18', 'corona', '9874563210'),
(113, 'anees@gmail.com', 'anees rehman', 'Male', 'evening', 'cold', '22:18:00', '2022-11-05', 'corona', '9874563210'),
(114, 'diana@gmail.com', 'diana', 'Female', 'morning', 'alcoholism', '10:18:00', '2022-11-05', 'Endocrinology', '9874563210'),
(115, 'penty@gmail.com', 'kate penty', 'Female', 'morning', 'skin infection', '08:27:00', '2022-11-26', 'Dermatology', '9874563210'),
(116, 'sadash@gmail.com', 'sudesh shetty', 'Male', 'evening', 'fracture', '16:25:00', '2022-12-09', 'Anesthesilogy', '9874589654'),
(117, 'khushi@gmail.com', 'khushi tiwari', 'Female', 'evening', 'cancer', '20:42:00', '2023-01-21', 'Oncology', '9874563210'),
(118, 'mrunal@gmail.com', 'mrunal thakur', 'Female', 'evening', 'cancer', '15:46:00', '2023-01-31', 'Oncology', '9874587496'),
(119, 'andhi@gmail.com', 'dora andhi', 'Female', 'evening', 'bypass', '15:48:00', '2023-01-23', 'cardiology', '9874563210'),
(120, 'andhi@gmail.com', 'dora andhi', 'Female', 'morning', 'alcoholism', '10:48:00', '2023-01-26', 'endocrinology', '9874563210'),
(121, 'bhengi@gmail.com', 'donald trump', 'male', 'evening', 'rashes', '15:00:00', '2023-01-25', 'dermatology', '9874563410'),
(122, 'sword@gmail.com', 'parnika talwar', 'Female', 'evening', 'heartache', '23:48:00', '2022-12-23', 'cardiology', '9874663210'),
(123, 'oliveoil@gmail.com', 'jamie oliver', 'Male', 'morning', 'cholesterol', '08:48:00', '2023-01-21', 'cardiology', '9874563210'),
(124, 'gordon@gmail.com', 'gordon ramsay', 'Male', 'evening', 'coronas', '15:42:00', '2023-01-23', 'corona', '9874523210'),
(125, 'nigel@gmail.com', 'nigel ng', 'Male', 'morning', 'blood loss', '12:48:00', '2022-12-23', 'oncology', '9872363340'),
(126, 'angel@gmail.com', 'angel priya', 'Female', 'morning', 'anaemia', '10:58:00', '2022-12-18', 'oncology', '9874563212'),
(127, 'aditi@gmail.com', 'aditi jagadish', 'Female', 'evening', 'operation', '16:34:00', '2023-01-13', 'anesthesiology', '9874563210'),
(128, 'dj@gmail.com', 'dermat jayaswal', 'Male', 'morning', 'overdose', '09:40:00', '2023-01-15', 'anesthesiology', '9874554210');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO schedule VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO schedule VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO schedule VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `ttid` int(11) NOT NULL,
  `tname` varchar(20) NOT NULL,
  `demail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`ttid`, `tname`, `demail`) VALUES
(10, 'test1', 'aman@gmail.com'),
(20, 'test2', 'raj@gmail.com'),
(30, 'test3', 'abhi@gmail.com'),
(40, 'test4', 'bibha@gmail'),
(50, 'test5', 'shilpi@gmail.com'),
(60, 'test5', 'batcat@gmail.com'),
(70, 'test6', 'kumar@gmail.com'),
(80, 'test7', 'iyer@gmail.com'),
(90, 'test8', 'varun@gmail.com'),
(100, 'test9', 'mehul@gmail'),
(110, 'test10', 'theju@gmail.com'),
(1200, 'test11', 'mohan@gmail.com');


-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(70, 111, 'aniket@gmail.com', 'aniket tiwari', 'PATIENT INSERTED', '2023-02-02 21:20:00'),
(50, 112, 'duck.quack@gmail.com', 'sanskriti singh','PATIENT INSERTED', '2022-11-18 09:06:00'),
(110,113, 'anees@gmail.com', 'anees rehman','PATIENT INSERTED', '2022-11-18 22:18:00'),
(40,114, 'diana@gmail.com', 'diana','PATIENT UPDATED', '2022-11-05 10:18:00'),
(20,115, 'penty@gmail.com', 'kate penty', 'Patient INSERTED', '2022-11-26 08:27:40'),
(30,116, 'sadash@gmail.com', 'sudesh shetty', 'PATIENT UPDATED', '2022-12-09 16:25:00'),
(60, 117, 'khushi@gmail.com', 'khushi tiwari', 'PATIENT INSERTED', '2023-01-21 20:42:00'),
(1200,118, 'mrunal@gmail.com', 'mrunal thakur','PATIENT UPDATED', '2023-01-31 15:46:00' ),
(10,120, 'andhi@gmail.com', 'dora andhi','PATIENT INSERTED', '2023-01-23 15:48:57'),
(100,120, 'andhi@gmail.com', 'dora andhi','PATIENT INSERTED', '2023-01-26 10:48:00'),
(80,121, 'bhengi@gmail.com', 'donald trump', 'PATIENT UPDATED', '2023-01-25 15:00:00'),
(10,122, 'sword@gmail.com', 'parnika talwar', 'PATIENT UPDATED', '2022-02-23 23:48:00'),
(70,123, 'oliveoil@gmail.com', 'jamie oliver', 'PATIENT INSERTED', '2023-01-21 08:48:00'),
(110,124, 'gordon@gmail.com', 'gordon ramsay','PATIENT UPDATED', '2023-01-23 15:42:00'),
(60,125, 'nigel@gmail.com', 'nigel ng', 'PATIENT INSERTED', '2023-12-23 12:48:00'),
(1200,126, 'angel@gmail.com', 'angel priya','PATIENT UPDATED', '2022-12-18 10:58:00'),
(90,127, 'aditi@gmail.com', 'aditi jagadish', 'PATIENT INSERTED', '2023-01-23 16:34:00'),
(30,128, 'dj@gmail.com', 'dermat jayaswal', 'PATIENT UPDATED', '2023-01-15 09:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `usertype`, `email`, `password`) VALUES
(13, 'anees', 'Doctor', 'anees@gmail.com', 'pbkdf2:sha256:150000$xAKZCiJG$4c7a7e704708f86659d730565ff92e8327b01be5c49a6b1ef8afdf1c531fa5c3'),
(14, 'aneeqah', 'Patient', 'aneeqah@gmail.com', 'pbkdf2:sha256:150000$Yf51ilDC$028cff81a536ed9d477f9e45efcd9e53a9717d0ab5171d75334c397716d581b8'),
(15, 'khushi', 'Patient', 'khushi@gmail.com', 'pbkdf2:sha256:150000$BeSHeRKV$a8b27379ce9b2499d4caef21d9d387260b3e4ba9f7311168b6e180a00db91f22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`ttid`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `ttid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `schedule`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

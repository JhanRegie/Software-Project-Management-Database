-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2023 at 03:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio2`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_id` int(11) NOT NULL,
  `Address_Line_1` varchar(40) NOT NULL,
  `Address_Line_2` varchar(40) DEFAULT NULL,
  `Address_postcode` varchar(8) NOT NULL,
  `Address_country` varchar(15) DEFAULT 'UK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_id`, `Address_Line_1`, `Address_Line_2`, `Address_postcode`, `Address_country`) VALUES
(1, '20 New Road', 'London', 'LD1 9NO', 'UK'),
(2, '47 Fifth Avenue', 'Birmingham', 'BP2 ZMO', 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `Organisation_id` int(11) NOT NULL,
  `Address_id` int(11) NOT NULL,
  `Organisation` varchar(30) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `MethodOfContact` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`Organisation_id`, `Address_id`, `Organisation`, `FirstName`, `LastName`, `Email`, `MethodOfContact`) VALUES
(1, 1, 'MPC', 'Michael', 'Prince', 'Michaelp@gmail.com', 'Email'),
(2, 2, 'APC', 'Victor', 'Adamo', 'VictorA@gmail.com', 'Post');

-- --------------------------------------------------------

--
-- Table structure for table `pool_member`
--

CREATE TABLE `pool_member` (
  `Pool_member_id` int(11) NOT NULL,
  `Address_id` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Work` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pool_member`
--

INSERT INTO `pool_member` (`Pool_member_id`, `Address_id`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Work`) VALUES
(1, 1, 'Marcus', 'Dominguez', 'md@gmail.com', '12345678909', 'Analyst'),
(2, 2, 'Ethan', 'Smith', 'Esmith@gmail.com', '09876543212', 'Programmer');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `Project_id` int(11) NOT NULL,
  `Organisation_id` int(11) NOT NULL,
  `Pool_member_id` int(11) DEFAULT NULL,
  `Title` varchar(30) NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL,
  `Budget` int(11) NOT NULL,
  `Description` varchar(30) DEFAULT NULL,
  `Phase` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`Project_id`, `Organisation_id`, `Pool_member_id`, `Title`, `Start_date`, `End_date`, `Budget`, `Description`, `Phase`) VALUES
(1, 1, 2, 'Machine Learning', '2023-01-10', '2024-01-10', 500000, NULL, 'Development');

-- --------------------------------------------------------

--
-- Table structure for table `project_skills`
--

CREATE TABLE `project_skills` (
  `Project_id` int(11) NOT NULL,
  `Skill_id` int(11) NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_skills`
--

INSERT INTO `project_skills` (`Project_id`, `Skill_id`, `FirstName`, `LastName`) VALUES
(1, 5, 'Ethan', 'Smith'),
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `share_skills`
--

CREATE TABLE `share_skills` (
  `Pool_member_id` int(11) NOT NULL,
  `Skill_id` int(11) NOT NULL,
  `Experience` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `share_skills`
--

INSERT INTO `share_skills` (`Pool_member_id`, `Skill_id`, `Experience`) VALUES
(1, 1, 'Junior'),
(2, 5, 'Professional');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `Skill_id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`Skill_id`, `Name`, `Type`) VALUES
(1, 'HTML', 'Frontend'),
(2, 'CSS', 'Backend'),
(3, 'JavaScript', 'Frontend'),
(4, 'Java', 'Designer'),
(5, 'Python', 'Data Science'),
(6, 'Python', 'Machine Learning');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Organisation_id`),
  ADD KEY `Fk_Address_id` (`Address_id`);

--
-- Indexes for table `pool_member`
--
ALTER TABLE `pool_member`
  ADD PRIMARY KEY (`Pool_member_id`),
  ADD KEY `FK_Address_id_2` (`Address_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Project_id`),
  ADD KEY `Fk_Organisation_id` (`Organisation_id`),
  ADD KEY `Fk_Pool_member` (`Pool_member_id`);

--
-- Indexes for table `project_skills`
--
ALTER TABLE `project_skills`
  ADD KEY `Fk_Project_id` (`Project_id`),
  ADD KEY `Fk_Project_skill` (`Skill_id`);

--
-- Indexes for table `share_skills`
--
ALTER TABLE `share_skills`
  ADD KEY `Fk_Pool_member_id` (`Pool_member_id`),
  ADD KEY `Fk_Share_skill` (`Skill_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`Skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `Fk_Address_id` FOREIGN KEY (`Address_id`) REFERENCES `address` (`Address_id`);

--
-- Constraints for table `pool_member`
--
ALTER TABLE `pool_member`
  ADD CONSTRAINT `FK_Address_id_2` FOREIGN KEY (`Address_id`) REFERENCES `address` (`Address_id`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `Fk_Organisation_id` FOREIGN KEY (`Organisation_id`) REFERENCES `client` (`Organisation_id`),
  ADD CONSTRAINT `Fk_Pool_member` FOREIGN KEY (`Pool_member_id`) REFERENCES `pool_member` (`Pool_member_id`);

--
-- Constraints for table `project_skills`
--
ALTER TABLE `project_skills`
  ADD CONSTRAINT `Fk_Project_id` FOREIGN KEY (`Project_id`) REFERENCES `project` (`Project_id`),
  ADD CONSTRAINT `Fk_Project_skill` FOREIGN KEY (`Skill_id`) REFERENCES `skills` (`Skill_id`);

--
-- Constraints for table `share_skills`
--
ALTER TABLE `share_skills`
  ADD CONSTRAINT `Fk_Pool_member_id` FOREIGN KEY (`Pool_member_id`) REFERENCES `pool_member` (`Pool_member_id`),
  ADD CONSTRAINT `Fk_Share_skill` FOREIGN KEY (`Skill_id`) REFERENCES `skills` (`Skill_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

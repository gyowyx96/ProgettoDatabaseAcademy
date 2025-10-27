-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 27, 2025 alle 09:40
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

DROP DATABASE IF EXISTS DB_Academy;
CREATE DATABASE DB_Academy;
use DB_Academy;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_academy`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `city`
--

CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `ProvinceID` int(11) NOT NULL,
  `CityName` varchar(25) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `city`
--

INSERT INTO `city` (`CityID`, `ProvinceID`, `CityName`, `isDeleted`) VALUES
(1, 1, 'Agrigento', 0),
(2, 1, 'Canicattì', 0),
(3, 1, 'Licata', 0),
(4, 1, 'Favara', 0),
(5, 1, 'Sciacca', 0),
(6, 2, 'Caltanissetta', 0),
(7, 2, 'Gela', 0),
(8, 2, 'Niscemi', 0),
(9, 2, 'San Cataldo', 0),
(10, 2, 'Mazzarino', 0),
(11, 3, 'Catania', 0),
(12, 3, 'Acireale', 0),
(13, 3, 'Paternò', 0),
(14, 3, 'Adrano', 0),
(15, 3, 'Misterbianco', 0),
(16, 4, 'Enna', 0),
(17, 4, 'Piazza Armerina', 0),
(18, 4, 'Leonforte', 0),
(19, 4, 'Nicosia', 0),
(20, 4, 'Barrafranca', 0),
(21, 5, 'Messina', 0),
(22, 5, 'Barcellona Pozzo di Gotto', 0),
(23, 5, 'Milazzo', 0),
(24, 5, 'Patti', 0),
(25, 5, 'Taormina', 0),
(26, 6, 'Palermo', 0),
(27, 6, 'Bagheria', 0),
(28, 6, 'Monreale', 0),
(29, 6, 'Termini Imerese', 0),
(30, 6, 'Carini', 0),
(31, 7, 'Ragusa', 0),
(32, 7, 'Modica', 0),
(33, 7, 'Vittoria', 0),
(34, 7, 'Comiso', 0),
(35, 7, 'Scicli', 0),
(36, 8, 'Siracusa', 0),
(37, 8, 'Augusta', 0),
(38, 8, 'Noto', 0),
(39, 8, 'Lentini', 0),
(40, 8, 'Avola', 0),
(41, 9, 'Trapani', 0),
(42, 9, 'Marsala', 0),
(43, 9, 'Mazara del Vallo', 0),
(44, 9, 'Alcamo', 0),
(45, 9, 'Castelvetrano', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `course`
--

CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(60) NOT NULL,
  `CourseNumber` int(11) NOT NULL,
  `SiteID` int(11) NOT NULL,
  `TutorID` int(11) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `CourseNumber`, `SiteID`, `TutorID`, `StartDate`, `EndDate`, `isDeleted`) VALUES
(1, 'Corso di Web Developer A.I.', 29, 5, 1, '2021-12-20', '2023-12-20', 0),
(2, 'Corso di Web Developer A.I.', 30, 5, 3, '2022-02-03', '2024-02-03', 0),
(3, 'Corso di Tecnico TBM (Tunnel Boring Machine)', 31, 3, 4, '2023-02-14', '2025-02-14', 0),
(4, 'Corso di A.I. & Data Analysis', 32, 5, 2, '2024-07-16', NULL, 0),
(5, 'Corso di Web Developer A.I.', 33, 9, 1, '2025-01-09', NULL, 0),
(6, 'Corso di A.I. & Data Analysis', 34, 4, 5, '2022-02-05', '2024-02-05', 0),
(7, 'Corso di Digital Media Design', 35, 3, 5, '2024-06-17', NULL, 0),
(8, 'Corso di A.I. & Data Analysis', 36, 1, 4, '2021-10-28', '2023-10-28', 0),
(9, 'Corso di Industry 4.0 & Smart Manufacturing', 37, 6, 1, '2024-01-26', NULL, 0),
(10, 'Corso di Industry 4.0 & Smart Manufacturing', 38, 10, 4, '2024-08-25', NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `grade`
--

CREATE TABLE `grade` (
  `GradeID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `ModuleID` int(11) NOT NULL,
  `Grade` decimal(4,2) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `grade`
--

INSERT INTO `grade` (`GradeID`, `StudentID`, `ModuleID`, `Grade`, `isDeleted`) VALUES
(1, 2, 43, 7.00, 0),
(2, 2, 45, 8.00, 0),
(3, 2, 46, 6.00, 0),
(4, 2, 47, 4.00, 0),
(5, 2, 51, 7.00, 0),
(6, 3, 35, 9.00, 0),
(7, 3, 36, 8.00, 0),
(8, 4, 1, 7.00, 0),
(9, 4, 2, 9.00, 0),
(10, 4, 3, 9.00, 0),
(11, 4, 4, 5.00, 0),
(12, 4, 5, 9.00, 0),
(13, 4, 6, 10.00, 0),
(14, 4, 7, 7.00, 0),
(15, 4, 8, 10.00, 0),
(16, 4, 9, 6.00, 0),
(17, 4, 10, 10.00, 0),
(18, 4, 11, 5.00, 0),
(19, 4, 12, 10.00, 0),
(20, 4, 13, 4.00, 0),
(21, 5, 14, 10.00, 0),
(22, 5, 15, 10.00, 0),
(23, 5, 16, 8.00, 0),
(24, 5, 17, 4.00, 0),
(25, 5, 18, 6.00, 0),
(26, 5, 19, 6.00, 0),
(27, 5, 20, 10.00, 0),
(28, 5, 21, 9.00, 0),
(29, 5, 22, 7.00, 0),
(30, 5, 23, 10.00, 0),
(31, 5, 24, 9.00, 0),
(32, 5, 25, 8.00, 0),
(33, 5, 26, 6.00, 0),
(34, 6, 80, 5.00, 0),
(35, 6, 85, 9.00, 0),
(36, 6, 87, 4.00, 0),
(37, 7, 55, 9.00, 0),
(38, 7, 56, 4.00, 0),
(39, 7, 57, 7.00, 0),
(40, 7, 58, 9.00, 0),
(41, 7, 59, 9.00, 0),
(42, 7, 60, 6.00, 0),
(43, 7, 61, 8.00, 0),
(44, 7, 62, 6.00, 0),
(45, 8, 27, 5.00, 0),
(46, 8, 28, 8.00, 0),
(47, 8, 29, 5.00, 0),
(48, 8, 30, 5.00, 0),
(49, 8, 31, 6.00, 0),
(50, 8, 32, 6.00, 0),
(51, 8, 33, 4.00, 0),
(52, 9, 85, 7.00, 0),
(53, 9, 86, 5.00, 0),
(54, 10, 36, 10.00, 0),
(55, 10, 37, 6.00, 0),
(56, 11, 42, 10.00, 0),
(57, 11, 47, 9.00, 0),
(58, 11, 49, 10.00, 0),
(59, 11, 54, 5.00, 0),
(60, 12, 42, 6.00, 0),
(61, 12, 48, 7.00, 0),
(62, 12, 53, 7.00, 0),
(63, 13, 44, 7.00, 0),
(64, 13, 45, 5.00, 0),
(65, 13, 47, 6.00, 0),
(66, 13, 52, 10.00, 0),
(67, 13, 53, 6.00, 0),
(68, 14, 80, 5.00, 0),
(69, 14, 83, 4.00, 0),
(70, 14, 85, 8.00, 0),
(71, 14, 87, 4.00, 0),
(72, 15, 55, 8.00, 0),
(73, 15, 56, 4.00, 0),
(74, 15, 57, 8.00, 0),
(75, 15, 58, 10.00, 0),
(76, 15, 59, 5.00, 0),
(77, 15, 60, 4.00, 0),
(78, 15, 61, 6.00, 0),
(79, 15, 62, 10.00, 0),
(80, 16, 27, 4.00, 0),
(81, 16, 28, 7.00, 0),
(82, 16, 29, 4.00, 0),
(83, 16, 30, 5.00, 0),
(84, 16, 31, 4.00, 0),
(85, 16, 32, 7.00, 0),
(86, 16, 33, 9.00, 0),
(87, 17, 72, 5.00, 0),
(88, 17, 73, 9.00, 0),
(89, 17, 74, 6.00, 0),
(90, 17, 75, 9.00, 0),
(91, 17, 76, 10.00, 0),
(92, 17, 77, 10.00, 0),
(93, 17, 78, 5.00, 0),
(94, 17, 79, 9.00, 0),
(95, 18, 90, 7.00, 0),
(96, 18, 95, 6.00, 0),
(97, 18, 97, 6.00, 0),
(98, 18, 99, 9.00, 0),
(99, 19, 14, 9.00, 0),
(100, 19, 15, 4.00, 0),
(101, 19, 16, 9.00, 0),
(102, 19, 17, 6.00, 0),
(103, 19, 18, 9.00, 0),
(104, 19, 19, 8.00, 0),
(105, 19, 20, 9.00, 0),
(106, 19, 21, 10.00, 0),
(107, 19, 22, 4.00, 0),
(108, 19, 23, 6.00, 0),
(109, 19, 24, 5.00, 0),
(110, 19, 25, 4.00, 0),
(111, 19, 26, 5.00, 0),
(112, 20, 14, 4.00, 0),
(113, 20, 15, 5.00, 0),
(114, 20, 16, 10.00, 0),
(115, 20, 17, 7.00, 0),
(116, 20, 18, 10.00, 0),
(117, 20, 19, 4.00, 0),
(118, 20, 20, 4.00, 0),
(119, 20, 21, 9.00, 0),
(120, 20, 22, 4.00, 0),
(121, 20, 23, 10.00, 0),
(122, 20, 24, 8.00, 0),
(123, 20, 25, 7.00, 0),
(124, 20, 26, 8.00, 0),
(125, 21, 94, 7.00, 0),
(126, 21, 99, 4.00, 0),
(127, 22, 82, 6.00, 0),
(128, 22, 85, 4.00, 0),
(129, 22, 89, 8.00, 0),
(130, 23, 90, 8.00, 0),
(131, 23, 92, 9.00, 0),
(132, 23, 98, 4.00, 0),
(133, 25, 27, 9.00, 0),
(134, 25, 28, 6.00, 0),
(135, 25, 29, 10.00, 0),
(136, 25, 30, 6.00, 0),
(137, 25, 31, 8.00, 0),
(138, 25, 32, 4.00, 0),
(139, 25, 33, 7.00, 0),
(140, 26, 27, 6.00, 0),
(141, 26, 28, 7.00, 0),
(142, 26, 29, 7.00, 0),
(143, 26, 30, 6.00, 0),
(144, 26, 31, 9.00, 0),
(145, 26, 32, 7.00, 0),
(146, 26, 33, 10.00, 0),
(147, 27, 44, 8.00, 0),
(148, 28, 64, 10.00, 0),
(149, 29, 36, 8.00, 0),
(150, 29, 38, 10.00, 0),
(151, 29, 41, 8.00, 0),
(152, 30, 91, 7.00, 0),
(153, 30, 94, 10.00, 0),
(154, 30, 98, 4.00, 0),
(155, 30, 99, 8.00, 0),
(156, 31, 1, 4.00, 0),
(157, 31, 2, 7.00, 0),
(158, 31, 3, 8.00, 0),
(159, 31, 4, 8.00, 0),
(160, 31, 5, 10.00, 0),
(161, 31, 6, 8.00, 0),
(162, 31, 7, 8.00, 0),
(163, 31, 8, 7.00, 0),
(164, 31, 9, 4.00, 0),
(165, 31, 10, 6.00, 0),
(166, 31, 11, 10.00, 0),
(167, 31, 12, 7.00, 0),
(168, 31, 13, 4.00, 0),
(169, 32, 72, 5.00, 0),
(170, 32, 73, 6.00, 0),
(171, 32, 74, 9.00, 0),
(172, 32, 75, 9.00, 0),
(173, 32, 76, 9.00, 0),
(174, 32, 77, 4.00, 0),
(175, 32, 78, 8.00, 0),
(176, 32, 79, 4.00, 0),
(177, 33, 66, 8.00, 0),
(178, 33, 67, 8.00, 0),
(179, 33, 70, 5.00, 0),
(180, 34, 55, 8.00, 0),
(181, 34, 56, 10.00, 0),
(182, 34, 57, 5.00, 0),
(183, 34, 58, 6.00, 0),
(184, 34, 59, 9.00, 0),
(185, 34, 60, 4.00, 0),
(186, 34, 61, 7.00, 0),
(187, 34, 62, 9.00, 0),
(188, 35, 64, 6.00, 0),
(189, 36, 80, 9.00, 0),
(190, 36, 82, 7.00, 0),
(191, 36, 85, 5.00, 0),
(192, 37, 27, 7.00, 0),
(193, 37, 28, 6.00, 0),
(194, 37, 29, 8.00, 0),
(195, 37, 30, 6.00, 0),
(196, 37, 31, 9.00, 0),
(197, 37, 32, 7.00, 0),
(198, 37, 33, 9.00, 0),
(199, 38, 80, 6.00, 0),
(200, 38, 81, 6.00, 0),
(201, 38, 82, 5.00, 0),
(202, 38, 83, 7.00, 0),
(203, 38, 89, 5.00, 0),
(204, 39, 1, 10.00, 0),
(205, 39, 2, 4.00, 0),
(206, 39, 3, 7.00, 0),
(207, 39, 4, 9.00, 0),
(208, 39, 5, 9.00, 0),
(209, 39, 6, 5.00, 0),
(210, 39, 7, 10.00, 0),
(211, 39, 8, 4.00, 0),
(212, 39, 9, 4.00, 0),
(213, 39, 10, 7.00, 0),
(214, 39, 11, 8.00, 0),
(215, 39, 12, 4.00, 0),
(216, 39, 13, 8.00, 0),
(217, 40, 80, 5.00, 0),
(218, 40, 83, 9.00, 0),
(219, 40, 86, 5.00, 0),
(220, 41, 14, 10.00, 0),
(221, 41, 15, 7.00, 0),
(222, 41, 16, 4.00, 0),
(223, 41, 17, 9.00, 0),
(224, 41, 18, 7.00, 0),
(225, 41, 19, 6.00, 0),
(226, 41, 20, 9.00, 0),
(227, 41, 21, 8.00, 0),
(228, 41, 22, 7.00, 0),
(229, 41, 23, 7.00, 0),
(230, 41, 24, 4.00, 0),
(231, 41, 25, 8.00, 0),
(232, 41, 26, 10.00, 0),
(233, 42, 43, 5.00, 0),
(234, 42, 47, 10.00, 0),
(235, 42, 50, 10.00, 0),
(236, 42, 54, 4.00, 0),
(237, 43, 14, 6.00, 0),
(238, 43, 15, 10.00, 0),
(239, 43, 16, 10.00, 0),
(240, 43, 17, 4.00, 0),
(241, 43, 18, 5.00, 0),
(242, 43, 19, 8.00, 0),
(243, 43, 20, 6.00, 0),
(244, 43, 21, 6.00, 0),
(245, 43, 22, 9.00, 0),
(246, 43, 23, 5.00, 0),
(247, 43, 24, 7.00, 0),
(248, 43, 25, 5.00, 0),
(249, 43, 26, 5.00, 0),
(250, 44, 46, 6.00, 0),
(251, 44, 48, 6.00, 0),
(252, 44, 49, 5.00, 0),
(253, 44, 50, 6.00, 0),
(254, 44, 53, 9.00, 0),
(255, 45, 14, 4.00, 0),
(256, 45, 15, 8.00, 0),
(257, 45, 16, 6.00, 0),
(258, 45, 17, 8.00, 0),
(259, 45, 18, 9.00, 0),
(260, 45, 19, 5.00, 0),
(261, 45, 20, 9.00, 0),
(262, 45, 21, 10.00, 0),
(263, 45, 22, 10.00, 0),
(264, 45, 23, 5.00, 0),
(265, 45, 24, 6.00, 0),
(266, 45, 25, 8.00, 0),
(267, 45, 26, 7.00, 0),
(268, 46, 27, 7.00, 0),
(269, 46, 28, 6.00, 0),
(270, 46, 29, 4.00, 0),
(271, 46, 30, 5.00, 0),
(272, 46, 31, 5.00, 0),
(273, 46, 32, 9.00, 0),
(274, 46, 33, 6.00, 0),
(275, 48, 14, 4.00, 0),
(276, 48, 15, 9.00, 0),
(277, 48, 16, 5.00, 0),
(278, 48, 17, 6.00, 0),
(279, 48, 18, 9.00, 0),
(280, 48, 19, 9.00, 0),
(281, 48, 20, 10.00, 0),
(282, 48, 21, 6.00, 0),
(283, 48, 22, 6.00, 0),
(284, 48, 23, 8.00, 0),
(285, 48, 24, 9.00, 0),
(286, 48, 25, 8.00, 0),
(287, 48, 26, 7.00, 0),
(288, 49, 72, 4.00, 0),
(289, 49, 73, 4.00, 0),
(290, 49, 74, 6.00, 0),
(291, 49, 75, 6.00, 0),
(292, 49, 76, 5.00, 0),
(293, 49, 77, 4.00, 0),
(294, 49, 78, 6.00, 0),
(295, 49, 79, 10.00, 0),
(296, 52, 63, 9.00, 0),
(297, 52, 64, 8.00, 0),
(298, 52, 65, 8.00, 0),
(299, 52, 71, 5.00, 0),
(300, 54, 27, 7.00, 0),
(301, 54, 28, 9.00, 0),
(302, 54, 29, 5.00, 0),
(303, 54, 30, 5.00, 0),
(304, 54, 31, 4.00, 0),
(305, 54, 32, 8.00, 0),
(306, 54, 33, 5.00, 0),
(307, 55, 55, 9.00, 0),
(308, 55, 56, 10.00, 0),
(309, 55, 57, 5.00, 0),
(310, 55, 58, 7.00, 0),
(311, 55, 59, 10.00, 0),
(312, 55, 60, 10.00, 0),
(313, 55, 61, 10.00, 0),
(314, 55, 62, 10.00, 0),
(315, 56, 72, 6.00, 0),
(316, 56, 73, 6.00, 0),
(317, 56, 74, 6.00, 0),
(318, 56, 75, 5.00, 0),
(319, 56, 76, 5.00, 0),
(320, 56, 77, 10.00, 0),
(321, 56, 78, 10.00, 0),
(322, 56, 79, 7.00, 0),
(323, 57, 27, 10.00, 0),
(324, 57, 28, 7.00, 0),
(325, 57, 29, 7.00, 0),
(326, 57, 30, 4.00, 0),
(327, 57, 31, 8.00, 0),
(328, 57, 32, 5.00, 0),
(329, 57, 33, 6.00, 0),
(330, 58, 95, 10.00, 0),
(331, 58, 96, 8.00, 0),
(332, 58, 98, 7.00, 0),
(333, 58, 99, 8.00, 0),
(334, 59, 72, 4.00, 0),
(335, 59, 73, 4.00, 0),
(336, 59, 74, 7.00, 0),
(337, 59, 75, 10.00, 0),
(338, 59, 76, 4.00, 0),
(339, 59, 77, 9.00, 0),
(340, 59, 78, 9.00, 0),
(341, 59, 79, 9.00, 0),
(342, 60, 40, 10.00, 0),
(343, 61, 14, 10.00, 0),
(344, 61, 15, 8.00, 0),
(345, 61, 16, 5.00, 0),
(346, 61, 17, 4.00, 0),
(347, 61, 18, 8.00, 0),
(348, 61, 19, 6.00, 0),
(349, 61, 20, 10.00, 0),
(350, 61, 21, 5.00, 0),
(351, 61, 22, 4.00, 0),
(352, 61, 23, 10.00, 0),
(353, 61, 24, 4.00, 0),
(354, 61, 25, 9.00, 0),
(355, 61, 26, 6.00, 0),
(356, 62, 65, 8.00, 0),
(357, 62, 66, 7.00, 0),
(358, 63, 92, 8.00, 0),
(359, 64, 81, 10.00, 0),
(360, 64, 82, 9.00, 0),
(361, 64, 83, 6.00, 0),
(362, 64, 85, 7.00, 0),
(363, 64, 87, 8.00, 0),
(364, 65, 63, 7.00, 0),
(365, 65, 66, 5.00, 0),
(366, 65, 67, 10.00, 0),
(367, 66, 14, 7.00, 0),
(368, 66, 15, 7.00, 0),
(369, 66, 16, 10.00, 0),
(370, 66, 17, 9.00, 0),
(371, 66, 18, 9.00, 0),
(372, 66, 19, 9.00, 0),
(373, 66, 20, 10.00, 0),
(374, 66, 21, 5.00, 0),
(375, 66, 22, 8.00, 0),
(376, 66, 23, 9.00, 0),
(377, 66, 24, 7.00, 0),
(378, 66, 25, 4.00, 0),
(379, 66, 26, 8.00, 0),
(380, 67, 47, 5.00, 0),
(381, 67, 54, 5.00, 0),
(382, 68, 42, 10.00, 0),
(383, 68, 46, 9.00, 0),
(384, 68, 51, 9.00, 0),
(385, 68, 54, 10.00, 0),
(386, 69, 34, 8.00, 0),
(387, 69, 36, 9.00, 0),
(388, 69, 37, 9.00, 0),
(389, 70, 70, 8.00, 0),
(390, 71, 83, 8.00, 0),
(391, 71, 86, 8.00, 0),
(392, 72, 1, 4.00, 0),
(393, 72, 2, 9.00, 0),
(394, 72, 3, 7.00, 0),
(395, 72, 4, 7.00, 0),
(396, 72, 5, 7.00, 0),
(397, 72, 6, 9.00, 0),
(398, 72, 7, 5.00, 0),
(399, 72, 8, 8.00, 0),
(400, 72, 9, 8.00, 0),
(401, 72, 10, 5.00, 0),
(402, 72, 11, 9.00, 0),
(403, 72, 12, 8.00, 0),
(404, 72, 13, 8.00, 0),
(405, 73, 35, 10.00, 0),
(406, 73, 37, 5.00, 0),
(407, 73, 41, 6.00, 0),
(408, 74, 82, 5.00, 0),
(409, 74, 86, 10.00, 0),
(410, 75, 72, 9.00, 0),
(411, 75, 73, 10.00, 0),
(412, 75, 74, 4.00, 0),
(413, 75, 75, 4.00, 0),
(414, 75, 76, 10.00, 0),
(415, 75, 77, 7.00, 0),
(416, 75, 78, 9.00, 0),
(417, 75, 79, 8.00, 0),
(418, 76, 91, 8.00, 0),
(419, 76, 93, 10.00, 0),
(420, 76, 99, 10.00, 0),
(421, 77, 1, 9.00, 0),
(422, 77, 2, 7.00, 0),
(423, 77, 3, 8.00, 0),
(424, 77, 4, 8.00, 0),
(425, 77, 5, 5.00, 0),
(426, 77, 6, 6.00, 0),
(427, 77, 7, 4.00, 0),
(428, 77, 8, 9.00, 0),
(429, 77, 9, 5.00, 0),
(430, 77, 10, 9.00, 0),
(431, 77, 11, 9.00, 0),
(432, 77, 12, 8.00, 0),
(433, 77, 13, 8.00, 0),
(434, 78, 1, 5.00, 0),
(435, 78, 2, 10.00, 0),
(436, 78, 3, 7.00, 0),
(437, 78, 4, 6.00, 0),
(438, 78, 5, 10.00, 0),
(439, 78, 6, 9.00, 0),
(440, 78, 7, 7.00, 0),
(441, 78, 8, 7.00, 0),
(442, 78, 9, 6.00, 0),
(443, 78, 10, 7.00, 0),
(444, 78, 11, 4.00, 0),
(445, 78, 12, 9.00, 0),
(446, 78, 13, 10.00, 0),
(447, 79, 97, 10.00, 0),
(448, 79, 98, 10.00, 0),
(449, 80, 35, 10.00, 0),
(450, 81, 45, 10.00, 0),
(451, 81, 46, 4.00, 0),
(452, 81, 49, 6.00, 0),
(453, 81, 50, 4.00, 0),
(454, 81, 51, 4.00, 0),
(455, 82, 35, 7.00, 0),
(456, 83, 27, 9.00, 0),
(457, 83, 28, 6.00, 0),
(458, 83, 29, 8.00, 0),
(459, 83, 30, 4.00, 0),
(460, 83, 31, 7.00, 0),
(461, 83, 32, 9.00, 0),
(462, 83, 33, 4.00, 0),
(463, 84, 42, 10.00, 0),
(464, 84, 49, 10.00, 0),
(465, 85, 27, 10.00, 0),
(466, 85, 28, 10.00, 0),
(467, 85, 29, 6.00, 0),
(468, 85, 30, 10.00, 0),
(469, 85, 31, 7.00, 0),
(470, 85, 32, 8.00, 0),
(471, 85, 33, 6.00, 0),
(472, 86, 82, 6.00, 0),
(473, 86, 87, 9.00, 0),
(474, 87, 38, 4.00, 0),
(475, 88, 44, 9.00, 0),
(476, 88, 52, 6.00, 0),
(477, 89, 42, 4.00, 0),
(478, 89, 49, 5.00, 0),
(479, 89, 52, 6.00, 0),
(480, 90, 91, 8.00, 0),
(481, 90, 92, 8.00, 0),
(482, 90, 95, 4.00, 0),
(483, 90, 98, 9.00, 0),
(484, 90, 99, 5.00, 0),
(485, 91, 42, 10.00, 0),
(486, 91, 43, 8.00, 0),
(487, 91, 44, 8.00, 0),
(488, 91, 47, 8.00, 0),
(489, 91, 51, 10.00, 0),
(490, 91, 53, 5.00, 0),
(491, 91, 54, 5.00, 0),
(492, 92, 72, 6.00, 0),
(493, 92, 73, 9.00, 0),
(494, 92, 74, 9.00, 0),
(495, 92, 75, 5.00, 0),
(496, 92, 76, 7.00, 0),
(497, 92, 77, 10.00, 0),
(498, 92, 78, 7.00, 0),
(499, 92, 79, 4.00, 0),
(500, 93, 27, 9.00, 0),
(501, 93, 28, 4.00, 0),
(502, 93, 29, 6.00, 0),
(503, 93, 30, 10.00, 0),
(504, 93, 31, 10.00, 0),
(505, 93, 32, 4.00, 0),
(506, 93, 33, 6.00, 0),
(507, 94, 81, 6.00, 0),
(508, 95, 55, 5.00, 0),
(509, 95, 56, 4.00, 0),
(510, 95, 57, 9.00, 0),
(511, 95, 58, 9.00, 0),
(512, 95, 59, 9.00, 0),
(513, 95, 60, 5.00, 0),
(514, 95, 61, 10.00, 0),
(515, 95, 62, 10.00, 0),
(516, 96, 72, 10.00, 0),
(517, 96, 73, 8.00, 0),
(518, 96, 74, 9.00, 0),
(519, 96, 75, 8.00, 0),
(520, 96, 76, 9.00, 0),
(521, 96, 77, 6.00, 0),
(522, 96, 78, 6.00, 0),
(523, 96, 79, 6.00, 0),
(524, 97, 63, 7.00, 0),
(525, 97, 64, 8.00, 0),
(526, 97, 66, 5.00, 0),
(527, 97, 70, 5.00, 0),
(528, 98, 14, 8.00, 0),
(529, 98, 15, 5.00, 0),
(530, 98, 16, 9.00, 0),
(531, 98, 17, 6.00, 0),
(532, 98, 18, 9.00, 0),
(533, 98, 19, 9.00, 0),
(534, 98, 20, 6.00, 0),
(535, 98, 21, 4.00, 0),
(536, 98, 22, 9.00, 0),
(537, 98, 23, 9.00, 0),
(538, 98, 24, 9.00, 0),
(539, 98, 25, 6.00, 0),
(540, 98, 26, 7.00, 0),
(541, 99, 38, 10.00, 0),
(542, 100, 93, 9.00, 0);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `infostudente`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `infostudente` (
`Studente` varchar(41)
,`Materia` varchar(60)
,`Voto` varchar(8)
,`Professore` varchar(41)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `materiacorsospecifici`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `materiacorsospecifici` (
`Studente` varchar(41)
,`Voto` varchar(8)
,`Corso` varchar(98)
,`Professore` varchar(41)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `mediamateriacorsi`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `mediamateriacorsi` (
`Corso` varchar(98)
,`Materia` varchar(60)
,`MediaVoti` varchar(7)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `mediavotituttistudenti`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `mediavotituttistudenti` (
`StudentID` int(11)
,`Studente` varchar(41)
,`MediaVoti` varchar(7)
,`Corso` varchar(98)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `module`
--

CREATE TABLE `module` (
  `ModuleID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `TeacherID` int(11) DEFAULT NULL,
  `SubjectID` int(11) NOT NULL,
  `ModuleHours` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `module`
--

INSERT INTO `module` (`ModuleID`, `CourseID`, `TeacherID`, `SubjectID`, `ModuleHours`, `isDeleted`) VALUES
(1, 1, 19, 1, 30, 0),
(2, 1, 16, 2, 20, 0),
(3, 1, 13, 3, 40, 0),
(4, 1, 17, 4, 50, 0),
(5, 1, 1, 5, 40, 0),
(6, 1, 20, 6, 80, 0),
(7, 1, 13, 7, 40, 0),
(8, 1, 1, 8, 30, 0),
(9, 1, 7, 9, 80, 0),
(10, 1, 11, 10, 80, 0),
(11, 1, 19, 11, 80, 0),
(12, 1, 5, 12, 40, 0),
(13, 1, 14, 13, 30, 0),
(14, 2, 9, 1, 70, 0),
(15, 2, 4, 2, 80, 0),
(16, 2, 13, 3, 60, 0),
(17, 2, 12, 4, 80, 0),
(18, 2, 18, 5, 50, 0),
(19, 2, 18, 6, 30, 0),
(20, 2, 3, 7, 70, 0),
(21, 2, 2, 8, 20, 0),
(22, 2, 5, 9, 30, 0),
(23, 2, 6, 10, 60, 0),
(24, 2, 7, 11, 40, 0),
(25, 2, 11, 12, 60, 0),
(26, 2, 17, 13, 80, 0),
(27, 3, 9, 50, 40, 0),
(28, 3, 11, 51, 40, 0),
(29, 3, 4, 52, 40, 0),
(30, 3, 8, 53, 80, 0),
(31, 3, 20, 54, 80, 0),
(32, 3, 16, 55, 30, 0),
(33, 3, 19, 56, 60, 0),
(34, 4, 4, 42, 40, 0),
(35, 4, 2, 43, 50, 0),
(36, 4, 3, 44, 50, 0),
(37, 4, 5, 45, 80, 0),
(38, 4, 5, 46, 40, 0),
(39, 4, 4, 47, 60, 0),
(40, 4, 19, 48, 80, 0),
(41, 4, 13, 49, 20, 0),
(42, 5, 19, 1, 60, 0),
(43, 5, 8, 2, 60, 0),
(44, 5, 3, 3, 40, 0),
(45, 5, 12, 4, 40, 0),
(46, 5, 19, 5, 60, 0),
(47, 5, 4, 6, 50, 0),
(48, 5, 9, 7, 20, 0),
(49, 5, 2, 8, 80, 0),
(50, 5, 10, 9, 20, 0),
(51, 5, 20, 10, 70, 0),
(52, 5, 1, 11, 20, 0),
(53, 5, 14, 12, 20, 0),
(54, 5, 2, 13, 30, 0),
(55, 6, 8, 42, 80, 0),
(56, 6, 19, 43, 50, 0),
(57, 6, 6, 44, 20, 0),
(58, 6, 15, 45, 30, 0),
(59, 6, 8, 46, 30, 0),
(60, 6, 4, 47, 50, 0),
(61, 6, 13, 48, 80, 0),
(62, 6, 18, 49, 80, 0),
(63, 7, 10, 33, 60, 0),
(64, 7, 9, 34, 70, 0),
(65, 7, 16, 35, 40, 0),
(66, 7, 4, 36, 30, 0),
(67, 7, 21, 37, 40, 0),
(68, 7, 2, 38, 20, 0),
(69, 7, 1, 39, 80, 0),
(70, 7, 10, 40, 70, 0),
(71, 7, 20, 41, 40, 0),
(72, 8, 15, 42, 50, 0),
(73, 8, 11, 43, 50, 0),
(74, 8, 3, 44, 20, 0),
(75, 8, 11, 45, 60, 0),
(76, 8, 15, 46, 20, 0),
(77, 8, 9, 47, 30, 0),
(78, 8, 20, 48, 80, 0),
(79, 8, 18, 49, 80, 0),
(80, 9, 16, 14, 70, 0),
(81, 9, 12, 15, 40, 0),
(82, 9, 6, 16, 60, 0),
(83, 9, 7, 17, 40, 0),
(84, 9, 7, 18, 30, 0),
(85, 9, 12, 19, 20, 0),
(86, 9, 9, 20, 20, 0),
(87, 9, 15, 21, 20, 0),
(88, 9, 21, 22, 60, 0),
(89, 9, 21, 23, 40, 0),
(90, 10, 8, 14, 50, 0),
(91, 10, 10, 15, 20, 0),
(92, 10, 11, 16, 30, 0),
(93, 10, 11, 17, 80, 0),
(94, 10, 19, 18, 40, 0),
(95, 10, 8, 19, 40, 0),
(96, 10, 4, 20, 60, 0),
(97, 10, 20, 21, 60, 0),
(98, 10, 20, 22, 20, 0),
(99, 10, 8, 23, 30, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `province`
--

CREATE TABLE `province` (
  `ProvinceID` int(11) NOT NULL,
  `ProvinceName` varchar(25) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `province`
--

INSERT INTO `province` (`ProvinceID`, `ProvinceName`, `isDeleted`) VALUES
(1, 'Agrigento', 0),
(2, 'Caltanissetta', 0),
(3, 'Catania', 0),
(4, 'Enna', 0),
(5, 'Messina', 0),
(6, 'Palermo', 0),
(7, 'Ragusa', 0),
(8, 'Siracusa', 0),
(9, 'Trapani', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `site`
--

CREATE TABLE `site` (
  `SiteID` int(11) NOT NULL,
  `CityID` int(11) NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `SiteAddress` varchar(60) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `site`
--

INSERT INTO `site` (`SiteID`, `CityID`, `SiteName`, `SiteAddress`, `isDeleted`) VALUES
(1, 9, 'Sede di San Cataldo', 'Contrada Danilo, 77', 0),
(2, 37, 'Sede di Augusta', 'Piazza Pellico, 59', 0),
(3, 5, 'Sede di Sciacca', 'Rotonda Amadeo, 40', 0),
(4, 17, 'Sede di Piazza Armerina', 'Stretto Gianfrancesco, 47 Appartamento 17', 0),
(5, 8, 'Sede di Niscemi', 'Via Elisa, 991 Appartamento 84', 0),
(6, 32, 'Sede di Modica', 'Viale Gioachino, 96 Piano 1', 0),
(7, 29, 'Sede di Termini Imerese', 'Via Umberto, 115 Piano 9', 0),
(8, 31, 'Sede di Ragusa', 'Via Tiziano, 0 Piano 8', 0),
(9, 42, 'Sede di Marsala', 'Viale Jacuzzi, 6 Piano 0', 0),
(10, 25, 'Sede di Taormina', 'Vicolo Vismara, 878 Piano 0', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `UserInfoID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `student`
--

INSERT INTO `student` (`StudentID`, `UserInfoID`, `CourseID`, `isDeleted`) VALUES
(1, 6, 10, 0),
(2, 69, 5, 0),
(3, 113, 4, 0),
(4, 21, 1, 0),
(5, 75, 2, 0),
(6, 158, 9, 0),
(7, 197, 6, 0),
(8, 22, 3, 0),
(9, 200, 9, 0),
(10, 186, 4, 0),
(11, 3, 5, 0),
(12, 82, 5, 0),
(13, 100, 5, 0),
(14, 142, 9, 0),
(15, 134, 6, 0),
(16, 43, 3, 0),
(17, 28, 8, 0),
(18, 144, 10, 0),
(19, 92, 2, 0),
(20, 193, 2, 0),
(21, 146, 10, 0),
(22, 48, 9, 0),
(23, 49, 10, 0),
(24, 42, 7, 0),
(25, 40, 3, 0),
(26, 90, 3, 0),
(27, 87, 5, 0),
(28, 30, 7, 0),
(29, 147, 4, 0),
(30, 84, 10, 0),
(31, 36, 1, 0),
(32, 59, 8, 0),
(33, 171, 7, 0),
(34, 156, 6, 0),
(35, 10, 7, 0),
(36, 89, 9, 0),
(37, 161, 3, 0),
(38, 175, 9, 0),
(39, 85, 1, 0),
(40, 122, 9, 0),
(41, 44, 2, 0),
(42, 14, 5, 0),
(43, 70, 2, 0),
(44, 71, 5, 0),
(45, 19, 2, 0),
(46, 126, 3, 0),
(47, 153, 10, 0),
(48, 149, 2, 0),
(49, 124, 8, 0),
(50, 120, 4, 0),
(51, 196, 7, 0),
(52, 65, 7, 0),
(53, 2, 7, 0),
(54, 54, 3, 0),
(55, 119, 6, 0),
(56, 47, 8, 0),
(57, 24, 3, 0),
(58, 37, 10, 0),
(59, 199, 8, 0),
(60, 4, 4, 0),
(61, 112, 2, 0),
(62, 91, 7, 0),
(63, 60, 10, 0),
(64, 81, 9, 0),
(65, 190, 7, 0),
(66, 9, 2, 0),
(67, 97, 5, 0),
(68, 155, 5, 0),
(69, 188, 4, 0),
(70, 20, 7, 0),
(71, 164, 9, 0),
(72, 165, 1, 0),
(73, 118, 4, 0),
(74, 131, 9, 0),
(75, 39, 8, 0),
(76, 137, 10, 0),
(77, 80, 1, 0),
(78, 56, 1, 0),
(79, 25, 10, 0),
(80, 168, 4, 0),
(81, 13, 5, 0),
(82, 32, 4, 0),
(83, 129, 3, 0),
(84, 1, 5, 0),
(85, 107, 3, 0),
(86, 74, 9, 0),
(87, 152, 4, 0),
(88, 182, 5, 0),
(89, 180, 5, 0),
(90, 63, 10, 0),
(91, 170, 5, 0),
(92, 31, 8, 0),
(93, 34, 3, 0),
(94, 98, 9, 0),
(95, 150, 6, 0),
(96, 68, 8, 0),
(97, 93, 7, 0),
(98, 159, 2, 0),
(99, 185, 4, 0),
(100, 79, 10, 0);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `studenticonpiudi30anni`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `studenticonpiudi30anni` (
`StudentID` int(11)
,`Studente` varchar(41)
,`Età` bigint(21)
,`MediaVoti` varchar(7)
,`Corso` varchar(98)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `subject`
--

CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL,
  `SubjectName` varchar(60) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `subject`
--

INSERT INTO `subject` (`SubjectID`, `SubjectName`, `isDeleted`) VALUES
(1, 'Fondamenti di informatica e programmazione', 0),
(2, 'Algoritmi e strutture dati', 0),
(3, 'HTML5, CSS3, JavaScript', 0),
(4, 'Framework front-end (React, Angular)', 0),
(5, 'Sviluppo back-end (Node.js, API REST, Database)', 0),
(6, 'Data Management e SQL', 0),
(7, 'Data analysis per sviluppatori', 0),
(8, 'Cloud computing', 0),
(9, 'Intelligenza artificiale applicata al web', 0),
(10, 'Machine Learning e Big Data', 0),
(11, 'DevOps e CI/CD', 0),
(12, 'Sicurezza applicativa e protezione dati', 0),
(13, 'UX/UI Design', 0),
(14, 'Automazione industriale e sistemi meccatronici', 0),
(15, 'Controllori PLC e robotica industriale', 0),
(16, 'Sensori e attuatori', 0),
(17, 'Internet of Things (IoT) per la produzione', 0),
(18, 'Sistemi cyber-fisici e smart factory', 0),
(19, 'Manutenzione predittiva', 0),
(20, 'Analisi dei dati di produzione', 0),
(21, 'Qualità e sicurezza sul lavoro', 0),
(22, 'Normative e certificazioni industriali', 0),
(23, 'Progettazione e integrazione macchine', 0),
(24, 'Architetture di rete e sistemi operativi', 0),
(25, 'Crittografia e protocolli sicuri', 0),
(26, 'Sicurezza delle infrastrutture IT', 0),
(27, 'Penetration testing e ethical hacking', 0),
(28, 'Sicurezza applicativa e vulnerabilità web', 0),
(29, 'Incident response e digital forensics', 0),
(30, 'Sicurezza by design nei servizi digitali', 0),
(31, 'Normative GDPR e privacy', 0),
(32, 'Cloud e sicurezza dei dati', 0),
(33, 'Design grafico e comunicazione visiva', 0),
(34, 'User Experience (UX) e User Interface (UI)', 0),
(35, 'Motion graphics e animazione 2D/3D', 0),
(36, 'Realtà virtuale (VR) e aumentata (AR)', 0),
(37, 'Produzione multimediale e video editing', 0),
(38, 'Prototipazione digitale', 0),
(39, 'Web design responsivo', 0),
(40, 'Storytelling e comunicazione visiva', 0),
(41, 'Strumenti di design (Adobe, Blender, ecc.)', 0),
(42, 'Statistica e probabilità per data science', 0),
(43, 'Big Data e data warehouse', 0),
(44, 'Machine Learning e Deep Learning', 0),
(45, 'Data visualization e dashboarding', 0),
(46, 'Analisi predittiva e modelli statistici', 0),
(47, 'Etica dei dati e data governance', 0),
(48, 'Business Intelligence e cloud analytics', 0),
(49, 'Python per analisi dati', 0),
(50, 'Fondamenti di meccanica e idraulica', 0),
(51, 'Componenti e funzionamento TBM', 0),
(52, 'Sistemi meccatronici per infrastrutture', 0),
(53, 'Controlli automatici e sensoristica', 0),
(54, 'Manutenzione e diagnostica predittiva', 0),
(55, 'Sicurezza cantieri e normativa tecnica', 0),
(56, 'Disegno tecnico e CAD', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `teacher`
--

CREATE TABLE `teacher` (
  `TeacherID` int(11) NOT NULL,
  `UserInfoID` int(11) NOT NULL,
  `HireDate` date DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `teacher`
--

INSERT INTO `teacher` (`TeacherID`, `UserInfoID`, `HireDate`, `isDeleted`) VALUES
(1, 57, '2024-01-07', 0),
(2, 162, '2022-03-27', 0),
(3, 178, '2024-06-19', 0),
(4, 133, '2022-09-16', 0),
(5, 116, '2023-12-05', 0),
(6, 58, '2024-02-10', 0),
(7, 135, '2021-08-24', 0),
(8, 167, '2024-10-22', 0),
(9, 8, '2024-03-20', 0),
(10, 102, '2023-08-04', 0),
(11, 173, '2022-10-05', 0),
(12, 148, '2021-04-11', 0),
(13, 83, '2021-06-20', 0),
(14, 169, '2023-01-25', 0),
(15, 110, '2021-04-19', 0),
(16, 16, '2025-09-05', 0),
(17, 189, '2022-08-16', 0),
(18, 77, '2024-06-28', 0),
(19, 33, '2022-08-20', 0),
(20, 55, '2025-06-21', 0),
(21, 201, '2022-06-22', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `tutor`
--

CREATE TABLE `tutor` (
  `TutorID` int(11) NOT NULL,
  `UserInfoID` int(11) NOT NULL,
  `HireDate` date DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tutor`
--

INSERT INTO `tutor` (`TutorID`, `UserInfoID`, `HireDate`, `isDeleted`) VALUES
(1, 181, '2025-08-20', 0),
(2, 130, '2024-12-04', 0),
(3, 174, '2023-11-19', 0),
(4, 110, '2022-11-22', 0),
(5, 140, '2022-09-03', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `userinfo`
--

CREATE TABLE `userinfo` (
  `UserInfoID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `UserAddress` varchar(60) DEFAULT NULL,
  `CityID` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `userinfo`
--

INSERT INTO `userinfo` (`UserInfoID`, `FirstName`, `LastName`, `Email`, `PasswordHash`, `PhoneNumber`, `BirthDate`, `UserAddress`, `CityID`, `isDeleted`) VALUES
(1, 'Alberto', 'Lollobrigida', 'grazianocapecchi@example.net', 'b26db56982631f475a70fc886c97f99a841cbb30efb8d303847aa799f3211f57', '+39 0578412244', '1990-10-02', 'Viale Carnera, 644 Piano 1', 14, 0),
(2, 'Paolo', 'Micheletti', 'vbiagiotti@example.com', 'fe97387f0a2c571864e70193e831defac2ccb892f2e169d1d318b74afbc3aa92', '+39 3779304114', '1988-02-18', 'Piazza Annamaria, 39 Appartamento 6', 7, 0),
(3, 'Paola', 'Zanzi', 'martinoriccardi@example.org', '90356f4b6793769e86377e6f5cab0e193da59999a2208fc7812a913f8cb2f397', '337168587', '1962-07-24', 'Via Fabio, 964', 32, 0),
(4, 'Bianca', 'Papetti', 'vidonigianfranco@example.net', 'a4fefd8392176369266db5b6a7f42ae360b9ce6f8bed57641fb4c1ba35bc13b5', '+39 3716454984', '1967-02-21', 'Piazza Angiolello, 6', 2, 0),
(5, 'Ciro', 'Foletti', 'annibale00@example.com', '169a86263996c2690db7ea1ab5bd5ea79d8e1b535ce137d0671ab8775dbfcf32', '07826561191', '1976-10-29', 'Canale Nordio, 42', 25, 0),
(6, 'Ciro', 'Vercelloni', 'gottigiancarlo@example.org', '7b4d90d05e5c28d61111b7870ee73caa0172a430a3a740b4b765f57eda8c96d8', '+39 073314811', '1979-08-08', 'Viale Cossiga, 28 Appartamento 2', 28, 0),
(7, 'Raffaele', 'Valmarana', 'antoniogramsci@example.com', 'ad43755938efbcc7696797a01e12c0f66117b1b188429e827e608b21516ed382', '+39 33976848705', '1971-06-26', 'Piazza Prati, 30 Appartamento 74', 39, 0),
(8, 'Annalisa', 'Leone', 'antoniobongiorno@example.net', 'e5311cb7c76a47d8f8070d74d77f9fe9bf151d157c1a99c340cb5d80dbefa0c7', '03758344429', '1965-08-05', 'Via Crespi, 6', 1, 0),
(9, 'Serafina', 'Giusti', 'zrinaldi@example.org', '23068674ed0735811d1769cb26e99103a7da93a22df55183f03c573197e638f5', '07742973191', '2004-10-04', 'Borgo Pareto, 13 Appartamento 4', 45, 0),
(10, 'Gastone', 'Loredan', 'armanidanilo@example.net', '4214fe22e4f065d2d1506928f80e2907109f2561da8bf087e3d26d5818c7bbec', '+39 09214218568', '1981-11-02', 'Viale Letizia, 965', 29, 0),
(11, 'Lucrezia', 'Marino', 'robertoturchi@example.org', '604f28e99d65af581e963b5ad0caf39881c1840d7256511dcfe402ed6c29bde1', '0884069669', '1993-05-04', 'Canale Argan, 52', 18, 0),
(12, 'Baldassare', 'Rubbia', 'dallaratonino@example.net', '2718d73bb143a3acbe71db48ea1ea0faf5f135a947da69936bd572d44f9200b0', '+39 361164943', '1982-07-15', 'Strada Ilaria, 7 Piano 8', 15, 0),
(13, 'Raffaele', 'Grassi', 'franco12@example.net', '62aba00442679a5676166a942b9312e8ab15a252ddb8bbca36bedb9a3737ad6f', '094229478', '1969-03-17', 'Contrada Piccio, 21 Appartamento 63', 38, 0),
(14, 'Cesare', 'Gargallo', 'fgiannone@example.com', '2e30d8e5e750ea7565fe50800fe887151cc7328f58e77343a96c8560cc5eb494', '34923347834', '1982-04-11', 'Borgo Bernardo, 60 Piano 9', 7, 0),
(15, 'Augusto', 'Trillini', 'ansaldolegnante@example.org', '7d96cf8ca9cc0cdc45108e66e7b4fd0e6f046352b2fca5a9d7cb4b7fabae74dc', '0322307246', '1982-04-03', 'Canale Golino, 70 Appartamento 95', 21, 0),
(16, 'Temistocle', 'Paganini', 'mazzeoannibale@example.org', '917252f4dceba86d897027e3c6a6f9f3289e814729169928c071720e2b8b1c98', '+39 07752670815', '1965-08-25', 'Incrocio Arturo, 75 Appartamento 4', 2, 0),
(17, 'Luciana', 'Crispi', 'napoleonepelli@example.net', '45dbd8fb35f7d860f4ba72ed0f22c5f0734765aee10814535833302f073bc254', '0324652918', '1981-02-25', 'Rotonda Niscoromni, 5 Appartamento 65', 2, 0),
(18, 'Milo', 'Paganini', 'dmartucci@example.net', 'c347184c175d3ae97d313b45a83a7e0e5304f320caf573810d9d84cc7e3c71f4', '083582024', '1967-06-26', 'Vicolo Benigni, 28', 2, 0),
(19, 'Stefania', 'Gibilisco', 'rsamele@example.com', 'ac1053cddfe67a6a33f9404582b1e0e6878a48827472c4ab98f4bd88f51327bb', '+39 38971463081', '1987-04-15', 'Rotonda Serafina, 10 Appartamento 94', 42, 0),
(20, 'Pietro', 'Ziani', 'pacettipierpaolo@example.com', '16511c63fcdb891c9259dca2f895c519619f33f4fb9b77858857d68522f934ef', '37110110675', '2003-01-29', 'Incrocio Saraceno, 337 Appartamento 62', 35, 0),
(21, 'Enzio', 'Giacconi', 'camiscionegiosue@example.org', 'c9303d7399520d96ffb059030cb1a266c23cbc89a9dc57e85b19ee50725b6133', '327162016', '1996-03-07', 'Piazza Camiscione, 51 Piano 0', 1, 0),
(22, 'Emma', 'Verdi', 'milenamorellato@example.com', '2bc892ac13e21505f245df18fcf3e54f45b30ff6e1a842713f0210407964fc99', '+39 0122540871', '1994-05-19', 'Borgo Polizzi, 492 Appartamento 8', 25, 0),
(23, 'Vincenzo', 'Chinnici', 'luchinotafuri@example.com', 'a9d3094cc7ef66aa4ec13388efdc6ba2a16d713abb00a7c4a9cacfb563606941', '034422431', '2006-05-29', 'Vicolo Galasso, 16', 44, 0),
(24, 'Beppe', 'Busoni', 'mantegazzaluciano@example.org', '657ec51d6593108b8e043e47fb6bc8a2c5b4042a982bb3c35dda5997055d8cea', '0890501263', '2006-01-22', 'Piazza Totino, 371 Appartamento 79', 14, 0),
(25, 'Patrizio', 'Cammarata', 'bartolomeo85@example.net', '2e50966d11e768a3317e01c6eaca3a682699e8c5b67fdf9ee36b6921d9aa4c95', '+39 351347221', '1992-10-01', 'Contrada Curatoli, 76 Appartamento 14', 28, 0),
(26, 'Elladio', 'Turchetta', 'amanda49@example.net', '898f8670c67247d1d72933462b087652f270bab09ad56be2067e6decf9e140d6', '3907393182', '1962-07-28', 'Rotonda Gritti, 769 Piano 5', 2, 0),
(27, 'Elvira', 'Druso', 'ggentilini@example.org', 'ce9be6b7768372cb2395c33f1350f358d94e002363fdd4e6f249a7132170aa2f', '37835377537', '1986-12-14', 'Contrada Cavalcanti, 70', 34, 0),
(28, 'Alessia', 'Gravina', 'qcundari@example.org', 'e597c254213594a4c244c5898651cb73239fd983f19ca21b7d3019143470963a', '3343188229', '1994-09-23', 'Borgo Bartoli, 8', 15, 0),
(29, 'Donato', 'Zampa', 'marta87@example.net', 'b49f0b5f25a685efd820e0df86bb6a234aceab86353ef1a0e1f35e0965cd01e3', '0932266375', '1977-06-19', 'Vicolo Bruno, 55 Piano 5', 29, 0),
(30, 'Lara', 'Ferrazzi', 'borzomieraldo@example.net', 'ee25fd1aa7457ee4c3b20f5f024205379854213071f6906b52610a9c5993661a', '+39 014166629', '1976-03-23', 'Contrada Gaspare, 5 Piano 2', 32, 0),
(31, 'Costanzo', 'Rocca', 'lucreziafoletti@example.net', 'd3c3020c12a235b85029fc042b162467b6406350f859fec9f1c0bd833a6fbbcf', '0345368290', '1973-07-11', 'Stretto Gianetti, 0 Piano 4', 36, 0),
(32, 'Rossana', 'Raimondi', 'lfarnese@example.net', '20297d063b9141dbe2776213a5042576365ead47dbb03bb8c758d1bf1123a556', '+39 3534868539', '1964-03-14', 'Viale Antonello, 82 Appartamento 29', 15, 0),
(33, 'Baccio', 'Onisto', 'hpepe@example.org', 'e40cda712b97e1d0f85525380603ac88bac362d900d77525b7ca87750b2763f2', '+39 0161980155', '2003-03-11', 'Viale Virginia, 68 Appartamento 45', 23, 0),
(34, 'Michela', 'Brambilla', 'donatigoffredo@example.com', '4e85cc7071f58c861ea9eb240bfaa26fc10ad943f2974f4df0ac9de379d925c8', '+39 0354843317', '1994-08-30', 'Stretto Benvenuto, 95 Appartamento 17', 15, 0),
(35, 'Roman', 'Ferretti', 'onistorolando@example.com', 'b2556064d881e4809a28ec4bdafd5b51a6d06182525b4e23ff35bff760848890', '0438007028', '1960-06-08', 'Stretto Paulina, 0', 44, 0),
(36, 'Flora', 'Righi', 'martino16@example.org', '632e46300a539c16b207e7f5469314478fb32d58780bb1d1ea0b7cb34ae9c58a', '37169988792', '1978-01-24', 'Vicolo Vecellio, 14 Piano 7', 15, 0),
(37, 'Alberto', 'Mocenigo', 'lodovico90@example.org', 'a48af68588d1a7e0d586e633f2feb362b25ef8ec9fbe49925d316b478a25964a', '+39 0573112463', '2003-08-21', 'Contrada Magrassi, 26', 30, 0),
(38, 'Napoleone', 'Romagnoli', 'tatiana87@example.com', '6b819cbf364e94d91ba607da7a523a4052266f1fbdf39b2850abb5ea9c663470', '+39 0954846041', '1993-11-30', 'Incrocio Palmisano, 0', 19, 0),
(39, 'Laureano', 'Vigliotti', 'veronica32@example.org', '163cd333325d2df20042519625461eba597602b2fd53c49976e131f65a50b3a1', '35010387051', '1960-11-24', 'Via Gian, 22', 2, 0),
(40, 'Piersanti', 'Grasso', 'gremesemarina@example.org', '94b131632d4b8a2ac4eefc8d0e5e62019389b0795abde37187a05ce02d2b2fe6', '0583579663', '1993-02-09', 'Vicolo Federica, 53 Piano 5', 27, 0),
(41, 'Giosuè', 'Gigli', 'fabia52@example.com', '1b4802ede19e2c1739c8699a05e8a9bbce7b94cdcd9e8ce4c4e5e3c1e33b594a', '0564162851', '2006-05-23', 'Canale Flavio, 8 Appartamento 95', 36, 0),
(42, 'Gioele', 'Olivetti', 'giannellijacopo@example.net', '252d613ab8f65033fcfe799da8d7832316c6992434b8f0de9b83f4e068e78090', '+39 0425123582', '1975-05-01', 'Vicolo Tonisto, 347', 42, 0),
(43, 'Massimo', 'Dandolo', 'gaiattoluchino@example.com', '6284ebb7dfef00473b6ac5a751153c81bd457d42ee2c7204ff6b04a52afb7aef', '+39 3510057851', '1994-08-06', 'Vicolo Mercati, 77 Piano 1', 7, 0),
(44, 'Gustavo', 'Notarbartolo', 'mlombardi@example.com', '149418dafb98a5907cf6663386049cd12613db8a01616ca6d4bffbbff520e216', '+39 0571251657', '1970-01-08', 'Piazza Lina, 1 Piano 9', 12, 0),
(45, 'Leopoldo', 'Brunelleschi', 'mnovaro@example.org', '7202839d8126fcff97904e39500cb1fa6bb9f9e7eeba077e29da01eb9615333a', '+39 0775059527', '1999-01-02', 'Viale Filippa, 88', 41, 0),
(46, 'Carla', 'Foconi', 'giada20@example.com', '827e73600a849a6b417217a426864c130dd65d4bb2d6ffe0f0a7b062288f7b78', '+39 07616829785', '1973-11-09', 'Strada Cipriano, 72', 19, 0),
(47, 'Riccardo', 'Meucci', 'vmonti@example.org', '09c735ce9625f8567f0a03e3d12d751dea5a3110f86e5ed7c56d74d1afd3587c', '017174675', '1987-02-12', 'Stretto Contarini, 32 Appartamento 33', 8, 0),
(48, 'Ciro', 'Stein', 'riccardocortese@example.com', '1437f7484db8ee3bcab7785c80c7c4d04caf006b14ebdec0cceb7e4e035febc5', '+39 09018557898', '2000-02-12', 'Viale Pertini, 2 Appartamento 10', 22, 0),
(49, 'Claudia', 'Garibaldi', 'bacciomicca@example.com', '43f165f5252edd432a63601c032b8981629a69f12fbed663ca8065d92a0d0964', '+39 3814160512', '1996-02-15', 'Via Panzera, 45', 33, 0),
(50, 'Gianpietro', 'Tamburi', 'pbaracca@example.org', 'a2eb12e1893419217e440b566a2ba7fe53453427d364148b50eee55e12adf97b', '+39 0835792355', '1964-03-22', 'Piazza Trupiano, 3 Appartamento 4', 28, 0),
(51, 'Fabrizia', 'Navone', 'bpolesel@example.com', '4da1026c6b53035ee4efe70df81086d455f7aae3f22925d2c30327b5032385c9', '+39 0425123307', '2001-10-09', 'Piazza Fedele, 530 Appartamento 65', 33, 0),
(52, 'Sabatino', 'Avogadro', 'wboitani@example.net', 'b18090926dec15fb7e4d427f3ceb578afdeca9c28ca18869549f151de8b9da98', '0322789819', '1996-11-21', 'Stretto Nino, 25 Appartamento 29', 43, 0),
(53, 'Donatella', 'Sobrero', 'rgaliazzo@example.com', 'd2fee52c4065fcb9a4c3cb22abaa3e007543a16364ddd70b967ed5985c74829f', '07758048279', '1999-12-15', 'Stretto Petruzzi, 88', 13, 0),
(54, 'Manuel', 'Venditti', 'dino08@example.org', '47bc5823137d2468a4bd3ee9cbb264793bad99ec902a10ba58c35f08faee4973', '3514174041', '1966-06-21', 'Strada Tarantini, 9 Appartamento 0', 20, 0),
(55, 'Bartolomeo', 'Iannuzzi', 'argentiraffaele@example.net', '5ba80608bc281e87ad23861fc338d55bbed9e7f982a59c8b191525136a6c3204', '370376612', '2003-02-21', 'Rotonda Nonis, 2 Appartamento 5', 19, 0),
(56, 'Francesca', 'Barbarigo', 'isaragat@example.org', 'a53320d737afab64cc4af1e8931b7bc4ed754d665167a19dc3de4be38ed2d2f2', '+39 0457149631', '1976-04-24', 'Via Stefano, 719 Piano 2', 38, 0),
(57, 'Marta', 'Pagliaro', 'wiannuzzi@example.org', 'db7d3ac53c31979664efef0a55a4da0b1124bd3c0210e2a8a1fc8e9c16460b48', '0364166077', '1975-09-01', 'Piazza Poerio, 23', 32, 0),
(58, 'Gianpaolo', 'Grassi', 'lorenzomarrone@example.net', '4b6c91b452def270db45398e1fb4b7dbfb3ab82934f8295c2c70124440dec156', '385490743', '1970-10-13', 'Incrocio Finzi, 72', 33, 0),
(59, 'Laura', 'Vivaldi', 'malonzi@example.org', '94086d179a40e45ad6ef9e4e240ace03fe4d85893b7252d9cf96be827588b3e2', '07718130334', '1977-10-13', 'Contrada Bellocchio, 10 Appartamento 55', 26, 0),
(60, 'Gianfranco', 'Cicilia', 'anichinisylvia@example.org', '4506e64a4a8f03c497e30aa49a9e08029709577de0a20f03efab7b668c000304', '37391884305', '1977-06-06', 'Stretto Trotta, 4 Piano 9', 38, 0),
(61, 'Piergiorgio', 'Vergassola', 'rvercelloni@example.net', '30f9bd5c4188b05fc0fda6817f5349f6a6b90e29c63fc6ad84857e24685e047e', '+39 0434346483', '1996-04-10', 'Strada Giacobbe, 52', 3, 0),
(62, 'Martino', 'Tognazzi', 'gtaccola@example.net', '0e14c6e8408e50cfc6e5823c39aa7248f0a7c2891ccab48539cb317297079fb0', '0771937466', '1985-06-25', 'Canale Stella, 81', 31, 0),
(63, 'Giuseppina', 'Mazzacurati', 'fgonzaga@example.net', 'b566847bb441fb61842085984b600d718e66ac73933dc0e4d48cb882d55e183a', '014184144', '1981-11-25', 'Contrada Loretta, 682', 16, 0),
(64, 'Sandra', 'Gemito', 'lolita00@example.com', 'd99a630c612604e02549a4e46310ae3d0252bd1ad14c1cf744e79063261e5374', '+39 073122316', '1981-08-09', 'Stretto Troisi, 490', 26, 0),
(65, 'Fedele', 'Interminei', 'ssollima@example.com', '7354e6ae05ccca78e8073ffb98e307e4eac9bc7ae6745ba9f9f2d00aa6dbd7bd', '3757686438', '1977-10-28', 'Contrada Jolanda, 512', 27, 0),
(66, 'Costantino', 'Morgagni', 'tatiana66@example.com', '13813fd6dd305352cbd65833674b24697c7be260c0cdf0019e31712e6c46a603', '+39 04457856692', '1970-01-28', 'Rotonda Paolini, 39', 43, 0),
(67, 'Vito', 'Borromini', 'pacelligionata@example.org', '95d3ff6a8d551eba580ef2d145fd987a2679da5692c0b9caa9686b5a207fd0ab', '+39 35126789497', '1982-12-29', 'Via Sandra, 2', 12, 0),
(68, 'Donato', 'Avogadro', 'sbertoni@example.com', 'ec6caf8dd575e672dd4ed84954ec784607c526d42b7ab224cdd81ec79a312101', '+39 3629759086', '1999-07-15', 'Incrocio Pellegrino, 9 Piano 5', 24, 0),
(69, 'Adriana', 'Polizzi', 'luigidonati@example.com', '96d19082dae10e1c83701bc962ef6453aee8afdf3eb9c7b6ed90ade8cf2c4764', '09418281947', '1962-02-03', 'Canale Graziano, 14 Appartamento 31', 36, 0),
(70, 'Adelasia', 'Stein', 'mauropezzali@example.net', 'd028fe2d83c7ce11d39bd75899fa9f300ad2588045f261700d5e6b258323cda1', '+39 05728100911', '1959-11-09', 'Stretto Marini, 27', 45, 0),
(71, 'Anita', 'Garobbio', 'giammussoisabella@example.com', 'bb73263596b02fec7ca87af1418eaa125169aacde6e4028dc197475b36519638', '35192656910', '1995-09-12', 'Borgo Folliero, 613 Piano 8', 44, 0),
(72, 'Romina', 'Mogherini', 'ludovica49@example.org', 'b7f3a5cb56474da94040f93cf2d7525a1db4f7b2f6e686d88d918bf47f435bc8', '+39 0438479800', '2007-04-20', 'Canale Giammusso, 66', 24, 0),
(73, 'Tonia', 'Muti', 'letizia01@example.net', 'fe79d4f17f7ac659d94fb05794b7f7403f04dc0ffa241c2aefe25056f38b85e0', '+39 0399387469', '1964-06-09', 'Vicolo Giacinto, 236 Piano 3', 6, 0),
(74, 'Leonardo', 'Iannucci', 'jacopoiadanza@example.com', '9818ee37bc288d37630a2377e8a799ed63252b4f621b7a73caa69267269fff9b', '+39 052167726', '1999-06-22', 'Piazza Tresoldi, 230', 29, 0),
(75, 'Elisa', 'Dandolo', 'barozzistefano@example.com', 'f8a0debe2866e4e99f242b8963885a9eac44fd32627fdd572a42d5f9cfc62d57', '+39 0704603569', '1999-03-31', 'Canale Pirandello, 273', 43, 0),
(76, 'Ansaldo', 'Piane', 'zolatiziano@example.com', '6a399eb03a06a4ac93581ec1f7d0a835fde910849ba17bcce0491c5fcd937948', '+39 343651429', '1971-09-16', 'Borgo Pellegrino, 30 Piano 6', 33, 0),
(77, 'Liliana', 'Leonetti', 'martinafattori@example.net', '450fe9fefef823848f36cc021681611a9a1f1d5a09e0964c0d37b18d331e68e2', '+39 033234253', '2001-03-21', 'Contrada Gucci, 14', 7, 0),
(78, 'Benedetto', 'Guinizzelli', 'taccolagiacinto@example.com', '423bb9567aebc5cbdf52777e0b264ef63700a6453c52ec01444566c8e6183831', '01634509765', '2001-03-22', 'Incrocio Sophia, 4 Appartamento 75', 11, 0),
(79, 'Elisa', 'Sorrentino', 'angelotencalla@example.org', '7de2aeef1158d925ff3cfcae9c4de6cbf3f2acfeee47a5d29b86ed2d8c667626', '+39 3222148004', '1963-07-07', 'Via Baldassare, 59 Appartamento 3', 34, 0),
(80, 'Marta', 'Palladio', 'nordiovincenzo@example.com', '638820c9de82072289fb15a3e22e61e4a9974edea7e8672548820f0e98ad3161', '+39 333976898', '1997-07-03', 'Incrocio Pacelli, 67', 26, 0),
(81, 'Ubaldo', 'Gabba', 'silvio06@example.org', 'f8f33772a94d4d92b98cd8482887edb74c674f024dd1450cb5aba92385fbd168', '+39 05644936053', '2003-11-15', 'Stretto Arnaldo, 82', 24, 0),
(82, 'Rosalia', 'Emo', 'jcomboni@example.com', '4dd597921df0dcab482891d6f3fa3c24f5f78ee37e14c4489cd608af9d1afee0', '3621811673', '1995-11-12', 'Viale Gaetano, 53 Piano 9', 32, 0),
(83, 'Pierina', 'Vercelloni', 'cimarosalucio@example.net', '1bb0aa27464afda0618fbe06a184a7486fd04723a54f21aef1259e1d6b5bc442', '07823671603', '1999-08-01', 'Canale Alfieri, 57 Piano 3', 2, 0),
(84, 'Luisa', 'Ponti', 'greco70@example.com', '8f689aa6ddd27f0c1b01eaf15bf1829936718e8e54e69a9a25de289fefcb4121', '+39 0556338960', '1970-02-14', 'Rotonda Beppe, 8 Piano 2', 31, 0),
(85, 'Giulietta', 'Chiesa', 'wredi@example.com', '213431956677c8ec72432b35f5273aeed58c468ff1f608aac86e1d18f4c39cbe', '0583472403', '1993-10-19', 'Strada Carolina, 0', 3, 0),
(86, 'Natalia', 'Zaguri', 'bbramante@example.net', '69a7c66c6146f8fd1521d7ecc2c6fe2be78172ab2faf7089901f1988b95d4c5c', '3714229159', '1965-03-16', 'Borgo Bocca, 764 Piano 8', 20, 0),
(87, 'Dina', 'Beffa', 'rosariamastandrea@example.org', '9a319b932fa7e7a49db793626774cafad2c0290d001de079269980654cd1a497', '+39 0523912876', '1963-07-11', 'Rotonda Telesio, 36', 40, 0),
(88, 'Achille', 'Galilei', 'cremonesisonia@example.net', '7342980a88b1c645d630e343687f94e88ebc15e3f94c6b9e9abba297a79c0b3e', '+39 3890284352', '1977-03-21', 'Vicolo Basso, 57 Piano 6', 38, 0),
(89, 'Rosario', 'Zaccagnini', 'idascandone@example.com', 'ae22a67f206e1582d3ac5fca699705f5708a094a96ee5b824b1667e87448e723', '+39 3440149736', '2003-07-15', 'Viale Gangemi, 57 Piano 7', 38, 0),
(90, 'Nicoletta', 'Boldù', 'antoninofranzese@example.net', '876a3fa59c0a1b9d5826844435128b4f08dd977c9dd389efda947b4b7fed401a', '33144720796', '1984-07-13', 'Borgo Scalera, 584', 26, 0),
(91, 'Benedetto', 'Brenna', 'ruggeroparisi@example.org', '99b9309a440eb1eac562123c28916ab66daef41b98e94ee2c3558062d23f9ab4', '0974640424', '2005-06-11', 'Stretto Binaghi, 71 Appartamento 60', 42, 0),
(92, 'Martino', 'Semitecolo', 'lambertobabati@example.com', 'ec14fcef854519cfc19bdc7c43553e23302ce6b57efadd2a1c91daa6532aa199', '+39 09219906801', '1968-04-13', 'Strada Tarchetti, 85', 11, 0),
(93, 'Milo', 'Cappelli', 'nicoletta13@example.net', '49f17ef2a877deb007e918c729e808c61d81b6e4243b0a04b514575c5c9229ab', '0375251349', '1991-03-14', 'Rotonda Treves, 2 Appartamento 4', 11, 0),
(94, 'Sandro', 'Cavalcanti', 'nicolobarberini@example.com', 'c4b2217db3c122a451b753bffee56ec20a851f7c3cf11389256a5f575c8c713f', '+39 0774326703', '1979-04-03', 'Via Boccioni, 1 Appartamento 1', 33, 0),
(95, 'Agostino', 'Bertolucci', 'pierfranceschi@example.org', 'c7c525278aec904b4595efbd6e6e05053e7fe203260234c6808ab16ee34c0559', '+39 3757278054', '1990-08-05', 'Contrada Ermes, 19', 15, 0),
(96, 'Corrado', 'Agazzi', 'antonellaossola@example.net', 'a5e26ba36ee720772065b6167020c24f7d45d48ca203864515aac2b364e34a2e', '+39 0532114368', '1980-04-24', 'Stretto Casellati, 8', 1, 0),
(97, 'Ilaria', 'Fieramosca', 'silvestro30@example.org', 'af3732864912e2a04faf22eeb2f19390fb1fc2f3d56e2990ced33a01963a5107', '+39 37795103667', '1991-02-21', 'Piazza Fiorucci, 42 Piano 1', 13, 0),
(98, 'Tonia', 'Anguillara', 'lina29@example.com', '3624045e5d44b46c7de16fd0655cc999325be3c812a80ee29df93f2f11f8df8b', '078313950', '1971-07-01', 'Via Pareto, 29', 35, 0),
(99, 'Arnaldo', 'Strangio', 'romana67@example.net', 'c7cee2d6ce70855d9bc406426059ccc9dc82a912d845a89a62e09ff8dbb20b12', '+39 039806435', '2001-07-09', 'Incrocio Ziani, 9', 36, 0),
(100, 'Gloria', 'Majewski', 'gscaramucci@example.net', 'f2a92c16295b6fa7b9177dd0add6366f727a3c32bc2c7aa5081563cce4b7063c', '3926049045', '1969-05-06', 'Rotonda Lucia, 72', 15, 0),
(101, 'Carolina', 'Ortese', 'jtotino@example.org', 'b8de497036351ec0e1a7f54b24213db8b39d75910614c697df12ea85fc9ca21e', '+39 07610154456', '1986-12-08', 'Rotonda Modugno, 52 Piano 6', 26, 0),
(102, 'Fausto', 'Pugliese', 'rmarinetti@example.org', '63e6b1a8381346913e3b214f26d65eb415f7c1f8c9edcb292daed67d779df51b', '+39 37375147604', '1992-12-21', 'Via Fo, 31', 33, 0),
(103, 'Aria', 'Micca', 'pmaffei@example.com', '857b3e7100fdba8f34b09f1a260f2d3cbc79335f8f1ab2fb0f8a252a04a4fbc7', '0583754153', '1999-10-22', 'Piazza Guglielmi, 891', 23, 0),
(104, 'Giancarlo', 'Fogazzaro', 'santinadia@example.com', 'e7000c62393d1ea9429b462e9332abc9457233ef2ca12b223c99c703e2a10e88', '0789756610', '1981-12-04', 'Stretto Tartaglia, 2', 37, 0),
(105, 'Gian', 'Comencini', 'zaccogiovanna@example.net', 'ff5f915dc8e1395774059230d7b2c4876261f7e23b28dcda63fc280e84a040c7', '+39 37111151961', '1987-12-22', 'Incrocio Rossetti, 89 Piano 1', 23, 0),
(106, 'Pasquale', 'Castellitto', 'bbettin@example.org', '149eab4061832641e897d29f8ff1def9481bebc84396991fee337287e39ce84c', '+39 3779876529', '1998-07-01', 'Via Bianca, 3', 30, 0),
(107, 'Pomponio', 'Guarneri', 'valentinatremonti@example.com', '0e358617b4c7fab3ba5f3b58af385062ec5221b1636b9d37cb91b344279ad8d6', '05011567587', '1985-06-10', 'Viale Sandra, 3', 18, 0),
(108, 'Alessia', 'Visintini', 'plombardo@example.org', '134466507c0d5d8c19c2b48de4d7cfaaeca80c309a7c88035045ebf6d5345ca4', '08023324129', '1980-05-21', 'Incrocio Cabrini, 49', 43, 0),
(109, 'Venancio', 'Capecchi', 'conteserena@example.org', 'b900749f5dd0a52d207c05ffe841fc043a22168654ad1825fc926a685ca39029', '+39 35010622709', '1993-12-20', 'Vicolo Ceravolo, 83 Appartamento 28', 36, 0),
(110, 'Bianca', 'Bruscantini', 'federiconicolucci@example.net', 'e570ecd2a315b9fa4895d44352dce02a1a961f93f9c6102c33d6db9f3fda27cb', '+39 3555253765', '1976-08-08', 'Borgo Camillo, 28', 39, 0),
(111, 'Gioachino', 'Manzoni', 'chiara89@example.com', 'ead027034a99e829f926ad741eacafb77b57c0d3f5b6dd193233fed9a58f91c8', '0344157762', '2002-06-30', 'Canale Ferrazzi, 66 Appartamento 83', 1, 0),
(112, 'Giacomo', 'Puglisi', 'ubaldoturci@example.org', '6b35e34ca01d52af39c10927544dc508610b1217a39b63db8777dca963beb2d8', '0141626599', '2004-07-03', 'Borgo Sergius, 56', 25, 0),
(113, 'Bernardo', 'Garibaldi', 'orlando95@example.com', 'f2269eb1a4eb287bbf8d65577e7ea6cf592caedc73566a9c7502aceae1a91a70', '047162369', '1972-08-07', 'Via Canova, 96', 33, 0),
(114, 'Roman', 'Schiavone', 'giuseppeangiolello@example.net', 'a7713b917a37ba5d27582c02c2a7b48aebf83884f7f62d1c63384cb86bc742b1', '076135757', '1976-03-03', 'Contrada Mirco, 69', 9, 0),
(115, 'Bettina', 'Filippini', 'gustavobusoni@example.com', 'ff19c9b5ef9b32620beebc1da5a1ea40950dda5c86e8401d15459ff32516f77a', '3398449713', '1992-08-01', 'Vicolo Venturi, 40', 34, 0),
(116, 'Amico', 'Giannone', 'simonettaargenti@example.com', '4cbb945e36000281b21b9372f91cab9984f5752426922f210b19856d60aebf32', '+39 03625681943', '1988-11-12', 'Incrocio Maria, 40 Piano 0', 36, 0),
(117, 'Graziano', 'Veneziano', 'tamburielena@example.net', '6a77fb6cf768b91434401845228c0aece3782c7678dbcc8e2951605234f6610d', '03652567496', '2005-09-14', 'Borgo Amalia, 73', 14, 0),
(118, 'Daria', 'Tarchetti', 'ferdinandoparri@example.org', '2534ec821c6f896c368c4863c4a8cc2ec6f93503858def4e477cea89103b5218', '+39 0124453639', '1973-08-14', 'Piazza Donini, 3 Piano 2', 28, 0),
(119, 'Antonina', 'Battelli', 'fernandagaiatto@example.com', 'eb00976e84f132f417156fb8101b4bbee9552554253867dc3a97e28297d43c93', '+39 3926435768', '2005-10-26', 'Borgo Gianfrancesco, 6 Piano 6', 4, 0),
(120, 'Torquato', 'Pace', 'simonetta26@example.net', '1adcc03b70edef98e980bf286a44a9a68f2f8d8d870034c5c715b021b5e46175', '+39 37723131434', '1962-02-04', 'Incrocio Scarlatti, 43 Appartamento 92', 31, 0),
(121, 'Tiziana', 'Colletti', 'qpiane@example.org', '0c8a07344451a7767ba6b61080919257443b9d429e6d134f5590d9cc14748bb5', '0565251369', '1994-07-14', 'Borgo Carducci, 96', 24, 0),
(122, 'Gabriele', 'Soderini', 'lucrezia28@example.com', 'b4324be8f55895725040414b8869ef84459a5e8044d5983e19247d8ae31af7b0', '382023046', '2003-11-20', 'Contrada Tonisto, 4', 37, 0),
(123, 'Silvio', 'Cossiga', 'virginia42@example.org', 'e10b9870a8490f849cbc041c91d951e4ba2b3bda42d84adfac7e7665d9d89c0b', '078955598', '1976-03-29', 'Borgo Girolamo, 618 Piano 7', 36, 0),
(124, 'Ugolino', 'Mengolo', 'durantebernardini@example.com', 'baffabc28b84038c8f1aa7a77cb35400fbc647607c3a9e725d7e7f529eb64969', '04719000773', '1987-06-04', 'Borgo Ippazio, 3', 13, 0),
(125, 'Tiziano', 'Turchi', 'margheritaadinolfi@example.com', 'f9cc0abacf6bc9da3ff80290bf6c1c68dcb08fcf2ddf430e25b628b7ea7f51f3', '0342165405', '1983-03-06', 'Piazza Ruggero, 32 Piano 8', 33, 0),
(126, 'Antonello', 'Vanvitelli', 'piergiuseppe97@example.com', '313f5d5f3654a81f186bf89d304176a6c7b82cfb64a664101864aec75683a47c', '0932585903', '1993-08-08', 'Borgo Boezio, 84 Piano 2', 27, 0),
(127, 'Gelsomina', 'Fantini', 'finziarmando@example.org', '557ac0a6213446548764c465fcd12b03785dc135064b43da5792a2d27c4b583f', '+39 0721563200', '1964-01-12', 'Rotonda Nico, 86 Appartamento 7', 32, 0),
(128, 'Elmo', 'Stucchi', 'wmazzini@example.org', '34f39494639ecbddce8fc986cbeec6ea36bccddb8c20d490643e752809ceadd3', '0595162024', '1982-06-20', 'Via Edoardo, 5', 23, 0),
(129, 'Venancio', 'Toselli', 'sinzaghi@example.com', '2e18822a77e985c3478ce87bdd0ec6afd68628b5d26c9901c2dca2e13eb46fd8', '0799919513', '1975-12-23', 'Via Filippa, 6', 27, 0),
(130, 'Viridiana', 'Loredan', 'toninoscotto@example.org', '7f829ffaef9377dead2942bf3751b958e09fa8daa09e72d44d3ff0ca4999a19a', '0321484281', '1969-11-01', 'Canale Matilda, 9', 23, 0),
(131, 'Aurora', 'Peruzzi', 'antoniagarrone@example.org', '64042e5a4a9c6736f75bc5222f90e74af6896f836f9aa6820de98365de8b9066', '0345587911', '1980-03-22', 'Vicolo Ludovico, 899', 1, 0),
(132, 'Jacopo', 'Roccabonella', 'gioachinopennetta@example.net', '3d148bded1c440bf1a736837bce5260991c7eabce7097e1d6f84af8bc99c49bd', '+39 07332404316', '1966-11-29', 'Viale Luigi, 16', 35, 0),
(133, 'Pierina', 'Rusticucci', 'ninetta23@example.net', '060433b22ca3ccc70a34f49c893e02ee8ecd424b397673ef5701069458e998ec', '3514336574', '1980-03-29', 'Stretto Dolores, 9', 35, 0),
(134, 'Uberto', 'Marazzi', 'montesanoclaudia@example.net', 'b294485b8ed4d14544b0cbe2f6c5b133d6bfcd668c257f09822ed7dc36c0b2c2', '0481628974', '1987-09-05', 'Incrocio Danilo, 6', 40, 0),
(135, 'Telemaco', 'Piovani', 'coriolanoscalfaro@example.org', 'ba8c5bf568d4b450ed91b8b7ae238d994d6709b2c933570a359b0f83acabb23b', '3517660406', '1968-09-16', 'Stretto Nicola, 31', 40, 0),
(136, 'Pierpaolo', 'Barbarigo', 'martina05@example.org', 'd3a2fffbcf1e3985a7b115ea2f38c901443bed55c1455c31335675fc32380d97', '0421321015', '1993-05-11', 'Incrocio Aurora, 3 Piano 8', 22, 0),
(137, 'Federico', 'Nievo', 'xtanzini@example.net', 'c18766c7c4543ec422d1dd9925550aa9d7d78e5c5d618e6f32d9140038150237', '+39 3500943413', '1977-09-09', 'Piazza Romolo, 12', 30, 0),
(138, 'Imelda', 'Ortese', 'niggligioachino@example.net', 'e75718b0a1cbcb6e496b6607a367b2ccfaf563d8c54718352f392054e76c19c9', '+39 0587840951', '1959-12-18', 'Viale Corrado, 5', 39, 0),
(139, 'Armando', 'Gaiatto', 'gabrielialberico@example.net', '58d2abf6c706d7e3fe9df656cf92efa3bcfb3195845f08d0c8bedee5f5aad154', '36239642591', '2001-05-19', 'Piazza Raimondi, 3', 2, 0),
(140, 'Amedeo', 'Calarco', 'piergiorgiocerquiglini@example.net', '9885bc8d3992d977c896046a93ba325f9f7608e98e8c81dd5d907aa692f6e7fa', '0865330528', '1976-07-22', 'Canale Valmarana, 4 Appartamento 95', 15, 0),
(141, 'Maria', 'Sagese', 'ferragamomariana@example.net', 'fd8f9c1b661bcb804e883997e590c4ed461fbd32e9ee8ef9082eafd5fc512581', '+39 3517494010', '1994-03-10', 'Canale Ziani, 17 Piano 8', 41, 0),
(142, 'Sophia', 'Lerner', 'giulietta89@example.com', '445a5d4239f205a48197d8bae43dc2c98f58ff3531caa8aaad65a72c3a4b7856', '+39 333568677', '1971-11-03', 'Piazza Camicione, 56 Piano 9', 12, 0),
(143, 'Annetta', 'Carpaccio', 'rominaanguillara@example.com', '22b564fe5c4e0507e96b841a2da9aaea092f5bff05e2a8c21a8a4e65cd9d1e31', '037529295', '1982-07-25', 'Contrada Eleanora, 9 Piano 8', 36, 0),
(144, 'Giuliano', 'Interminelli', 'dcuratoli@example.org', 'fcc3c87c7c3a32f2e728b227d37bd2c5cce9ee1bee6f7f706e97440d13af3d01', '08017182464', '1973-05-18', 'Canale Silvia, 48 Piano 8', 38, 0),
(145, 'Sole', 'Caboto', 'gemmaesposito@example.org', 'ffdd7d5deb5afc028aa8cf00f6dac755812bd97c70d0c3f0f0b39ed43ae85965', '+39 3510908997', '2002-06-30', 'Stretto Gioacchino, 35', 12, 0),
(146, 'Salvi', 'Ferretti', 'nvento@example.net', '4dd74ae9631105370d80704312f1353c3c2c13216b0248af20112fc7925cd54b', '0413809269', '1973-04-15', 'Strada Trobbiani, 0', 6, 0),
(147, 'Luigina', 'Disdero', 'flaviaanastasi@example.net', '1bc1b2dd61c2c74be161e4fcf757d93d23860188db5e88905b218f4611769028', '+39 07733371028', '1991-04-04', 'Borgo Maccanelli, 1', 36, 0),
(148, 'Dario', 'Bova', 'gricci@example.org', '5f484f8f570bb0911168ea0b5d81cce6c9e370636fd0f2d2228981e717025823', '05858929794', '1991-04-01', 'Borgo Bianca, 12 Piano 7', 17, 0),
(149, 'Gianni', 'Pozzecco', 'lucrezia03@example.org', '47375ca55a2baa0a96dedad17921be65063ceecf09d3a3c700b28c591f57acb7', '018313906', '1971-08-29', 'Incrocio Comencini, 96', 3, 0),
(150, 'Maurilio', 'Govoni', 'mercedes74@example.org', 'd7560e2214808e0bfb2e936a094d6e38609d0684b78e9415042b399882d5470e', '+39 0735672966', '1990-11-18', 'Incrocio Farnese, 9', 44, 0),
(151, 'Melissa', 'Brambilla', 'ioppipietro@example.net', 'be35f201c857cb024e455d3c47badf0c3a959864b2a65e334122a487956eccb2', '+39 045959603', '2005-04-15', 'Strada Fredo, 60', 5, 0),
(152, 'Fausto', 'Maggioli', 'gustavo95@example.org', '2a20f929c6546f2c1dad0a5b847bb1ad4c87f8d6129ea6ce5b195b8296578fe7', '+39 0344625450', '1965-12-16', 'Stretto Notarbartolo, 734 Appartamento 8', 6, 0),
(153, 'Achille', 'Catalano', 'dina82@example.net', 'f512f61b7acb0285a09d3a31e1c868a82f3657ffd02f11e0ea6982641deb9352', '+39 0342357541', '1968-08-01', 'Stretto Giannetti, 0 Appartamento 97', 2, 0),
(154, 'Giada', 'Bertolucci', 'amadeo77@example.org', 'dcfc150eef12bea4ec76fa4830062a42e420d02488e58f8d35e001a8c7827a09', '+39 361726400', '1974-12-07', 'Vicolo Liberto, 30 Piano 1', 29, 0),
(155, 'Ludovica', 'Vergerio', 'virginia94@example.net', 'c1d6e3a145d2f612ee37e94be7a707e4a0994f2b5df3d5b60d568bdbc5242bd6', '+39 35150782587', '1991-12-09', 'Strada Borromini, 43 Appartamento 49', 1, 0),
(156, 'Ermes', 'Dulbecco', 'mserlupi@example.org', 'd04d30c1f502f082668cf2b4fc00235d2c2dcbf0294b307b78a7107f1f20618d', '+39 375632199', '1972-10-16', 'Piazza Piacentini, 26 Appartamento 3', 18, 0),
(157, 'Michele', 'Oliboni', 'farinagioele@example.com', '525a28833e4e421b79a0c23118e4a0bdd984d81580a036afc9b2933dfd389396', '058897718', '1983-02-11', 'Contrada Gonzaga, 34', 16, 0),
(158, 'Nicolò', 'Romiti', 'uberto53@example.org', '072d7ca662f6be88603f24a7f0670b8cb8264bca193424a5024fd5308a9e42cf', '0911756200', '1986-07-14', 'Via Ubaldo, 66', 18, 0),
(159, 'Teresa', 'Scarponi', 'juvaradamiano@example.net', '963f420a473131d4e44053f80977aad63b1ad662ae3cab9e01cb00b2e10cafe6', '+39 0171172773', '1988-01-22', 'Contrada Rodolfo, 2', 8, 0),
(160, 'Alberto', 'Avogadro', 'mcammarata@example.com', '36fc33aa527a53cc7052b4bde8860d97ccb0a4b68675e74c26597aedff191996', '3773914863', '1962-10-14', 'Incrocio Boccaccio, 135', 40, 0),
(161, 'Gianluca', 'Acerbi', 'toninellievangelista@example.net', 'fb725036722a0b94ec7cfdaad2ef7a7f4ca9ecf97995f550efe2611e58084428', '+39 3701961752', '1976-06-06', 'Via Graziella, 1', 12, 0),
(162, 'Vittoria', 'Sismondi', 'lferrabosco@example.org', '690df4fa39ba26f72b877a47f5e57959509667841336531454a30d7fbd6208ed', '3815889944', '1992-12-25', 'Strada Bellucci, 761 Piano 9', 23, 0),
(163, 'Dante', 'Mazzocchi', 'kcastelli@example.net', '43213a21976e711fae16a65ad3114b4b4b02a1b5a2f8a6e8791dbc0a8252da33', '3448175911', '1997-04-20', 'Borgo Speri, 0', 19, 0),
(164, 'Giulia', 'Iannelli', 'ernestofoscari@example.com', '394d6042bf7b6a51a17ef80ef7475169bc1bb9ca5c125a67b20cccfd14cbca73', '+39 04037299992', '2005-11-15', 'Borgo Ferraris, 4 Appartamento 10', 5, 0),
(165, 'Daria', 'Brugnaro', 'alfonsimarissa@example.org', '5ded55844983386803d13aaaa40401cfb36a301647b81d7da87a7a059952cf0c', '+39 014135370', '1980-02-09', 'Borgo Ramona, 5', 11, 0),
(166, 'Tina', 'Modigliani', 'fabriziabonatti@example.com', 'ce630d4a038cd1da17ab12d5e7d9276fef4a0b29fcbcea2e977fb8f102981646', '+39 0865709244', '1992-03-16', 'Vicolo Enzio, 17 Appartamento 6', 11, 0),
(167, 'Stefania', 'Vendetti', 'evangelista01@example.com', 'a165287c7c70f76411d1bc8a44245a1c3aeddc66ebdba71e8da1240d6468cb8c', '+39 3715079724', '1972-03-18', 'Stretto Ronaldo, 82', 17, 0),
(168, 'Mariana', 'Opizzi', 'salatacirillo@example.com', '3419bdfb43090cd3826379136b0a99d1c05079568ef4cf40a1b3ebd5f99d24a2', '+39 0776961899', '1991-12-18', 'Viale Serraglio, 66 Appartamento 1', 34, 0),
(169, 'Tonino', 'Fittipaldi', 'fmerisi@example.com', '20e08b5a1278884aa691b75a7dfd96ccc4151d73568954d9594f88dc3b82ce48', '3350988128', '1977-02-21', 'Via Munari, 112', 11, 0),
(170, 'Dante', 'Finzi', 'cibinumberto@example.net', '2a645876aed4a4f569a489ad1d2d9d3607ea613f231e67cf74eda61b1791a7b9', '3458188326', '1962-07-13', 'Rotonda Margherita, 42 Piano 2', 43, 0),
(171, 'Rodolfo', 'Cignaroli', 'bdibiasi@example.net', '8240c083710392a963a8c93fa710af75226c9c72acef26541de832bb410f99d5', '+39 34500809704', '1979-02-03', 'Viale Casaleggio, 74 Appartamento 8', 18, 0),
(172, 'Mariano', 'Paolucci', 'mircoborsiere@example.com', 'dc17e4c9e89db63643f0be96fa6defba990c9a632ab5a20c8c138f2253c4d0ae', '057345808', '1971-01-27', 'Borgo Gastone, 4', 42, 0),
(173, 'Ottavio', 'Paolucci', 'lucamorlacchi@example.org', '4ac248cd7901305b471743bb006662c51d23431cc160a232e3b5ffd39e3bd87a', '0796075756', '2005-10-31', 'Canale Lupo, 48 Piano 2', 19, 0),
(174, 'Antonia', 'Viola', 'ferrazziida@example.com', '026a32e4cfa6476ae8020ff7bce8ead6660b693c1acfb1184fb8da3b7c855ebb', '+39 0732547984', '1986-10-08', 'Stretto Gelli, 216 Appartamento 43', 30, 0),
(175, 'Giampiero', 'Dulbecco', 'elladio26@example.net', 'a94adb61f3da3ad590c4f79d53132f702f8ec62eae8a87bd29e3f7726c854bdf', '+39 0109580317', '1971-06-08', 'Incrocio Rosina, 9 Piano 1', 45, 0),
(176, 'Benvenuto', 'Scarponi', 'salvi00@example.com', '341c7d2b790503cc83eecd5f26c9ddf609ec9acc0fdbf8f943111bfd82e95d7f', '362038206', '1963-05-28', 'Strada Caffarelli, 4 Appartamento 7', 21, 0),
(177, 'Irma', 'Maspero', 'mirko72@example.net', 'fe256a491200b24e7cd64bbe0509e92ac79bad816b3304621cf1ea0ea0245059', '+39 073731120', '1990-09-20', 'Rotonda Vincentio, 222', 32, 0),
(178, 'Geronimo', 'Sansoni', 'girolamobernetti@example.org', '042d6244d457b25546685c039b350c5dd9b82d813bc3e51fbc94a79148d378e7', '+39 36378306583', '1973-01-16', 'Via Natalia, 59', 31, 0),
(179, 'Rocco', 'Pergolesi', 'dionigiricci@example.com', 'cfcd507a2d441695ae1af773c6345d6cda56378e01ca026a4d233fbb9710db90', '3739586050', '1974-04-16', 'Stretto Maria, 67 Piano 0', 8, 0),
(180, 'Angelina', 'Fieramosca', 'ocaracciolo@example.org', '05f3552d0a8a66d441264167ae738a5461d7480efb92f9f2bab241b6911a525c', '+39 0835933095', '1972-10-13', 'Contrada Elena, 81', 2, 0),
(181, 'Federigo', 'Trobbiani', 'pomponiomarangoni@example.com', '5b3852dbb7b1cc67e47a1490fb4b2da845c00838aed6224077c5284ca7c7f2e9', '045262885', '1969-12-10', 'Canale Pierina, 13 Appartamento 16', 20, 0),
(182, 'Stefani', 'Cerutti', 'ceschiemma@example.net', '9db1fa3ed6e1d6c6b7aeaf8ed81dcccbd89264919885e3daaff87a707c108a06', '+39 0950848827', '1996-12-12', 'Rotonda Federica, 43', 25, 0),
(183, 'Franco', 'Cutuli', 'gustavo55@example.org', '07410d4d60ed93fb847d42047641d522b22e6a5da27c8138a9c6b4441f382d0f', '+39 0432267396', '1985-07-13', 'Viale Alighieri, 71 Piano 6', 22, 0),
(184, 'Marina', 'Montanari', 'elisaiannelli@example.com', '559c2fb47b82b286e48d8d4b26872c5591621fd492d96ca7bf0ad23fb4ccbde1', '+39 071407060', '2004-11-18', 'Incrocio Romina, 2', 27, 0),
(185, 'Benvenuto', 'Santi', 'elisalercari@example.net', '372b00161b6e7f582820a5bfbc93305c7cd7a68f5d9de0156ae2c89493389b69', '+39 3757895355', '2004-10-26', 'Stretto Vespucci, 46 Piano 9', 13, 0),
(186, 'Gioffre', 'Paolucci', 'diana98@example.net', 'e463aadcd79219701b7a4e6007270ca2a85167cad83d112d2ba9d63c8d863b4f', '+39 0549785027', '1962-01-08', 'Strada Flaiano, 875 Appartamento 7', 17, 0),
(187, 'Ninetta', 'Botta', 'annettaromagnoli@example.com', 'd270c94d74a64b31e3a5a4e1ab0fba1c7a23aab38dedbb5a6a03a532f8e6023c', '+39 0571316153', '1983-11-22', 'Via Sandi, 90', 7, 0),
(188, 'Rosina', 'Nitti', 'paolo77@example.org', 'a7ac0d2ad0794745036af1dc0959089fb94cc32a8a92eed54acd229ea7280a6f', '+39 3773231095', '1976-12-11', 'Borgo Maura, 4 Piano 8', 17, 0),
(189, 'Serafina', 'Bataglia', 'osanudo@example.net', 'bf5514111c18a6530178d0218f4bfd604dad2e7d710f4e5e93bc9bdd0a774a8f', '092166547', '1969-12-28', 'Canale Michelotto, 60 Appartamento 6', 33, 0),
(190, 'Erika', 'Romano', 'federicozichichi@example.com', '708722313f2cc851f196ac78836b19adfefbe192101029596487bef0197b42b5', '3514803151', '1981-12-12', 'Stretto Mirko, 31', 14, 0),
(191, 'Giustino', 'Filogamo', 'kpasolini@example.net', '2c3c21729c06027236dc4b50abc4984ecd38d3e8e972820f7d47403e062fe6bf', '0187874756', '1984-12-01', 'Rotonda Gregori, 13', 39, 0),
(192, 'Laureano', 'Coppola', 'vanessa19@example.com', 'b41eca0540208406fada9fd925aadd28d261398648af8fd2ba543a57d82df3d3', '+39 087403857', '1960-12-23', 'Contrada Elvira, 36', 28, 0),
(193, 'Gianpaolo', 'Cipolla', 'tornatoreruggero@example.com', 'b44f13f0678b9916fecf8021d74196c4df8df680431fa836fe795ba29ed8b4dd', '+39 37152747899', '2004-12-30', 'Borgo Palombi, 17 Piano 3', 2, 0),
(194, 'Lucia', 'Manacorda', 'gustavo88@example.com', 'e6d63c8fdcc4014eecff9026d785f3af28515f66897385f0612bf153bd70aada', '+39 08833544994', '1976-05-07', 'Via Palmisano, 88', 15, 0),
(195, 'Antonella', 'Pozzecco', 'romeopoerio@example.com', '712224d23ccfcf6540dc4cd5ec1c7139951fc2b6473d2f4d1f5079396e4643d9', '+39 0565223682', '1968-04-14', 'Vicolo Rosario, 1', 2, 0),
(196, 'Massimiliano', 'Boccaccio', 'rzito@example.com', '54b5728e2e245cab506815c46a0768a6a2b1f25258556389c5dc819979ebf439', '073151424', '1972-01-31', 'Strada Gramsci, 62', 26, 0),
(197, 'Romolo', 'Gucci', 'zgasperi@example.org', 'cdffb227dbd82575e54adae58fcce21fff71619555c9f874461ced2f6c3e8bc1', '+39 0345203557', '1969-04-02', 'Vicolo Novaro, 88', 10, 0),
(198, 'Adelmo', 'Michelangeli', 'tonicomolli@example.net', 'e570a4272c3af3aa769d704b578a127a2beac772a96d1235b989d8cb2142fb7a', '+39 042523238', '1998-09-27', 'Borgo Zichichi, 6 Piano 6', 3, 0),
(199, 'Ezio', 'Ferraris', 'goffredoparpinel@example.com', 'b79ffadddc4fb1e2a5caf363dd64331963c9318cbf0d9d869d384f650c9ab89b', '+39 0161771623', '1959-11-19', 'Borgo Enzo, 37 Piano 5', 11, 0),
(200, 'Nicola', 'Beccheria', 'erikavecoli@example.org', 'dc80f9a67bd01f86a5a09b86a4e2a7f26936d15f1ea598eaa2d7af9660d633fd', '0823962159', '1978-12-02', 'Viale Fabia, 23', 29, 0),
(201, 'Roberto', 'Bologna', 'bobologna@gmfake.com', '34c8af4a0621debd9ec1f0c51f963b9230a6466f457aa45b2a81d60c2bd2086b', '01650546719', '1969-06-11', 'Piazza Fiorenzo, 125', 11, 0);

-- --------------------------------------------------------

--
-- Struttura per vista `infostudente`
--
DROP TABLE IF EXISTS `infostudente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `infostudente`  AS SELECT concat(`ui_s`.`FirstName`,' ',`ui_s`.`LastName`) AS `Studente`, `sub`.`SubjectName` AS `Materia`, if(`g`.`Grade` is null,'In corso',`g`.`Grade`) AS `Voto`, concat(`ui_p`.`FirstName`,' ',`ui_p`.`LastName`) AS `Professore` FROM (((((((`grade` `g` join `module` `m` on(`g`.`ModuleID` = `m`.`ModuleID`)) join `subject` `sub` on(`sub`.`SubjectID` = `m`.`SubjectID`)) join `student` `s` on(`s`.`StudentID` = `g`.`StudentID`)) join `userinfo` `ui_s` on(`ui_s`.`UserInfoID` = `s`.`UserInfoID`)) join `course` `c` on(`c`.`CourseID` = `s`.`CourseID`)) join `teacher` `t` on(`t`.`TeacherID` = `m`.`TeacherID`)) join `userinfo` `ui_p` on(`ui_p`.`UserInfoID` = `t`.`UserInfoID`)) WHERE `s`.`StudentID` = 7 ORDER BY if(`g`.`Grade` is null,'In corso',`g`.`Grade`) ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `materiacorsospecifici`
--
DROP TABLE IF EXISTS `materiacorsospecifici`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `materiacorsospecifici`  AS SELECT concat(`ui_s`.`FirstName`,' ',`ui_s`.`LastName`) AS `Studente`, if(`g`.`Grade` is null,'In corso',`g`.`Grade`) AS `Voto`, concat(`c`.`CourseName`,' ',`c`.`CourseNumber`,' ',`city`.`CityName`) AS `Corso`, concat(`ui_p`.`FirstName`,' ',`ui_p`.`LastName`) AS `Professore` FROM (((((((((`grade` `g` join `module` `m` on(`g`.`ModuleID` = `m`.`ModuleID`)) join `subject` `sub` on(`sub`.`SubjectID` = `m`.`SubjectID`)) join `student` `s` on(`s`.`StudentID` = `g`.`StudentID`)) join `userinfo` `ui_s` on(`ui_s`.`UserInfoID` = `s`.`UserInfoID`)) join `course` `c` on(`c`.`CourseID` = `s`.`CourseID`)) join `site` on(`site`.`SiteID` = `c`.`SiteID`)) join `city` on(`city`.`CityID` = `site`.`CityID`)) join `teacher` `t` on(`t`.`TeacherID` = `m`.`TeacherID`)) join `userinfo` `ui_p` on(`ui_p`.`UserInfoID` = `t`.`UserInfoID`)) WHERE `c`.`CourseName` like '%Data%' AND `sub`.`SubjectName` like '%big%' ORDER BY `c`.`CourseName` ASC, if(`g`.`Grade` is null,'In corso',`g`.`Grade`) ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `mediamateriacorsi`
--
DROP TABLE IF EXISTS `mediamateriacorsi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mediamateriacorsi`  AS SELECT concat(`c`.`CourseName`,' ',`c`.`CourseNumber`,' ',`city`.`CityName`) AS `Corso`, `sub`.`SubjectName` AS `Materia`, if(round(avg(`g`.`Grade`),2) is null,'---',round(avg(`g`.`Grade`),2)) AS `MediaVoti` FROM ((((((`grade` `g` join `module` `m` on(`g`.`ModuleID` = `m`.`ModuleID`)) join `subject` `sub` on(`sub`.`SubjectID` = `m`.`SubjectID`)) join `student` `s` on(`s`.`StudentID` = `g`.`StudentID`)) join `course` `c` on(`c`.`CourseID` = `s`.`CourseID`)) join `site` on(`site`.`SiteID` = `c`.`SiteID`)) join `city` on(`city`.`CityID` = `site`.`CityID`)) GROUP BY concat(`c`.`CourseName`,' ',`c`.`CourseNumber`,' ',`city`.`CityName`), `sub`.`SubjectName` ORDER BY concat(`c`.`CourseName`,' ',`c`.`CourseNumber`,' ',`city`.`CityName`) ASC, `sub`.`SubjectName` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `mediavotituttistudenti`
--
DROP TABLE IF EXISTS `mediavotituttistudenti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mediavotituttistudenti`  AS SELECT `s`.`StudentID` AS `StudentID`, concat(`ui_s`.`FirstName`,' ',`ui_s`.`LastName`) AS `Studente`, if(round(avg(`g`.`Grade`),2) is null,'---',round(avg(`g`.`Grade`),2)) AS `MediaVoti`, concat(`c`.`CourseName`,' ',`c`.`CourseNumber`,' ',`city`.`CityName`) AS `Corso` FROM (((((((`grade` `g` join `module` `m` on(`g`.`ModuleID` = `m`.`ModuleID`)) join `subject` `sub` on(`sub`.`SubjectID` = `m`.`SubjectID`)) join `student` `s` on(`s`.`StudentID` = `g`.`StudentID`)) join `userinfo` `ui_s` on(`ui_s`.`UserInfoID` = `s`.`UserInfoID`)) join `course` `c` on(`c`.`CourseID` = `s`.`CourseID`)) join `site` on(`site`.`SiteID` = `c`.`SiteID`)) join `city` on(`city`.`CityID` = `site`.`CityID`)) GROUP BY concat(`ui_s`.`FirstName`,' ',`ui_s`.`LastName`) ORDER BY avg(`g`.`Grade`) DESC ;

-- --------------------------------------------------------

--
-- Struttura per vista `studenticonpiudi30anni`
--
DROP TABLE IF EXISTS `studenticonpiudi30anni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studenticonpiudi30anni`  AS SELECT `s`.`StudentID` AS `StudentID`, concat(`ui_s`.`FirstName`,' ',`ui_s`.`LastName`) AS `Studente`, timestampdiff(YEAR,`ui_s`.`BirthDate`,curdate()) AS `Età`, if(round(avg(`g`.`Grade`),2) is null,'---',round(avg(`g`.`Grade`),2)) AS `MediaVoti`, concat(`c`.`CourseName`,' ',`c`.`CourseNumber`,' ',`city`.`CityName`) AS `Corso` FROM (((((((`grade` `g` join `module` `m` on(`g`.`ModuleID` = `m`.`ModuleID`)) join `subject` `sub` on(`sub`.`SubjectID` = `m`.`SubjectID`)) join `student` `s` on(`s`.`StudentID` = `g`.`StudentID`)) join `userinfo` `ui_s` on(`ui_s`.`UserInfoID` = `s`.`UserInfoID`)) join `course` `c` on(`c`.`CourseID` = `s`.`CourseID`)) join `site` on(`site`.`SiteID` = `c`.`SiteID`)) join `city` on(`city`.`CityID` = `site`.`CityID`)) WHERE timestampdiff(YEAR,`ui_s`.`BirthDate`,curdate()) > 30 GROUP BY concat(`ui_s`.`FirstName`,' ',`ui_s`.`LastName`) ORDER BY avg(`g`.`Grade`) DESC, timestampdiff(YEAR,`ui_s`.`BirthDate`,curdate()) DESC ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`),
  ADD UNIQUE KEY `CityName` (`CityName`),
  ADD KEY `fkCityProvinceID` (`ProvinceID`);

--
-- Indici per le tabelle `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`),
  ADD UNIQUE KEY `CourseNumber` (`CourseNumber`),
  ADD KEY `fkCourseSiteID` (`SiteID`),
  ADD KEY `fkCourseTutorID` (`TutorID`);

--
-- Indici per le tabelle `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`GradeID`),
  ADD KEY `fkGradeStudentID` (`StudentID`),
  ADD KEY `fkGradeModuleID` (`ModuleID`);

--
-- Indici per le tabelle `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`ModuleID`),
  ADD KEY `fkModuleCourseID` (`CourseID`),
  ADD KEY `fkModuleTeacherID` (`TeacherID`),
  ADD KEY `fkModuleSubjectID` (`SubjectID`);

--
-- Indici per le tabelle `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`ProvinceID`),
  ADD UNIQUE KEY `ProvinceName` (`ProvinceName`);

--
-- Indici per le tabelle `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`SiteID`),
  ADD UNIQUE KEY `SiteName` (`SiteName`),
  ADD UNIQUE KEY `SiteAddress` (`SiteAddress`),
  ADD KEY `fkSiteCityID` (`CityID`);

--
-- Indici per le tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `fkStudentUserInfoID` (`UserInfoID`),
  ADD KEY `fkStudentCourseID` (`CourseID`);

--
-- Indici per le tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SubjectID`),
  ADD UNIQUE KEY `SubjectName` (`SubjectName`);

--
-- Indici per le tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`TeacherID`),
  ADD KEY `fkTeacherUserInfoID` (`UserInfoID`);

--
-- Indici per le tabelle `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`TutorID`),
  ADD KEY `fkTutorUserInfoID` (`UserInfoID`);

--
-- Indici per le tabelle `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`UserInfoID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  ADD UNIQUE KEY `UserAddress` (`UserAddress`),
  ADD KEY `fkUserInfoCityID` (`CityID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT per la tabella `course`
--
ALTER TABLE `course`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `grade`
--
ALTER TABLE `grade`
  MODIFY `GradeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999;

--
-- AUTO_INCREMENT per la tabella `module`
--
ALTER TABLE `module`
  MODIFY `ModuleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT per la tabella `province`
--
ALTER TABLE `province`
  MODIFY `ProvinceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `site`
--
ALTER TABLE `site`
  MODIFY `SiteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `subject`
--
ALTER TABLE `subject`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT per la tabella `teacher`
--
ALTER TABLE `teacher`
  MODIFY `TeacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `tutor`
--
ALTER TABLE `tutor`
  MODIFY `TutorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `UserInfoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fkCityProvinceID` FOREIGN KEY (`ProvinceID`) REFERENCES `province` (`ProvinceID`);

--
-- Limiti per la tabella `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fkCourseSiteID` FOREIGN KEY (`SiteID`) REFERENCES `site` (`SiteID`),
  ADD CONSTRAINT `fkCourseTutorID` FOREIGN KEY (`TutorID`) REFERENCES `tutor` (`TutorID`);

--
-- Limiti per la tabella `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `fkGradeModuleID` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`),
  ADD CONSTRAINT `fkGradeStudentID` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Limiti per la tabella `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `fkModuleCourseID` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `fkModuleSubjectID` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`),
  ADD CONSTRAINT `fkModuleTeacherID` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`TeacherID`);

--
-- Limiti per la tabella `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `fkSiteCityID` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Limiti per la tabella `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fkStudentCourseID` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `fkStudentUserInfoID` FOREIGN KEY (`UserInfoID`) REFERENCES `userinfo` (`UserInfoID`);

--
-- Limiti per la tabella `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `fkTeacherUserInfoID` FOREIGN KEY (`UserInfoID`) REFERENCES `userinfo` (`UserInfoID`);

--
-- Limiti per la tabella `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `fkTutorUserInfoID` FOREIGN KEY (`UserInfoID`) REFERENCES `userinfo` (`UserInfoID`);

--
-- Limiti per la tabella `userinfo`
--
ALTER TABLE `userinfo`
  ADD CONSTRAINT `fkUserInfoCityID` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

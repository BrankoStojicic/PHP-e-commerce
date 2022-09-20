-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2016 at 09:07 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lrb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `article_price` int(11) NOT NULL DEFAULT '0',
  `article_lager` int(11) NOT NULL DEFAULT '0',
  `article_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Unisex',
  `article_action` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NE',
  `article_description` text COLLATE utf8_unicode_ci NOT NULL,
  `brend_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `brend_id` (`brend_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`article_id`, `article_name`, `article_price`, `article_lager`, `article_type`, `article_action`, `article_description`, `brend_id`) VALUES
(1, 'Perforated Steel', 5000, 1, 'Muški', 'DA', 'Description for Perforated Steel Driver Watch.', 1),
(2, 'Silver Chrono Bracelet Watch', 5000, 0, 'Muški', 'DA', 'Description for A|X Silver Chrono Bracelet Watch.', 1),
(3, 'ERA-300DL', 4000, 1, 'Muški', 'DA', 'Description for ERA-300DL CASIO', 2),
(5, 'DIESSEL-800', 1500, 5, 'Muški', 'NE', 'This is description for DIESSEL 800 article.', 3),
(6, 'DIESSEL-1000', 7000, 11, 'Unisex', 'NE', 'This is description for DIESSEL 800 article.', 3),
(13, 'Angry Birds', 500, 20, 'Dečji', 'DA', 'Dečji sat sa motivima popularne igre.', 5),
(14, 'Žanski sat', 333, 3, 'Ženski', 'NE', 'Žensaki sat opis.', 2),
(15, 'iWatch', 15000, 5, 'Unisex', 'DA', 'Pametni sat.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `brends`
--

CREATE TABLE IF NOT EXISTS `brends` (
  `brend_id` int(11) NOT NULL AUTO_INCREMENT,
  `brend_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brend_description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`brend_id`),
  KEY `brend_id` (`brend_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `brends`
--

INSERT INTO `brends` (`brend_id`, `brend_name`, `brend_description`) VALUES
(1, 'ARMANI EXCHANGE', 'Standardni opis za AE.'),
(2, 'CASIO', 'Standardni opis za CASSIO.'),
(3, 'DIESSEL', 'Standardni opis za DIESSEL.'),
(4, 'FOSSIL', 'Standardni opis za FOSSIL.'),
(5, 'HUGO HOSS', 'Standardni opis za HB');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE IF NOT EXISTS `carts` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_user_status` int(11) NOT NULL DEFAULT '0',
  `cart_admin_status` int(11) NOT NULL DEFAULT '0',
  `cart_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `article_id` (`article_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=77 ;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `article_id`, `user_id`, `cart_user_status`, `cart_admin_status`, `cart_code`) VALUES
(44, 1, 14, 1, 1, '141202031201281'),
(46, 6, 14, 1, 1, '141202031201281'),
(47, 5, 18, 1, 0, '141202031559217'),
(48, 2, 1, 0, 0, '141203114138921'),
(69, 2, 19, 0, 0, '141211113035761'),
(70, 3, 19, 0, 0, '141211113035761'),
(76, 16, 1, 0, 0, '141203114138921');

-- --------------------------------------------------------

--
-- Stand-in structure for view `cart_code`
--
CREATE TABLE IF NOT EXISTS `cart_code` (
`cart_code` varchar(20)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `closed_cart_code`
--
CREATE TABLE IF NOT EXISTS `closed_cart_code` (
`cart_code` varchar(20)
);
-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `article_id`, `comment`, `time`) VALUES
(14, 16, 5, 'Moj komentar.', '2014-12-03 10:41:05'),
(15, 1, 15, 'Odličan sat.', '2014-12-03 10:47:04'),
(16, 14, 1, 'Dobar odnos cene i kvaliteta.', '2014-12-10 15:52:16'),
(17, 19, 14, 'Dopada mi se.', '2014-12-11 10:27:19'),
(18, 21, 13, 'Lep decji sat...', '2015-03-26 14:22:45'),
(19, 14, 1, 'Ovo je moj komentar.', '2016-03-02 14:25:51');

-- --------------------------------------------------------

--
-- Stand-in structure for view `open_cart_code`
--
CREATE TABLE IF NOT EXISTS `open_cart_code` (
`cart_code` varchar(20)
);
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `first_name`, `last_name`, `email`, `active`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Darko', 'Pantovic', 'darko.pantovic@link.co.rs', 2),
(14, 'marko', 'f9358ac24412310090578eb1877344e1', 'Marko', 'Markovic', 'marko@gmail.com', 1),
(15, 'janko', 'f9358ac24412310090578eb1877344e1', 'Janko', 'Jankovic', 'janko@gmail.com', 1),
(16, 'petar', 'ad649ed4ce9f8aedeccc39825ff3b624', 'Petar', 'Petrovic', 'petar@mail.com', 1),
(18, 'milan', '9c4bde02de6fa68614240303c3070e47', 'Milan', 'Milanovic', 'milan@net.com', 1),
(19, 'marija', '2808c6d6e7b4aed69d3390e5ead943a6', 'Marija', 'Marijanovic', 'marija@gmail.com', 0),
(20, 'svetozar', '4bc379cf4b558a3adfb47ad625369c0b', 'Sveta', 'Markovic', 'sveta@gmail.com', 1),
(21, 'jovana', '2368e9a1148bfec4079f3d7e932c97fb', 'Jovana', 'Jovanovic', 'jovana@gmail.com', 1);

-- --------------------------------------------------------

--
-- Structure for view `cart_code`
--
DROP TABLE IF EXISTS `cart_code`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cart_code` AS select distinct `carts`.`cart_code` AS `cart_code` from `carts`;

-- --------------------------------------------------------

--
-- Structure for view `closed_cart_code`
--
DROP TABLE IF EXISTS `closed_cart_code`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `closed_cart_code` AS select distinct `carts`.`cart_code` AS `cart_code` from `carts` where (`carts`.`cart_admin_status` = 1);

-- --------------------------------------------------------

--
-- Structure for view `open_cart_code`
--
DROP TABLE IF EXISTS `open_cart_code`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `open_cart_code` AS select distinct `carts`.`cart_code` AS `cart_code` from `carts` where ((`carts`.`cart_admin_status` = 0) and (`carts`.`cart_user_status` = 1));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

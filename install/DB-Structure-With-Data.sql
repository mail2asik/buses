-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2015 at 06:06 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bus_services`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus_directions`
--

CREATE TABLE IF NOT EXISTS `bus_directions` (
  `d_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique bus direction id',
  `sn_id` int(10) unsigned NOT NULL COMMENT 'Foreign key: service_numbers.sn_id',
  `direction_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Bus direction name',
  PRIMARY KEY (`d_id`),
  KEY `directions_sn_id_foreign` (`sn_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `bus_directions`
--

INSERT INTO `bus_directions` (`d_id`, `sn_id`, `direction_name`) VALUES
(1, 1, 'Shenton Way Ter'),
(2, 1, 'Bt Batok Int'),
(3, 2, 'Shenton Way Ter'),
(4, 2, 'Bt Batok Int'),
(5, 3, 'Bt Merah Int'),
(6, 3, 'Sembawang Int'),
(7, 4, 'Bt Merah Int'),
(8, 4, 'Sembawang Int'),
(9, 5, 'Ang Mo Kio Int'),
(10, 5, 'Woodlands Reg Int'),
(11, 6, 'Blk 923'),
(12, 6, 'Woodlands Reg Int');

-- --------------------------------------------------------

--
-- Table structure for table `bus_migrations`
--

CREATE TABLE IF NOT EXISTS `bus_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bus_migrations`
--

INSERT INTO `bus_migrations` (`migration`, `batch`) VALUES
('2015_02_05_070519_bus_services', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bus_service_numbers`
--

CREATE TABLE IF NOT EXISTS `bus_service_numbers` (
  `sn_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique bus service number id',
  `service_number` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Unique bus service number',
  PRIMARY KEY (`sn_id`),
  UNIQUE KEY `service_numbers_service_number_unique` (`service_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `bus_service_numbers`
--

INSERT INTO `bus_service_numbers` (`sn_id`, `service_number`) VALUES
(1, '106'),
(2, '106D'),
(3, '167'),
(4, '167D'),
(5, '169'),
(6, '169A');

-- --------------------------------------------------------

--
-- Table structure for table `bus_stops`
--

CREATE TABLE IF NOT EXISTS `bus_stops` (
  `s_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique bus stop id',
  `d_id` int(10) unsigned NOT NULL COMMENT 'Foreign key: service_numbers.sn_id',
  `sn_id` int(10) unsigned NOT NULL COMMENT 'Foreign key: directions.d_id',
  `stop_code` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Bus stop number',
  `stop_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Bus stop name',
  `arrival_time` time NOT NULL COMMENT 'Bus arrival name',
  PRIMARY KEY (`s_id`),
  KEY `stops_sn_id_foreign` (`sn_id`),
  KEY `stops_d_id_foreign` (`d_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;

--
-- Dumping data for table `bus_stops`
--

INSERT INTO `bus_stops` (`s_id`, `d_id`, `sn_id`, `stop_code`, `stop_name`, `arrival_time`) VALUES
(1, 1, 1, '43179', 'Blk 231 - BT BATOK EAST AVE 3', '10:00:00'),
(2, 1, 1, '43189', 'Blk 283 - BT BATOK EAST AVE 3', '12:00:00'),
(3, 1, 1, '43619', 'Blk 289E - BT BATOK EAST AVE 3', '14:00:00'),
(4, 1, 1, '43629', 'Yusof Ishak Sec Sch - BT BATOK EAST AVE 3', '16:00:00'),
(5, 1, 1, '42319', 'Burgundy Hill - BT BATOK EAST AVE 3', '18:00:00'),
(6, 2, 1, '03211', 'bef Shenton Way - PALMER', '06:25:00'),
(7, 2, 1, '03222', 'Hub Synergy Pt - ANSON', '08:40:00'),
(8, 2, 1, '03531', 'Bef Marina Way - CENTRAL BOULEVARD', '10:30:00'),
(9, 2, 1, '03511', 'Marina Bay Sands MICE*', '12:10:00'),
(10, 2, 1, '03501', 'Marina Bay Sands Theatre - BAYFRONT AVE', '14:20:00'),
(11, 3, 2, '05319', 'OCBC Ctr - CHURCH', '09:30:00'),
(12, 3, 2, '03059', 'One Raffles Quay - RAFFLES QUAY', '10:30:00'),
(13, 3, 2, '03129', 'UIC Bldg - SHENTON WAY', '11:30:00'),
(14, 3, 2, '03218', 'opp MAS Bldg - SHENTON WAY', '12:30:00'),
(15, 3, 2, '03219', 'aft Shenton Way - PALMER', '13:30:00'),
(16, 4, 2, '42311', 'opp Burgundy Hill - BT BATOK EAST AVE 3', '11:30:00'),
(17, 4, 2, '43621', 'opp Parkview Apts - BT BATOK EAST AVE 3', '12:30:00'),
(18, 4, 2, '43611', 'Blk 290H - BT BATOK EAST AVE 3', '13:30:00'),
(19, 4, 2, '43181', 'Keming Pr Sch - BT BATOK EAST AVE 3', '14:30:00'),
(20, 4, 2, '43171', 'Blk 229 - BT BATOK EAST AVE 3', '15:30:00'),
(21, 5, 3, '58151', 'bef Sembawang Stn - CANBERRA', '02:25:00'),
(22, 5, 3, '58331', 'Blk 589D - CANBERRA LINK', '03:45:00'),
(23, 5, 3, '58029', 'aft Canberra Rd - S''WANG', '05:35:00'),
(24, 5, 3, '58019', 'aft Sembawang Shop Ctr - S''WANG', '06:50:00'),
(25, 5, 3, '57139', 'aft Jln Kemuning - S''WANG', '08:25:00'),
(26, 6, 3, '10089', 'Blk 119 - JLN BT MERAH', '09:00:00'),
(27, 6, 3, '10079', 'Blk 201 - JLN BT MERAH', '10:00:00'),
(28, 6, 3, '10069', 'opp Blk 140 - JLN BT MERAH', '11:00:00'),
(29, 6, 3, '10059', 'opp Blk 149 - JLN BT MERAH', '12:00:00'),
(30, 6, 3, '10049', 'aft Jln Bt Merah - KG BAHRU', '13:00:00'),
(31, 7, 4, '10051', 'Blk 149 - JLN BT MERAH', '14:30:00'),
(32, 7, 4, '10061', 'Blk 140 - JLN BT MERAH', '15:30:00'),
(33, 7, 4, '10071', 'Blk 111 - JLN BT MERAH', '16:30:00'),
(34, 7, 4, '10501', 'Blk 104 - JLN BT MERAH', '17:30:00'),
(35, 7, 4, '10081', 'opp Blk 120 - JLN BT MERAH', '18:30:00'),
(36, 8, 4, '57131', 'Seletaris Condo - S''WANG', '03:25:00'),
(37, 8, 4, '58011', 'opp Sembawang Shop Ctr - S''WANG', '04:50:00'),
(38, 8, 4, '58021', 'bef Canberra Rd - S''WANG', '08:25:00'),
(39, 8, 4, '58339', 'opp Blk 589D - CANBERRA LINK', '06:05:00'),
(40, 8, 4, '58159', 'aft Admiral Hill - CANBERRA', '02:25:00'),
(41, 9, 5, '46271', 'opp Blk 802 - W''LANDS AVE 2', '04:30:00'),
(42, 9, 5, '46269', 'Republic Polytechnic - W''LANDS AVE 9', '10:30:00'),
(43, 9, 5, '46451', 'opp Blk 872 - W''LANDS AVE 9', '02:30:00'),
(44, 9, 5, '46461', 'opp Blk 757A CP - W''LANDS AVE 9', '10:30:00'),
(45, 9, 5, '46471', 'opp Blk 773 - W''LANDS AVE 9', '22:30:00'),
(46, 10, 5, '54247', 'Blk 322 - AMK AVE 3', '02:30:00'),
(47, 10, 5, '54239', 'Blk 209 - AMK AVE 3', '04:30:00'),
(48, 10, 5, '54229', 'Ang Mo Kio Pr Sch - AMK AVE 3', '05:30:00'),
(49, 10, 5, '54219', 'opp Mayflower Sec Sch - AMK AVE 3', '12:30:00'),
(50, 10, 5, '54069', 'opp Blk 246 - AMK AVE 1', '15:30:00'),
(51, 11, 6, '58059', 'aft Sembawang CC - S''WANG', '09:00:00'),
(52, 11, 6, '58049', 'bef Yishun Ave 2 - S''WANG', '04:50:00'),
(53, 11, 6, '59529', 'opp Yishun Sapphire - YISHUN AVE 2', '11:30:00'),
(54, 11, 6, '59259', 'Darul Makmur Mque - YISHUN AVE 2', '06:50:00'),
(55, 11, 6, '59099', 'aft Blk 220 - YISHUN AVE 2', '08:25:00'),
(56, 12, 6, '58171', 'Sembawang Corp Ind - ADMIRALTY RD WEST', '02:25:00'),
(57, 12, 6, '58181', 'Sembawang Drug Rehab Ctr - ADMIRALTY RD WEST', '10:30:00'),
(58, 12, 6, '58191', 'aft Wellington Rd - ADMIRALTY RD EAST', '11:00:00'),
(59, 12, 6, '58201', 'bef Prison Trg Sch - ADMIRALTY RD EAST', '16:00:00'),
(60, 12, 6, '58069', 'opp The Ashram - S''WANG', '18:30:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_directions`
--
ALTER TABLE `bus_directions`
  ADD CONSTRAINT `directions_sn_id_foreign` FOREIGN KEY (`sn_id`) REFERENCES `bus_service_numbers` (`sn_id`);

--
-- Constraints for table `bus_stops`
--
ALTER TABLE `bus_stops`
  ADD CONSTRAINT `stops_d_id_foreign` FOREIGN KEY (`d_id`) REFERENCES `bus_directions` (`d_id`),
  ADD CONSTRAINT `stops_sn_id_foreign` FOREIGN KEY (`sn_id`) REFERENCES `bus_service_numbers` (`sn_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2015 at 11:04 PM
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
-- Table structure for table `bus_api_keys`
--

CREATE TABLE IF NOT EXISTS `bus_api_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_keys_key_unique` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bus_api_keys`
--

INSERT INTO `bus_api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '670b9d8140edf7d6f4481886f167bf6618b86691', 10, 1, '2015-04-10 12:54:58', '2015-04-10 12:54:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bus_api_logs`
--

CREATE TABLE IF NOT EXISTS `bus_api_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_key_id` int(10) unsigned NOT NULL,
  `route` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_logs_route_index` (`route`),
  KEY `api_logs_method_index` (`method`),
  KEY `api_logs_api_key_id_foreign` (`api_key_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bus_api_logs`
--

INSERT INTO `bus_api_logs` (`id`, `api_key_id`, `route`, `method`, `params`, `ip_address`, `created_at`, `updated_at`) VALUES
(4, 1, 'BusController@getBusNumbers', 'GET', '', '::1', '2015-04-10 14:20:45', '2015-04-10 14:20:45'),
(5, 1, 'BusController@getBusNumbers', 'GET', '', '::1', '2015-04-10 15:34:37', '2015-04-10 15:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `bus_directions`
--

CREATE TABLE IF NOT EXISTS `bus_directions` (
  `d_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique bus direction id',
  `direction_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Bus direction name',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `bus_directions`
--

INSERT INTO `bus_directions` (`d_id`, `direction_name`) VALUES
(1, 'Shenton Way Ter'),
(2, 'Bt Batok Int'),
(3, 'Bt Merah Int'),
(4, 'Sembawang Int'),
(5, 'Ang Mo Kio Int'),
(6, 'Woodlands Reg Int'),
(7, 'Blk 923');

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
('2014_06_12_084423_create_api_keys_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bus_service_numbers`
--

CREATE TABLE IF NOT EXISTS `bus_service_numbers` (
  `sn_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique bus service number id',
  `service_number` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Unique bus service number',
  PRIMARY KEY (`sn_id`),
  UNIQUE KEY `service_number_unique` (`service_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

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
-- Table structure for table `bus_service_numbers_directions`
--

CREATE TABLE IF NOT EXISTS `bus_service_numbers_directions` (
  `snd_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique bus service number, direction id',
  `sn_id` int(10) unsigned NOT NULL COMMENT 'Foreign key: service_number.sn_id',
  `d_id` int(10) unsigned NOT NULL COMMENT 'Foreign key: direction.d_id',
  PRIMARY KEY (`snd_id`),
  KEY `sn_id_foreign` (`sn_id`),
  KEY `d_id_foreign` (`d_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `bus_service_numbers_directions`
--

INSERT INTO `bus_service_numbers_directions` (`snd_id`, `sn_id`, `d_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 3),
(6, 3, 4),
(7, 4, 3),
(8, 4, 4),
(9, 5, 5),
(10, 5, 6),
(11, 6, 7),
(12, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `bus_stops`
--

CREATE TABLE IF NOT EXISTS `bus_stops` (
  `s_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique bus stop id',
  `stop_code` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Bus stop number',
  `stop_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Bus stop name',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;

--
-- Dumping data for table `bus_stops`
--

INSERT INTO `bus_stops` (`s_id`, `stop_code`, `stop_name`) VALUES
(1, '43179', 'Blk 231 - BT BATOK EAST AVE 3'),
(2, '43189', 'Blk 283 - BT BATOK EAST AVE 3'),
(3, '43619', 'Blk 289E - BT BATOK EAST AVE 3'),
(4, '43629', 'Yusof Ishak Sec Sch - BT BATOK EAST AVE 3'),
(5, '42319', 'Burgundy Hill - BT BATOK EAST AVE 3'),
(6, '03211', 'bef Shenton Way - PALMER'),
(7, '03222', 'Hub Synergy Pt - ANSON'),
(8, '03531', 'Bef Marina Way - CENTRAL BOULEVARD'),
(9, '03511', 'Marina Bay Sands MICE*'),
(10, '03501', 'Marina Bay Sands Theatre - BAYFRONT AVE'),
(11, '05319', 'OCBC Ctr - CHURCH'),
(12, '03059', 'One Raffles Quay - RAFFLES QUAY'),
(13, '03129', 'UIC Bldg - SHENTON WAY'),
(14, '03218', 'opp MAS Bldg - SHENTON WAY'),
(15, '03219', 'aft Shenton Way - PALMER'),
(16, '42311', 'opp Burgundy Hill - BT BATOK EAST AVE 3'),
(17, '43621', 'opp Parkview Apts - BT BATOK EAST AVE 3'),
(18, '43611', 'Blk 290H - BT BATOK EAST AVE 3'),
(19, '43181', 'Keming Pr Sch - BT BATOK EAST AVE 3'),
(20, '43171', 'Blk 229 - BT BATOK EAST AVE 3'),
(21, '58151', 'bef Sembawang Stn - CANBERRA'),
(22, '58331', 'Blk 589D - CANBERRA LINK'),
(23, '58029', 'aft Canberra Rd - S''WANG'),
(24, '58019', 'aft Sembawang Shop Ctr - S''WANG'),
(25, '57139', 'aft Jln Kemuning - S''WANG'),
(26, '10089', 'Blk 119 - JLN BT MERAH'),
(27, '10079', 'Blk 201 - JLN BT MERAH'),
(28, '10069', 'opp Blk 140 - JLN BT MERAH'),
(29, '10059', 'opp Blk 149 - JLN BT MERAH'),
(30, '10049', 'aft Jln Bt Merah - KG BAHRU'),
(31, '10051', 'Blk 149 - JLN BT MERAH'),
(32, '10061', 'Blk 140 - JLN BT MERAH'),
(33, '10071', 'Blk 111 - JLN BT MERAH'),
(34, '10501', 'Blk 104 - JLN BT MERAH'),
(35, '10081', 'opp Blk 120 - JLN BT MERAH'),
(36, '57131', 'Seletaris Condo - S''WANG'),
(37, '58011', 'opp Sembawang Shop Ctr - S''WANG'),
(38, '58021', 'bef Canberra Rd - S''WANG'),
(39, '58339', 'opp Blk 589D - CANBERRA LINK'),
(40, '58159', 'aft Admiral Hill - CANBERRA'),
(41, '46271', 'opp Blk 802 - W''LANDS AVE 2'),
(42, '46269', 'Republic Polytechnic - W''LANDS AVE 9'),
(43, '46451', 'opp Blk 872 - W''LANDS AVE 9'),
(44, '46461', 'opp Blk 757A CP - W''LANDS AVE 9'),
(45, '46471', 'opp Blk 773 - W''LANDS AVE 9'),
(46, '54247', 'Blk 322 - AMK AVE 3'),
(47, '54239', 'Blk 209 - AMK AVE 3'),
(48, '54229', 'Ang Mo Kio Pr Sch - AMK AVE 3'),
(49, '54219', 'opp Mayflower Sec Sch - AMK AVE 3'),
(50, '54069', 'opp Blk 246 - AMK AVE 1'),
(51, '58059', 'aft Sembawang CC - S''WANG'),
(52, '58049', 'bef Yishun Ave 2 - S''WANG'),
(53, '59529', 'opp Yishun Sapphire - YISHUN AVE 2'),
(54, '59259', 'Darul Makmur Mque - YISHUN AVE 2'),
(55, '59099', 'aft Blk 220 - YISHUN AVE 2'),
(56, '58171', 'Sembawang Corp Ind - ADMIRALTY RD WEST'),
(57, '58181', 'Sembawang Drug Rehab Ctr - ADMIRALTY RD WEST'),
(58, '58191', 'aft Wellington Rd - ADMIRALTY RD EAST'),
(59, '58201', 'bef Prison Trg Sch - ADMIRALTY RD EAST'),
(60, '58069', 'opp The Ashram - S''WANG');

-- --------------------------------------------------------

--
-- Table structure for table `bus_stops_arrival_times`
--

CREATE TABLE IF NOT EXISTS `bus_stops_arrival_times` (
  `sat_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique bus stop arrival time id',
  `snd_id` int(10) unsigned NOT NULL COMMENT 'Foreign key: service_number_direction.snd_id',
  `s_id` int(10) unsigned NOT NULL COMMENT 'Foreign key: stop.s_id',
  `arrival_time` time NOT NULL COMMENT 'Bus arrival name',
  PRIMARY KEY (`sat_id`),
  KEY `snd_id_foreign` (`snd_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;

--
-- Dumping data for table `bus_stops_arrival_times`
--

INSERT INTO `bus_stops_arrival_times` (`sat_id`, `snd_id`, `s_id`, `arrival_time`) VALUES
(1, 1, 1, '10:00:00'),
(2, 1, 2, '12:00:00'),
(3, 1, 3, '14:00:00'),
(4, 1, 4, '16:00:00'),
(5, 1, 5, '18:00:00'),
(6, 2, 6, '06:25:00'),
(7, 2, 7, '08:40:00'),
(8, 2, 8, '10:30:00'),
(9, 2, 9, '12:10:00'),
(10, 2, 10, '14:20:00'),
(11, 3, 11, '09:30:00'),
(12, 3, 12, '10:30:00'),
(13, 3, 13, '11:30:00'),
(14, 3, 14, '12:30:00'),
(15, 3, 15, '13:30:00'),
(16, 4, 16, '11:30:00'),
(17, 4, 17, '12:30:00'),
(18, 4, 18, '13:30:00'),
(19, 4, 19, '14:30:00'),
(20, 4, 20, '15:30:00'),
(21, 5, 21, '02:25:00'),
(22, 5, 22, '03:45:00'),
(23, 5, 23, '05:35:00'),
(24, 5, 24, '06:50:00'),
(25, 5, 25, '08:25:00'),
(26, 6, 26, '09:00:00'),
(27, 6, 27, '10:00:00'),
(28, 6, 28, '11:00:00'),
(29, 6, 29, '12:00:00'),
(30, 6, 30, '13:00:00'),
(31, 7, 31, '14:30:00'),
(32, 7, 32, '15:30:00'),
(33, 7, 33, '16:30:00'),
(34, 7, 34, '17:30:00'),
(35, 7, 35, '18:30:00'),
(36, 8, 36, '03:25:00'),
(37, 8, 37, '04:50:00'),
(38, 8, 38, '08:25:00'),
(39, 8, 39, '06:05:00'),
(40, 8, 40, '02:25:00'),
(41, 9, 41, '04:30:00'),
(42, 9, 42, '10:30:00'),
(43, 9, 43, '02:30:00'),
(44, 9, 44, '10:30:00'),
(45, 9, 45, '22:30:00'),
(46, 10, 46, '02:30:00'),
(47, 10, 47, '04:30:00'),
(48, 10, 48, '05:30:00'),
(49, 10, 49, '12:30:00'),
(50, 10, 50, '15:30:00'),
(51, 11, 51, '09:00:00'),
(52, 11, 52, '04:50:00'),
(53, 11, 53, '11:30:00'),
(54, 11, 54, '06:50:00'),
(55, 11, 55, '08:25:00'),
(56, 12, 56, '02:25:00'),
(57, 12, 57, '10:30:00'),
(58, 12, 58, '11:00:00'),
(59, 12, 59, '16:00:00'),
(60, 12, 60, '18:30:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_api_logs`
--
ALTER TABLE `bus_api_logs`
  ADD CONSTRAINT `api_logs_api_key_id_foreign` FOREIGN KEY (`api_key_id`) REFERENCES `bus_api_keys` (`id`);

--
-- Constraints for table `bus_service_numbers_directions`
--
ALTER TABLE `bus_service_numbers_directions`
  ADD CONSTRAINT `bus_service_numbers_directions_ibfk_1` FOREIGN KEY (`sn_id`) REFERENCES `bus_service_numbers` (`sn_id`),
  ADD CONSTRAINT `bus_service_numbers_directions_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `bus_directions` (`d_id`);

--
-- Constraints for table `bus_stops_arrival_times`
--
ALTER TABLE `bus_stops_arrival_times`
  ADD CONSTRAINT `bus_stops_arrival_times_ibfk_1` FOREIGN KEY (`snd_id`) REFERENCES `bus_service_numbers_directions` (`snd_id`),
  ADD CONSTRAINT `bus_stops_arrival_times_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `bus_stops` (`s_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
